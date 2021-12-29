import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cities_record.g.dart';

abstract class CitiesRecord
    implements Built<CitiesRecord, CitiesRecordBuilder> {
  static Serializer<CitiesRecord> get serializer => _$citiesRecordSerializer;

  @nullable
  String get cityname;

  @nullable
  String get englishName;

  @nullable
  bool get publishe;

  @nullable
  BuiltList<String> get cityphoto;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CitiesRecordBuilder builder) => builder
    ..cityname = ''
    ..englishName = ''
    ..publishe = false
    ..cityphoto = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CitiesRecord._();
  factory CitiesRecord([void Function(CitiesRecordBuilder) updates]) =
      _$CitiesRecord;

  static CitiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCitiesRecordData({
  String cityname,
  String englishName,
  bool publishe,
}) =>
    serializers.toFirestore(
        CitiesRecord.serializer,
        CitiesRecord((c) => c
          ..cityname = cityname
          ..englishName = englishName
          ..publishe = publishe
          ..cityphoto = null));
