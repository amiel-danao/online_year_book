const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.deleteUser = functions.https.onCall(async (data, context) => {
  const uid = data.uid;
  
  try {
    const batch = admin.firestore().batch();
    const userRef = admin.firestore().collection('users').doc(uid);
    const userDoc = await userRef.get();

    if (!userDoc.exists) {
      console.log('User document not found.');
      return { success: false, error: 'User not found' };
    }

    // Delete the user in Firebase Authentication
    await admin.auth().deleteUser(uid);

    // Delete the user document only if the Firebase Authentication user deletion was successful
    batch.delete(userRef);

    const photoUrl = userDoc.data().photo_url;
    if (photoUrl) {
      // Delete the file from Firebase Storage
      const storageRef = admin.storage().refFromURL(photoUrl);
      batch.delete(storageRef);
    }

    // Commit the batch operation
    await batch.commit();

    console.log('User and file deleted successfully.');
    return { success: true };
  } catch (error) {
    console.error('Error deleting user and file:', error);
    return { success: false, error: 'Failed to delete user and file' };
  }
});