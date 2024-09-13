import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/eliminar_confimacion_cuenta_widget.dart';
import '/components/logos_cuentas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          autofocus: true,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'Caja de ahoro',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: _model.switchValue1!
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Switch.adaptive(
                          value: _model.switchValue1!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.switchValue1 = newValue);
                          },
                          activeColor: FlutterFlowTheme.of(context).secondary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondary,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
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
                          value: _model.switchValue2!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.switchValue2 = newValue);
                          },
                          activeColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          activeTrackColor: FlutterFlowTheme.of(context).error,
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
                      controller: _model.textController2,
                      focusNode: _model.textFieldFocusNode2,
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
                          color: _model.switchValue2!
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).success,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: _model.switchValue2!
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context).success,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 104.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.parametroCuenta!.reference
                          .update(createCuentasRecordData(
                        cuenta: _model.textController1.text,
                        logo: FFAppState().imagen,
                        ahorro: _model.switchValue1,
                      ));
                      if (_model.textController2.text != '') {
                        await TransaccionesRecord.collection
                            .doc()
                            .set(createTransaccionesRecordData(
                              uid: currentUserUid,
                              fecha: getCurrentTimestamp,
                              movimiento: 'Ajuste',
                              monto: _model.switchValue2!
                                  ? functions.funcionAjusteDeCuenta(
                                      double.tryParse(
                                          _model.textController2.text))
                                  : double.tryParse(
                                      _model.textController2.text),
                              cuenta: widget.parametroCuenta?.reference,
                            ));
                      }
                      FFAppState().imagen = '';
                      safeSetState(() {});

                      context.pushNamed('cuentas');
                    },
                    text: 'Guardar cambios',
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
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
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.5,
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
    );
  }
}
