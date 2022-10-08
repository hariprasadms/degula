// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AboutRecord> _$aboutRecordSerializer = new _$AboutRecordSerializer();

class _$AboutRecordSerializer implements StructuredSerializer<AboutRecord> {
  @override
  final Iterable<Type> types = const [AboutRecord, _$AboutRecord];
  @override
  final String wireName = 'AboutRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AboutRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.aboutTemple;
    if (value != null) {
      result
        ..add('about_temple')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AboutRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AboutRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'about_temple':
          result.aboutTemple = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AboutRecord extends AboutRecord {
  @override
  final String? aboutTemple;
  @override
  final String? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AboutRecord([void Function(AboutRecordBuilder)? updates]) =>
      (new AboutRecordBuilder()..update(updates))._build();

  _$AboutRecord._({this.aboutTemple, this.id, this.ffRef}) : super._();

  @override
  AboutRecord rebuild(void Function(AboutRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AboutRecordBuilder toBuilder() => new AboutRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AboutRecord &&
        aboutTemple == other.aboutTemple &&
        id == other.id &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, aboutTemple.hashCode), id.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AboutRecord')
          ..add('aboutTemple', aboutTemple)
          ..add('id', id)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AboutRecordBuilder implements Builder<AboutRecord, AboutRecordBuilder> {
  _$AboutRecord? _$v;

  String? _aboutTemple;
  String? get aboutTemple => _$this._aboutTemple;
  set aboutTemple(String? aboutTemple) => _$this._aboutTemple = aboutTemple;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AboutRecordBuilder() {
    AboutRecord._initializeBuilder(this);
  }

  AboutRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aboutTemple = $v.aboutTemple;
      _id = $v.id;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AboutRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AboutRecord;
  }

  @override
  void update(void Function(AboutRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AboutRecord build() => _build();

  _$AboutRecord _build() {
    final _$result = _$v ??
        new _$AboutRecord._(aboutTemple: aboutTemple, id: id, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
