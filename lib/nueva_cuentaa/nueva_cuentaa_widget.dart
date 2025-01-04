import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/logos_cuentas_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'nueva_cuentaa_model.dart';
export 'nueva_cuentaa_model.dart';

class NuevaCuentaaWidget extends StatefulWidget {
  const NuevaCuentaaWidget({
    super.key,
    bool? cuentaAhorro,
  }) : cuentaAhorro = cuentaAhorro ?? false;

  final bool cuentaAhorro;

  @override
  State<NuevaCuentaaWidget> createState() => _NuevaCuentaaWidgetState();
}

class _NuevaCuentaaWidgetState extends State<NuevaCuentaaWidget> {
  late NuevaCuentaaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaCuentaaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().imagen =
          'https://firebasestorage.googleapis.com/v0/b/oiko-oficial-45p72k.appspot.com/o/cms_uploads%2Faccount_balance_40dp_FFFFFF.png?alt=media&token=64d7e603-1b4d-495f-992e-e71e184a8d3a';
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.esAhorroValue = widget.cuentaAhorro;
    _model.saldoInicialTextController ??= TextEditingController();
    _model.saldoInicialFocusNode ??= FocusNode();

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
                FFAppState().imagen = '';
                safeSetState(() {});
              },
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 15,
                      child: Row(
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nombre de la cuenta',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
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
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  'Caja de ahoro',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: _model.esAhorroValue!
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Switch.adaptive(
                                value: _model.esAhorroValue!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.esAhorroValue = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.esAhorroValue == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                        child: Text(
                          'Moneda',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    if (_model.esAhorroValue == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.monedaValueController ??=
                              FormFieldController<String>(
                            _model.monedaValue ??= '\$ARS',
                          ),
                          options: const ['\$ARS', 'USD', 'BTC', 'ETH', 'EUR'],
                          onChanged: (val) =>
                              safeSetState(() => _model.monedaValue = val),
                          width: 160.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 30.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                      child: Text(
                        'Saldo inicial',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(64.0, 16.0, 64.0, 0.0),
                      child: TextFormField(
                        controller: _model.saldoInicialTextController,
                        focusNode: _model.saldoInicialFocusNode,
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
                          suffixIcon: const Icon(
                            Icons.edit_rounded,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                        textAlign: TextAlign.center,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: _model.saldoInicialTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    if ((_model.saldoInicialTextController.text != '') &&
                        (_model.monedaValue != '\$ARS') &&
                        _model.esAhorroValue!)
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
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
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
                          const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var shouldSetState = false;
                          if (_model.esAhorroValue!) {
                            if ((_model.saldoInicialTextController.text !=
                                        '') &&
                                (_model.saldoInicialTextController.text !=
                                    '0')) {
                              if (_model.monedaValue != '\$ARS') {
                                if ((_model.textController1.text != '') &&
                                    (_model.monedaValue != null &&
                                        _model.monedaValue != '') &&
                                    ((_model.tipoDeCambioTextController
                                                    .text !=
                                                '') &&
                                        (_model.tipoDeCambioTextController
                                                .text !=
                                            '0'))) {
                                  var cuentasRecordReference1 =
                                      CuentasRecord.collection.doc();
                                  await cuentasRecordReference1
                                      .set(createCuentasRecordData(
                                    uid: currentUserUid,
                                    cuenta: _model.textController1.text,
                                    logo: FFAppState().imagen,
                                    activa: true,
                                    ahorro: _model.esAhorroValue,
                                    divisa: _model.monedaValue,
                                    ppp: double.tryParse(
                                        _model.tipoDeCambioTextController.text),
                                    tap: functions.calcularMontoAhorro(
                                        double.parse(_model
                                            .saldoInicialTextController.text),
                                        double.parse(_model
                                            .tipoDeCambioTextController.text)),
                                    tad: double.tryParse(
                                        _model.saldoInicialTextController.text),
                                  ));
                                  _model.ahorroDivisaSaldo =
                                      CuentasRecord.getDocumentFromData(
                                          createCuentasRecordData(
                                            uid: currentUserUid,
                                            cuenta: _model.textController1.text,
                                            logo: FFAppState().imagen,
                                            activa: true,
                                            ahorro: _model.esAhorroValue,
                                            divisa: _model.monedaValue,
                                            ppp: double.tryParse(_model
                                                .tipoDeCambioTextController
                                                .text),
                                            tap: functions.calcularMontoAhorro(
                                                double.parse(_model
                                                    .saldoInicialTextController
                                                    .text),
                                                double.parse(_model
                                                    .tipoDeCambioTextController
                                                    .text)),
                                            tad: double.tryParse(_model
                                                .saldoInicialTextController
                                                .text),
                                          ),
                                          cuentasRecordReference1);
                                  shouldSetState = true;

                                  await TransaccionesRecord.collection
                                      .doc()
                                      .set(createTransaccionesRecordData(
                                        uid: currentUserUid,
                                        fecha: getCurrentTimestamp,
                                        movimiento: 'Ajuste',
                                        montoAhorro: functions
                                            .calcularMontoAhorro(
                                                double.parse(_model
                                                    .saldoInicialTextController
                                                    .text),
                                                double.parse(_model
                                                    .tipoDeCambioTextController
                                                    .text)),
                                        montoDivisa: double.tryParse(_model
                                            .saldoInicialTextController.text),
                                        monto: 0.0,
                                        cuentaCredito:
                                            _model.ahorroDivisaSaldo?.reference,
                                        timestamp: getCurrentTimestamp,
                                      ));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Completar datos'),
                                        content: const Text(
                                            'Debes indicar nombre, moneda y tipo de cambio de la cuenta.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if ((_model.textController1.text != '') &&
                                    (_model.monedaValue != null &&
                                        _model.monedaValue != '')) {
                                  var cuentasRecordReference2 =
                                      CuentasRecord.collection.doc();
                                  await cuentasRecordReference2
                                      .set(createCuentasRecordData(
                                    uid: currentUserUid,
                                    cuenta: _model.textController1.text,
                                    logo: FFAppState().imagen,
                                    activa: true,
                                    ahorro: _model.esAhorroValue,
                                    divisa: _model.monedaValue,
                                    tap: double.tryParse(
                                        _model.saldoInicialTextController.text),
                                    ppp: 1.0,
                                    tad: 0.0,
                                  ));
                                  _model.ahorroArsSaldo =
                                      CuentasRecord.getDocumentFromData(
                                          createCuentasRecordData(
                                            uid: currentUserUid,
                                            cuenta: _model.textController1.text,
                                            logo: FFAppState().imagen,
                                            activa: true,
                                            ahorro: _model.esAhorroValue,
                                            divisa: _model.monedaValue,
                                            tap: double.tryParse(_model
                                                .saldoInicialTextController
                                                .text),
                                            ppp: 1.0,
                                            tad: 0.0,
                                          ),
                                          cuentasRecordReference2);
                                  shouldSetState = true;

                                  await TransaccionesRecord.collection
                                      .doc()
                                      .set(createTransaccionesRecordData(
                                        uid: currentUserUid,
                                        fecha: getCurrentTimestamp,
                                        movimiento: 'Ajuste',
                                        montoAhorro: double.tryParse(_model
                                            .saldoInicialTextController.text),
                                        montoDivisa: 0.0,
                                        monto: 0.0,
                                        timestamp: getCurrentTimestamp,
                                        cuentaCredito:
                                            _model.ahorroArsSaldo?.reference,
                                      ));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Completar datos'),
                                        content: const Text(
                                            'Debes indicar nombre y moneda de la cuenta.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                            } else {
                              if (_model.monedaValue != '\$ARS') {
                                if ((_model.textController1.text != '') &&
                                    (_model.monedaValue != null &&
                                        _model.monedaValue != '')) {
                                  var cuentasRecordReference3 =
                                      CuentasRecord.collection.doc();
                                  await cuentasRecordReference3
                                      .set(createCuentasRecordData(
                                    uid: currentUserUid,
                                    cuenta: _model.textController1.text,
                                    logo: FFAppState().imagen,
                                    activa: true,
                                    ahorro: _model.esAhorroValue,
                                    divisa: _model.monedaValue,
                                    ppp: 1.0,
                                    tap: 0.0,
                                    tad: 0.0,
                                  ));
                                  _model.ahorroDivisa =
                                      CuentasRecord.getDocumentFromData(
                                          createCuentasRecordData(
                                            uid: currentUserUid,
                                            cuenta: _model.textController1.text,
                                            logo: FFAppState().imagen,
                                            activa: true,
                                            ahorro: _model.esAhorroValue,
                                            divisa: _model.monedaValue,
                                            ppp: 1.0,
                                            tap: 0.0,
                                            tad: 0.0,
                                          ),
                                          cuentasRecordReference3);
                                  shouldSetState = true;
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Completar datos'),
                                        content: const Text(
                                            'Debes indicar nombre y moneda de la cuenta.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if ((_model.textController1.text != '') &&
                                    (_model.monedaValue != null &&
                                        _model.monedaValue != '')) {
                                  var cuentasRecordReference4 =
                                      CuentasRecord.collection.doc();
                                  await cuentasRecordReference4
                                      .set(createCuentasRecordData(
                                    uid: currentUserUid,
                                    cuenta: _model.textController1.text,
                                    logo: FFAppState().imagen,
                                    activa: true,
                                    ahorro: _model.esAhorroValue,
                                    divisa: _model.monedaValue,
                                    tap: double.tryParse(
                                        _model.saldoInicialTextController.text),
                                    ppp: 1.0,
                                    tad: 0.0,
                                  ));
                                  _model.pesosSinSaldo =
                                      CuentasRecord.getDocumentFromData(
                                          createCuentasRecordData(
                                            uid: currentUserUid,
                                            cuenta: _model.textController1.text,
                                            logo: FFAppState().imagen,
                                            activa: true,
                                            ahorro: _model.esAhorroValue,
                                            divisa: _model.monedaValue,
                                            tap: double.tryParse(_model
                                                .saldoInicialTextController
                                                .text),
                                            ppp: 1.0,
                                            tad: 0.0,
                                          ),
                                          cuentasRecordReference4);
                                  shouldSetState = true;
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Completar datos'),
                                        content: const Text(
                                            'Debes indicar nombre y moneda de la cuenta.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                            }
                          } else {
                            if (_model.textController1.text != '') {
                              if ((_model.saldoInicialTextController.text !=
                                          '') &&
                                  (_model.saldoInicialTextController.text !=
                                      '0')) {
                                var cuentasRecordReference5 =
                                    CuentasRecord.collection.doc();
                                await cuentasRecordReference5
                                    .set(createCuentasRecordData(
                                  uid: currentUserUid,
                                  cuenta: _model.textController1.text,
                                  logo: FFAppState().imagen,
                                  activa: true,
                                  ahorro: _model.esAhorroValue,
                                  divisa: '\$ARS',
                                  ppp: 1.0,
                                  tap: double.tryParse(
                                      _model.saldoInicialTextController.text),
                                  tad: 0.0,
                                ));
                                _model.noAhorro =
                                    CuentasRecord.getDocumentFromData(
                                        createCuentasRecordData(
                                          uid: currentUserUid,
                                          cuenta: _model.textController1.text,
                                          logo: FFAppState().imagen,
                                          activa: true,
                                          ahorro: _model.esAhorroValue,
                                          divisa: '\$ARS',
                                          ppp: 1.0,
                                          tap: double.tryParse(_model
                                              .saldoInicialTextController.text),
                                          tad: 0.0,
                                        ),
                                        cuentasRecordReference5);
                                shouldSetState = true;

                                await TransaccionesRecord.collection
                                    .doc()
                                    .set(createTransaccionesRecordData(
                                      uid: currentUserUid,
                                      fecha: getCurrentTimestamp,
                                      movimiento: 'Ajuste',
                                      monto: double.tryParse(_model
                                          .saldoInicialTextController.text),
                                      cuenta: _model.noAhorro?.reference,
                                      timestamp: getCurrentTimestamp,
                                    ));
                              } else {
                                await CuentasRecord.collection
                                    .doc()
                                    .set(createCuentasRecordData(
                                      uid: currentUserUid,
                                      cuenta: _model.textController1.text,
                                      logo: FFAppState().imagen,
                                      activa: true,
                                      ahorro: _model.esAhorroValue,
                                      divisa: '\$ARS',
                                      ppp: 1.0,
                                      tap: 0.0,
                                      tad: 0.0,
                                    ));
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Completar datos'),
                                    content: const Text(
                                        'El nombre de la cuenta no puede estar vacío.'),
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
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }
                          }

                          await actions
                              .obtenerYProcesarTransaccionesCompletas();
                          await actions.saldoCuentasAhorro();
                          await actions.procesarDatosDeCuentas();
                          FFAppState().imagen = '';
                          safeSetState(() {});
                          context.safePop();
                          if (shouldSetState) safeSetState(() {});
                        },
                        text: 'Agregar',
                        icon: const Icon(
                          Icons.check_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
