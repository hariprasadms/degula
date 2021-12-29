import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'about_record.g.dart';

abstract class AboutRecord implements Built<AboutRecord, AboutRecordBuilder> {
  static Serializer<AboutRecord> get serializer => _$aboutRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'about_temple')
  String get aboutTemple;

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AboutRecordBuilder builder) => builder
    ..aboutTemple = ''
    ..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('about');

  static Stream<AboutRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AboutRecord._();
  factory AboutRecord([void Function(AboutRecordBuilder) updates]) =
      _$AboutRecord;

  static AboutRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAboutRecordData({
  String aboutTemple,
  String id,
}) =>
    serializers.toFirestore(
        AboutRecord.serializer,
        AboutRecord((a) => a
          ..aboutTemple = aboutTemple
          ..id = id));
