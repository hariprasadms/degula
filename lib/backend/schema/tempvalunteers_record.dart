import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tempvalunteers_record.g.dart';

abstract class TempvalunteersRecord
    implements Built<TempvalunteersRecord, TempvalunteersRecordBuilder> {
  static Serializer<TempvalunteersRecord> get serializer =>
      _$tempvalunteersRecordSerializer;

  @nullable
  String get templename;

  @nullable
  @BuiltValueField(wireName: 'valunteer_name')
  String get valunteerName;

  @nullable
  @BuiltValueField(wireName: 'valunteer_uid')
  String get valunteerUid;

  @nullable
  @BuiltValueField(wireName: 'valunteer_phone')
  String get valunteerPhone;

  @nullable
  @BuiltValueField(wireName: 'valunteer_email')
  String get valunteerEmail;

  @nullable
  @BuiltValueField(wireName: 'valunteer_reason')
  String get valunteerReason;

  @nullable
  @BuiltValueField(wireName: 'valunteer_photo')
  String get valunteerPhoto;

  @nullable
  bool get isApproved;

  @nullable
  bool get isRejected;

  @nullable
  bool get isInPending;

  @nullable
  @BuiltValueField(wireName: 'temple_ref')
  DocumentReference get templeRef;

  @nullable
  @BuiltValueField(wireName: 'temple_city')
  String get templeCity;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TempvalunteersRecordBuilder builder) => builder
    ..templename = ''
    ..valunteerName = ''
    ..valunteerUid = ''
    ..valunteerPhone = ''
    ..valunteerEmail = ''
    ..valunteerReason = ''
    ..valunteerPhoto = ''
    ..isApproved = false
    ..isRejected = false
    ..isInPending = false
    ..templeCity = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tempvalunteers');

  static Stream<TempvalunteersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TempvalunteersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TempvalunteersRecord._();
  factory TempvalunteersRecord(
          [void Function(TempvalunteersRecordBuilder) updates]) =
      _$TempvalunteersRecord;

  static TempvalunteersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTempvalunteersRecordData({
  String templename,
  String valunteerName,
  String valunteerUid,
  String valunteerPhone,
  String valunteerEmail,
  String valunteerReason,
  String valunteerPhoto,
  bool isApproved,
  bool isRejected,
  bool isInPending,
  DocumentReference templeRef,
  String templeCity,
}) =>
    serializers.toFirestore(
        TempvalunteersRecord.serializer,
        TempvalunteersRecord((t) => t
          ..templename = templename
          ..valunteerName = valunteerName
          ..valunteerUid = valunteerUid
          ..valunteerPhone = valunteerPhone
          ..valunteerEmail = valunteerEmail
          ..valunteerReason = valunteerReason
          ..valunteerPhoto = valunteerPhoto
          ..isApproved = isApproved
          ..isRejected = isRejected
          ..isInPending = isInPending
          ..templeRef = templeRef
          ..templeCity = templeCity));
