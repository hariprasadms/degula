import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get id;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  bool? get isVolunteer;

  @BuiltValueField(wireName: 'city_list')
  BuiltList<DocumentReference>? get cityList;

  @BuiltValueField(wireName: 'temple_list')
  BuiltList<DocumentReference>? get templeList;

  bool? get isVolunteerReqSubmitted;

  String? get address;

  @BuiltValueField(wireName: 'valunteer_temp_names')
  BuiltList<String>? get valunteerTempNames;

  @BuiltValueField(wireName: 'degula_admin')
  bool? get degulaAdmin;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..id = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..isVolunteer = false
    ..cityList = ListBuilder()
    ..templeList = ListBuilder()
    ..isVolunteerReqSubmitted = false
    ..address = ''
    ..valunteerTempNames = ListBuilder()
    ..degulaAdmin = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? id,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isVolunteer,
  bool? isVolunteerReqSubmitted,
  String? address,
  bool? degulaAdmin,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..id = id
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..isVolunteer = isVolunteer
        ..cityList = null
        ..templeList = null
        ..isVolunteerReqSubmitted = isVolunteerReqSubmitted
        ..address = address
        ..valunteerTempNames = null
        ..degulaAdmin = degulaAdmin,
    ),
  );

  return firestoreData;
}
