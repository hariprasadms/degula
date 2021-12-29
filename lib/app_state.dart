import 'package:shared_preferences/shared_preferences.dart';
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
    _cities = prefs.getStringList('ff_cities') ?? [];
  }

  SharedPreferences prefs;

  List<String> _cities = [];
  List<String> get cities => _cities;
  set cities(List<String> _value) {
    _cities = _value;
    prefs.setStringList('ff_cities', _value);
  }

  void addToCities(String _value) {
    _cities.add(_value);
    prefs.setStringList('ff_cities', _cities);
  }

  void removeFromCities(String _value) {
    _cities.remove(_value);
    prefs.setStringList('ff_cities', _cities);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
