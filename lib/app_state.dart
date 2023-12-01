import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _StatusNavBar = 0;
  int get StatusNavBar => _StatusNavBar;
  set StatusNavBar(int _value) {
    _StatusNavBar = _value;
  }

  String _UserLogado = '';
  String get UserLogado => _UserLogado;
  set UserLogado(String _value) {
    _UserLogado = _value;
  }

  bool _SafonaStatus = false;
  bool get SafonaStatus => _SafonaStatus;
  set SafonaStatus(bool _value) {
    _SafonaStatus = _value;
  }

  final _nomeUSerManager = FutureRequestManager<List<UsuariosRow>>();
  Future<List<UsuariosRow>> nomeUSer({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsuariosRow>> Function() requestFn,
  }) =>
      _nomeUSerManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNomeUSerCache() => _nomeUSerManager.clear();
  void clearNomeUSerCacheKey(String? uniqueKey) =>
      _nomeUSerManager.clearRequest(uniqueKey);

  final _duvidasbancoManager = FutureRequestManager<List<DuvidasGeraisRow>>();
  Future<List<DuvidasGeraisRow>> duvidasbanco({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<DuvidasGeraisRow>> Function() requestFn,
  }) =>
      _duvidasbancoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDuvidasbancoCache() => _duvidasbancoManager.clear();
  void clearDuvidasbancoCacheKey(String? uniqueKey) =>
      _duvidasbancoManager.clearRequest(uniqueKey);
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
