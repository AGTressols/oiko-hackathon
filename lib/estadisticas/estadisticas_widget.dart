import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'estadisticas_model.dart';
export 'estadisticas_model.dart';

class EstadisticasWidget extends StatefulWidget {
  const EstadisticasWidget({super.key});

  @override
  State<EstadisticasWidget> createState() => _EstadisticasWidgetState();
}

class _EstadisticasWidgetState extends State<EstadisticasWidget>
    with TickerProviderStateMixin {
  late EstadisticasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstadisticasModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final chartPieChartColorsList1 = [
      FlutterFlowTheme.of(context).primary,
      FlutterFlowTheme.of(context).secondary,
      FlutterFlowTheme.of(context).tertiary,
      FlutterFlowTheme.of(context).warning,
      const Color(0xFFC600DB),
      const Color(0xFFCB91F4),
      FlutterFlowTheme.of(context).accent4,
      const Color(0xFF100EA3),
      FlutterFlowTheme.of(context).secondaryText,
      const Color(0xFF0FE7F9),
      const Color(0xFF5C502E),
      const Color(0xFF6A80C9),
      FlutterFlowTheme.of(context).error,
      const Color(0xFF2534B9),
      const Color(0xFF8E80D9),
      const Color(0xFF885495),
      const Color(0xFF5B5ADF)
    ];
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Column(
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
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 0.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(0.0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  unselectedLabelStyle: const TextStyle(),
                                  labelColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  unselectedBackgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  unselectedBorderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 100.0,
                                  elevation: 0.0,
                                  buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  padding: const EdgeInsets.all(4.0),
                                  tabs: const [
                                    Tab(
                                      text: 'Gastos',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [() async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            flex: 15,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Flexible(
                                                  flex: 55,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          'Agosto 24\'',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 34.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          multiSelectController: _model
                                                                  .dropDownValueController ??=
                                                              FormListFieldController<
                                                                  String>(_model
                                                                      .dropDownValue ??=
                                                                  List<
                                                                      String>.from(
                                                            FFAppState()
                                                                    .seleccionPeriodos ??
                                                                [],
                                                          )),
                                                          options: functions
                                                              .calendarDropdown(),
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.4,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.04,
                                                          textStyle:
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
                                                          hintText: 'Períodos',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 14.0,
                                                          ),
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          borderWidth: 2.0,
                                                          borderRadius: 100.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      16.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: true,
                                                          onMultiSelectChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropDownValue =
                                                                    val);
                                                            FFAppState()
                                                                    .seleccionPeriodos =
                                                                _model
                                                                    .dropDownValue!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            safeSetState(() {});
                                                            await actions
                                                                .procesarDatosGraficoPresupuesto();
                                                            await actions
                                                                .calcularGastosTotales();
                                                            await actions
                                                                .calcularSaldoTotal();
                                                            await actions
                                                                .procesarDatosDeCuentas();
                                                            await actions
                                                                .obtenerCategoriasConTransacciones();
                                                            await actions
                                                                .obtenerCategoriasConTransaccionesHistorico();

                                                            context.pushNamed(
                                                              'Estadisticas',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 45,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        flex: 65,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        30.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        30.0),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  flex: 30,
                                                                  child: Text(
                                                                    'Gastos totales',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  flex: 70,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      formatNumber(
                                                                        FFAppState()
                                                                            .gastoTotalVariable,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.automatic,
                                                                        currency:
                                                                            '\$',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 35,
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      30.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          30.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Flexible(
                                                                flex: 35,
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Saldo',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                flex: 65,
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      FFAppState()
                                                                          .saldoVariable,
                                                                      formatType:
                                                                          FormatType
                                                                              .compact,
                                                                      currency:
                                                                          '\$',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
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
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 85,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 85,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              flex: 10,
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Gastos por cuentas',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 30,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final gastosCuenta =
                                                                                FFAppState().gastosPorCuenta.map((e) => e).toList();

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: gastosCuenta.length,
                                                                              separatorBuilder: (_, __) => const SizedBox(width: 10.0),
                                                                              itemBuilder: (context, gastosCuentaIndex) {
                                                                                final gastosCuentaItem = gastosCuenta[gastosCuentaIndex];
                                                                                return Container(
                                                                                  width: 150.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.01,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 35,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                flex: 20,
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                                  height: MediaQuery.sizeOf(context).width * 0.4,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: const BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    gastosCuentaItem.logo,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                flex: 80,
                                                                                                child: Text(
                                                                                                  gastosCuentaItem.cuenta,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 65,
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              gastosCuentaItem.monto,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.automatic,
                                                                                              currency: '\$',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  fontSize: 20.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            32.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.1,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              30.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              30.0),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        flex:
                                                                            10,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Disponible por categorías',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            136.0,
                                                                            24.0,
                                                                            16.0,
                                                                            4.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Gastado',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Disponible',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          maxHeight:
                                                                              250.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(30.0),
                                                                            bottomRight:
                                                                                Radius.circular(30.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              16.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final gastosPresupuesto = FFAppState().graficoPresupuestoAppState.map((e) => e).toList();

                                                                              return ListView.separated(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: gastosPresupuesto.length,
                                                                                separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                                                                                itemBuilder: (context, gastosPresupuestoIndex) {
                                                                                  final gastosPresupuestoItem = gastosPresupuesto[gastosPresupuestoIndex];
                                                                                  return Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        flex: 35,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: MediaQuery.sizeOf(context).height * 0.05,
                                                                                              decoration: const BoxDecoration(),
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                gastosPresupuestoItem.categoria,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        flex: 65,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      gastosPresupuestoItem.gastadoAbs,
                                                                                                      formatType: FormatType.compact,
                                                                                                      currency: '\$',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Flexible(
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                    child: Text(
                                                                                                      formatNumber(
                                                                                                        gastosPresupuestoItem.presupuestoDisponible,
                                                                                                        formatType: FormatType.decimal,
                                                                                                        decimalType: DecimalType.automatic,
                                                                                                        currency: '\$',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 18.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                                    child: Container(
                                                                                                      width: 235.0,
                                                                                                      height: MediaQuery.sizeOf(context).height * 0.025,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                                      ),
                                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: gastosPresupuestoItem.presupuestoGrafico.toDouble(),
                                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
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
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            32.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Importancia de categorías',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          flex:
                                                                              90,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                              child: SizedBox(
                                                                                width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    FlutterFlowPieChart(
                                                                                      data: FFPieChartData(
                                                                                        values: FFAppState().graficoPresupuestoAppState.map((e) => e.gastadoAbs).toList(),
                                                                                        colors: chartPieChartColorsList1,
                                                                                        radius: [80.0],
                                                                                        borderWidth: [1.0],
                                                                                        borderColor: [
                                                                                          FlutterFlowTheme.of(context).accent4
                                                                                        ],
                                                                                      ),
                                                                                      donutHoleRadius: 20.0,
                                                                                      donutHoleColor: Colors.transparent,
                                                                                      sectionLabelType: PieChartSectionLabelType.percent,
                                                                                      sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: FlutterFlowChartLegendWidget(
                                                                                        entries: FFAppState()
                                                                                            .graficoPresupuestoAppState
                                                                                            .map((e) => e.categoria)
                                                                                            .toList()
                                                                                            .asMap()
                                                                                            .entries
                                                                                            .map(
                                                                                              (label) => LegendEntry(
                                                                                                chartPieChartColorsList1[label.key % chartPieChartColorsList1.length],
                                                                                                label.value,
                                                                                              ),
                                                                                            )
                                                                                            .toList(),
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        textPadding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        borderWidth: 0.0,
                                                                                        indicatorSize: 10.0,
                                                                                        indicatorBorderRadius: BorderRadius.circular(100.0),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            32.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Etiquetas',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                15,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                              child: FlutterFlowDropDown<String>(
                                                                                controller: _model.dropdownetiquetasValueController ??= FormFieldController<String>(null),
                                                                                options: FFAppState().seleccionCategorias,
                                                                                onChanged: (val) async {
                                                                                  safeSetState(() => _model.dropdownetiquetasValue = val);
                                                                                  FFAppState().insertAtIndexInCategoriasSeleccionadas(0, _model.dropdownetiquetasValue!);
                                                                                  safeSetState(() {});
                                                                                  await actions.procesarGraficoEtiqueta();
                                                                                },
                                                                                width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintText: 'Categoria',
                                                                                icon: Icon(
                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                elevation: 0.0,
                                                                                borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                borderWidth: 1.0,
                                                                                borderRadius: 100.0,
                                                                                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isOverButton: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                75,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: SizedBox(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.23,
                                                                                  child: FlutterFlowBarChart(
                                                                                    barData: [
                                                                                      FFBarChartData(
                                                                                        yData: FFAppState().graficoEtiquetaAppState.map((e) => e.gasto.toString()).toList(),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                      )
                                                                                    ],
                                                                                    xLabels: FFAppState().graficoEtiquetaAppState.map((e) => e.etiquetas).toList(),
                                                                                    barWidth: 32.0,
                                                                                    barBorderRadius: const BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    groupSpace: 16.0,
                                                                                    alignment: BarChartAlignment.spaceEvenly,
                                                                                    chartStylingInfo: ChartStylingInfo(
                                                                                      enableTooltip: true,
                                                                                      tooltipBackgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                      showBorder: false,
                                                                                    ),
                                                                                    axisBounds: const AxisBounds(),
                                                                                    xAxisLabelInfo: AxisLabelInfo(
                                                                                      showLabels: true,
                                                                                      labelTextStyle: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 18.0,
                                                                                      ),
                                                                                      labelInterval: 10.0,
                                                                                      reservedSize: 28.0,
                                                                                    ),
                                                                                    yAxisLabelInfo: const AxisLabelInfo(
                                                                                      reservedSize: 42.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
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
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            32.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Histórico',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                15,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: FlutterFlowDropDown<String>(
                                                                                      controller: _model.categoriashistoricoValueController ??= FormFieldController<String>(null),
                                                                                      options: FFAppState().categoriasHistorico,
                                                                                      onChanged: (val) async {
                                                                                        safeSetState(() => _model.categoriashistoricoValue = val);
                                                                                        FFAppState().seleccionCategoriasHistorico = [];
                                                                                        safeSetState(() {});
                                                                                        FFAppState().insertAtIndexInSeleccionCategoriasHistorico(0, _model.categoriashistoricoValue!);
                                                                                        safeSetState(() {});
                                                                                        await actions.obtenerEtiquetasHistorico();
                                                                                      },
                                                                                      width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintText: 'Categorias',
                                                                                      searchHintText: 'Search for an item...',
                                                                                      icon: Icon(
                                                                                        Icons.keyboard_arrow_down_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                      elevation: 0.0,
                                                                                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      borderWidth: 1.0,
                                                                                      borderRadius: 100.0,
                                                                                      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                      hidesUnderline: true,
                                                                                      isOverButton: true,
                                                                                      isSearchable: true,
                                                                                      isMultiSelect: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: FlutterFlowDropDown<String>(
                                                                                      controller: _model.etiquetashistoricoValueController ??= FormFieldController<String>(null),
                                                                                      options: FFAppState().etiquetasHistorico,
                                                                                      onChanged: (val) async {
                                                                                        safeSetState(() => _model.etiquetashistoricoValue = val);
                                                                                        FFAppState().seleccionEtiquetasHistorico = [];
                                                                                        safeSetState(() {});
                                                                                        FFAppState().insertAtIndexInSeleccionEtiquetasHistorico(0, _model.etiquetashistoricoValue!);
                                                                                        safeSetState(() {});
                                                                                        await actions.procesarGraficoHistoricoGastos();
                                                                                      },
                                                                                      width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintText: 'Etiquetas',
                                                                                      searchHintText: 'Search for an item...',
                                                                                      icon: Icon(
                                                                                        Icons.keyboard_arrow_down_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                      elevation: 0.0,
                                                                                      borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                      borderWidth: 1.0,
                                                                                      borderRadius: 100.0,
                                                                                      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                      hidesUnderline: true,
                                                                                      isOverButton: true,
                                                                                      isSearchable: true,
                                                                                      isMultiSelect: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            flex:
                                                                                75,
                                                                            child:
                                                                                ListView(
                                                                              padding: EdgeInsets.zero,
                                                                              reverse: true,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: SizedBox(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: MediaQuery.sizeOf(context).height * 0.23,
                                                                                      child: FlutterFlowBarChart(
                                                                                        barData: [
                                                                                          FFBarChartData(
                                                                                            yData: FFAppState().gastoGraficoHistoricoGastos.map((e) => e).toList(),
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                          )
                                                                                        ],
                                                                                        xLabels: FFAppState().periodosGraficoHistoricoGastos.map((e) => e).toList(),
                                                                                        barWidth: 32.0,
                                                                                        barBorderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        groupSpace: 100.0,
                                                                                        alignment: BarChartAlignment.spaceBetween,
                                                                                        chartStylingInfo: ChartStylingInfo(
                                                                                          enableTooltip: true,
                                                                                          tooltipBackgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                          showBorder: false,
                                                                                        ),
                                                                                        axisBounds: const AxisBounds(),
                                                                                        xAxisLabelInfo: AxisLabelInfo(
                                                                                          showLabels: true,
                                                                                          labelTextStyle: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 18.0,
                                                                                          ),
                                                                                          labelInterval: 10.0,
                                                                                          reservedSize: 28.0,
                                                                                        ),
                                                                                        yAxisLabelInfo: const AxisLabelInfo(
                                                                                          reservedSize: 42.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
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
            ],
          ),
        ),
      ),
    );
  }
}
