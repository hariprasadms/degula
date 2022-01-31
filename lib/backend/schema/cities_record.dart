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

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static CitiesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CitiesRecord(
        (c) => c
          ..cityname = snapshot.data['cityname']
          ..englishName = snapshot.data['englishName']
          ..publishe = snapshot.data['publishe']
          ..cityphoto = safeGet(() => ListBuilder(snapshot.data['cityphoto']))
          ..reference = CitiesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CitiesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'cities',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
