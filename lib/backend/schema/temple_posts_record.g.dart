// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temple_posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TemplePostsRecord> _$templePostsRecordSerializer =
    new _$TemplePostsRecordSerializer();

class _$TemplePostsRecordSerializer
    implements StructuredSerializer<TemplePostsRecord> {
  @override
  final Iterable<Type> types = const [TemplePostsRecord, _$TemplePostsRecord];
  @override
  final String wireName = 'TemplePostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TemplePostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.templeName;
    if (value != null) {
      result
        ..add('temple_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postByVolunteer;
    if (value != null) {
      result
        ..add('post_by_volunteer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postById;
    if (value != null) {
      result
        ..add('post_by_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postDetails;
    if (value != null) {
      result
        ..add('post_details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.templeRef;
    if (value != null) {
      result
        ..add('temple_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdDateTime;
    if (value != null) {
      result
        ..add('created_date_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.cityname;
    if (value != null) {
      result
        ..add('cityname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.templimg;
    if (value != null) {
      result
        ..add('templimg')
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
  TemplePostsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TemplePostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temple_name':
          result.templeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_by_volunteer':
          result.postByVolunteer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_by_id':
          result.postById = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_details':
          result.postDetails = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'temple_ref':
          result.templeRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_date_time':
          result.createdDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'cityname':
          result.cityname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'templimg':
          result.templimg = serializers.deserialize(value,
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

class _$TemplePostsRecord extends TemplePostsRecord {
  @override
  final String? templeName;
  @override
  final String? postByVolunteer;
  @override
  final String? postById;
  @override
  final String? postTitle;
  @override
  final String? postDetails;
  @override
  final DocumentReference<Object?>? templeRef;
  @override
  final DateTime? createdDateTime;
  @override
  final String? cityname;
  @override
  final String? templimg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TemplePostsRecord(
          [void Function(TemplePostsRecordBuilder)? updates]) =>
      (new TemplePostsRecordBuilder()..update(updates))._build();

  _$TemplePostsRecord._(
      {this.templeName,
      this.postByVolunteer,
      this.postById,
      this.postTitle,
      this.postDetails,
      this.templeRef,
      this.createdDateTime,
      this.cityname,
      this.templimg,
      this.ffRef})
      : super._();

  @override
  TemplePostsRecord rebuild(void Function(TemplePostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplePostsRecordBuilder toBuilder() =>
      new TemplePostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplePostsRecord &&
        templeName == other.templeName &&
        postByVolunteer == other.postByVolunteer &&
        postById == other.postById &&
        postTitle == other.postTitle &&
        postDetails == other.postDetails &&
        templeRef == other.templeRef &&
        createdDateTime == other.createdDateTime &&
        cityname == other.cityname &&
        templimg == other.templimg &&
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
                                    $jc($jc(0, templeName.hashCode),
                                        postByVolunteer.hashCode),
                                    postById.hashCode),
                                postTitle.hashCode),
                            postDetails.hashCode),
                        templeRef.hashCode),
                    createdDateTime.hashCode),
                cityname.hashCode),
            templimg.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TemplePostsRecord')
          ..add('templeName', templeName)
          ..add('postByVolunteer', postByVolunteer)
          ..add('postById', postById)
          ..add('postTitle', postTitle)
          ..add('postDetails', postDetails)
          ..add('templeRef', templeRef)
          ..add('createdDateTime', createdDateTime)
          ..add('cityname', cityname)
          ..add('templimg', templimg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TemplePostsRecordBuilder
    implements Builder<TemplePostsRecord, TemplePostsRecordBuilder> {
  _$TemplePostsRecord? _$v;

  String? _templeName;
  String? get templeName => _$this._templeName;
  set templeName(String? templeName) => _$this._templeName = templeName;

  String? _postByVolunteer;
  String? get postByVolunteer => _$this._postByVolunteer;
  set postByVolunteer(String? postByVolunteer) =>
      _$this._postByVolunteer = postByVolunteer;

  String? _postById;
  String? get postById => _$this._postById;
  set postById(String? postById) => _$this._postById = postById;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  String? _postDetails;
  String? get postDetails => _$this._postDetails;
  set postDetails(String? postDetails) => _$this._postDetails = postDetails;

  DocumentReference<Object?>? _templeRef;
  DocumentReference<Object?>? get templeRef => _$this._templeRef;
  set templeRef(DocumentReference<Object?>? templeRef) =>
      _$this._templeRef = templeRef;

  DateTime? _createdDateTime;
  DateTime? get createdDateTime => _$this._createdDateTime;
  set createdDateTime(DateTime? createdDateTime) =>
      _$this._createdDateTime = createdDateTime;

  String? _cityname;
  String? get cityname => _$this._cityname;
  set cityname(String? cityname) => _$this._cityname = cityname;

  String? _templimg;
  String? get templimg => _$this._templimg;
  set templimg(String? templimg) => _$this._templimg = templimg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TemplePostsRecordBuilder() {
    TemplePostsRecord._initializeBuilder(this);
  }

  TemplePostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templeName = $v.templeName;
      _postByVolunteer = $v.postByVolunteer;
      _postById = $v.postById;
      _postTitle = $v.postTitle;
      _postDetails = $v.postDetails;
      _templeRef = $v.templeRef;
      _createdDateTime = $v.createdDateTime;
      _cityname = $v.cityname;
      _templimg = $v.templimg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TemplePostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplePostsRecord;
  }

  @override
  void update(void Function(TemplePostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplePostsRecord build() => _build();

  _$TemplePostsRecord _build() {
    final _$result = _$v ??
        new _$TemplePostsRecord._(
            templeName: templeName,
            postByVolunteer: postByVolunteer,
            postById: postById,
            postTitle: postTitle,
            postDetails: postDetails,
            templeRef: templeRef,
            createdDateTime: createdDateTime,
            cityname: cityname,
            templimg: templimg,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
