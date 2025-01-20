import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExampleArtsRecord extends FirestoreRecord {
  ExampleArtsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "paths" field.
  List<String>? _paths;
  List<String> get paths => _paths ?? const [];
  bool hasPaths() => _paths != null;

  // "prompts" field.
  List<String>? _prompts;
  List<String> get prompts => _prompts ?? const [];
  bool hasPrompts() => _prompts != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _paths = getDataList(snapshotData['paths']);
    _prompts = getDataList(snapshotData['prompts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('example_arts');

  static Stream<ExampleArtsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExampleArtsRecord.fromSnapshot(s));

  static Future<ExampleArtsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExampleArtsRecord.fromSnapshot(s));

  static ExampleArtsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExampleArtsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExampleArtsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExampleArtsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExampleArtsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExampleArtsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExampleArtsRecordData({
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExampleArtsRecordDocumentEquality implements Equality<ExampleArtsRecord> {
  const ExampleArtsRecordDocumentEquality();

  @override
  bool equals(ExampleArtsRecord? e1, ExampleArtsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.paths, e2?.paths) &&
        listEquality.equals(e1?.prompts, e2?.prompts);
  }

  @override
  int hash(ExampleArtsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.paths, e?.prompts]);

  @override
  bool isValidKey(Object? o) => o is ExampleArtsRecord;
}
