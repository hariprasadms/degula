// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temples_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TemplesRecord> _$templesRecordSerializer =
    new _$TemplesRecordSerializer();

class _$TemplesRecordSerializer implements StructuredSerializer<TemplesRecord> {
  @override
  final Iterable<Type> types = const [TemplesRecord, _$TemplesRecord];
  @override
  final String wireName = 'TemplesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TemplesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.templename;
    if (value != null) {
      result
        ..add('templename')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cityname;
    if (value != null) {
      result
        ..add('cityname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.story;
    if (value != null) {
      result
        ..add('story')
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
    value = object.tempDetailsImg;
    if (value != null) {
      result
        ..add('tempDetailsImg')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.geoLocation;
    if (value != null) {
      result
        ..add('geoLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.templePlaceName;
    if (value != null) {
      result
        ..add('templePlaceName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favBy;
    if (value != null) {
      result
        ..add('favBy')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.cityKanName;
    if (value != null) {
      result
        ..add('cityKanName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.templeEngName;
    if (value != null) {
      result
        ..add('templeEngName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.famous;
    if (value != null) {
      result
        ..add('famous')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  TemplesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TemplesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'templename':
          result.templename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cityname':
          result.cityname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'story':
          result.story = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'publishe':
          result.publishe = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tempDetailsImg':
          result.tempDetailsImg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'geoLocation':
          result.geoLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'templePlaceName':
          result.templePlaceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favBy':
          result.favBy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'cityKanName':
          result.cityKanName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'templeEngName':
          result.templeEngName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'famous':
          result.famous = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$TemplesRecord extends TemplesRecord {
  @override
  final String? templename;
  @override
  final String? cityname;
  @override
  final String? address;
  @override
  final String? story;
  @override
  final bool? publishe;
  @override
  final BuiltList<String>? tempDetailsImg;
  @override
  final LatLng? geoLocation;
  @override
  final String? templePlaceName;
  @override
  final String? website;
  @override
  final String? phoneNumber;
  @override
  final BuiltList<String>? favBy;
  @override
  final String? cityKanName;
  @override
  final String? templeEngName;
  @override
  final bool? famous;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TemplesRecord([void Function(TemplesRecordBuilder)? updates]) =>
      (new TemplesRecordBuilder()..update(updates))._build();

  _$TemplesRecord._(
      {this.templename,
      this.cityname,
      this.address,
      this.story,
      this.publishe,
      this.tempDetailsImg,
      this.geoLocation,
      this.templePlaceName,
      this.website,
      this.phoneNumber,
      this.favBy,
      this.cityKanName,
      this.templeEngName,
      this.famous,
      this.ffRef})
      : super._();

  @override
  TemplesRecord rebuild(void Function(TemplesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplesRecordBuilder toBuilder() => new TemplesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplesRecord &&
        templename == other.templename &&
        cityname == other.cityname &&
        address == other.address &&
        story == other.story &&
        publishe == other.publishe &&
        tempDetailsImg == other.tempDetailsImg &&
        geoLocation == other.geoLocation &&
        templePlaceName == other.templePlaceName &&
        website == other.website &&
        phoneNumber == other.phoneNumber &&
        favBy == other.favBy &&
        cityKanName == other.cityKanName &&
        templeEngName == other.templeEngName &&
        famous == other.famous &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                templename
                                                                    .hashCode),
                                                            cityname.hashCode),
                                                        address.hashCode),
                                                    story.hashCode),
                                                publishe.hashCode),
                                            tempDetailsImg.hashCode),
                                        geoLocation.hashCode),
                                    templePlaceName.hashCode),
                                website.hashCode),
                            phoneNumber.hashCode),
                        favBy.hashCode),
                    cityKanName.hashCode),
                templeEngName.hashCode),
            famous.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TemplesRecord')
          ..add('templename', templename)
          ..add('cityname', cityname)
          ..add('address', address)
          ..add('story', story)
          ..add('publishe', publishe)
          ..add('tempDetailsImg', tempDetailsImg)
          ..add('geoLocation', geoLocation)
          ..add('templePlaceName', templePlaceName)
          ..add('website', website)
          ..add('phoneNumber', phoneNumber)
          ..add('favBy', favBy)
          ..add('cityKanName', cityKanName)
          ..add('templeEngName', templeEngName)
          ..add('famous', famous)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TemplesRecordBuilder
    implements Builder<TemplesRecord, TemplesRecordBuilder> {
  _$TemplesRecord? _$v;

  String? _templename;
  String? get templename => _$this._templename;
  set templename(String? templename) => _$this._templename = templename;

  String? _cityname;
  String? get cityname => _$this._cityname;
  set cityname(String? cityname) => _$this._cityname = cityname;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _story;
  String? get story => _$this._story;
  set story(String? story) => _$this._story = story;

  bool? _publishe;
  bool? get publishe => _$this._publishe;
  set publishe(bool? publishe) => _$this._publishe = publishe;

  ListBuilder<String>? _tempDetailsImg;
  ListBuilder<String> get tempDetailsImg =>
      _$this._tempDetailsImg ??= new ListBuilder<String>();
  set tempDetailsImg(ListBuilder<String>? tempDetailsImg) =>
      _$this._tempDetailsImg = tempDetailsImg;

  LatLng? _geoLocation;
  LatLng? get geoLocation => _$this._geoLocation;
  set geoLocation(LatLng? geoLocation) => _$this._geoLocation = geoLocation;

  String? _templePlaceName;
  String? get templePlaceName => _$this._templePlaceName;
  set templePlaceName(String? templePlaceName) =>
      _$this._templePlaceName = templePlaceName;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  ListBuilder<String>? _favBy;
  ListBuilder<String> get favBy => _$this._favBy ??= new ListBuilder<String>();
  set favBy(ListBuilder<String>? favBy) => _$this._favBy = favBy;

  String? _cityKanName;
  String? get cityKanName => _$this._cityKanName;
  set cityKanName(String? cityKanName) => _$this._cityKanName = cityKanName;

  String? _templeEngName;
  String? get templeEngName => _$this._templeEngName;
  set templeEngName(String? templeEngName) =>
      _$this._templeEngName = templeEngName;

  bool? _famous;
  bool? get famous => _$this._famous;
  set famous(bool? famous) => _$this._famous = famous;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TemplesRecordBuilder() {
    TemplesRecord._initializeBuilder(this);
  }

  TemplesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templename = $v.templename;
      _cityname = $v.cityname;
      _address = $v.address;
      _story = $v.story;
      _publishe = $v.publishe;
      _tempDetailsImg = $v.tempDetailsImg?.toBuilder();
      _geoLocation = $v.geoLocation;
      _templePlaceName = $v.templePlaceName;
      _website = $v.website;
      _phoneNumber = $v.phoneNumber;
      _favBy = $v.favBy?.toBuilder();
      _cityKanName = $v.cityKanName;
      _templeEngName = $v.templeEngName;
      _famous = $v.famous;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TemplesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplesRecord;
  }

  @override
  void update(void Function(TemplesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplesRecord build() => _build();

  _$TemplesRecord _build() {
    _$TemplesRecord _$result;
    try {
      _$result = _$v ??
          new _$TemplesRecord._(
              templename: templename,
              cityname: cityname,
              address: address,
              story: story,
              publishe: publishe,
              tempDetailsImg: _tempDetailsImg?.build(),
              geoLocation: geoLocation,
              templePlaceName: templePlaceName,
              website: website,
              phoneNumber: phoneNumber,
              favBy: _favBy?.build(),
              cityKanName: cityKanName,
              templeEngName: templeEngName,
              famous: famous,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tempDetailsImg';
        _tempDetailsImg?.build();

        _$failedField = 'favBy';
        _favBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TemplesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
