import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _seleccionPeriodos =
          prefs.getStringList('ff_seleccionPeriodos') ?? _seleccionPeriodos;
    });
    _safeInit(() {
      _categoriasSeleccionadas =
          prefs.getStringList('ff_categoriasSeleccionadas') ??
              _categoriasSeleccionadas;
    });
    _safeInit(() {
      _seleccionCategoriasHistorico =
          prefs.getStringList('ff_seleccionCategoriasHistorico') ??
              _seleccionCategoriasHistorico;
    });
    _safeInit(() {
      _seleccionEtiquetasHistorico =
          prefs.getStringList('ff_seleccionEtiquetasHistorico') ??
              _seleccionEtiquetasHistorico;
    });
    _safeInit(() {
      _colores = prefs
              .getStringList('ff_colores')
              ?.map((x) => Color(int.tryParse(x) ?? 0))
              .toList() ??
          _colores;
    });
    _safeInit(() {
      _tad = prefs.getDouble('ff_tad') ?? _tad;
    });
    _safeInit(() {
      _transaccionesAhorro = prefs
              .getStringList('ff_transaccionesAhorro')
              ?.map((x) {
                try {
                  return TotalidadDeTransaccionesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaccionesAhorro;
    });
    _safeInit(() {
      _transaccionesGasto = prefs
              .getStringList('ff_transaccionesGasto')
              ?.map((x) {
                try {
                  return TotalidadDeTransaccionesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaccionesGasto;
    });
    _safeInit(() {
      _transaccionesTraspaso = prefs
              .getStringList('ff_transaccionesTraspaso')
              ?.map((x) {
                try {
                  return TotalidadDeTransaccionesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaccionesTraspaso;
    });
    _safeInit(() {
      _transaccionesIngreso = prefs
              .getStringList('ff_transaccionesIngreso')
              ?.map((x) {
                try {
                  return TotalidadDeTransaccionesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaccionesIngreso;
    });
    _safeInit(() {
      _cacheCategorias = prefs
              .getStringList('ff_cacheCategorias')
              ?.map((x) {
                try {
                  return CategoriasCacheStructStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cacheCategorias;
    });
    _safeInit(() {
      _cacheCuentas = prefs
              .getStringList('ff_cacheCuentas')
              ?.map((x) {
                try {
                  return CuentaCacheStructStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cacheCuentas;
    });
    _safeInit(() {
      _cacheEtiquetas = prefs
              .getStringList('ff_cacheEtiquetas')
              ?.map((x) {
                try {
                  return EtiquetaCacheStructStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cacheEtiquetas;
    });
    _safeInit(() {
      _ultimoTimestampTransaccion =
          prefs.getString('ff_ultimoTimestampTransaccion') ??
              _ultimoTimestampTransaccion;
    });
    _safeInit(() {
      _transaccionesAjuste = prefs
              .getStringList('ff_transaccionesAjuste')
              ?.map((x) {
                try {
                  return TotalidadDeTransaccionesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaccionesAjuste;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<GraficoAhorroPorCuentaPadreStruct> _cuentaAhorroPadreMas = [];
  List<GraficoAhorroPorCuentaPadreStruct> get cuentaAhorroPadreMas =>
      _cuentaAhorroPadreMas;
  set cuentaAhorroPadreMas(List<GraficoAhorroPorCuentaPadreStruct> value) {
    _cuentaAhorroPadreMas = value;
  }

  void addToCuentaAhorroPadreMas(GraficoAhorroPorCuentaPadreStruct value) {
    cuentaAhorroPadreMas.add(value);
  }

  void removeFromCuentaAhorroPadreMas(GraficoAhorroPorCuentaPadreStruct value) {
    cuentaAhorroPadreMas.remove(value);
  }

  void removeAtIndexFromCuentaAhorroPadreMas(int index) {
    cuentaAhorroPadreMas.removeAt(index);
  }

  void updateCuentaAhorroPadreMasAtIndex(
    int index,
    GraficoAhorroPorCuentaPadreStruct Function(
            GraficoAhorroPorCuentaPadreStruct)
        updateFn,
  ) {
    cuentaAhorroPadreMas[index] = updateFn(_cuentaAhorroPadreMas[index]);
  }

  void insertAtIndexInCuentaAhorroPadreMas(
      int index, GraficoAhorroPorCuentaPadreStruct value) {
    cuentaAhorroPadreMas.insert(index, value);
  }

  List<GraficoAhorroPorCuentaPadreStruct> _cuentaAhorroPadreMenos = [];
  List<GraficoAhorroPorCuentaPadreStruct> get cuentaAhorroPadreMenos =>
      _cuentaAhorroPadreMenos;
  set cuentaAhorroPadreMenos(List<GraficoAhorroPorCuentaPadreStruct> value) {
    _cuentaAhorroPadreMenos = value;
  }

  void addToCuentaAhorroPadreMenos(GraficoAhorroPorCuentaPadreStruct value) {
    cuentaAhorroPadreMenos.add(value);
  }

  void removeFromCuentaAhorroPadreMenos(
      GraficoAhorroPorCuentaPadreStruct value) {
    cuentaAhorroPadreMenos.remove(value);
  }

  void removeAtIndexFromCuentaAhorroPadreMenos(int index) {
    cuentaAhorroPadreMenos.removeAt(index);
  }

  void updateCuentaAhorroPadreMenosAtIndex(
    int index,
    GraficoAhorroPorCuentaPadreStruct Function(
            GraficoAhorroPorCuentaPadreStruct)
        updateFn,
  ) {
    cuentaAhorroPadreMenos[index] = updateFn(_cuentaAhorroPadreMenos[index]);
  }

  void insertAtIndexInCuentaAhorroPadreMenos(
      int index, GraficoAhorroPorCuentaPadreStruct value) {
    cuentaAhorroPadreMenos.insert(index, value);
  }

  int _alturaMaximaPadreMas = 0;
  int get alturaMaximaPadreMas => _alturaMaximaPadreMas;
  set alturaMaximaPadreMas(int value) {
    _alturaMaximaPadreMas = value;
  }

  int _alturaMaximaPadreMenos = 0;
  int get alturaMaximaPadreMenos => _alturaMaximaPadreMenos;
  set alturaMaximaPadreMenos(int value) {
    _alturaMaximaPadreMenos = value;
  }

  List<double> _totalAjusteGraficoGeneral = [];
  List<double> get totalAjusteGraficoGeneral => _totalAjusteGraficoGeneral;
  set totalAjusteGraficoGeneral(List<double> value) {
    _totalAjusteGraficoGeneral = value;
  }

  void addToTotalAjusteGraficoGeneral(double value) {
    totalAjusteGraficoGeneral.add(value);
  }

  void removeFromTotalAjusteGraficoGeneral(double value) {
    totalAjusteGraficoGeneral.remove(value);
  }

  void removeAtIndexFromTotalAjusteGraficoGeneral(int index) {
    totalAjusteGraficoGeneral.removeAt(index);
  }

  void updateTotalAjusteGraficoGeneralAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    totalAjusteGraficoGeneral[index] =
        updateFn(_totalAjusteGraficoGeneral[index]);
  }

  void insertAtIndexInTotalAjusteGraficoGeneral(int index, double value) {
    totalAjusteGraficoGeneral.insert(index, value);
  }

  List<GraficoAhorroCuentaStruct> _graficoAhorroCuenta = [];
  List<GraficoAhorroCuentaStruct> get graficoAhorroCuenta =>
      _graficoAhorroCuenta;
  set graficoAhorroCuenta(List<GraficoAhorroCuentaStruct> value) {
    _graficoAhorroCuenta = value;
  }

  void addToGraficoAhorroCuenta(GraficoAhorroCuentaStruct value) {
    graficoAhorroCuenta.add(value);
  }

  void removeFromGraficoAhorroCuenta(GraficoAhorroCuentaStruct value) {
    graficoAhorroCuenta.remove(value);
  }

  void removeAtIndexFromGraficoAhorroCuenta(int index) {
    graficoAhorroCuenta.removeAt(index);
  }

  void updateGraficoAhorroCuentaAtIndex(
    int index,
    GraficoAhorroCuentaStruct Function(GraficoAhorroCuentaStruct) updateFn,
  ) {
    graficoAhorroCuenta[index] = updateFn(_graficoAhorroCuenta[index]);
  }

  void insertAtIndexInGraficoAhorroCuenta(
      int index, GraficoAhorroCuentaStruct value) {
    graficoAhorroCuenta.insert(index, value);
  }

  List<AhorroPorCuentaStruct> _ahorroPorCuenta = [];
  List<AhorroPorCuentaStruct> get ahorroPorCuenta => _ahorroPorCuenta;
  set ahorroPorCuenta(List<AhorroPorCuentaStruct> value) {
    _ahorroPorCuenta = value;
  }

  void addToAhorroPorCuenta(AhorroPorCuentaStruct value) {
    ahorroPorCuenta.add(value);
  }

  void removeFromAhorroPorCuenta(AhorroPorCuentaStruct value) {
    ahorroPorCuenta.remove(value);
  }

  void removeAtIndexFromAhorroPorCuenta(int index) {
    ahorroPorCuenta.removeAt(index);
  }

  void updateAhorroPorCuentaAtIndex(
    int index,
    AhorroPorCuentaStruct Function(AhorroPorCuentaStruct) updateFn,
  ) {
    ahorroPorCuenta[index] = updateFn(_ahorroPorCuenta[index]);
  }

  void insertAtIndexInAhorroPorCuenta(int index, AhorroPorCuentaStruct value) {
    ahorroPorCuenta.insert(index, value);
  }

  List<GraficoAhorroPorCuentaPadreStruct> _graficoAhorroPorCuentaPadre = [];
  List<GraficoAhorroPorCuentaPadreStruct> get graficoAhorroPorCuentaPadre =>
      _graficoAhorroPorCuentaPadre;
  set graficoAhorroPorCuentaPadre(
      List<GraficoAhorroPorCuentaPadreStruct> value) {
    _graficoAhorroPorCuentaPadre = value;
  }

  void addToGraficoAhorroPorCuentaPadre(
      GraficoAhorroPorCuentaPadreStruct value) {
    graficoAhorroPorCuentaPadre.add(value);
  }

  void removeFromGraficoAhorroPorCuentaPadre(
      GraficoAhorroPorCuentaPadreStruct value) {
    graficoAhorroPorCuentaPadre.remove(value);
  }

  void removeAtIndexFromGraficoAhorroPorCuentaPadre(int index) {
    graficoAhorroPorCuentaPadre.removeAt(index);
  }

  void updateGraficoAhorroPorCuentaPadreAtIndex(
    int index,
    GraficoAhorroPorCuentaPadreStruct Function(
            GraficoAhorroPorCuentaPadreStruct)
        updateFn,
  ) {
    graficoAhorroPorCuentaPadre[index] =
        updateFn(_graficoAhorroPorCuentaPadre[index]);
  }

  void insertAtIndexInGraficoAhorroPorCuentaPadre(
      int index, GraficoAhorroPorCuentaPadreStruct value) {
    graficoAhorroPorCuentaPadre.insert(index, value);
  }

  List<GraficoAhorroPorCuentaHijoStruct> _graficoAhorroPorCuentaHijo = [];
  List<GraficoAhorroPorCuentaHijoStruct> get graficoAhorroPorCuentaHijo =>
      _graficoAhorroPorCuentaHijo;
  set graficoAhorroPorCuentaHijo(List<GraficoAhorroPorCuentaHijoStruct> value) {
    _graficoAhorroPorCuentaHijo = value;
  }

  void addToGraficoAhorroPorCuentaHijo(GraficoAhorroPorCuentaHijoStruct value) {
    graficoAhorroPorCuentaHijo.add(value);
  }

  void removeFromGraficoAhorroPorCuentaHijo(
      GraficoAhorroPorCuentaHijoStruct value) {
    graficoAhorroPorCuentaHijo.remove(value);
  }

  void removeAtIndexFromGraficoAhorroPorCuentaHijo(int index) {
    graficoAhorroPorCuentaHijo.removeAt(index);
  }

  void updateGraficoAhorroPorCuentaHijoAtIndex(
    int index,
    GraficoAhorroPorCuentaHijoStruct Function(GraficoAhorroPorCuentaHijoStruct)
        updateFn,
  ) {
    graficoAhorroPorCuentaHijo[index] =
        updateFn(_graficoAhorroPorCuentaHijo[index]);
  }

  void insertAtIndexInGraficoAhorroPorCuentaHijo(
      int index, GraficoAhorroPorCuentaHijoStruct value) {
    graficoAhorroPorCuentaHijo.insert(index, value);
  }

  List<GraficoAhorroPorCuentaPadreStruct> _padreMenos = [];
  List<GraficoAhorroPorCuentaPadreStruct> get padreMenos => _padreMenos;
  set padreMenos(List<GraficoAhorroPorCuentaPadreStruct> value) {
    _padreMenos = value;
  }

  void addToPadreMenos(GraficoAhorroPorCuentaPadreStruct value) {
    padreMenos.add(value);
  }

  void removeFromPadreMenos(GraficoAhorroPorCuentaPadreStruct value) {
    padreMenos.remove(value);
  }

  void removeAtIndexFromPadreMenos(int index) {
    padreMenos.removeAt(index);
  }

  void updatePadreMenosAtIndex(
    int index,
    GraficoAhorroPorCuentaPadreStruct Function(
            GraficoAhorroPorCuentaPadreStruct)
        updateFn,
  ) {
    padreMenos[index] = updateFn(_padreMenos[index]);
  }

  void insertAtIndexInPadreMenos(
      int index, GraficoAhorroPorCuentaPadreStruct value) {
    padreMenos.insert(index, value);
  }

  List<GraficoAhorroPorCuentaHijoStruct> _hijoMenos = [];
  List<GraficoAhorroPorCuentaHijoStruct> get hijoMenos => _hijoMenos;
  set hijoMenos(List<GraficoAhorroPorCuentaHijoStruct> value) {
    _hijoMenos = value;
  }

  void addToHijoMenos(GraficoAhorroPorCuentaHijoStruct value) {
    hijoMenos.add(value);
  }

  void removeFromHijoMenos(GraficoAhorroPorCuentaHijoStruct value) {
    hijoMenos.remove(value);
  }

  void removeAtIndexFromHijoMenos(int index) {
    hijoMenos.removeAt(index);
  }

  void updateHijoMenosAtIndex(
    int index,
    GraficoAhorroPorCuentaHijoStruct Function(GraficoAhorroPorCuentaHijoStruct)
        updateFn,
  ) {
    hijoMenos[index] = updateFn(_hijoMenos[index]);
  }

  void insertAtIndexInHijoMenos(
      int index, GraficoAhorroPorCuentaHijoStruct value) {
    hijoMenos.insert(index, value);
  }

  int _alturaMaximaContainerPadreCuentaAhorroMas = 0;
  int get alturaMaximaContainerPadreCuentaAhorroMas =>
      _alturaMaximaContainerPadreCuentaAhorroMas;
  set alturaMaximaContainerPadreCuentaAhorroMas(int value) {
    _alturaMaximaContainerPadreCuentaAhorroMas = value;
  }

  int _alturaMaximaContainerPadreCuentaAhorroMenos = 0;
  int get alturaMaximaContainerPadreCuentaAhorroMenos =>
      _alturaMaximaContainerPadreCuentaAhorroMenos;
  set alturaMaximaContainerPadreCuentaAhorroMenos(int value) {
    _alturaMaximaContainerPadreCuentaAhorroMenos = value;
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

  FlowCuentaStruct _flowCuentaCredito = FlowCuentaStruct();
  FlowCuentaStruct get flowCuentaCredito => _flowCuentaCredito;
  set flowCuentaCredito(FlowCuentaStruct value) {
    _flowCuentaCredito = value;
  }

  void updateFlowCuentaCreditoStruct(Function(FlowCuentaStruct) updateFn) {
    updateFn(_flowCuentaCredito);
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
    prefs.setStringList('ff_categoriasSeleccionadas', value);
  }

  void addToCategoriasSeleccionadas(String value) {
    categoriasSeleccionadas.add(value);
    prefs.setStringList('ff_categoriasSeleccionadas', _categoriasSeleccionadas);
  }

  void removeFromCategoriasSeleccionadas(String value) {
    categoriasSeleccionadas.remove(value);
    prefs.setStringList('ff_categoriasSeleccionadas', _categoriasSeleccionadas);
  }

  void removeAtIndexFromCategoriasSeleccionadas(int index) {
    categoriasSeleccionadas.removeAt(index);
    prefs.setStringList('ff_categoriasSeleccionadas', _categoriasSeleccionadas);
  }

  void updateCategoriasSeleccionadasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoriasSeleccionadas[index] = updateFn(_categoriasSeleccionadas[index]);
    prefs.setStringList('ff_categoriasSeleccionadas', _categoriasSeleccionadas);
  }

  void insertAtIndexInCategoriasSeleccionadas(int index, String value) {
    categoriasSeleccionadas.insert(index, value);
    prefs.setStringList('ff_categoriasSeleccionadas', _categoriasSeleccionadas);
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
    prefs.setStringList('ff_seleccionCategoriasHistorico', value);
  }

  void addToSeleccionCategoriasHistorico(String value) {
    seleccionCategoriasHistorico.add(value);
    prefs.setStringList(
        'ff_seleccionCategoriasHistorico', _seleccionCategoriasHistorico);
  }

  void removeFromSeleccionCategoriasHistorico(String value) {
    seleccionCategoriasHistorico.remove(value);
    prefs.setStringList(
        'ff_seleccionCategoriasHistorico', _seleccionCategoriasHistorico);
  }

  void removeAtIndexFromSeleccionCategoriasHistorico(int index) {
    seleccionCategoriasHistorico.removeAt(index);
    prefs.setStringList(
        'ff_seleccionCategoriasHistorico', _seleccionCategoriasHistorico);
  }

  void updateSeleccionCategoriasHistoricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionCategoriasHistorico[index] =
        updateFn(_seleccionCategoriasHistorico[index]);
    prefs.setStringList(
        'ff_seleccionCategoriasHistorico', _seleccionCategoriasHistorico);
  }

  void insertAtIndexInSeleccionCategoriasHistorico(int index, String value) {
    seleccionCategoriasHistorico.insert(index, value);
    prefs.setStringList(
        'ff_seleccionCategoriasHistorico', _seleccionCategoriasHistorico);
  }

  List<String> _seleccionEtiquetasHistorico = [];
  List<String> get seleccionEtiquetasHistorico => _seleccionEtiquetasHistorico;
  set seleccionEtiquetasHistorico(List<String> value) {
    _seleccionEtiquetasHistorico = value;
    prefs.setStringList('ff_seleccionEtiquetasHistorico', value);
  }

  void addToSeleccionEtiquetasHistorico(String value) {
    seleccionEtiquetasHistorico.add(value);
    prefs.setStringList(
        'ff_seleccionEtiquetasHistorico', _seleccionEtiquetasHistorico);
  }

  void removeFromSeleccionEtiquetasHistorico(String value) {
    seleccionEtiquetasHistorico.remove(value);
    prefs.setStringList(
        'ff_seleccionEtiquetasHistorico', _seleccionEtiquetasHistorico);
  }

  void removeAtIndexFromSeleccionEtiquetasHistorico(int index) {
    seleccionEtiquetasHistorico.removeAt(index);
    prefs.setStringList(
        'ff_seleccionEtiquetasHistorico', _seleccionEtiquetasHistorico);
  }

  void updateSeleccionEtiquetasHistoricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionEtiquetasHistorico[index] =
        updateFn(_seleccionEtiquetasHistorico[index]);
    prefs.setStringList(
        'ff_seleccionEtiquetasHistorico', _seleccionEtiquetasHistorico);
  }

  void insertAtIndexInSeleccionEtiquetasHistorico(int index, String value) {
    seleccionEtiquetasHistorico.insert(index, value);
    prefs.setStringList(
        'ff_seleccionEtiquetasHistorico', _seleccionEtiquetasHistorico);
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

  double _ingresoTotalVariable = 0.0;
  double get ingresoTotalVariable => _ingresoTotalVariable;
  set ingresoTotalVariable(double value) {
    _ingresoTotalVariable = value;
  }

  List<GastosCuentasStruct> _ingresosPorCuenta = [];
  List<GastosCuentasStruct> get ingresosPorCuenta => _ingresosPorCuenta;
  set ingresosPorCuenta(List<GastosCuentasStruct> value) {
    _ingresosPorCuenta = value;
  }

  void addToIngresosPorCuenta(GastosCuentasStruct value) {
    ingresosPorCuenta.add(value);
  }

  void removeFromIngresosPorCuenta(GastosCuentasStruct value) {
    ingresosPorCuenta.remove(value);
  }

  void removeAtIndexFromIngresosPorCuenta(int index) {
    ingresosPorCuenta.removeAt(index);
  }

  void updateIngresosPorCuentaAtIndex(
    int index,
    GastosCuentasStruct Function(GastosCuentasStruct) updateFn,
  ) {
    ingresosPorCuenta[index] = updateFn(_ingresosPorCuenta[index]);
  }

  void insertAtIndexInIngresosPorCuenta(int index, GastosCuentasStruct value) {
    ingresosPorCuenta.insert(index, value);
  }

  List<GraficoCategoriasIngresoStruct> _graficoIngresoPorCategoria = [];
  List<GraficoCategoriasIngresoStruct> get graficoIngresoPorCategoria =>
      _graficoIngresoPorCategoria;
  set graficoIngresoPorCategoria(List<GraficoCategoriasIngresoStruct> value) {
    _graficoIngresoPorCategoria = value;
  }

  void addToGraficoIngresoPorCategoria(GraficoCategoriasIngresoStruct value) {
    graficoIngresoPorCategoria.add(value);
  }

  void removeFromGraficoIngresoPorCategoria(
      GraficoCategoriasIngresoStruct value) {
    graficoIngresoPorCategoria.remove(value);
  }

  void removeAtIndexFromGraficoIngresoPorCategoria(int index) {
    graficoIngresoPorCategoria.removeAt(index);
  }

  void updateGraficoIngresoPorCategoriaAtIndex(
    int index,
    GraficoCategoriasIngresoStruct Function(GraficoCategoriasIngresoStruct)
        updateFn,
  ) {
    graficoIngresoPorCategoria[index] =
        updateFn(_graficoIngresoPorCategoria[index]);
  }

  void insertAtIndexInGraficoIngresoPorCategoria(
      int index, GraficoCategoriasIngresoStruct value) {
    graficoIngresoPorCategoria.insert(index, value);
  }

  List<Color> _colores = [
    const Color(0xff00dba4),
    const Color(0xff7699d4),
    const Color(0xff9448bc),
    const Color(0xff480355),
    const Color(0xffefbc9b),
    const Color(0xffeac435),
    const Color(0xff345995),
    const Color(0xfffb4d3d),
    const Color(0xffca1551),
    const Color(0xffdf9a57),
    const Color(0xfffc7a57),
    const Color(0xfffcd757),
    const Color(0xff5e5b52),
    const Color(0xff791e94),
    const Color(0xffde6449),
    const Color(0xff407899),
    const Color(0xffcfd11a),
    const Color(0xff9f87af),
    const Color(0xff88527f),
    const Color(0xff614344),
    const Color(0xff332c23),
    const Color(0xffe56399),
    const Color(0xffe5d4ce),
    const Color(0xffde6e4b),
    const Color(0xff7a6563)
  ];
  List<Color> get colores => _colores;
  set colores(List<Color> value) {
    _colores = value;
    prefs.setStringList(
        'ff_colores', value.map((x) => x.value.toString()).toList());
  }

  void addToColores(Color value) {
    colores.add(value);
    prefs.setStringList(
        'ff_colores', _colores.map((x) => x.value.toString()).toList());
  }

  void removeFromColores(Color value) {
    colores.remove(value);
    prefs.setStringList(
        'ff_colores', _colores.map((x) => x.value.toString()).toList());
  }

  void removeAtIndexFromColores(int index) {
    colores.removeAt(index);
    prefs.setStringList(
        'ff_colores', _colores.map((x) => x.value.toString()).toList());
  }

  void updateColoresAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    colores[index] = updateFn(_colores[index]);
    prefs.setStringList(
        'ff_colores', _colores.map((x) => x.value.toString()).toList());
  }

  void insertAtIndexInColores(int index, Color value) {
    colores.insert(index, value);
    prefs.setStringList(
        'ff_colores', _colores.map((x) => x.value.toString()).toList());
  }

  List<GraficoHistoricoIngresoStruct> _graficoHistoricoIngresoPadre = [];
  List<GraficoHistoricoIngresoStruct> get graficoHistoricoIngresoPadre =>
      _graficoHistoricoIngresoPadre;
  set graficoHistoricoIngresoPadre(List<GraficoHistoricoIngresoStruct> value) {
    _graficoHistoricoIngresoPadre = value;
  }

  void addToGraficoHistoricoIngresoPadre(GraficoHistoricoIngresoStruct value) {
    graficoHistoricoIngresoPadre.add(value);
  }

  void removeFromGraficoHistoricoIngresoPadre(
      GraficoHistoricoIngresoStruct value) {
    graficoHistoricoIngresoPadre.remove(value);
  }

  void removeAtIndexFromGraficoHistoricoIngresoPadre(int index) {
    graficoHistoricoIngresoPadre.removeAt(index);
  }

  void updateGraficoHistoricoIngresoPadreAtIndex(
    int index,
    GraficoHistoricoIngresoStruct Function(GraficoHistoricoIngresoStruct)
        updateFn,
  ) {
    graficoHistoricoIngresoPadre[index] =
        updateFn(_graficoHistoricoIngresoPadre[index]);
  }

  void insertAtIndexInGraficoHistoricoIngresoPadre(
      int index, GraficoHistoricoIngresoStruct value) {
    graficoHistoricoIngresoPadre.insert(index, value);
  }

  List<CategoriasIngresoHistoricoStruct> _graficoIngresoHistoricoHijo = [];
  List<CategoriasIngresoHistoricoStruct> get graficoIngresoHistoricoHijo =>
      _graficoIngresoHistoricoHijo;
  set graficoIngresoHistoricoHijo(
      List<CategoriasIngresoHistoricoStruct> value) {
    _graficoIngresoHistoricoHijo = value;
  }

  void addToGraficoIngresoHistoricoHijo(
      CategoriasIngresoHistoricoStruct value) {
    graficoIngresoHistoricoHijo.add(value);
  }

  void removeFromGraficoIngresoHistoricoHijo(
      CategoriasIngresoHistoricoStruct value) {
    graficoIngresoHistoricoHijo.remove(value);
  }

  void removeAtIndexFromGraficoIngresoHistoricoHijo(int index) {
    graficoIngresoHistoricoHijo.removeAt(index);
  }

  void updateGraficoIngresoHistoricoHijoAtIndex(
    int index,
    CategoriasIngresoHistoricoStruct Function(CategoriasIngresoHistoricoStruct)
        updateFn,
  ) {
    graficoIngresoHistoricoHijo[index] =
        updateFn(_graficoIngresoHistoricoHijo[index]);
  }

  void insertAtIndexInGraficoIngresoHistoricoHijo(
      int index, CategoriasIngresoHistoricoStruct value) {
    graficoIngresoHistoricoHijo.insert(index, value);
  }

  double _flowMontoAhorro = 0.0;
  double get flowMontoAhorro => _flowMontoAhorro;
  set flowMontoAhorro(double value) {
    _flowMontoAhorro = value;
  }

  double _flowMontoDivisa = 0.0;
  double get flowMontoDivisa => _flowMontoDivisa;
  set flowMontoDivisa(double value) {
    _flowMontoDivisa = value;
  }

  double _tad = 0.0;
  double get tad => _tad;
  set tad(double value) {
    _tad = value;
    prefs.setDouble('ff_tad', value);
  }

  bool _esAhorro = false;
  bool get esAhorro => _esAhorro;
  set esAhorro(bool value) {
    _esAhorro = value;
  }

  int _alturaMaximaContainerPadreAhorroMas = 0;
  int get alturaMaximaContainerPadreAhorroMas =>
      _alturaMaximaContainerPadreAhorroMas;
  set alturaMaximaContainerPadreAhorroMas(int value) {
    _alturaMaximaContainerPadreAhorroMas = value;
  }

  int _alturaMaximaContainerPadreAhorroMenos = 0;
  int get alturaMaximaContainerPadreAhorroMenos =>
      _alturaMaximaContainerPadreAhorroMenos;
  set alturaMaximaContainerPadreAhorroMenos(int value) {
    _alturaMaximaContainerPadreAhorroMenos = value;
  }

  List<String> _cuentasDeAhorroDropdown = [];
  List<String> get cuentasDeAhorroDropdown => _cuentasDeAhorroDropdown;
  set cuentasDeAhorroDropdown(List<String> value) {
    _cuentasDeAhorroDropdown = value;
  }

  void addToCuentasDeAhorroDropdown(String value) {
    cuentasDeAhorroDropdown.add(value);
  }

  void removeFromCuentasDeAhorroDropdown(String value) {
    cuentasDeAhorroDropdown.remove(value);
  }

  void removeAtIndexFromCuentasDeAhorroDropdown(int index) {
    cuentasDeAhorroDropdown.removeAt(index);
  }

  void updateCuentasDeAhorroDropdownAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cuentasDeAhorroDropdown[index] = updateFn(_cuentasDeAhorroDropdown[index]);
  }

  void insertAtIndexInCuentasDeAhorroDropdown(int index, String value) {
    cuentasDeAhorroDropdown.insert(index, value);
  }

  List<String> _seleccionCuentaAhorro = [];
  List<String> get seleccionCuentaAhorro => _seleccionCuentaAhorro;
  set seleccionCuentaAhorro(List<String> value) {
    _seleccionCuentaAhorro = value;
  }

  void addToSeleccionCuentaAhorro(String value) {
    seleccionCuentaAhorro.add(value);
  }

  void removeFromSeleccionCuentaAhorro(String value) {
    seleccionCuentaAhorro.remove(value);
  }

  void removeAtIndexFromSeleccionCuentaAhorro(int index) {
    seleccionCuentaAhorro.removeAt(index);
  }

  void updateSeleccionCuentaAhorroAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seleccionCuentaAhorro[index] = updateFn(_seleccionCuentaAhorro[index]);
  }

  void insertAtIndexInSeleccionCuentaAhorro(int index, String value) {
    seleccionCuentaAhorro.insert(index, value);
  }

  List<SaldosCuentasAppStateStruct> _saldosCuentas = [];
  List<SaldosCuentasAppStateStruct> get saldosCuentas => _saldosCuentas;
  set saldosCuentas(List<SaldosCuentasAppStateStruct> value) {
    _saldosCuentas = value;
  }

  void addToSaldosCuentas(SaldosCuentasAppStateStruct value) {
    saldosCuentas.add(value);
  }

  void removeFromSaldosCuentas(SaldosCuentasAppStateStruct value) {
    saldosCuentas.remove(value);
  }

  void removeAtIndexFromSaldosCuentas(int index) {
    saldosCuentas.removeAt(index);
  }

  void updateSaldosCuentasAtIndex(
    int index,
    SaldosCuentasAppStateStruct Function(SaldosCuentasAppStateStruct) updateFn,
  ) {
    saldosCuentas[index] = updateFn(_saldosCuentas[index]);
  }

  void insertAtIndexInSaldosCuentas(
      int index, SaldosCuentasAppStateStruct value) {
    saldosCuentas.insert(index, value);
  }

  double _saldoGeneral = 0.0;
  double get saldoGeneral => _saldoGeneral;
  set saldoGeneral(double value) {
    _saldoGeneral = value;
  }

  double _saldoAhorroGeneral = 0.0;
  double get saldoAhorroGeneral => _saldoAhorroGeneral;
  set saldoAhorroGeneral(double value) {
    _saldoAhorroGeneral = value;
  }

  List<TodasTransaccionesStruct> _todasTransacciones = [];
  List<TodasTransaccionesStruct> get todasTransacciones => _todasTransacciones;
  set todasTransacciones(List<TodasTransaccionesStruct> value) {
    _todasTransacciones = value;
  }

  void addToTodasTransacciones(TodasTransaccionesStruct value) {
    todasTransacciones.add(value);
  }

  void removeFromTodasTransacciones(TodasTransaccionesStruct value) {
    todasTransacciones.remove(value);
  }

  void removeAtIndexFromTodasTransacciones(int index) {
    todasTransacciones.removeAt(index);
  }

  void updateTodasTransaccionesAtIndex(
    int index,
    TodasTransaccionesStruct Function(TodasTransaccionesStruct) updateFn,
  ) {
    todasTransacciones[index] = updateFn(_todasTransacciones[index]);
  }

  void insertAtIndexInTodasTransacciones(
      int index, TodasTransaccionesStruct value) {
    todasTransacciones.insert(index, value);
  }

  List<IngresoGastoAhorroStruct> _ingresoGastoAhorro = [];
  List<IngresoGastoAhorroStruct> get ingresoGastoAhorro => _ingresoGastoAhorro;
  set ingresoGastoAhorro(List<IngresoGastoAhorroStruct> value) {
    _ingresoGastoAhorro = value;
  }

  void addToIngresoGastoAhorro(IngresoGastoAhorroStruct value) {
    ingresoGastoAhorro.add(value);
  }

  void removeFromIngresoGastoAhorro(IngresoGastoAhorroStruct value) {
    ingresoGastoAhorro.remove(value);
  }

  void removeAtIndexFromIngresoGastoAhorro(int index) {
    ingresoGastoAhorro.removeAt(index);
  }

  void updateIngresoGastoAhorroAtIndex(
    int index,
    IngresoGastoAhorroStruct Function(IngresoGastoAhorroStruct) updateFn,
  ) {
    ingresoGastoAhorro[index] = updateFn(_ingresoGastoAhorro[index]);
  }

  void insertAtIndexInIngresoGastoAhorro(
      int index, IngresoGastoAhorroStruct value) {
    ingresoGastoAhorro.insert(index, value);
  }

  List<String> _fechaIngresoGastoAhorro = [];
  List<String> get fechaIngresoGastoAhorro => _fechaIngresoGastoAhorro;
  set fechaIngresoGastoAhorro(List<String> value) {
    _fechaIngresoGastoAhorro = value;
  }

  void addToFechaIngresoGastoAhorro(String value) {
    fechaIngresoGastoAhorro.add(value);
  }

  void removeFromFechaIngresoGastoAhorro(String value) {
    fechaIngresoGastoAhorro.remove(value);
  }

  void removeAtIndexFromFechaIngresoGastoAhorro(int index) {
    fechaIngresoGastoAhorro.removeAt(index);
  }

  void updateFechaIngresoGastoAhorroAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fechaIngresoGastoAhorro[index] = updateFn(_fechaIngresoGastoAhorro[index]);
  }

  void insertAtIndexInFechaIngresoGastoAhorro(int index, String value) {
    fechaIngresoGastoAhorro.insert(index, value);
  }

  List<double> _totalIngresoGraficoGeneral = [];
  List<double> get totalIngresoGraficoGeneral => _totalIngresoGraficoGeneral;
  set totalIngresoGraficoGeneral(List<double> value) {
    _totalIngresoGraficoGeneral = value;
  }

  void addToTotalIngresoGraficoGeneral(double value) {
    totalIngresoGraficoGeneral.add(value);
  }

  void removeFromTotalIngresoGraficoGeneral(double value) {
    totalIngresoGraficoGeneral.remove(value);
  }

  void removeAtIndexFromTotalIngresoGraficoGeneral(int index) {
    totalIngresoGraficoGeneral.removeAt(index);
  }

  void updateTotalIngresoGraficoGeneralAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    totalIngresoGraficoGeneral[index] =
        updateFn(_totalIngresoGraficoGeneral[index]);
  }

  void insertAtIndexInTotalIngresoGraficoGeneral(int index, double value) {
    totalIngresoGraficoGeneral.insert(index, value);
  }

  List<double> _totalGastoGraficoGeneral = [];
  List<double> get totalGastoGraficoGeneral => _totalGastoGraficoGeneral;
  set totalGastoGraficoGeneral(List<double> value) {
    _totalGastoGraficoGeneral = value;
  }

  void addToTotalGastoGraficoGeneral(double value) {
    totalGastoGraficoGeneral.add(value);
  }

  void removeFromTotalGastoGraficoGeneral(double value) {
    totalGastoGraficoGeneral.remove(value);
  }

  void removeAtIndexFromTotalGastoGraficoGeneral(int index) {
    totalGastoGraficoGeneral.removeAt(index);
  }

  void updateTotalGastoGraficoGeneralAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    totalGastoGraficoGeneral[index] =
        updateFn(_totalGastoGraficoGeneral[index]);
  }

  void insertAtIndexInTotalGastoGraficoGeneral(int index, double value) {
    totalGastoGraficoGeneral.insert(index, value);
  }

  List<double> _totalAhorroGraficoGeneral = [];
  List<double> get totalAhorroGraficoGeneral => _totalAhorroGraficoGeneral;
  set totalAhorroGraficoGeneral(List<double> value) {
    _totalAhorroGraficoGeneral = value;
  }

  void addToTotalAhorroGraficoGeneral(double value) {
    totalAhorroGraficoGeneral.add(value);
  }

  void removeFromTotalAhorroGraficoGeneral(double value) {
    totalAhorroGraficoGeneral.remove(value);
  }

  void removeAtIndexFromTotalAhorroGraficoGeneral(int index) {
    totalAhorroGraficoGeneral.removeAt(index);
  }

  void updateTotalAhorroGraficoGeneralAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    totalAhorroGraficoGeneral[index] =
        updateFn(_totalAhorroGraficoGeneral[index]);
  }

  void insertAtIndexInTotalAhorroGraficoGeneral(int index, double value) {
    totalAhorroGraficoGeneral.insert(index, value);
  }

  List<TotalidadDeTransaccionesStruct> _transaccionesAhorro = [];
  List<TotalidadDeTransaccionesStruct> get transaccionesAhorro =>
      _transaccionesAhorro;
  set transaccionesAhorro(List<TotalidadDeTransaccionesStruct> value) {
    _transaccionesAhorro = value;
    prefs.setStringList(
        'ff_transaccionesAhorro', value.map((x) => x.serialize()).toList());
  }

  void addToTransaccionesAhorro(TotalidadDeTransaccionesStruct value) {
    transaccionesAhorro.add(value);
    prefs.setStringList('ff_transaccionesAhorro',
        _transaccionesAhorro.map((x) => x.serialize()).toList());
  }

  void removeFromTransaccionesAhorro(TotalidadDeTransaccionesStruct value) {
    transaccionesAhorro.remove(value);
    prefs.setStringList('ff_transaccionesAhorro',
        _transaccionesAhorro.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaccionesAhorro(int index) {
    transaccionesAhorro.removeAt(index);
    prefs.setStringList('ff_transaccionesAhorro',
        _transaccionesAhorro.map((x) => x.serialize()).toList());
  }

  void updateTransaccionesAhorroAtIndex(
    int index,
    TotalidadDeTransaccionesStruct Function(TotalidadDeTransaccionesStruct)
        updateFn,
  ) {
    transaccionesAhorro[index] = updateFn(_transaccionesAhorro[index]);
    prefs.setStringList('ff_transaccionesAhorro',
        _transaccionesAhorro.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaccionesAhorro(
      int index, TotalidadDeTransaccionesStruct value) {
    transaccionesAhorro.insert(index, value);
    prefs.setStringList('ff_transaccionesAhorro',
        _transaccionesAhorro.map((x) => x.serialize()).toList());
  }

  List<TotalidadDeTransaccionesStruct> _transaccionesGasto = [];
  List<TotalidadDeTransaccionesStruct> get transaccionesGasto =>
      _transaccionesGasto;
  set transaccionesGasto(List<TotalidadDeTransaccionesStruct> value) {
    _transaccionesGasto = value;
    prefs.setStringList(
        'ff_transaccionesGasto', value.map((x) => x.serialize()).toList());
  }

  void addToTransaccionesGasto(TotalidadDeTransaccionesStruct value) {
    transaccionesGasto.add(value);
    prefs.setStringList('ff_transaccionesGasto',
        _transaccionesGasto.map((x) => x.serialize()).toList());
  }

  void removeFromTransaccionesGasto(TotalidadDeTransaccionesStruct value) {
    transaccionesGasto.remove(value);
    prefs.setStringList('ff_transaccionesGasto',
        _transaccionesGasto.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaccionesGasto(int index) {
    transaccionesGasto.removeAt(index);
    prefs.setStringList('ff_transaccionesGasto',
        _transaccionesGasto.map((x) => x.serialize()).toList());
  }

  void updateTransaccionesGastoAtIndex(
    int index,
    TotalidadDeTransaccionesStruct Function(TotalidadDeTransaccionesStruct)
        updateFn,
  ) {
    transaccionesGasto[index] = updateFn(_transaccionesGasto[index]);
    prefs.setStringList('ff_transaccionesGasto',
        _transaccionesGasto.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaccionesGasto(
      int index, TotalidadDeTransaccionesStruct value) {
    transaccionesGasto.insert(index, value);
    prefs.setStringList('ff_transaccionesGasto',
        _transaccionesGasto.map((x) => x.serialize()).toList());
  }

  List<TotalidadDeTransaccionesStruct> _transaccionesTraspaso = [];
  List<TotalidadDeTransaccionesStruct> get transaccionesTraspaso =>
      _transaccionesTraspaso;
  set transaccionesTraspaso(List<TotalidadDeTransaccionesStruct> value) {
    _transaccionesTraspaso = value;
    prefs.setStringList(
        'ff_transaccionesTraspaso', value.map((x) => x.serialize()).toList());
  }

  void addToTransaccionesTraspaso(TotalidadDeTransaccionesStruct value) {
    transaccionesTraspaso.add(value);
    prefs.setStringList('ff_transaccionesTraspaso',
        _transaccionesTraspaso.map((x) => x.serialize()).toList());
  }

  void removeFromTransaccionesTraspaso(TotalidadDeTransaccionesStruct value) {
    transaccionesTraspaso.remove(value);
    prefs.setStringList('ff_transaccionesTraspaso',
        _transaccionesTraspaso.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaccionesTraspaso(int index) {
    transaccionesTraspaso.removeAt(index);
    prefs.setStringList('ff_transaccionesTraspaso',
        _transaccionesTraspaso.map((x) => x.serialize()).toList());
  }

  void updateTransaccionesTraspasoAtIndex(
    int index,
    TotalidadDeTransaccionesStruct Function(TotalidadDeTransaccionesStruct)
        updateFn,
  ) {
    transaccionesTraspaso[index] = updateFn(_transaccionesTraspaso[index]);
    prefs.setStringList('ff_transaccionesTraspaso',
        _transaccionesTraspaso.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaccionesTraspaso(
      int index, TotalidadDeTransaccionesStruct value) {
    transaccionesTraspaso.insert(index, value);
    prefs.setStringList('ff_transaccionesTraspaso',
        _transaccionesTraspaso.map((x) => x.serialize()).toList());
  }

  List<TotalidadDeTransaccionesStruct> _transaccionesIngreso = [];
  List<TotalidadDeTransaccionesStruct> get transaccionesIngreso =>
      _transaccionesIngreso;
  set transaccionesIngreso(List<TotalidadDeTransaccionesStruct> value) {
    _transaccionesIngreso = value;
    prefs.setStringList(
        'ff_transaccionesIngreso', value.map((x) => x.serialize()).toList());
  }

  void addToTransaccionesIngreso(TotalidadDeTransaccionesStruct value) {
    transaccionesIngreso.add(value);
    prefs.setStringList('ff_transaccionesIngreso',
        _transaccionesIngreso.map((x) => x.serialize()).toList());
  }

  void removeFromTransaccionesIngreso(TotalidadDeTransaccionesStruct value) {
    transaccionesIngreso.remove(value);
    prefs.setStringList('ff_transaccionesIngreso',
        _transaccionesIngreso.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaccionesIngreso(int index) {
    transaccionesIngreso.removeAt(index);
    prefs.setStringList('ff_transaccionesIngreso',
        _transaccionesIngreso.map((x) => x.serialize()).toList());
  }

  void updateTransaccionesIngresoAtIndex(
    int index,
    TotalidadDeTransaccionesStruct Function(TotalidadDeTransaccionesStruct)
        updateFn,
  ) {
    transaccionesIngreso[index] = updateFn(_transaccionesIngreso[index]);
    prefs.setStringList('ff_transaccionesIngreso',
        _transaccionesIngreso.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaccionesIngreso(
      int index, TotalidadDeTransaccionesStruct value) {
    transaccionesIngreso.insert(index, value);
    prefs.setStringList('ff_transaccionesIngreso',
        _transaccionesIngreso.map((x) => x.serialize()).toList());
  }

  List<CategoriasCacheStructStruct> _cacheCategorias = [];
  List<CategoriasCacheStructStruct> get cacheCategorias => _cacheCategorias;
  set cacheCategorias(List<CategoriasCacheStructStruct> value) {
    _cacheCategorias = value;
    prefs.setStringList(
        'ff_cacheCategorias', value.map((x) => x.serialize()).toList());
  }

  void addToCacheCategorias(CategoriasCacheStructStruct value) {
    cacheCategorias.add(value);
    prefs.setStringList('ff_cacheCategorias',
        _cacheCategorias.map((x) => x.serialize()).toList());
  }

  void removeFromCacheCategorias(CategoriasCacheStructStruct value) {
    cacheCategorias.remove(value);
    prefs.setStringList('ff_cacheCategorias',
        _cacheCategorias.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCacheCategorias(int index) {
    cacheCategorias.removeAt(index);
    prefs.setStringList('ff_cacheCategorias',
        _cacheCategorias.map((x) => x.serialize()).toList());
  }

  void updateCacheCategoriasAtIndex(
    int index,
    CategoriasCacheStructStruct Function(CategoriasCacheStructStruct) updateFn,
  ) {
    cacheCategorias[index] = updateFn(_cacheCategorias[index]);
    prefs.setStringList('ff_cacheCategorias',
        _cacheCategorias.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCacheCategorias(
      int index, CategoriasCacheStructStruct value) {
    cacheCategorias.insert(index, value);
    prefs.setStringList('ff_cacheCategorias',
        _cacheCategorias.map((x) => x.serialize()).toList());
  }

  List<CuentaCacheStructStruct> _cacheCuentas = [];
  List<CuentaCacheStructStruct> get cacheCuentas => _cacheCuentas;
  set cacheCuentas(List<CuentaCacheStructStruct> value) {
    _cacheCuentas = value;
    prefs.setStringList(
        'ff_cacheCuentas', value.map((x) => x.serialize()).toList());
  }

  void addToCacheCuentas(CuentaCacheStructStruct value) {
    cacheCuentas.add(value);
    prefs.setStringList(
        'ff_cacheCuentas', _cacheCuentas.map((x) => x.serialize()).toList());
  }

  void removeFromCacheCuentas(CuentaCacheStructStruct value) {
    cacheCuentas.remove(value);
    prefs.setStringList(
        'ff_cacheCuentas', _cacheCuentas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCacheCuentas(int index) {
    cacheCuentas.removeAt(index);
    prefs.setStringList(
        'ff_cacheCuentas', _cacheCuentas.map((x) => x.serialize()).toList());
  }

  void updateCacheCuentasAtIndex(
    int index,
    CuentaCacheStructStruct Function(CuentaCacheStructStruct) updateFn,
  ) {
    cacheCuentas[index] = updateFn(_cacheCuentas[index]);
    prefs.setStringList(
        'ff_cacheCuentas', _cacheCuentas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCacheCuentas(int index, CuentaCacheStructStruct value) {
    cacheCuentas.insert(index, value);
    prefs.setStringList(
        'ff_cacheCuentas', _cacheCuentas.map((x) => x.serialize()).toList());
  }

  List<EtiquetaCacheStructStruct> _cacheEtiquetas = [];
  List<EtiquetaCacheStructStruct> get cacheEtiquetas => _cacheEtiquetas;
  set cacheEtiquetas(List<EtiquetaCacheStructStruct> value) {
    _cacheEtiquetas = value;
    prefs.setStringList(
        'ff_cacheEtiquetas', value.map((x) => x.serialize()).toList());
  }

  void addToCacheEtiquetas(EtiquetaCacheStructStruct value) {
    cacheEtiquetas.add(value);
    prefs.setStringList('ff_cacheEtiquetas',
        _cacheEtiquetas.map((x) => x.serialize()).toList());
  }

  void removeFromCacheEtiquetas(EtiquetaCacheStructStruct value) {
    cacheEtiquetas.remove(value);
    prefs.setStringList('ff_cacheEtiquetas',
        _cacheEtiquetas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCacheEtiquetas(int index) {
    cacheEtiquetas.removeAt(index);
    prefs.setStringList('ff_cacheEtiquetas',
        _cacheEtiquetas.map((x) => x.serialize()).toList());
  }

  void updateCacheEtiquetasAtIndex(
    int index,
    EtiquetaCacheStructStruct Function(EtiquetaCacheStructStruct) updateFn,
  ) {
    cacheEtiquetas[index] = updateFn(_cacheEtiquetas[index]);
    prefs.setStringList('ff_cacheEtiquetas',
        _cacheEtiquetas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCacheEtiquetas(
      int index, EtiquetaCacheStructStruct value) {
    cacheEtiquetas.insert(index, value);
    prefs.setStringList('ff_cacheEtiquetas',
        _cacheEtiquetas.map((x) => x.serialize()).toList());
  }

  String _ultimoTimestampTransaccion = '';
  String get ultimoTimestampTransaccion => _ultimoTimestampTransaccion;
  set ultimoTimestampTransaccion(String value) {
    _ultimoTimestampTransaccion = value;
    prefs.setString('ff_ultimoTimestampTransaccion', value);
  }

  List<TotalidadDeTransaccionesStruct> _transaccionesAjuste = [];
  List<TotalidadDeTransaccionesStruct> get transaccionesAjuste =>
      _transaccionesAjuste;
  set transaccionesAjuste(List<TotalidadDeTransaccionesStruct> value) {
    _transaccionesAjuste = value;
    prefs.setStringList(
        'ff_transaccionesAjuste', value.map((x) => x.serialize()).toList());
  }

  void addToTransaccionesAjuste(TotalidadDeTransaccionesStruct value) {
    transaccionesAjuste.add(value);
    prefs.setStringList('ff_transaccionesAjuste',
        _transaccionesAjuste.map((x) => x.serialize()).toList());
  }

  void removeFromTransaccionesAjuste(TotalidadDeTransaccionesStruct value) {
    transaccionesAjuste.remove(value);
    prefs.setStringList('ff_transaccionesAjuste',
        _transaccionesAjuste.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaccionesAjuste(int index) {
    transaccionesAjuste.removeAt(index);
    prefs.setStringList('ff_transaccionesAjuste',
        _transaccionesAjuste.map((x) => x.serialize()).toList());
  }

  void updateTransaccionesAjusteAtIndex(
    int index,
    TotalidadDeTransaccionesStruct Function(TotalidadDeTransaccionesStruct)
        updateFn,
  ) {
    transaccionesAjuste[index] = updateFn(_transaccionesAjuste[index]);
    prefs.setStringList('ff_transaccionesAjuste',
        _transaccionesAjuste.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaccionesAjuste(
      int index, TotalidadDeTransaccionesStruct value) {
    transaccionesAjuste.insert(index, value);
    prefs.setStringList('ff_transaccionesAjuste',
        _transaccionesAjuste.map((x) => x.serialize()).toList());
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
