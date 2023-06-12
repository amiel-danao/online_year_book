import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YearBooksRecord extends FirestoreRecord {
  YearBooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "students" field.
  List<DocumentReference>? _students;
  List<DocumentReference> get students => _students ?? const [];
  bool hasStudents() => _students != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  // "school_year" field.
  int? _schoolYear;
  int get schoolYear => _schoolYear ?? 0;
  bool hasSchoolYear() => _schoolYear != null;

  // "section" field.
  DocumentReference? _section;
  DocumentReference? get section => _section;
  bool hasSection() => _section != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  void _initializeFields() {
    _students = getDataList(snapshotData['students']);
    _title = snapshotData['title'] as String?;
    _course = snapshotData['course'] as DocumentReference?;
    _schoolYear = snapshotData['school_year'] as int?;
    _section = snapshotData['section'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('yearBooks');

  static Stream<YearBooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YearBooksRecord.fromSnapshot(s));

  static Future<YearBooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YearBooksRecord.fromSnapshot(s));

  static YearBooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      YearBooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YearBooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YearBooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YearBooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YearBooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYearBooksRecordData({
  String? title,
  DocumentReference? course,
  int? schoolYear,
  DocumentReference? section,
  DateTime? timePosted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'course': course,
      'school_year': schoolYear,
      'section': section,
      'time_posted': timePosted,
    }.withoutNulls,
  );

  return firestoreData;
}
