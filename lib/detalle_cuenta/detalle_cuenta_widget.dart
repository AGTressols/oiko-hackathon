import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/eliminar_confimacion_cuenta_widget.dart';
import '/components/logos_cuentas_widget.dart';
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
import 'detalle_cuenta_model.dart';
export 'detalle_cuenta_model.dart';

class DetalleCuentaWidget extends StatefulWidget {
  const DetalleCuentaWidget({
    super.key,
    required this.parametroCuenta,
    bool? nuevoUsuario,
  }) : nuevoUsuario = nuevoUsuario ?? false;

  final CuentasRecord? parametroCuenta;
  final bool nuevoUsuario;

  @override
  State<DetalleCuentaWidget> createState() => _DetalleCuentaWidgetState();
}

class _DetalleCuentaWidgetState extends State<DetalleCuentaWidget> {
  late DetalleCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalleCuentaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().imagen = widget.parametroCuenta!.logo;
      safeSetState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: widget.parametroCuenta?.cuenta);
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = false;
    _model.ajusteTextController ??= TextEditingController();
    _model.ajusteFocusNode ??= FocusNode();

    _model.tipoDeCambioTextController ??= TextEditingController();
    _model.tipoDeCambioFocusNode ??= FocusNode();
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: BoxDecoration(
                        color: widget.parametroCuenta?.ahorro == false
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        widget.parametroCuenta?.ahorro == false
                            ? 'Cuenta corriente'
                            : 'Caja de ahorro',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 20,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
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
                                              0.75,
                                      child: const LogosCuentasWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).width * 0.2,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              FFAppState().imagen,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 70,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              suffixIcon: const Icon(
                                Icons.edit_rounded,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (widget.parametroCuenta?.ahorro == true)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Text(
                        'Moneda',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  if (widget.parametroCuenta?.ahorro == true)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.parametroCuenta?.divisa,
                          'moneda',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  if (!widget.nuevoUsuario)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                      child: Text(
                        'Ajustar saldo',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  if (!widget.nuevoUsuario)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Switch.adaptive(
                            value: _model.switchValue!,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.switchValue = newValue);
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).error,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).success,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!widget.nuevoUsuario)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(64.0, 16.0, 64.0, 0.0),
                      child: TextFormField(
                        controller: _model.ajusteTextController,
                        focusNode: _model.ajusteFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: '\$ ...',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 16.0, 8.0, 16.0),
                          suffixIcon: Icon(
                            Icons.edit_rounded,
                            color: _model.switchValue!
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context).success,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: _model.switchValue!
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context).success,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                        textAlign: TextAlign.center,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: _model.ajusteTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  if ((_model.ajusteTextController.text != '') &&
                      (widget.parametroCuenta?.divisa != '\$ARS') &&
                      (widget.parametroCuenta?.tad == 0.0))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Tipo de cambio',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 180.0,
                              child: TextFormField(
                                controller: _model.tipoDeCambioTextController,
                                focusNode: _model.tipoDeCambioFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Valor que compraste',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 16.0, 8.0, 16.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model
                                    .tipoDeCambioTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: StreamBuilder<CuentasRecord>(
                      stream: CuentasRecord.getDocument(
                          widget.parametroCuenta!.reference),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitChasingDots(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }

                        final buttonCuentasRecord = snapshot.data!;

                        return FFButtonWidget(
                          onPressed: () async {
                            if ((widget.parametroCuenta?.ahorro == true) &&
                                (widget.parametroCuenta?.divisa != '\$ARS') &&
                                (widget.parametroCuenta?.tad == 0.0)) {
                              if (!(_model.tipoDeCambioTextController.text !=
                                      '')) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Ingresa el tipo de cambio'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              await widget.parametroCuenta!.reference
                                  .update(createCuentasRecordData(
                                cuenta: _model.textController1.text,
                                logo: FFAppState().imagen,
                              ));
                            } else {
                              await widget.parametroCuenta!.reference
                                  .update(createCuentasRecordData(
                                cuenta: _model.textController1.text,
                                logo: FFAppState().imagen,
                              ));
                            }

                            if (_model.ajusteTextController.text != '') {
                              if (widget.parametroCuenta?.ahorro == true) {
                                if (buttonCuentasRecord.divisa != '\$ARS') {
                                  if (widget.parametroCuenta?.tad == 0.0) {
                                    await buttonCuentasRecord.reference
                                        .update(createCuentasRecordData(
                                      ppp: double.tryParse(_model
                                          .tipoDeCambioTextController.text),
                                    ));
                                  }

                                  var transaccionesRecordReference1 =
                                      TransaccionesRecord.collection.doc();
                                  await transaccionesRecordReference1
                                      .set(createTransaccionesRecordData(
                                    uid: currentUserUid,
                                    fecha: getCurrentTimestamp,
                                    movimiento: 'Ajuste',
                                    montoAhorro: _model.switchValue!
                                        ? functions.ajusteDivisa(
                                            double.parse(_model
                                                .ajusteTextController.text),
                                            buttonCuentasRecord.ppp,
                                            -1.0)
                                        : functions.ajusteDivisa(
                                            double.parse(_model
                                                .ajusteTextController.text),
                                            buttonCuentasRecord.ppp,
                                            1.0),
                                    montoDivisa: _model.switchValue!
                                        ? functions.cambiarSimbolo(
                                            double.tryParse(_model
                                                .ajusteTextController.text))
                                        : double.tryParse(
                                            _model.ajusteTextController.text),
                                    cuentaCredito:
                                        widget.parametroCuenta?.reference,
                                    timestamp: getCurrentTimestamp,
                                    monto: 0.0,
                                  ));
                                  _model.ajusteDivisa =
                                      TransaccionesRecord.getDocumentFromData(
                                          createTransaccionesRecordData(
                                            uid: currentUserUid,
                                            fecha: getCurrentTimestamp,
                                            movimiento: 'Ajuste',
                                            montoAhorro: _model.switchValue!
                                                ? functions.ajusteDivisa(
                                                    double.parse(_model
                                                        .ajusteTextController
                                                        .text),
                                                    buttonCuentasRecord.ppp,
                                                    -1.0)
                                                : functions.ajusteDivisa(
                                                    double.parse(_model
                                                        .ajusteTextController
                                                        .text),
                                                    buttonCuentasRecord.ppp,
                                                    1.0),
                                            montoDivisa: _model.switchValue!
                                                ? functions.cambiarSimbolo(
                                                    double.tryParse(_model
                                                        .ajusteTextController
                                                        .text))
                                                : double.tryParse(_model
                                                    .ajusteTextController.text),
                                            cuentaCredito: widget
                                                .parametroCuenta?.reference,
                                            timestamp: getCurrentTimestamp,
                                            monto: 0.0,
                                          ),
                                          transaccionesRecordReference1);

                                  await buttonCuentasRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'tap': FieldValue.increment(
                                            _model.ajusteDivisa!.montoAhorro),
                                        'tad': FieldValue.increment(
                                            _model.ajusteDivisa!.montoDivisa),
                                      },
                                    ),
                                  });
                                } else {
                                  var transaccionesRecordReference2 =
                                      TransaccionesRecord.collection.doc();
                                  await transaccionesRecordReference2
                                      .set(createTransaccionesRecordData(
                                    uid: currentUserUid,
                                    fecha: getCurrentTimestamp,
                                    movimiento: 'Ajuste',
                                    montoAhorro: _model.switchValue!
                                        ? functions.cambiarSimbolo(
                                            double.tryParse(_model
                                                .ajusteTextController.text))
                                        : double.tryParse(
                                            _model.ajusteTextController.text),
                                    timestamp: getCurrentTimestamp,
                                    cuentaCredito:
                                        widget.parametroCuenta?.reference,
                                    monto: 0.0,
                                    montoDivisa: 0.0,
                                  ));
                                  _model.ajustePesoAhorro =
                                      TransaccionesRecord.getDocumentFromData(
                                          createTransaccionesRecordData(
                                            uid: currentUserUid,
                                            fecha: getCurrentTimestamp,
                                            movimiento: 'Ajuste',
                                            montoAhorro: _model.switchValue!
                                                ? functions.cambiarSimbolo(
                                                    double.tryParse(_model
                                                        .ajusteTextController
                                                        .text))
                                                : double.tryParse(_model
                                                    .ajusteTextController.text),
                                            timestamp: getCurrentTimestamp,
                                            cuentaCredito: widget
                                                .parametroCuenta?.reference,
                                            monto: 0.0,
                                            montoDivisa: 0.0,
                                          ),
                                          transaccionesRecordReference2);

                                  await buttonCuentasRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'tap': FieldValue.increment(_model
                                            .ajustePesoAhorro!.montoAhorro),
                                      },
                                    ),
                                  });
                                }
                              } else {
                                var transaccionesRecordReference3 =
                                    TransaccionesRecord.collection.doc();
                                await transaccionesRecordReference3
                                    .set(createTransaccionesRecordData(
                                  uid: currentUserUid,
                                  fecha: getCurrentTimestamp,
                                  movimiento: 'Ajuste',
                                  timestamp: getCurrentTimestamp,
                                  monto: _model.switchValue!
                                      ? functions.cambiarSimbolo(
                                          double.tryParse(
                                              _model.ajusteTextController.text))
                                      : double.tryParse(
                                          _model.ajusteTextController.text),
                                  cuenta: widget.parametroCuenta?.reference,
                                  montoAhorro: 0.0,
                                  montoDivisa: 0.0,
                                ));
                                _model.ajustePeso =
                                    TransaccionesRecord.getDocumentFromData(
                                        createTransaccionesRecordData(
                                          uid: currentUserUid,
                                          fecha: getCurrentTimestamp,
                                          movimiento: 'Ajuste',
                                          timestamp: getCurrentTimestamp,
                                          monto: _model.switchValue!
                                              ? functions.cambiarSimbolo(
                                                  double.tryParse(_model
                                                      .ajusteTextController
                                                      .text))
                                              : double.tryParse(_model
                                                  .ajusteTextController.text),
                                          cuenta: widget
                                              .parametroCuenta?.reference,
                                          montoAhorro: 0.0,
                                          montoDivisa: 0.0,
                                        ),
                                        transaccionesRecordReference3);

                                await buttonCuentasRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'tap': FieldValue.increment(
                                          _model.ajustePeso!.monto),
                                    },
                                  ),
                                });
                              }
                            }
                            FFAppState().imagen = '';
                            safeSetState(() {});
                            FFAppState().flowFecha = getCurrentTimestamp;
                            FFAppState().flowMovimiento = '';
                            FFAppState().flowMonto = 0.0;
                            FFAppState().flowCuenta = FlowCuentaStruct();
                            FFAppState().flowCategoria = FlowCategoriaStruct();
                            FFAppState().flowEtiqueta = FlowEtiquetaStruct();
                            safeSetState(() {});
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
                              Future(() async {
                                await actions.saldoCuentasAhorro();
                              }),
                            ]);
                            context.safePop();

                            safeSetState(() {});
                          },
                          text: 'Guardar cambios',
                          options: FFButtonOptions(
                            height: MediaQuery.sizeOf(context).height * 0.05,
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
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                  child: EliminarConfimacionCuentaWidget(
                                    cuenta: widget.parametroCuenta!.reference,
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
    );
  }
}
