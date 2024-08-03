import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

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

  DateTime? _flowFecha;
  DateTime? get flowFecha => _flowFecha;
  set flowFecha(DateTime? value) {
    _flowFecha = value;
  }

  String _flowMovimiento = '';
  String get flowMovimiento => _flowMovimiento;
  set flowMovimiento(String value) {
    _flowMovimiento = value;
  }

  double _flowMonto = 0.0;
  double get flowMonto => _flowMonto;
  set flowMonto(double value) {
    _flowMonto = value;
  }

  FlowCuentaStruct _flowCuenta = FlowCuentaStruct();
  FlowCuentaStruct get flowCuenta => _flowCuenta;
  set flowCuenta(FlowCuentaStruct value) {
    _flowCuenta = value;
  }

  void updateFlowCuentaStruct(Function(FlowCuentaStruct) updateFn) {
    updateFn(_flowCuenta);
  }

  FlowCategoriaStruct _flowCategoria = FlowCategoriaStruct();
  FlowCategoriaStruct get flowCategoria => _flowCategoria;
  set flowCategoria(FlowCategoriaStruct value) {
    _flowCategoria = value;
  }

  void updateFlowCategoriaStruct(Function(FlowCategoriaStruct) updateFn) {
    updateFn(_flowCategoria);
  }

  FlowEtiquetaStruct _flowEtiqueta = FlowEtiquetaStruct();
  FlowEtiquetaStruct get flowEtiqueta => _flowEtiqueta;
  set flowEtiqueta(FlowEtiquetaStruct value) {
    _flowEtiqueta = value;
  }

  void updateFlowEtiquetaStruct(Function(FlowEtiquetaStruct) updateFn) {
    updateFn(_flowEtiqueta);
  }

  FlowCuentaStruct _flowtraspasoCuenta = FlowCuentaStruct();
  FlowCuentaStruct get flowtraspasoCuenta => _flowtraspasoCuenta;
  set flowtraspasoCuenta(FlowCuentaStruct value) {
    _flowtraspasoCuenta = value;
  }

  void updateFlowtraspasoCuentaStruct(Function(FlowCuentaStruct) updateFn) {
    updateFn(_flowtraspasoCuenta);
  }

  String _imagen = '';
  String get imagen => _imagen;
  set imagen(String value) {
    _imagen = value;
  }
}
