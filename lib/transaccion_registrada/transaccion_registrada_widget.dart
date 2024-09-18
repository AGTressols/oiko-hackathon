import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'transaccion_registrada_model.dart';
export 'transaccion_registrada_model.dart';

class TransaccionRegistradaWidget extends StatefulWidget {
  const TransaccionRegistradaWidget({super.key});

  @override
  State<TransaccionRegistradaWidget> createState() =>
      _TransaccionRegistradaWidgetState();
}

class _TransaccionRegistradaWidgetState
    extends State<TransaccionRegistradaWidget> {
  late TransaccionRegistradaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransaccionRegistradaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.guardarMesActualEnSeleccionPeriodos();
      await Future.wait([
        Future(() async {
          await actions.procesarDatosGraficoPresupuesto();
        }),
        Future(() async {
          await actions.calcularGastosEIngresosTotales();
        }),
        Future(() async {
          await actions.calcularSaldoTotal();
        }),
        Future(() async {
          await actions.procesarDatosDeCuentas();
        }),
        Future(() async {
          await actions.obtenerCategoriasConTransacciones();
        }),
        Future(() async {
          await actions.obtenerCategoriasConTransaccionesHistorico();
        }),
        Future(() async {
          await actions.procesarDatosGraficoIngresoPorCategoria();
        }),
        Future(() async {
          await actions.procesarDatosHistoricoIngreso();
        }),
      ]);
      FFAppState().insertAtIndexInCategoriasHistorico(0, 'Todas');
      FFAppState().update(() {});
      FFAppState().insertAtIndexInSeleccionEtiquetasHistorico(0, 'Todas');
      FFAppState().update(() {});
      await actions.procesarGraficoHistoricoGastos();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Icon(
                      Icons.check_rounded,
                      color: FlutterFlowTheme.of(context).accent2,
                      size: 120.0,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '¡Registrado!',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).accent2,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
