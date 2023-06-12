import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentsRecord extends FirestoreRecord {
  StudentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "middle_name" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  bool hasMiddleName() => _middleName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "section" field.
  DocumentReference? _section;
  DocumentReference? get section => _section;
  bool hasSection() => _section != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  // "year_graduated" field.
  int? _yearGraduated;
  int get yearGraduated => _yearGraduated ?? 0;
  bool hasYearGraduated() => _yearGraduated != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _bio = snapshotData['bio'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _middleName = snapshotData['middle_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _section = snapshotData['section'] as DocumentReference?;
    _course = snapshotData['course'] as DocumentReference?;
    _yearGraduated = snapshotData['year_graduated'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('students');

  static Stream<StudentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentsRecord.fromSnapshot(s));

  static Future<StudentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentsRecord.fromSnapshot(s));

  static StudentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentsRecordData({
  String? photoUrl,
  String? bio,
  String? firstName,
  String? middleName,
  String? lastName,
  DocumentReference? section,
  DocumentReference? course,
  int? yearGraduated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'bio': bio,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'section': section,
      'course': course,
      'year_graduated': yearGraduated,
    }.withoutNulls,
  );

  return firestoreData;
}
