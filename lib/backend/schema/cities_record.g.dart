// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CitiesRecord> _$citiesRecordSerializer =
    new _$CitiesRecordSerializer();

class _$CitiesRecordSerializer implements StructuredSerializer<CitiesRecord> {
  @override
  final Iterable<Type> types = const [CitiesRecord, _$CitiesRecord];
  @override
  final String wireName = 'CitiesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CitiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cityname;
    if (value != null) {
      result
        ..add('cityname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.englishName;
    if (value != null) {
      result
        ..add('englishName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.publishe;
    if (value != null) {
      result
        ..add('publishe')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cityphoto;
    if (value != null) {
      result
        ..add('cityphoto')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  CitiesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CitiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cityname':
          result.cityname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'englishName':
          result.englishName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publishe':
          result.publishe = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cityphoto':
          result.cityphoto.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$CitiesRecord extends CitiesRecord {
  @override
  final String? cityname;
  @override
  final String? englishName;
  @override
  final bool? publishe;
  @override
  final BuiltList<String>? cityphoto;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CitiesRecord([void Function(CitiesRecordBuilder)? updates]) =>
      (new CitiesRecordBuilder()..update(updates))._build();

  _$CitiesRecord._(
      {this.cityname,
      this.englishName,
      this.publishe,
      this.cityphoto,
      this.ffRef})
      : super._();

  @override
  CitiesRecord rebuild(void Function(CitiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CitiesRecordBuilder toBuilder() => new CitiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CitiesRecord &&
        cityname == other.cityname &&
        englishName == other.englishName &&
        publishe == other.publishe &&
        cityphoto == other.cityphoto &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, cityname.hashCode), englishName.hashCode),
                publishe.hashCode),
            cityphoto.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CitiesRecord')
          ..add('cityname', cityname)
          ..add('englishName', englishName)
          ..add('publishe', publishe)
          ..add('cityphoto', cityphoto)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CitiesRecordBuilder
    implements Builder<CitiesRecord, CitiesRecordBuilder> {
  _$CitiesRecord? _$v;

  String? _cityname;
  String? get cityname => _$this._cityname;
  set cityname(String? cityname) => _$this._cityname = cityname;

  String? _englishName;
  String? get englishName => _$this._englishName;
  set englishName(String? englishName) => _$this._englishName = englishName;

  bool? _publishe;
  bool? get publishe => _$this._publishe;
  set publishe(bool? publishe) => _$this._publishe = publishe;

  ListBuilder<String>? _cityphoto;
  ListBuilder<String> get cityphoto =>
      _$this._cityphoto ??= new ListBuilder<String>();
  set cityphoto(ListBuilder<String>? cityphoto) =>
      _$this._cityphoto = cityphoto;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CitiesRecordBuilder() {
    CitiesRecord._initializeBuilder(this);
  }

  CitiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cityname = $v.cityname;
      _englishName = $v.englishName;
      _publishe = $v.publishe;
      _cityphoto = $v.cityphoto?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CitiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CitiesRecord;
  }

  @override
  void update(void Function(CitiesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CitiesRecord build() => _build();

  _$CitiesRecord _build() {
    _$CitiesRecord _$result;
    try {
      _$result = _$v ??
          new _$CitiesRecord._(
              cityname: cityname,
              englishName: englishName,
              publishe: publishe,
              cityphoto: _cityphoto?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cityphoto';
        _cityphoto?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CitiesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
