import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'eliminar_confimacion_transaccion_model.dart';
export 'eliminar_confimacion_transaccion_model.dart';

class EliminarConfimacionTransaccionWidget extends StatefulWidget {
  const EliminarConfimacionTransaccionWidget({
    super.key,
    required this.transaccion,
    required this.detalleTransaccion,
  });

  final DocumentReference? transaccion;
  final TodasTransaccionesStruct? detalleTransaccion;

  @override
  State<EliminarConfimacionTransaccionWidget> createState() =>
      _EliminarConfimacionTransaccionWidgetState();
}

class _EliminarConfimacionTransaccionWidgetState
    extends State<EliminarConfimacionTransaccionWidget> {
  late EliminarConfimacionTransaccionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EliminarConfimacionTransaccionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: 350.0,
                height: 153.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '¿Seguro queres eliminarla?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: 160.0,
                            height: 46.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await widget.transaccion!
                                .update(createTransaccionesRecordData(
                              eliminada: true,
                              timestamp: getCurrentTimestamp,
                            ));
                            if (widget.detalleTransaccion?.movimiento ==
                                'Traspaso') {
                              await widget.detalleTransaccion!.refCuenta!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'tap': FieldValue.increment(
                                        widget.detalleTransaccion!.monto),
                                  },
                                ),
                              });

                              await widget
                                  .detalleTransaccion!.refCuentaCredito!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'tap': FieldValue.increment(
                                        -(widget.detalleTransaccion!.monto)),
                                  },
                                ),
                              });
                            } else if (widget.detalleTransaccion?.movimiento ==
                                'Ajuste') {
                              if (widget.detalleTransaccion?.refCuenta ==
                                  null) {
                                await widget
                                    .detalleTransaccion!.refCuentaCredito!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(-(widget
                                          .detalleTransaccion!.montoAhorro)),
                                    },
                                  ),
                                });
                              } else {
                                await widget.detalleTransaccion!.refCuenta!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(
                                          -(widget.detalleTransaccion!.monto)),
                                    },
                                  ),
                                });
                              }
                            } else if (widget.detalleTransaccion?.movimiento ==
                                'Ahorro') {
                              if (widget.detalleTransaccion!.monto < 0.0) {
                                await widget.detalleTransaccion!.refCuenta!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(widget
                                          .detalleTransaccion!.montoAhorro),
                                    },
                                  ),
                                });

                                await widget
                                    .detalleTransaccion!.refCuentaCredito!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(-(widget
                                          .detalleTransaccion!.montoAhorro)),
                                    },
                                  ),
                                });
                              } else {
                                await widget.detalleTransaccion!.refCuenta!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(widget
                                          .detalleTransaccion!.montoAhorro),
                                    },
                                  ),
                                });

                                await widget
                                    .detalleTransaccion!.refCuentaCredito!
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(-(widget
                                          .detalleTransaccion!.montoAhorro)),
                                    },
                                  ),
                                });
                              }
                            } else {
                              await widget.detalleTransaccion!.refCuenta!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'tap': FieldValue.increment(-(widget
                                                .detalleTransaccion
                                                ?.movimiento ==
                                            'Gasto'
                                        ? functions.cambiarSimbolo(
                                            widget.detalleTransaccion?.monto)!
                                        : widget.detalleTransaccion!.monto)),
                                  },
                                ),
                              });
                            }

                            await actions.guardarMesActualEnSeleccionPeriodos();
                            await actions
                                .obtenerYProcesarTransaccionesCompletas();
                            await Future.wait([
                              Future(() async {
                                await actions.procesarDatosGraficoPresupuesto();
                              }),
                              Future(() async {
                                await actions.calcularGastosEIngresosTotales();
                              }),
                              Future(() async {
                                await actions.procesarDatosDeCuentas();
                              }),
                              Future(() async {
                                await actions
                                    .obtenerCategoriasConTransacciones();
                              }),
                              Future(() async {
                                await actions
                                    .obtenerCategoriasConTransaccionesHistorico();
                              }),
                              Future(() async {
                                await actions
                                    .procesarDatosGraficoIngresoPorCategoria();
                              }),
                              Future(() async {
                                await actions.procesarDatosHistoricoIngreso();
                              }),
                              Future(() async {
                                await actions.procesarDatosHistoricoAhorro();
                              }),
                              Future(() async {
                                await actions.poblarDropdownCuentaAhorro();
                              }),
                              Future(() async {
                                await actions.obtenerSaldosCuentas();
                              }),
                              Future(() async {
                                await actions.obtenerTodasLasTransacciones();
                              }),
                              Future(() async {
                                await actions.saldoGeneral();
                              }),
                            ]);
                            FFAppState()
                                .insertAtIndexInCategoriasHistorico(0, 'Todas');
                            FFAppState().update(() {});
                            FFAppState()
                                .insertAtIndexInSeleccionEtiquetasHistorico(
                                    0, 'Todas');
                            FFAppState().update(() {});
                            await actions.procesarGraficoHistoricoGastos();

                            context.pushNamed('Estadisticas');
                          },
                          text: 'Confirmar',
                          options: FFButtonOptions(
                            width: 160.0,
                            height: 46.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
