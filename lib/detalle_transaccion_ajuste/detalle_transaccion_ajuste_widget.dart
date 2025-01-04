import '/backend/backend.dart';
import '/components/dropdown_cuentas_widget.dart';
import '/components/eliminar_confimacion_transaccion_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'detalle_transaccion_ajuste_model.dart';
export 'detalle_transaccion_ajuste_model.dart';

class DetalleTransaccionAjusteWidget extends StatefulWidget {
  const DetalleTransaccionAjusteWidget({
    super.key,
    required this.parametroTransaccion,
    required this.divisa,
  });

  final TodasTransaccionesStruct? parametroTransaccion;
  final bool? divisa;

  @override
  State<DetalleTransaccionAjusteWidget> createState() =>
      _DetalleTransaccionAjusteWidgetState();
}

class _DetalleTransaccionAjusteWidgetState
    extends State<DetalleTransaccionAjusteWidget> {
  late DetalleTransaccionAjusteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalleTransaccionAjusteModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().flowFecha = widget.parametroTransaccion?.fecha;
      FFAppState().flowCuenta = widget.parametroTransaccion?.refCuenta == null
          ? FlowCuentaStruct(
              nombre: widget.parametroTransaccion?.cuentaCredito,
              cuentaRef: widget.parametroTransaccion?.refCuentaCredito,
              logo: widget.parametroTransaccion?.logoCuentaCredito,
            )
          : FlowCuentaStruct(
              nombre: widget.parametroTransaccion?.cuenta,
              cuentaRef: widget.parametroTransaccion?.refCuenta,
              logo: widget.parametroTransaccion?.logoCuenta,
            );
      safeSetState(() {});
    });

    _model.aumentarDisminuirValue =
        (widget.parametroTransaccion!.monto < 0.0) ||
            (widget.parametroTransaccion!.montoAhorro < 0.0);
    _model.textController ??= TextEditingController(
        text: widget.parametroTransaccion?.monto == 0.0
            ? (widget.parametroTransaccion!.montoAhorro < 0.0
                ? functions
                    .cambiarSimbolo(widget.parametroTransaccion?.montoAhorro)
                    ?.toString()
                : widget.parametroTransaccion?.montoAhorro.toString())
            : (widget.parametroTransaccion!.monto < 0.0
                ? functions
                    .cambiarSimbolo(widget.parametroTransaccion?.monto)
                    ?.toString()
                : widget.parametroTransaccion?.monto.toString()));
    _model.textFieldFocusNode ??= FocusNode();
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Ajuste',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Fecha',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.divisa == true) {
                          return;
                        }

                        final datePickedDate = await showDatePicker(
                          context: context,
                          initialDate: getCurrentTimestamp,
                          firstDate: DateTime(1900),
                          lastDate: getCurrentTimestamp,
                          builder: (context, child) {
                            return wrapInMaterialDatePickerTheme(
                              context,
                              child!,
                              headerBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              headerForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              headerTextStyle: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              pickerBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              pickerForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24.0,
                            );
                          },
                        );

                        if (datePickedDate != null) {
                          safeSetState(() {
                            _model.datePicked = DateTime(
                              datePickedDate.year,
                              datePickedDate.month,
                              datePickedDate.day,
                            );
                          });
                        }
                        FFAppState().flowFecha = _model.datePicked;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            dateTimeFormat("yMMMd", FFAppState().flowFecha),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_balance_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Cuenta',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.divisa!) {
                            return;
                          }

                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    child: DropdownCuentasWidget(
                                      ahorro: widget.parametroTransaccion
                                              ?.refCuenta ==
                                          null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.08,
                                height: MediaQuery.sizeOf(context).width * 0.08,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  FFAppState().flowCuenta.logo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFAppState().flowCuenta.nombre,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.attach_money_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Monto',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        'Aumentar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Switch.adaptive(
                                      value: _model.aumentarDisminuirValue!,
                                      onChanged: widget.divisa!
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                      .aumentarDisminuirValue =
                                                  newValue);
                                            },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).error,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context).success,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Disminuir',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 14.0, 0.0, 0.0),
                                child: Text(
                                  'Monto',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.35,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    readOnly: widget.divisa!,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'TextField',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        if (!widget.divisa!)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: StreamBuilder<CuentasRecord>(
                              stream: CuentasRecord.getDocument(widget
                                          .parametroTransaccion?.refCuenta ==
                                      null
                                  ? widget
                                      .parametroTransaccion!.refCuentaCredito!
                                  : widget.parametroTransaccion!.refCuenta!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }

                                final buttonCuentasRecord = snapshot.data!;

                                return FFButtonWidget(
                                  onPressed: () async {
                                    if (widget
                                            .parametroTransaccion?.refCuenta ==
                                        null) {
                                      await widget
                                          .parametroTransaccion!.refTransaccion!
                                          .update(createTransaccionesRecordData(
                                        timestamp: getCurrentTimestamp,
                                        cuentaCredito:
                                            FFAppState().flowCuenta.cuentaRef,
                                        montoAhorro: _model
                                                .aumentarDisminuirValue!
                                            ? functions.cambiarSimbolo(
                                                double.tryParse(
                                                    _model.textController.text))
                                            : double.tryParse(
                                                _model.textController.text),
                                        fecha: FFAppState().flowFecha,
                                      ));
                                      if (widget.parametroTransaccion
                                              ?.refCuentaCredito ==
                                          FFAppState().flowCuenta.cuentaRef) {
                                        await widget.parametroTransaccion!
                                            .refCuentaCredito!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tap': FieldValue.increment(_model
                                                          .aumentarDisminuirValue ==
                                                      false
                                                  ? functions.resta(
                                                      double.parse(_model
                                                          .textController.text),
                                                      widget
                                                          .parametroTransaccion!
                                                          .montoAhorro)!
                                                  : functions.resta(
                                                      functions.cambiarSimbolo(double.tryParse(
                                                          _model.textController.text))!,
                                                      widget.parametroTransaccion!.montoAhorro)!),
                                            },
                                          ),
                                        });
                                      } else {
                                        // arregloCuenta

                                        await widget.parametroTransaccion!
                                            .refCuentaCredito!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tap': FieldValue.increment(
                                                  -(widget
                                                      .parametroTransaccion!
                                                      .montoAhorro)),
                                            },
                                          ),
                                        });

                                        await FFAppState()
                                            .flowCuenta
                                            .cuentaRef!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tap': FieldValue.increment(_model
                                                      .aumentarDisminuirValue!
                                                  ? functions.cambiarSimbolo(
                                                      double.tryParse(_model
                                                          .textController
                                                          .text))!
                                                  : double.parse(_model
                                                      .textController.text)),
                                            },
                                          ),
                                        });
                                      }
                                    } else {
                                      await widget
                                          .parametroTransaccion!.refTransaccion!
                                          .update(createTransaccionesRecordData(
                                        timestamp: getCurrentTimestamp,
                                        monto: _model.aumentarDisminuirValue!
                                            ? functions.cambiarSimbolo(
                                                double.tryParse(
                                                    _model.textController.text))
                                            : double.tryParse(
                                                _model.textController.text),
                                        cuenta:
                                            FFAppState().flowCuenta.cuentaRef,
                                        fecha: FFAppState().flowFecha,
                                      ));
                                      if (widget.parametroTransaccion
                                              ?.refCuentaCredito ==
                                          FFAppState().flowCuenta.cuentaRef) {
                                        await widget
                                            .parametroTransaccion!.refCuenta!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tap': FieldValue.increment(_model
                                                          .aumentarDisminuirValue ==
                                                      false
                                                  ? functions.resta(
                                                      double.parse(_model
                                                          .textController.text),
                                                      widget
                                                          .parametroTransaccion!
                                                          .montoAhorro)!
                                                  : functions.resta(
                                                      functions.cambiarSimbolo(double.tryParse(
                                                          _model.textController.text))!,
                                                      widget.parametroTransaccion!.montoAhorro)!),
                                            },
                                          ),
                                        });
                                      } else {
                                        // arregloCuenta

                                        await widget
                                            .parametroTransaccion!.refCuenta!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tap': FieldValue.increment(
                                                  -(widget
                                                      .parametroTransaccion!
                                                      .monto)),
                                            },
                                          ),
                                        });

                                        await FFAppState()
                                            .flowCuenta
                                            .cuentaRef!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'tap': FieldValue.increment(_model
                                                      .aumentarDisminuirValue!
                                                  ? functions.cambiarSimbolo(
                                                      double.tryParse(_model
                                                          .textController
                                                          .text))!
                                                  : double.parse(_model
                                                      .textController.text)),
                                            },
                                          ),
                                        });
                                      }
                                    }

                                    await actions
                                        .obtenerYProcesarTransaccionesCompletas();
                                    await actions
                                        .guardarMesActualEnSeleccionPeriodos();
                                    await Future.wait([
                                      Future(() async {
                                        await actions
                                            .procesarDatosGraficoPresupuesto();
                                      }),
                                      Future(() async {
                                        await actions
                                            .calcularGastosEIngresosTotales();
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
                                        await actions
                                            .procesarDatosHistoricoIngreso();
                                      }),
                                      Future(() async {
                                        await actions
                                            .procesarDatosHistoricoAhorro();
                                      }),
                                      Future(() async {
                                        await actions
                                            .poblarDropdownCuentaAhorro();
                                      }),
                                      Future(() async {
                                        await actions.obtenerSaldosCuentas();
                                      }),
                                      Future(() async {
                                        await actions
                                            .obtenerTodasLasTransacciones();
                                      }),
                                      Future(() async {
                                        await actions.saldoGeneral();
                                      }),
                                      Future(() async {
                                        await actions.saldoCuentasAhorro();
                                      }),
                                    ]);
                                    FFAppState()
                                        .insertAtIndexInCategoriasHistorico(
                                            0, 'Todas');
                                    FFAppState().update(() {});
                                    FFAppState()
                                        .insertAtIndexInSeleccionEtiquetasHistorico(
                                            0, 'Todas');
                                    FFAppState().update(() {});
                                    await actions
                                        .procesarGraficoHistoricoGastos();
                                    context.safePop();
                                  },
                                  text: 'Guardar cambios',
                                  options: FFButtonOptions(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  showLoadingIndicator: false,
                                );
                              },
                            ),
                          ),
                        if (widget.divisa ?? true)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  ':(',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 40.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                'No se pueden modificar transacciones con divisas',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    if (!widget.divisa!)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 100.0,
                          borderWidth: 1.0,
                          buttonSize: MediaQuery.sizeOf(context).width * 0.15,
                          fillColor: FlutterFlowTheme.of(context).secondaryText,
                          icon: Icon(
                            Icons.delete_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 40.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      child:
                                          EliminarConfimacionTransaccionWidget(
                                        transaccion: widget
                                            .parametroTransaccion!
                                            .refTransaccion!,
                                        detalleTransaccion:
                                            widget.parametroTransaccion!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
