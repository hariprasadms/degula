import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'about_record.g.dart';

abstract class AboutRecord implements Built<AboutRecord, AboutRecordBuilder> {
  static Serializer<AboutRecord> get serializer => _$aboutRecordSerializer;

  @BuiltValueField(wireName: 'about_temple')
  String? get aboutTemple;

  String? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AboutRecordBuilder builder) => builder
    ..aboutTemple = ''
    ..id = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('about');

  static Stream<AboutRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AboutRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AboutRecord._();
  factory AboutRecord([void Function(AboutRecordBuilder) updates]) =
      _$AboutRecord;

  static AboutRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAboutRecordData({
  String? aboutTemple,
  String? id,
}) {
  final firestoreData = serializers.toFirestore(
    AboutRecord.serializer,
    AboutRecord(
      (a) => a
        ..aboutTemple = aboutTemple
        ..id = id,
    ),
  );

  return firestoreData;
}
