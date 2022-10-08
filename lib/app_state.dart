import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _templeRefList = prefs.getString('ff_templeRefList')?.ref ?? _templeRefList;
  }

  late SharedPreferences prefs;

  DocumentReference? _templeRefList;
  DocumentReference? get templeRefList => _templeRefList;
  set templeRefList(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _templeRefList = _value;
    prefs.setString('ff_templeRefList', _value.path);
  }

  String selectedtemple = '';

  String selectedcity = '';

  DocumentReference? selectedtempref;

  List<String> templenamelist = [];

  String selectedtempimg = '';

  List<String> citynamelist = [];
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
