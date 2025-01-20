import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_description" field.
  String? _commentDescription;
  String get commentDescription => _commentDescription ?? '';
  bool hasCommentDescription() => _commentDescription != null;

  // "comment_user" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "comment_timestamp" field.
  DateTime? _commentTimestamp;
  DateTime? get commentTimestamp => _commentTimestamp;
  bool hasCommentTimestamp() => _commentTimestamp != null;

  // "comment_likes" field.
  List<DocumentReference>? _commentLikes;
  List<DocumentReference> get commentLikes => _commentLikes ?? const [];
  bool hasCommentLikes() => _commentLikes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentDescription = snapshotData['comment_description'] as String?;
    _commentUser = snapshotData['comment_user'] as DocumentReference?;
    _commentTimestamp = snapshotData['comment_timestamp'] as DateTime?;
    _commentLikes = getDataList(snapshotData['comment_likes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? commentDescription,
  DocumentReference? commentUser,
  DateTime? commentTimestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_description': commentDescription,
      'comment_user': commentUser,
      'comment_timestamp': commentTimestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentDescription == e2?.commentDescription &&
        e1?.commentUser == e2?.commentUser &&
        e1?.commentTimestamp == e2?.commentTimestamp &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentDescription,
        e?.commentUser,
        e?.commentTimestamp,
        e?.commentLikes
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
