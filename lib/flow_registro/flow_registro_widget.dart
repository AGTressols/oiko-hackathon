import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nueva_etiqueta_widget.dart';
import '/components/q_divisa_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'flow_registro_model.dart';
export 'flow_registro_model.dart';

class FlowRegistroWidget extends StatefulWidget {
  const FlowRegistroWidget({super.key});

  @override
  State<FlowRegistroWidget> createState() => _FlowRegistroWidgetState();
}

class _FlowRegistroWidgetState extends State<FlowRegistroWidget>
    with TickerProviderStateMixin {
  late FlowRegistroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlowRegistroModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToCategoriasFiltro(FFAppState().flowMovimiento);
      safeSetState(() {});
      if ((FFAppState().flowMovimiento == 'Gasto') ||
          (FFAppState().flowMovimiento == 'Ingreso')) {
        _model.addToCategoriasFiltro('Mixta');
        safeSetState(() {});
      } else {
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.pagoConAhorroValue = false;
    _model.setMontoTextController ??= TextEditingController();
    _model.setMontoFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
          backgroundColor: FlutterFlowTheme.of(context).primary,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
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
                FFAppState().flowMonto = 0.0;
                FFAppState().flowCuenta = FlowCuentaStruct();
                FFAppState().flowCategoria = FlowCategoriaStruct();
                FFAppState().flowEtiqueta = FlowEtiquetaStruct();
                safeSetState(() {});
              },
            ),
            title: Text(
              'Registro',
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                indicatorColor: const Color(0xFD00DBA4),
                                indicatorWeight: 3.0,
                                padding: const EdgeInsets.all(4.0),
                                tabs: const [
                                  Tab(
                                    text: 'Monto',
                                  ),
                                  Tab(
                                    text: 'Cuenta',
                                  ),
                                  Tab(
                                    text: 'Categorias',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.35,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.035,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.calendar_today,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            "yMMMd",
                                                            FFAppState()
                                                                .flowFecha),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.35,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.035,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .autorenew_rounded,
                                                          color: () {
                                                            if (FFAppState()
                                                                    .flowMovimiento ==
                                                                'Gasto') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .error;
                                                            } else if (FFAppState()
                                                                    .flowMovimiento ==
                                                                'Ingreso') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .success;
                                                            } else if (FFAppState()
                                                                    .flowMovimiento ==
                                                                'Ahorro') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            }
                                                          }(),
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFAppState()
                                                            .flowMovimiento,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (FFAppState().flowMovimiento ==
                                                'Gasto')
                                              Flexible(
                                                child: Text(
                                                  'Pagar con ahorro',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: _model
                                                                    .pagoConAhorroValue!
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ),
                                            if (FFAppState().flowMovimiento ==
                                                'Gasto')
                                              Flexible(
                                                child: Switch.adaptive(
                                                  value: _model
                                                      .pagoConAhorroValue!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() => _model
                                                            .pagoConAhorroValue =
                                                        newValue);
                                                    if (newValue) {
                                                      safeSetState(() {
                                                        _model.tabBarController!
                                                            .animateTo(
                                                          min(
                                                              _model.tabBarController!
                                                                      .length -
                                                                  1,
                                                              _model.tabBarController!
                                                                      .index +
                                                                  1),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      });
                                                    } else {
                                                      safeSetState(() {
                                                        _model.tabBarController!
                                                            .animateTo(
                                                          min(
                                                              _model.tabBarController!
                                                                      .length -
                                                                  1,
                                                              _model.tabBarController!
                                                                      .index +
                                                                  1),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (_model.pagoConAhorroValue ==
                                                false)
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.7, 0.8),
                                                  child: Text(
                                                    'Monto',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 8,
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    if (_model
                                                            .pagoConAhorroValue ==
                                                        false)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      40.0,
                                                                      2.0,
                                                                      40.0,
                                                                      2.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .setMontoTextController,
                                                            focusNode: _model
                                                                .setMontoFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.setMontoTextController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () async {
                                                                if (_model.setMontoTextController
                                                                            .text ==
                                                                        '') {
                                                                  FFAppState()
                                                                          .flowMonto =
                                                                      0.0;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  FFAppState()
                                                                          .flowMonto =
                                                                      double.parse(_model
                                                                          .setMontoTextController
                                                                          .text);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .none,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              alignLabelWithHint:
                                                                  false,
                                                              hintText:
                                                                  '\$ ...',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: const Color(
                                                                            0x7AF3FFFB),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          8.0,
                                                                          32.0,
                                                                          8.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: _model
                                                                .setMontoTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[a-zA-Z0-9]'))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model
                                                            .pagoConAhorroValue ==
                                                        true)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Deslizá para continuar con tu registro. \n',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        21.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_right_alt_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 80.0,
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 10,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.35,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.035,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .calendar_today,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              "yMMMd",
                                                              FFAppState()
                                                                  .flowFecha),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.35,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.035,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .autorenew_rounded,
                                                            color: () {
                                                              if (FFAppState()
                                                                      .flowMovimiento ==
                                                                  'Gasto') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              } else if (FFAppState()
                                                                      .flowMovimiento ==
                                                                  'Ingreso') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .success;
                                                              } else if (FFAppState()
                                                                      .flowMovimiento ==
                                                                  'Ahorro') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              }
                                                            }(),
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState()
                                                              .flowMovimiento,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.35,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.035,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState()
                                                              .flowMonto
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 5,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    flex: 6,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.1, 0.8),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Cuenta',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          28.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.6, 0.8),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize:
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.09,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              icon: Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'nuevaCuentaa');
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 20,
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -0.25),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.9,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0),
                                                ),
                                                child: StreamBuilder<
                                                    List<CuentasRecord>>(
                                                  stream: queryCuentasRecord(
                                                    queryBuilder:
                                                        (cuentasRecord) =>
                                                            cuentasRecord
                                                                .where(
                                                                  'uid',
                                                                  isEqualTo:
                                                                      currentUserUid,
                                                                )
                                                                .where(
                                                                  'activa',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .where(
                                                                  'ahorro',
                                                                  isEqualTo: _model
                                                                      .pagoConAhorroValue,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitChasingDots(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CuentasRecord>
                                                        listViewCuentasRecordList =
                                                        snapshot.data!;

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewCuentasRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewCuentasRecord =
                                                            listViewCuentasRecordList[
                                                                listViewIndex];
                                                        return Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        16.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                if (FFAppState()
                                                                        .flowCuenta
                                                                        .cuentaRef
                                                                        ?.id !=
                                                                    listViewCuentasRecord
                                                                        .reference
                                                                        .id)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .flowCuenta =
                                                                          FlowCuentaStruct(
                                                                        nombre:
                                                                            listViewCuentasRecord.cuenta,
                                                                        cuentaRef:
                                                                            listViewCuentasRecord.reference,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      if (_model
                                                                          .pagoConAhorroValue!) {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: SizedBox(
                                                                                  height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                  child: QDivisaWidget(
                                                                                    divisa: listViewCuentasRecord.divisa,
                                                                                    tapOrTad: listViewCuentasRecord.divisa == '\$ARS' ? listViewCuentasRecord.tap : listViewCuentasRecord.tad,
                                                                                    ahorro: false,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .tabBarController!
                                                                            .animateTo(
                                                                          min(_model.tabBarController!.length - 1,
                                                                              _model.tabBarController!.index + 1),
                                                                          duration:
                                                                              const Duration(milliseconds: 300),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.15,
                                                                                  height: MediaQuery.sizeOf(context).width * 0.15,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    listViewCuentasRecord.logo,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  listViewCuentasRecord.cuenta,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .flowCuenta
                                                                        .cuentaRef
                                                                        ?.id ==
                                                                    listViewCuentasRecord
                                                                        .reference
                                                                        .id)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .flowCuenta =
                                                                          FlowCuentaStruct();
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.15,
                                                                                  height: MediaQuery.sizeOf(context).width * 0.15,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    listViewCuentasRecord.logo,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  listViewCuentasRecord.cuenta,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.035,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .calendar_today,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                "yMMMd",
                                                                FFAppState()
                                                                    .flowFecha),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.035,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .autorenew_rounded,
                                                              color: () {
                                                                if (FFAppState()
                                                                        .flowMovimiento ==
                                                                    'Gasto') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                } else if (FFAppState()
                                                                        .flowMovimiento ==
                                                                    'Ingreso') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .success;
                                                                } else if (FFAppState()
                                                                        .flowMovimiento ==
                                                                    'Ahorro') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary;
                                                                }
                                                              }(),
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFAppState()
                                                                .flowMovimiento,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.035,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .attach_money_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFAppState()
                                                                .flowMonto
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.035,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .account_balance_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFAppState()
                                                                .flowCuenta
                                                                .nombre,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.1, 0.0),
                                                    child: Text(
                                                      'Categoría',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 28.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.6, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.09,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'nuevaCategoriaa');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 16.0),
                                                child: StreamBuilder<
                                                    List<CategoriasRecord>>(
                                                  stream: queryCategoriasRecord(
                                                    queryBuilder:
                                                        (categoriasRecord) =>
                                                            categoriasRecord
                                                                .where(
                                                                  'uid',
                                                                  isEqualTo:
                                                                      currentUserUid,
                                                                )
                                                                .whereIn(
                                                                    'movimiento',
                                                                    _model
                                                                        .categoriasFiltro)
                                                                .where(
                                                                  'activa',
                                                                  isEqualTo:
                                                                      true,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitChasingDots(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CategoriasRecord>
                                                        listViewCategoriasRecordList =
                                                        snapshot.data!;

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewCategoriasRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewCategoriasRecord =
                                                            listViewCategoriasRecordList[
                                                                listViewIndex];
                                                        return Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        16.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                if (FFAppState()
                                                                        .flowCategoria
                                                                        .categoriaRef
                                                                        ?.id !=
                                                                    listViewCategoriasRecord
                                                                        .reference
                                                                        .id)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .flowCategoria =
                                                                          FlowCategoriaStruct(
                                                                        nombre:
                                                                            listViewCategoriasRecord.categoria,
                                                                        categoriaRef:
                                                                            listViewCategoriasRecord.reference,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.06,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.12,
                                                                                  height: MediaQuery.sizeOf(context).width * 0.12,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    listViewCategoriasRecord.logo,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                listViewCategoriasRecord.categoria,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .flowCategoria
                                                                        .categoriaRef
                                                                        ?.id ==
                                                                    listViewCategoriasRecord
                                                                        .reference
                                                                        .id)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .flowCategoria =
                                                                          FlowCategoriaStruct();
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.06,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.12,
                                                                                  height: MediaQuery.sizeOf(context).width * 0.12,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    listViewCategoriasRecord.logo,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                listViewCategoriasRecord.categoria,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.15,
                                              decoration: const BoxDecoration(),
                                              child: Visibility(
                                                visible: (FFAppState()
                                                            .flowMovimiento !=
                                                        'Ingreso') &&
                                                    FFAppState()
                                                        .flowCategoria
                                                        .hasNombre(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      flex: 15,
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      16.0,
                                                                      4.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -0.6,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Etiquetas',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        30.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                child: NuevaEtiquetaWidget(
                                                                                  categoria: FFAppState().flowCategoria.categoriaRef!,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 25,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Flexible(
                                                              child: StreamBuilder<
                                                                  List<
                                                                      EtiquetasRecord>>(
                                                                stream:
                                                                    queryEtiquetasRecord(
                                                                  queryBuilder: (etiquetasRecord) =>
                                                                      etiquetasRecord
                                                                          .where(
                                                                            'uid',
                                                                            isEqualTo:
                                                                                currentUserUid,
                                                                          )
                                                                          .where(
                                                                            'categoria',
                                                                            isEqualTo:
                                                                                FFAppState().flowCategoria.categoriaRef,
                                                                          )
                                                                          .where(
                                                                            'activa',
                                                                            isEqualTo:
                                                                                true,
                                                                          ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitChasingDots(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<EtiquetasRecord>
                                                                      gridViewEtiquetasRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return GridView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          2,
                                                                      mainAxisSpacing:
                                                                          10.0,
                                                                      childAspectRatio:
                                                                          0.25,
                                                                    ),
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        gridViewEtiquetasRecordList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            gridViewIndex) {
                                                                      final gridViewEtiquetasRecord =
                                                                          gridViewEtiquetasRecordList[
                                                                              gridViewIndex];
                                                                      return Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Stack(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          children: [
                                                                            if (FFAppState().flowEtiqueta.etiquetaRef?.id !=
                                                                                gridViewEtiquetasRecord.reference.id)
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  FFAppState().flowEtiqueta = FlowEtiquetaStruct(
                                                                                    nombre: gridViewEtiquetasRecord.etiqueta,
                                                                                    etiquetaRef: gridViewEtiquetasRecord.reference,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                  ),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    gridViewEtiquetasRecord.etiqueta,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (FFAppState().flowEtiqueta.etiquetaRef?.id ==
                                                                                gridViewEtiquetasRecord.reference.id)
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  FFAppState().flowEtiqueta = FlowEtiquetaStruct();
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                  ),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    gridViewEtiquetasRecord.etiqueta,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (FFAppState()
                                            .flowCategoria
                                            .hasNombre())
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: '+ Observación',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        Flexible(
                                          child: SizedBox(
                                            height: 100.0,
                                            child: Stack(
                                              children: [
                                                if (FFAppState()
                                                    .flowCategoria
                                                    .hasNombre())
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        CuentasRecord>(
                                                      stream: CuentasRecord
                                                          .getDocument(
                                                              FFAppState()
                                                                  .flowCuenta
                                                                  .cuentaRef!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitChasingDots(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final registrarButtonCuentasRecord =
                                                            snapshot.data!;

                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                                'transaccionRegistrada');

                                                            if (_model
                                                                .pagoConAhorroValue!) {
                                                              if (FFAppState().flowCuenta.hasCuentaRef() &&
                                                                  FFAppState()
                                                                      .flowCategoria
                                                                      .hasCategoriaRef() &&
                                                                  (FFAppState()
                                                                          .flowMontoDivisa >
                                                                      0.0)) {
                                                                if (registrarButtonCuentasRecord
                                                                        .divisa !=
                                                                    '\$ARS') {
                                                                  await TransaccionesRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createTransaccionesRecordData(
                                                                        uid:
                                                                            currentUserUid,
                                                                        fecha: FFAppState()
                                                                            .flowFecha,
                                                                        movimiento:
                                                                            'Ahorro',
                                                                        montoAhorro: functions.ajusteDivisa(
                                                                            FFAppState().flowMontoDivisa,
                                                                            registrarButtonCuentasRecord.ppp,
                                                                            -1.0),
                                                                        montoDivisa:
                                                                            functions.cambiarSimbolo(FFAppState().flowMontoDivisa),
                                                                        monto: functions.ajusteDivisa(
                                                                            FFAppState().flowMontoDivisa,
                                                                            registrarButtonCuentasRecord.ppp,
                                                                            1.0),
                                                                        cuenta: FFAppState()
                                                                            .flowCuenta
                                                                            .cuentaRef,
                                                                        cuentaCredito: FFAppState()
                                                                            .flowCuenta
                                                                            .cuentaRef,
                                                                        desahorro:
                                                                            true,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                      ));

                                                                  await registrarButtonCuentasRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'tap': FieldValue.increment(-(functions.calcularMontoAhorro(
                                                                            FFAppState().flowMontoDivisa,
                                                                            registrarButtonCuentasRecord.ppp)!)),
                                                                        'tad': FieldValue.increment(
                                                                            -(FFAppState().flowMontoDivisa)),
                                                                      },
                                                                    ),
                                                                  });

                                                                  await TransaccionesRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createTransaccionesRecordData(
                                                                        uid:
                                                                            currentUserUid,
                                                                        fecha: FFAppState()
                                                                            .flowFecha,
                                                                        movimiento:
                                                                            FFAppState().flowMovimiento,
                                                                        monto: functions.ajusteDivisa(
                                                                            FFAppState().flowMontoDivisa,
                                                                            registrarButtonCuentasRecord.ppp,
                                                                            1.0),
                                                                        cuenta: FFAppState()
                                                                            .flowCuenta
                                                                            .cuentaRef,
                                                                        categoria: FFAppState()
                                                                            .flowCategoria
                                                                            .categoriaRef,
                                                                        etiqueta: FFAppState()
                                                                            .flowEtiqueta
                                                                            .etiquetaRef,
                                                                        observacion: _model
                                                                            .textController2
                                                                            .text,
                                                                        montoAhorro:
                                                                            0.0,
                                                                        montoDivisa:
                                                                            0.0,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                      ));
                                                                } else {
                                                                  await TransaccionesRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createTransaccionesRecordData(
                                                                        uid:
                                                                            currentUserUid,
                                                                        fecha: FFAppState()
                                                                            .flowFecha,
                                                                        movimiento:
                                                                            'Ahorro',
                                                                        montoAhorro: functions.ajusteDivisa(
                                                                            FFAppState().flowMontoDivisa,
                                                                            registrarButtonCuentasRecord.ppp,
                                                                            -1.0),
                                                                        montoDivisa:
                                                                            0.0,
                                                                        monto: functions.ajusteDivisa(
                                                                            FFAppState().flowMontoDivisa,
                                                                            registrarButtonCuentasRecord.ppp,
                                                                            1.0),
                                                                        cuenta: FFAppState()
                                                                            .flowCuenta
                                                                            .cuentaRef,
                                                                        cuentaCredito: FFAppState()
                                                                            .flowCuenta
                                                                            .cuentaRef,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                      ));

                                                                  await FFAppState()
                                                                      .flowCuenta
                                                                      .cuentaRef!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'tap': FieldValue.increment(
                                                                            -(FFAppState().flowMontoDivisa)),
                                                                      },
                                                                    ),
                                                                  });

                                                                  await TransaccionesRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set(
                                                                          createTransaccionesRecordData(
                                                                        uid:
                                                                            currentUserUid,
                                                                        fecha: FFAppState()
                                                                            .flowFecha,
                                                                        movimiento:
                                                                            FFAppState().flowMovimiento,
                                                                        monto: FFAppState()
                                                                            .flowMontoDivisa,
                                                                        cuenta: FFAppState()
                                                                            .flowCuenta
                                                                            .cuentaRef,
                                                                        categoria: FFAppState()
                                                                            .flowCategoria
                                                                            .categoriaRef,
                                                                        etiqueta: FFAppState()
                                                                            .flowEtiqueta
                                                                            .etiquetaRef,
                                                                        observacion: _model
                                                                            .textController2
                                                                            .text,
                                                                        montoAhorro:
                                                                            0.0,
                                                                        montoDivisa:
                                                                            0.0,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                      ));
                                                                }
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Completá todos los datos'),
                                                                      content: const Text(
                                                                          'Debe estar definido el monto, la cuenta, la cantidad de moneda y la categoría '),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                return;
                                                              }
                                                            } else {
                                                              if ((FFAppState()
                                                                          .flowMonto >
                                                                      0.0) &&
                                                                  FFAppState()
                                                                      .flowCuenta
                                                                      .hasCuentaRef() &&
                                                                  FFAppState()
                                                                      .flowCategoria
                                                                      .hasCategoriaRef()) {
                                                                await TransaccionesRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createTransaccionesRecordData(
                                                                      uid:
                                                                          currentUserUid,
                                                                      fecha: FFAppState()
                                                                          .flowFecha,
                                                                      movimiento:
                                                                          FFAppState()
                                                                              .flowMovimiento,
                                                                      monto: FFAppState()
                                                                          .flowMonto,
                                                                      cuenta: FFAppState()
                                                                          .flowCuenta
                                                                          .cuentaRef,
                                                                      categoria: FFAppState()
                                                                          .flowCategoria
                                                                          .categoriaRef,
                                                                      etiqueta: FFAppState()
                                                                          .flowEtiqueta
                                                                          .etiquetaRef,
                                                                      observacion: _model
                                                                          .textController2
                                                                          .text,
                                                                      montoAhorro:
                                                                          0.0,
                                                                      montoDivisa:
                                                                          0.0,
                                                                      timestamp:
                                                                          getCurrentTimestamp,
                                                                    ));
                                                                if (FFAppState()
                                                                        .flowMovimiento ==
                                                                    'Gasto') {
                                                                  await registrarButtonCuentasRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'tap': FieldValue.increment(
                                                                            -(FFAppState().flowMonto)),
                                                                      },
                                                                    ),
                                                                  });
                                                                } else {
                                                                  await registrarButtonCuentasRecord
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'tap': FieldValue.increment(
                                                                            FFAppState().flowMonto),
                                                                      },
                                                                    ),
                                                                  });
                                                                }
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Completá todos los datos'),
                                                                      content: const Text(
                                                                          'Debe estar definido el monto, la cuenta, y la categoría '),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                return;
                                                              }
                                                            }

                                                            FFAppState()
                                                                    .flowFecha =
                                                                null;
                                                            FFAppState()
                                                                .flowMovimiento = '';
                                                            FFAppState()
                                                                    .flowMonto =
                                                                0.0;
                                                            FFAppState()
                                                                    .flowCuenta =
                                                                FlowCuentaStruct();
                                                            FFAppState()
                                                                    .flowCategoria =
                                                                FlowCategoriaStruct();
                                                            FFAppState()
                                                                    .flowEtiqueta =
                                                                FlowEtiquetaStruct();
                                                            safeSetState(() {});
                                                          },
                                                          text: 'Registrar',
                                                          options:
                                                              FFButtonOptions(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.07,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
