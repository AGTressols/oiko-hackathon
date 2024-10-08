import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _seleccionPeriodos =
          prefs.getStringList('ff_seleccionPeriodos') ?? _seleccionPeriodos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<String> _modificacionEtiquetas = [];
  List<String> get modificacionEtiquetas => _modificacionEtiquetas;
  set modificacionEtiquetas(List<String> value) {
    _modificacionEtiquetas = value;
  }

  void addToModificacionEtiquetas(String value) {
    modificacionEtiquetas.add(value);
  }

  void removeFromModificacionEtiquetas(String value) {
    modificacionEtiquetas.remove(value);
  }

  void removeAtIndexFromModificacionEtiquetas(int index) {
    modificacionEtiquetas.removeAt(index);
  }

  void updateModificacionEtiquetasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    modificacionEtiquetas[index] = updateFn(_modificacionEtiquetas[index]);
  }

  void insertAtIndexInModificacionEtiquetas(int index, String value) {
    modificacionEtiquetas.insert(index, value);
  }

  List<String> _seleccionPeriodos = [];
  List<String> get seleccionPeriodos => _seleccionPeriodos;
  set seleccionPeriodos(List<String> value) {
    _seleccionPeriodos = value;
    prefs.setStringList('ff_seleccionPeriodos', value);
  }

  void addToSeleccionPeriodos(String value) {
    seleccionPeriodos.add(value);
    prefs.setStringList('ff_seleccionPeriodos', _seleccionPeriodos);
  }

  void removeFromSeleccionPeriodos(String value) {
    seleccionPeriodos.remove(value);
    prefs.setStringList('ff_seleccionPeriodos', _seleccionPeriodos);
  }

  void removeAtIndexFromSeleccionPeriodos(int index) {
    seleccionPeriodos.removeAt(index);
    prefs.setStringList('ff_seleccionPeriodos', _seleccionPeriodos);
  }

  void updateSeleccionPeriodosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionPeriodos[index] = updateFn(_seleccionPeriodos[index]);
    prefs.setStringList('ff_seleccionPeriodos', _seleccionPeriodos);
  }

  void insertAtIndexInSeleccionPeriodos(int index, String value) {
    seleccionPeriodos.insert(index, value);
    prefs.setStringList('ff_seleccionPeriodos', _seleccionPeriodos);
  }

  List<GastosCuentasStruct> _gastosPorCuenta = [];
  List<GastosCuentasStruct> get gastosPorCuenta => _gastosPorCuenta;
  set gastosPorCuenta(List<GastosCuentasStruct> value) {
    _gastosPorCuenta = value;
  }

  void addToGastosPorCuenta(GastosCuentasStruct value) {
    gastosPorCuenta.add(value);
  }

  void removeFromGastosPorCuenta(GastosCuentasStruct value) {
    gastosPorCuenta.remove(value);
  }

  void removeAtIndexFromGastosPorCuenta(int index) {
    gastosPorCuenta.removeAt(index);
  }

  void updateGastosPorCuentaAtIndex(
    int index,
    GastosCuentasStruct Function(GastosCuentasStruct) updateFn,
  ) {
    gastosPorCuenta[index] = updateFn(_gastosPorCuenta[index]);
  }

  void insertAtIndexInGastosPorCuenta(int index, GastosCuentasStruct value) {
    gastosPorCuenta.insert(index, value);
  }

  double _gastoTotalVariable = 0.0;
  double get gastoTotalVariable => _gastoTotalVariable;
  set gastoTotalVariable(double value) {
    _gastoTotalVariable = value;
  }

  double _saldoVariable = 0.0;
  double get saldoVariable => _saldoVariable;
  set saldoVariable(double value) {
    _saldoVariable = value;
  }

  List<GraficoPresupuestoStruct> _graficoPresupuestoAppState = [];
  List<GraficoPresupuestoStruct> get graficoPresupuestoAppState =>
      _graficoPresupuestoAppState;
  set graficoPresupuestoAppState(List<GraficoPresupuestoStruct> value) {
    _graficoPresupuestoAppState = value;
  }

  void addToGraficoPresupuestoAppState(GraficoPresupuestoStruct value) {
    graficoPresupuestoAppState.add(value);
  }

  void removeFromGraficoPresupuestoAppState(GraficoPresupuestoStruct value) {
    graficoPresupuestoAppState.remove(value);
  }

  void removeAtIndexFromGraficoPresupuestoAppState(int index) {
    graficoPresupuestoAppState.removeAt(index);
  }

  void updateGraficoPresupuestoAppStateAtIndex(
    int index,
    GraficoPresupuestoStruct Function(GraficoPresupuestoStruct) updateFn,
  ) {
    graficoPresupuestoAppState[index] =
        updateFn(_graficoPresupuestoAppState[index]);
  }

  void insertAtIndexInGraficoPresupuestoAppState(
      int index, GraficoPresupuestoStruct value) {
    graficoPresupuestoAppState.insert(index, value);
  }

  List<TortaCategoriaGastoStruct> _tortaCategoriaGastoAppState = [];
  List<TortaCategoriaGastoStruct> get tortaCategoriaGastoAppState =>
      _tortaCategoriaGastoAppState;
  set tortaCategoriaGastoAppState(List<TortaCategoriaGastoStruct> value) {
    _tortaCategoriaGastoAppState = value;
  }

  void addToTortaCategoriaGastoAppState(TortaCategoriaGastoStruct value) {
    tortaCategoriaGastoAppState.add(value);
  }

  void removeFromTortaCategoriaGastoAppState(TortaCategoriaGastoStruct value) {
    tortaCategoriaGastoAppState.remove(value);
  }

  void removeAtIndexFromTortaCategoriaGastoAppState(int index) {
    tortaCategoriaGastoAppState.removeAt(index);
  }

  void updateTortaCategoriaGastoAppStateAtIndex(
    int index,
    TortaCategoriaGastoStruct Function(TortaCategoriaGastoStruct) updateFn,
  ) {
    tortaCategoriaGastoAppState[index] =
        updateFn(_tortaCategoriaGastoAppState[index]);
  }

  void insertAtIndexInTortaCategoriaGastoAppState(
      int index, TortaCategoriaGastoStruct value) {
    tortaCategoriaGastoAppState.insert(index, value);
  }

  List<String> _seleccionCategorias = [];
  List<String> get seleccionCategorias => _seleccionCategorias;
  set seleccionCategorias(List<String> value) {
    _seleccionCategorias = value;
  }

  void addToSeleccionCategorias(String value) {
    seleccionCategorias.add(value);
  }

  void removeFromSeleccionCategorias(String value) {
    seleccionCategorias.remove(value);
  }

  void removeAtIndexFromSeleccionCategorias(int index) {
    seleccionCategorias.removeAt(index);
  }

  void updateSeleccionCategoriasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionCategorias[index] = updateFn(_seleccionCategorias[index]);
  }

  void insertAtIndexInSeleccionCategorias(int index, String value) {
    seleccionCategorias.insert(index, value);
  }

  List<GraficoEtiquetaStruct> _graficoEtiquetaAppState = [];
  List<GraficoEtiquetaStruct> get graficoEtiquetaAppState =>
      _graficoEtiquetaAppState;
  set graficoEtiquetaAppState(List<GraficoEtiquetaStruct> value) {
    _graficoEtiquetaAppState = value;
  }

  void addToGraficoEtiquetaAppState(GraficoEtiquetaStruct value) {
    graficoEtiquetaAppState.add(value);
  }

  void removeFromGraficoEtiquetaAppState(GraficoEtiquetaStruct value) {
    graficoEtiquetaAppState.remove(value);
  }

  void removeAtIndexFromGraficoEtiquetaAppState(int index) {
    graficoEtiquetaAppState.removeAt(index);
  }

  void updateGraficoEtiquetaAppStateAtIndex(
    int index,
    GraficoEtiquetaStruct Function(GraficoEtiquetaStruct) updateFn,
  ) {
    graficoEtiquetaAppState[index] = updateFn(_graficoEtiquetaAppState[index]);
  }

  void insertAtIndexInGraficoEtiquetaAppState(
      int index, GraficoEtiquetaStruct value) {
    graficoEtiquetaAppState.insert(index, value);
  }

  List<String> _categoriasSeleccionadas = [];
  List<String> get categoriasSeleccionadas => _categoriasSeleccionadas;
  set categoriasSeleccionadas(List<String> value) {
    _categoriasSeleccionadas = value;
  }

  void addToCategoriasSeleccionadas(String value) {
    categoriasSeleccionadas.add(value);
  }

  void removeFromCategoriasSeleccionadas(String value) {
    categoriasSeleccionadas.remove(value);
  }

  void removeAtIndexFromCategoriasSeleccionadas(int index) {
    categoriasSeleccionadas.removeAt(index);
  }

  void updateCategoriasSeleccionadasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoriasSeleccionadas[index] = updateFn(_categoriasSeleccionadas[index]);
  }

  void insertAtIndexInCategoriasSeleccionadas(int index, String value) {
    categoriasSeleccionadas.insert(index, value);
  }

  List<String> _categoriasHistorico = [];
  List<String> get categoriasHistorico => _categoriasHistorico;
  set categoriasHistorico(List<String> value) {
    _categoriasHistorico = value;
  }

  void addToCategoriasHistorico(String value) {
    categoriasHistorico.add(value);
  }

  void removeFromCategoriasHistorico(String value) {
    categoriasHistorico.remove(value);
  }

  void removeAtIndexFromCategoriasHistorico(int index) {
    categoriasHistorico.removeAt(index);
  }

  void updateCategoriasHistoricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoriasHistorico[index] = updateFn(_categoriasHistorico[index]);
  }

  void insertAtIndexInCategoriasHistorico(int index, String value) {
    categoriasHistorico.insert(index, value);
  }

  List<String> _etiquetasHistorico = [];
  List<String> get etiquetasHistorico => _etiquetasHistorico;
  set etiquetasHistorico(List<String> value) {
    _etiquetasHistorico = value;
  }

  void addToEtiquetasHistorico(String value) {
    etiquetasHistorico.add(value);
  }

  void removeFromEtiquetasHistorico(String value) {
    etiquetasHistorico.remove(value);
  }

  void removeAtIndexFromEtiquetasHistorico(int index) {
    etiquetasHistorico.removeAt(index);
  }

  void updateEtiquetasHistoricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    etiquetasHistorico[index] = updateFn(_etiquetasHistorico[index]);
  }

  void insertAtIndexInEtiquetasHistorico(int index, String value) {
    etiquetasHistorico.insert(index, value);
  }

  List<String> _seleccionCategoriasHistorico = [];
  List<String> get seleccionCategoriasHistorico =>
      _seleccionCategoriasHistorico;
  set seleccionCategoriasHistorico(List<String> value) {
    _seleccionCategoriasHistorico = value;
  }

  void addToSeleccionCategoriasHistorico(String value) {
    seleccionCategoriasHistorico.add(value);
  }

  void removeFromSeleccionCategoriasHistorico(String value) {
    seleccionCategoriasHistorico.remove(value);
  }

  void removeAtIndexFromSeleccionCategoriasHistorico(int index) {
    seleccionCategoriasHistorico.removeAt(index);
  }

  void updateSeleccionCategoriasHistoricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionCategoriasHistorico[index] =
        updateFn(_seleccionCategoriasHistorico[index]);
  }

  void insertAtIndexInSeleccionCategoriasHistorico(int index, String value) {
    seleccionCategoriasHistorico.insert(index, value);
  }

  List<String> _seleccionEtiquetasHistorico = [];
  List<String> get seleccionEtiquetasHistorico => _seleccionEtiquetasHistorico;
  set seleccionEtiquetasHistorico(List<String> value) {
    _seleccionEtiquetasHistorico = value;
  }

  void addToSeleccionEtiquetasHistorico(String value) {
    seleccionEtiquetasHistorico.add(value);
  }

  void removeFromSeleccionEtiquetasHistorico(String value) {
    seleccionEtiquetasHistorico.remove(value);
  }

  void removeAtIndexFromSeleccionEtiquetasHistorico(int index) {
    seleccionEtiquetasHistorico.removeAt(index);
  }

  void updateSeleccionEtiquetasHistoricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionEtiquetasHistorico[index] =
        updateFn(_seleccionEtiquetasHistorico[index]);
  }

  void insertAtIndexInSeleccionEtiquetasHistorico(int index, String value) {
    seleccionEtiquetasHistorico.insert(index, value);
  }

  String _nombreGraficoHistoricoGastos = '';
  String get nombreGraficoHistoricoGastos => _nombreGraficoHistoricoGastos;
  set nombreGraficoHistoricoGastos(String value) {
    _nombreGraficoHistoricoGastos = value;
  }

  List<double> _gastoGraficoHistoricoGastos = [];
  List<double> get gastoGraficoHistoricoGastos => _gastoGraficoHistoricoGastos;
  set gastoGraficoHistoricoGastos(List<double> value) {
    _gastoGraficoHistoricoGastos = value;
  }

  void addToGastoGraficoHistoricoGastos(double value) {
    gastoGraficoHistoricoGastos.add(value);
  }

  void removeFromGastoGraficoHistoricoGastos(double value) {
    gastoGraficoHistoricoGastos.remove(value);
  }

  void removeAtIndexFromGastoGraficoHistoricoGastos(int index) {
    gastoGraficoHistoricoGastos.removeAt(index);
  }

  void updateGastoGraficoHistoricoGastosAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    gastoGraficoHistoricoGastos[index] =
        updateFn(_gastoGraficoHistoricoGastos[index]);
  }

  void insertAtIndexInGastoGraficoHistoricoGastos(int index, double value) {
    gastoGraficoHistoricoGastos.insert(index, value);
  }

  List<String> _periodosGraficoHistoricoGastos = [];
  List<String> get periodosGraficoHistoricoGastos =>
      _periodosGraficoHistoricoGastos;
  set periodosGraficoHistoricoGastos(List<String> value) {
    _periodosGraficoHistoricoGastos = value;
  }

  void addToPeriodosGraficoHistoricoGastos(String value) {
    periodosGraficoHistoricoGastos.add(value);
  }

  void removeFromPeriodosGraficoHistoricoGastos(String value) {
    periodosGraficoHistoricoGastos.remove(value);
  }

  void removeAtIndexFromPeriodosGraficoHistoricoGastos(int index) {
    periodosGraficoHistoricoGastos.removeAt(index);
  }

  void updatePeriodosGraficoHistoricoGastosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    periodosGraficoHistoricoGastos[index] =
        updateFn(_periodosGraficoHistoricoGastos[index]);
  }

  void insertAtIndexInPeriodosGraficoHistoricoGastos(int index, String value) {
    periodosGraficoHistoricoGastos.insert(index, value);
  }

  DocumentReference? _flowCuentaCredito;
  DocumentReference? get flowCuentaCredito => _flowCuentaCredito;
  set flowCuentaCredito(DocumentReference? value) {
    _flowCuentaCredito = value;
  }

  List<DateTime> _mesesDisponibles = [];
  List<DateTime> get mesesDisponibles => _mesesDisponibles;
  set mesesDisponibles(List<DateTime> value) {
    _mesesDisponibles = value;
  }

  void addToMesesDisponibles(DateTime value) {
    mesesDisponibles.add(value);
  }

  void removeFromMesesDisponibles(DateTime value) {
    mesesDisponibles.remove(value);
  }

  void removeAtIndexFromMesesDisponibles(int index) {
    mesesDisponibles.removeAt(index);
  }

  void updateMesesDisponiblesAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    mesesDisponibles[index] = updateFn(_mesesDisponibles[index]);
  }

  void insertAtIndexInMesesDisponibles(int index, DateTime value) {
    mesesDisponibles.insert(index, value);
  }

  bool _primerIngreso = true;
  bool get primerIngreso => _primerIngreso;
  set primerIngreso(bool value) {
    _primerIngreso = value;
  }
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
