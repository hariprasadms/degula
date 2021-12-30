import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temples_record.g.dart';

abstract class TemplesRecord
    implements Built<TemplesRecord, TemplesRecordBuilder> {
  static Serializer<TemplesRecord> get serializer => _$templesRecordSerializer;

  @nullable
  String get templename;

  @nullable
  String get cityname;

  @nullable
  String get address;

  @nullable
  String get story;

  @nullable
  bool get publishe;

  @nullable
  BuiltList<String> get tempDetailsImg;

  @nullable
  LatLng get geoLocation;

  @nullable
  String get templePlaceName;

  @nullable
  String get website;

  @nullable
  String get phoneNumber;

  @nullable
  BuiltList<String> get favBy;

  @nullable
  String get cityKanName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TemplesRecordBuilder builder) => builder
    ..templename = ''
    ..cityname = ''
    ..address = ''
    ..story = ''
    ..publishe = false
    ..tempDetailsImg = ListBuilder()
    ..templePlaceName = ''
    ..website = ''
    ..phoneNumber = ''
    ..favBy = ListBuilder()
    ..cityKanName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temples');

  static Stream<TemplesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TemplesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TemplesRecord._();
  factory TemplesRecord([void Function(TemplesRecordBuilder) updates]) =
      _$TemplesRecord;

  static TemplesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTemplesRecordData({
  String templename,
  String cityname,
  String address,
  String story,
  bool publishe,
  LatLng geoLocation,
  String templePlaceName,
  String website,
  String phoneNumber,
  String cityKanName,
}) =>
    serializers.toFirestore(
        TemplesRecord.serializer,
        TemplesRecord((t) => t
          ..templename = templename
          ..cityname = cityname
          ..address = address
          ..story = story
          ..publishe = publishe
          ..tempDetailsImg = null
          ..geoLocation = geoLocation
          ..templePlaceName = templePlaceName
          ..website = website
          ..phoneNumber = phoneNumber
          ..favBy = null
          ..cityKanName = cityKanName));
