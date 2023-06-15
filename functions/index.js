const functions = require('firebase-functions');
const admin = require('firebase-admin');
const { getStorage } = require('firebase-admin/storage');
const { getAuth } = require('firebase-admin/auth');
const { getFirestore } = require('firebase-admin/firestore');
admin.initializeApp();

exports.deleteUser = functions.https.onCall(async (data, context) => {
  const uid = data.uid;
  
  
  const batch = admin.firestore().batch();
  const userRef = admin.firestore().collection('users').doc(uid);
  const userDoc = await userRef.get();

  if (!userDoc.exists) {
    console.log('User document not found.');
    return { success: false, error: 'User not found' };
  }


  await admin.auth().deleteUser(uid).then(() => {
    console.log('Successfully deleted user');
  })
  .catch((error) => {
    console.log('Error deleting user:', error);

    var errorMessage = `${error}`;
    console.error('Error deleting user and file:', error.statusCode);
    if(error.statusCode != 401 || error.statusCode != 'auth/user-not-found'){
      return { success: false, error: `Failed to delete user and file ${errorMessage}`  };
    }
  });

  // Delete the user document only if the Firebase Authentication user deletion was successful
  batch.delete(userRef);

  try{
    const photoUrl = userDoc.data().photo_url;
    if (photoUrl) {
      // Delete the file from Firebase Storage
      const bucket = getStorage().bucket();
      const baseUrl = "https://firebasestorage.googleapis.com/v0/b/online-year-book.appspot.com/o/";
      let fileName = photoUrl.replace(baseUrl,"");

      const indexOfEndPath = fileName.indexOf("?");

      fileName = fileName.substring(0,indexOfEndPath);
      
      // let filePath = fileName.replace("%2F","/");
      let filePath = fileName.replace(/%2F/g, '/');
      await bucket.file(filePath).delete();
    }
  }
  catch(error){
    console.error(error);
    return { success: false, error: `Failed to delete profile image ${error}`  };
  }

  // Commit the batch operation
  await batch.commit();

  console.log('User and file deleted successfully.');
  return { success: true };
});


exports.createUser = functions.https.onCall(async (data, context) => {
  const email = data.email;  
  const password = data.password;
  const displayName = data.display_name;
  const photoURL = data.photo_url;
  try{
      return await getAuth().createUser({
        email: email,
        password: password,
        displayName: displayName,
        photoURL: photoURL
      })
      .then(async (userRecord) => {
        // See the UserRecord reference doc for the contents of userRecord.
        console.log('Successfully created new user:', userRecord.uid);
        const userRef = getFirestore().collection('users').doc(userRecord.uid);

        const userProfile = {
          display_name: displayName,
          email: email,
          created_time: admin.firestore.FieldValue.serverTimestamp(),
          uid: userRecord.uid,
          photo_url: photoURL,
          isAdmin: true
        };
    
        await userRef.set(userProfile);

        return { success: true, uid: userRecord.uid };    
      })
      .catch((error) => {
        console.log('Error creating new user:', error);
        return { success: false, error: `Failed to create user: ${error}` };
      });
    }
    catch(error){
      console.log('Really, Error creating new user:', error);
      return { success: false, error: `Failed to create user: ${error}` };
    }
});