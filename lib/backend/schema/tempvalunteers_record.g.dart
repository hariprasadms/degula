// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempvalunteers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TempvalunteersRecord> _$tempvalunteersRecordSerializer =
    new _$TempvalunteersRecordSerializer();

class _$TempvalunteersRecordSerializer
    implements StructuredSerializer<TempvalunteersRecord> {
  @override
  final Iterable<Type> types = const [
    TempvalunteersRecord,
    _$TempvalunteersRecord
  ];
  @override
  final String wireName = 'TempvalunteersRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TempvalunteersRecord object,
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
    value = object.valunteerName;
    if (value != null) {
      result
        ..add('valunteer_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valunteerUid;
    if (value != null) {
      result
        ..add('valunteer_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valunteerPhone;
    if (value != null) {
      result
        ..add('valunteer_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valunteerEmail;
    if (value != null) {
      result
        ..add('valunteer_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valunteerReason;
    if (value != null) {
      result
        ..add('valunteer_reason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valunteerPhoto;
    if (value != null) {
      result
        ..add('valunteer_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isApproved;
    if (value != null) {
      result
        ..add('isApproved')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isRejected;
    if (value != null) {
      result
        ..add('isRejected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isInPending;
    if (value != null) {
      result
        ..add('isInPending')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.templeRef;
    if (value != null) {
      result
        ..add('temple_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.templeCity;
    if (value != null) {
      result
        ..add('temple_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tempImg;
    if (value != null) {
      result
        ..add('temp_img')
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
  TempvalunteersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TempvalunteersRecordBuilder();

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
        case 'valunteer_name':
          result.valunteerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valunteer_uid':
          result.valunteerUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valunteer_phone':
          result.valunteerPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valunteer_email':
          result.valunteerEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valunteer_reason':
          result.valunteerReason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'valunteer_photo':
          result.valunteerPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isApproved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isRejected':
          result.isRejected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isInPending':
          result.isInPending = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'temple_ref':
          result.templeRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'temple_city':
          result.templeCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'temp_img':
          result.tempImg = serializers.deserialize(value,
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

class _$TempvalunteersRecord extends TempvalunteersRecord {
  @override
  final String? templename;
  @override
  final String? valunteerName;
  @override
  final String? valunteerUid;
  @override
  final String? valunteerPhone;
  @override
  final String? valunteerEmail;
  @override
  final String? valunteerReason;
  @override
  final String? valunteerPhoto;
  @override
  final bool? isApproved;
  @override
  final bool? isRejected;
  @override
  final bool? isInPending;
  @override
  final DocumentReference<Object?>? templeRef;
  @override
  final String? templeCity;
  @override
  final String? tempImg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TempvalunteersRecord(
          [void Function(TempvalunteersRecordBuilder)? updates]) =>
      (new TempvalunteersRecordBuilder()..update(updates))._build();

  _$TempvalunteersRecord._(
      {this.templename,
      this.valunteerName,
      this.valunteerUid,
      this.valunteerPhone,
      this.valunteerEmail,
      this.valunteerReason,
      this.valunteerPhoto,
      this.isApproved,
      this.isRejected,
      this.isInPending,
      this.templeRef,
      this.templeCity,
      this.tempImg,
      this.ffRef})
      : super._();

  @override
  TempvalunteersRecord rebuild(
          void Function(TempvalunteersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TempvalunteersRecordBuilder toBuilder() =>
      new TempvalunteersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TempvalunteersRecord &&
        templename == other.templename &&
        valunteerName == other.valunteerName &&
        valunteerUid == other.valunteerUid &&
        valunteerPhone == other.valunteerPhone &&
        valunteerEmail == other.valunteerEmail &&
        valunteerReason == other.valunteerReason &&
        valunteerPhoto == other.valunteerPhoto &&
        isApproved == other.isApproved &&
        isRejected == other.isRejected &&
        isInPending == other.isInPending &&
        templeRef == other.templeRef &&
        templeCity == other.templeCity &&
        tempImg == other.tempImg &&
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
                                                            0,
                                                            templename
                                                                .hashCode),
                                                        valunteerName.hashCode),
                                                    valunteerUid.hashCode),
                                                valunteerPhone.hashCode),
                                            valunteerEmail.hashCode),
                                        valunteerReason.hashCode),
                                    valunteerPhoto.hashCode),
                                isApproved.hashCode),
                            isRejected.hashCode),
                        isInPending.hashCode),
                    templeRef.hashCode),
                templeCity.hashCode),
            tempImg.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TempvalunteersRecord')
          ..add('templename', templename)
          ..add('valunteerName', valunteerName)
          ..add('valunteerUid', valunteerUid)
          ..add('valunteerPhone', valunteerPhone)
          ..add('valunteerEmail', valunteerEmail)
          ..add('valunteerReason', valunteerReason)
          ..add('valunteerPhoto', valunteerPhoto)
          ..add('isApproved', isApproved)
          ..add('isRejected', isRejected)
          ..add('isInPending', isInPending)
          ..add('templeRef', templeRef)
          ..add('templeCity', templeCity)
          ..add('tempImg', tempImg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TempvalunteersRecordBuilder
    implements Builder<TempvalunteersRecord, TempvalunteersRecordBuilder> {
  _$TempvalunteersRecord? _$v;

  String? _templename;
  String? get templename => _$this._templename;
  set templename(String? templename) => _$this._templename = templename;

  String? _valunteerName;
  String? get valunteerName => _$this._valunteerName;
  set valunteerName(String? valunteerName) =>
      _$this._valunteerName = valunteerName;

  String? _valunteerUid;
  String? get valunteerUid => _$this._valunteerUid;
  set valunteerUid(String? valunteerUid) => _$this._valunteerUid = valunteerUid;

  String? _valunteerPhone;
  String? get valunteerPhone => _$this._valunteerPhone;
  set valunteerPhone(String? valunteerPhone) =>
      _$this._valunteerPhone = valunteerPhone;

  String? _valunteerEmail;
  String? get valunteerEmail => _$this._valunteerEmail;
  set valunteerEmail(String? valunteerEmail) =>
      _$this._valunteerEmail = valunteerEmail;

  String? _valunteerReason;
  String? get valunteerReason => _$this._valunteerReason;
  set valunteerReason(String? valunteerReason) =>
      _$this._valunteerReason = valunteerReason;

  String? _valunteerPhoto;
  String? get valunteerPhoto => _$this._valunteerPhoto;
  set valunteerPhoto(String? valunteerPhoto) =>
      _$this._valunteerPhoto = valunteerPhoto;

  bool? _isApproved;
  bool? get isApproved => _$this._isApproved;
  set isApproved(bool? isApproved) => _$this._isApproved = isApproved;

  bool? _isRejected;
  bool? get isRejected => _$this._isRejected;
  set isRejected(bool? isRejected) => _$this._isRejected = isRejected;

  bool? _isInPending;
  bool? get isInPending => _$this._isInPending;
  set isInPending(bool? isInPending) => _$this._isInPending = isInPending;

  DocumentReference<Object?>? _templeRef;
  DocumentReference<Object?>? get templeRef => _$this._templeRef;
  set templeRef(DocumentReference<Object?>? templeRef) =>
      _$this._templeRef = templeRef;

  String? _templeCity;
  String? get templeCity => _$this._templeCity;
  set templeCity(String? templeCity) => _$this._templeCity = templeCity;

  String? _tempImg;
  String? get tempImg => _$this._tempImg;
  set tempImg(String? tempImg) => _$this._tempImg = tempImg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TempvalunteersRecordBuilder() {
    TempvalunteersRecord._initializeBuilder(this);
  }

  TempvalunteersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templename = $v.templename;
      _valunteerName = $v.valunteerName;
      _valunteerUid = $v.valunteerUid;
      _valunteerPhone = $v.valunteerPhone;
      _valunteerEmail = $v.valunteerEmail;
      _valunteerReason = $v.valunteerReason;
      _valunteerPhoto = $v.valunteerPhoto;
      _isApproved = $v.isApproved;
      _isRejected = $v.isRejected;
      _isInPending = $v.isInPending;
      _templeRef = $v.templeRef;
      _templeCity = $v.templeCity;
      _tempImg = $v.tempImg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TempvalunteersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TempvalunteersRecord;
  }

  @override
  void update(void Function(TempvalunteersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TempvalunteersRecord build() => _build();

  _$TempvalunteersRecord _build() {
    final _$result = _$v ??
        new _$TempvalunteersRecord._(
            templename: templename,
            valunteerName: valunteerName,
            valunteerUid: valunteerUid,
            valunteerPhone: valunteerPhone,
            valunteerEmail: valunteerEmail,
            valunteerReason: valunteerReason,
            valunteerPhoto: valunteerPhoto,
            isApproved: isApproved,
            isRejected: isRejected,
            isInPending: isInPending,
            templeRef: templeRef,
            templeCity: templeCity,
            tempImg: tempImg,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
