import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temple_posts_record.g.dart';

abstract class TemplePostsRecord
    implements Built<TemplePostsRecord, TemplePostsRecordBuilder> {
  static Serializer<TemplePostsRecord> get serializer =>
      _$templePostsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'temple_name')
  String get templeName;

  @nullable
  @BuiltValueField(wireName: 'post_by_volunteer')
  String get postByVolunteer;

  @nullable
  @BuiltValueField(wireName: 'post_by_id')
  String get postById;

  @nullable
  @BuiltValueField(wireName: 'post_title')
  String get postTitle;

  @nullable
  @BuiltValueField(wireName: 'post_details')
  String get postDetails;

  @nullable
  @BuiltValueField(wireName: 'temple_ref')
  DocumentReference get templeRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TemplePostsRecordBuilder builder) => builder
    ..templeName = ''
    ..postByVolunteer = ''
    ..postById = ''
    ..postTitle = ''
    ..postDetails = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temple_posts');

  static Stream<TemplePostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TemplePostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TemplePostsRecord._();
  factory TemplePostsRecord([void Function(TemplePostsRecordBuilder) updates]) =
      _$TemplePostsRecord;

  static TemplePostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTemplePostsRecordData({
  String templeName,
  String postByVolunteer,
  String postById,
  String postTitle,
  String postDetails,
  DocumentReference templeRef,
}) =>
    serializers.toFirestore(
        TemplePostsRecord.serializer,
        TemplePostsRecord((t) => t
          ..templeName = templeName
          ..postByVolunteer = postByVolunteer
          ..postById = postById
          ..postTitle = postTitle
          ..postDetails = postDetails
          ..templeRef = templeRef));
