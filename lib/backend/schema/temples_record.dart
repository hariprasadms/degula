import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temples_record.g.dart';

abstract class TemplesRecord
    implements Built<TemplesRecord, TemplesRecordBuilder> {
  static Serializer<TemplesRecord> get serializer => _$templesRecordSerializer;

  String? get templename;

  String? get cityname;

  String? get address;

  String? get story;

  bool? get publishe;

  BuiltList<String>? get tempDetailsImg;

  LatLng? get geoLocation;

  String? get templePlaceName;

  String? get website;

  String? get phoneNumber;

  BuiltList<String>? get favBy;

  String? get cityKanName;

  String? get templeEngName;

  bool? get famous;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

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
    ..cityKanName = ''
    ..templeEngName = ''
    ..famous = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temples');

  static Stream<TemplesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TemplesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static TemplesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TemplesRecord(
        (c) => c
          ..templename = snapshot.data['templename']
          ..cityname = snapshot.data['cityname']
          ..address = snapshot.data['address']
          ..story = snapshot.data['story']
          ..publishe = snapshot.data['publishe']
          ..tempDetailsImg =
              safeGet(() => ListBuilder(snapshot.data['tempDetailsImg']))
          ..geoLocation = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..templePlaceName = snapshot.data['templePlaceName']
          ..website = snapshot.data['website']
          ..phoneNumber = snapshot.data['phoneNumber']
          ..favBy = safeGet(() => ListBuilder(snapshot.data['favBy']))
          ..cityKanName = snapshot.data['cityKanName']
          ..templeEngName = snapshot.data['templeEngName']
          ..famous = snapshot.data['famous']
          ..ffRef = TemplesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TemplesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'temples',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  TemplesRecord._();
  factory TemplesRecord([void Function(TemplesRecordBuilder) updates]) =
      _$TemplesRecord;

  static TemplesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTemplesRecordData({
  String? templename,
  String? cityname,
  String? address,
  String? story,
  bool? publishe,
  LatLng? geoLocation,
  String? templePlaceName,
  String? website,
  String? phoneNumber,
  String? cityKanName,
  String? templeEngName,
  bool? famous,
}) {
  final firestoreData = serializers.toFirestore(
    TemplesRecord.serializer,
    TemplesRecord(
      (t) => t
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
        ..cityKanName = cityKanName
        ..templeEngName = templeEngName
        ..famous = famous,
    ),
  );

  return firestoreData;
}
