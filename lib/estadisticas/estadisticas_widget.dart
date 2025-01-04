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
      length: 4,
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
      const Color(0xFF00DBA4),
      const Color(0xFF7699D4),
      const Color(0xFF9448BC),
      const Color(0xFF480355),
      const Color(0xFFEFBC9B),
      const Color(0xFFEAC435),
      const Color(0xFF345995),
      const Color(0xFFFB4D3D),
      const Color(0xFFCA1551),
      const Color(0xFFDF9A57),
      const Color(0xFFFC7A57),
      const Color(0xFFFCD757),
      const Color(0xFF5E5B52),
      const Color(0xFF791E94),
      const Color(0xFFDE6449),
      const Color(0xFF407899),
      const Color(0xFFCFD11A),
      const Color(0xFF9F87AF),
      const Color(0xFF88527F),
      const Color(0xFF614344),
      const Color(0xFF332C23),
      const Color(0xFFE56399),
      const Color(0xFFE5D4CE),
      const Color(0xFFDE6E4B),
      const Color(0xFF7A6563)
    ];
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
                                    buttonMargin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    padding: const EdgeInsets.all(4.0),
                                    tabs: const [
                                      Tab(
                                        text: 'Egresos',
                                      ),
                                      Tab(
                                        text: 'Ingresos',
                                      ),
                                      Tab(
                                        text: 'Ahorro',
                                      ),
                                      Tab(
                                        text: 'General',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            multiSelectController: _model
                                                                    .dropDownValueController1 ??=
                                                                FormListFieldController<
                                                                    String>(_model
                                                                        .dropDownValue1 ??=
                                                                    List<
                                                                        String>.from(
                                                              FFAppState()
                                                                      .seleccionPeriodos ??
                                                                  [],
                                                            )),
                                                            options: functions
                                                                .calendarDropdown(),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Períodos',
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
                                                            borderRadius: 30.0,
                                                            margin:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: false,
                                                            isMultiSelect: true,
                                                            onMultiSelectChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.dropDownValue1 =
                                                                      val);
                                                              FFAppState()
                                                                      .seleccionPeriodos =
                                                                  _model
                                                                      .dropDownValue1!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              safeSetState(
                                                                  () {});
                                                              await Future
                                                                  .wait([
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosGraficoPresupuesto();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .calcularGastosEIngresosTotales();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .calcularSaldoTotal();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosDeCuentas();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .obtenerCategoriasConTransacciones();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .obtenerCategoriasConTransaccionesHistorico();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosGraficoIngresoPorCategoria();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .saldoCuentasAhorro();
                                                                }),
                                                              ]);

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
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
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
                                                                      child:
                                                                          Text(
                                                                        'Gastos totales',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 70,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            FFAppState().gastoTotalVariable,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.automatic,
                                                                            currency:
                                                                                '\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                MainAxisSize
                                                                    .min,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
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
                                                                                return Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(30.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 180.0,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.01,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            flex: 40,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  flex: 25,
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                                    height: MediaQuery.sizeOf(context).width * 0.6,
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
                                                                                                  flex: 75,
                                                                                                  child: Text(
                                                                                                    gastosCuentaItem.cuenta,
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 60,
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
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          32.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
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
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(30.0),
                                                                        topRight:
                                                                            Radius.circular(30.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Column(
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
                                                                  padding: const EdgeInsetsDirectional
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
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          shape:
                                                                              const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(30.0),
                                                                              bottomRight: Radius.circular(30.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            constraints:
                                                                                const BoxConstraints(
                                                                              maxHeight: 250.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(30.0),
                                                                                bottomRight: Radius.circular(30.0),
                                                                                topLeft: Radius.circular(0.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 16.0),
                                                                              child: Builder(
                                                                                builder: (context) {
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
                                                                                                          gastosPresupuestoItem.presupuestoDisponible == 0
                                                                                                              ? '-'
                                                                                                              : formatNumber(
                                                                                                                  gastosPresupuestoItem.presupuestoDisponible,
                                                                                                                  formatType: FormatType.decimal,
                                                                                                                  decimalType: DecimalType.automatic,
                                                                                                                  currency: '\$',
                                                                                                                ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: gastosPresupuestoItem.presupuestoDisponible < 0 ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).secondaryText,
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
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          32.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 10,
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
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
                                                                              flex: 90,
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          32.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
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
                                                                                flex: 10,
                                                                                child: Align(
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
                                                                                flex: 15,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropdownetiquetasValueController ??= FormFieldController<String>(null),
                                                                                    options: FFAppState().seleccionCategorias,
                                                                                    onChanged: (val) async {
                                                                                      safeSetState(() => _model.dropdownetiquetasValue = val);
                                                                                      FFAppState().insertAtIndexInCategoriasSeleccionadas(0, _model.dropdownetiquetasValue!);
                                                                                      safeSetState(() {});
                                                                                      FFAppState().removeAtIndexFromCategoriasSeleccionadas(1);
                                                                                      safeSetState(() {});
                                                                                      await actions.procesarGraficoEtiqueta();

                                                                                      context.pushNamed('Estadisticas');
                                                                                    },
                                                                                    width: MediaQuery.sizeOf(context).width * 0.5,
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
                                                                                    hintText: 'Categoria',
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
                                                                                flex: 80,
                                                                                child: ListView(
                                                                                  padding: EdgeInsets.zero,
                                                                                  reverse: true,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: SizedBox(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          height: MediaQuery.sizeOf(context).height * 0.23,
                                                                                          child: FlutterFlowBarChart(
                                                                                            barData: [
                                                                                              FFBarChartData(
                                                                                                yData: FFAppState().graficoEtiquetaAppState.map((e) => e.gasto).toList(),
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
                                                                                            groupSpace: 80.0,
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
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          32.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
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
                                                                                flex: 10,
                                                                                child: Align(
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
                                                                                flex: 15,
                                                                                child: Row(
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

                                                                                            context.pushNamed('Estadisticas');
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
                                                                                flex: 75,
                                                                                child: ListView(
                                                                                  padding: EdgeInsets.zero,
                                                                                  reverse: true,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 1.0),
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
                                                                                            groupSpace: 80.0,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            multiSelectController: _model
                                                                    .dropDownValueController2 ??=
                                                                FormListFieldController<
                                                                    String>(_model
                                                                        .dropDownValue2 ??=
                                                                    List<
                                                                        String>.from(
                                                              FFAppState()
                                                                      .seleccionPeriodos ??
                                                                  [],
                                                            )),
                                                            options: functions
                                                                .calendarDropdown(),
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.12,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Períodos',
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
                                                            borderRadius: 30.0,
                                                            margin:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: false,
                                                            isMultiSelect: true,
                                                            onMultiSelectChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.dropDownValue2 =
                                                                      val);
                                                              FFAppState()
                                                                      .seleccionPeriodos =
                                                                  _model
                                                                      .dropDownValue2!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              safeSetState(
                                                                  () {});
                                                              await Future
                                                                  .wait([
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosGraficoPresupuesto();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .calcularGastosEIngresosTotales();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .calcularSaldoTotal();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosDeCuentas();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .obtenerCategoriasConTransacciones();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .obtenerCategoriasConTransaccionesHistorico();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosGraficoIngresoPorCategoria();
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  await actions
                                                                      .procesarDatosHistoricoIngreso();
                                                                }),
                                                              ]);

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
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
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
                                                                      child:
                                                                          Text(
                                                                        'Ingresos totales',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 70,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            FFAppState().ingresoTotalVariable,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.automatic,
                                                                            currency:
                                                                                '\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                MainAxisSize
                                                                    .min,
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
                                                                    'Ingresos por cuentas',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
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
                                                                            final ingresosCuenta =
                                                                                FFAppState().ingresosPorCuenta.map((e) => e).toList();

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: ingresosCuenta.length,
                                                                              separatorBuilder: (_, __) => const SizedBox(width: 10.0),
                                                                              itemBuilder: (context, ingresosCuentaIndex) {
                                                                                final ingresosCuentaItem = ingresosCuenta[ingresosCuentaIndex];
                                                                                return Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(30.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 180.0,
                                                                                    height: MediaQuery.sizeOf(context).height * 0.01,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            flex: 40,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  flex: 25,
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                                    height: MediaQuery.sizeOf(context).width * 0.6,
                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                    decoration: const BoxDecoration(
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: Image.network(
                                                                                                      ingresosCuentaItem.logo,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Flexible(
                                                                                                  flex: 75,
                                                                                                  child: Text(
                                                                                                    ingresosCuentaItem.cuenta,
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            flex: 60,
                                                                                            child: Text(
                                                                                              formatNumber(
                                                                                                ingresosCuentaItem.monto,
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
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          32.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.5,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
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
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(-0.7, 0.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(30.0),
                                                                                    child: Container(
                                                                                      width: 118.0,
                                                                                      height: 350.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final ingresos = FFAppState().graficoIngresoPorCategoria.map((e) => e).toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: ingresos.length,
                                                                                            separatorBuilder: (_, __) => const SizedBox(height: 0.0),
                                                                                            itemBuilder: (context, ingresosIndex) {
                                                                                              final ingresosItem = ingresos[ingresosIndex];
                                                                                              return Container(
                                                                                                width: 100.0,
                                                                                                height: ingresosItem.ingresoPorCategoriaPX.toDouble(),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: ingresosItem.color,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).accent4,
                                                                                                  ),
                                                                                                ),
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  formatNumber(
                                                                                                    ingresosItem.porcentajeIngresoPorCategoria,
                                                                                                    formatType: FormatType.percent,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                                Container(
                                                                                  width: 222.0,
                                                                                  height: 380.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final ingresoDetalle = FFAppState().graficoIngresoPorCategoria.map((e) => e).toList();

                                                                                        return GridView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                                            crossAxisCount: 1,
                                                                                            crossAxisSpacing: 2.0,
                                                                                            mainAxisSpacing: 4.0,
                                                                                            childAspectRatio: 3.0,
                                                                                          ),
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: ingresoDetalle.length,
                                                                                          itemBuilder: (context, ingresoDetalleIndex) {
                                                                                            final ingresoDetalleItem = ingresoDetalle[ingresoDetalleIndex];
                                                                                            return Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 20,
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 30.0,
                                                                                                        height: 30.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: ingresoDetalleItem.color,
                                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 80,
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            ingresoDetalleItem.categoria,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            formatNumber(
                                                                                                              ingresoDetalleItem.ingresoPorCategoriaAbs,
                                                                                                              formatType: FormatType.decimal,
                                                                                                              decimalType: DecimalType.automatic,
                                                                                                              currency: '\$',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Outfit',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
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
                                                                                ),
                                                                              ],
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
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          32.0,
                                                                          4.0,
                                                                          32.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.4,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
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
                                                                              Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 400.0,
                                                                                  height: 300.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).accent4,
                                                                                  ),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final padre = FFAppState().graficoHistoricoIngresoPadre.map((e) => e).toList();

                                                                                      return ListView.separated(
                                                                                        padding: EdgeInsets.zero,
                                                                                        reverse: true,
                                                                                        primary: false,
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        itemCount: padre.length,
                                                                                        separatorBuilder: (_, __) => const SizedBox(width: 50.0),
                                                                                        itemBuilder: (context, padreIndex) {
                                                                                          final padreItem = padre[padreIndex];
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: Text(
                                                                                                  formatNumber(
                                                                                                    padreItem.ingresoTotalMes,
                                                                                                    formatType: FormatType.compact,
                                                                                                    currency: '\$',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              ClipRRect(
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                  topLeft: Radius.circular(8.0),
                                                                                                  topRight: Radius.circular(8.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 70.0,
                                                                                                  height: padreItem.alturaDataType.toDouble(),
                                                                                                  decoration: const BoxDecoration(
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      final hijo = FFAppState().graficoIngresoHistoricoHijo.map((e) => e).toList().where((e) => e.fecha == padreItem.fecha).toList();

                                                                                                      return ListView.builder(
                                                                                                        padding: EdgeInsets.zero,
                                                                                                        reverse: true,
                                                                                                        primary: false,
                                                                                                        scrollDirection: Axis.vertical,
                                                                                                        itemCount: hijo.length,
                                                                                                        itemBuilder: (context, hijoIndex) {
                                                                                                          final hijoItem = hijo[hijoIndex];
                                                                                                          return Container(
                                                                                                            width: 100.0,
                                                                                                            height: hijoItem.altura.toDouble(),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: hijoItem.color,
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                                                              ),
                                                                                                            ),
                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              formatNumber(
                                                                                                                hijoItem.ingresoPorCategoria,
                                                                                                                formatType: FormatType.compact,
                                                                                                                currency: '\$',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Outfit',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                padreItem.fecha,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      letterSpacing: 0.0,
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
                                                                            ],
                                                                          ),
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
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'Saldo de cajas de ahorro',
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
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final cuentasDeAhorro =
                                                                  FFAppState()
                                                                      .ahorroPorCuenta
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.totalDivisa !=
                                                                          0.0)
                                                                      .toList();

                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      10.0,
                                                                  mainAxisSpacing:
                                                                      10.0,
                                                                  childAspectRatio:
                                                                      0.8,
                                                                ),
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    cuentasDeAhorro
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        cuentasDeAhorroIndex) {
                                                                  final cuentasDeAhorroItem =
                                                                      cuentasDeAhorro[
                                                                          cuentasDeAhorroIndex];
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          273.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 40,
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 25,
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                        height: MediaQuery.sizeOf(context).width * 0.6,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: const BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          cuentasDeAhorroItem.logo,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 75,
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          cuentasDeAhorroItem.nombre,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 60,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    cuentasDeAhorroItem.divisa,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      formatNumber(
                                                                                        cuentasDeAhorroItem.totalDivisa,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.automatic,
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
                                                                          ],
                                                                        ),
                                                                      ),
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
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 32.0, 4.0, 32.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Destino del ahorro',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          reverse:
                                                                              true,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: functions.alturaModificada(FFAppState().alturaMaximaContainerPadreAhorroMas, 30)?.toDouble(),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                    ),
                                                                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final padreAhorro = FFAppState().graficoAhorroPorCuentaPadre.map((e) => e).toList();

                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.zero,
                                                                                          reverse: true,
                                                                                          primary: false,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          itemCount: padreAhorro.length,
                                                                                          separatorBuilder: (_, __) => const SizedBox(width: 50.0),
                                                                                          itemBuilder: (context, padreAhorroIndex) {
                                                                                            final padreAhorroItem = padreAhorro[padreAhorroIndex];
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      padreAhorroItem.fecha,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                      child: Text(
                                                                                                        formatNumber(
                                                                                                          padreAhorroItem.tAhorro,
                                                                                                          formatType: FormatType.compact,
                                                                                                          currency: '\$',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Outfit',
                                                                                                              fontSize: 16.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                ClipRRect(
                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(8.0),
                                                                                                    topRight: Radius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: 70.0,
                                                                                                    height: padreAhorroItem.alturaDataType.toDouble(),
                                                                                                    decoration: const BoxDecoration(
                                                                                                      borderRadius: BorderRadius.only(
                                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                                        bottomRight: Radius.circular(0.0),
                                                                                                        topLeft: Radius.circular(8.0),
                                                                                                        topRight: Radius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        final hijoAhorro = FFAppState().graficoAhorroPorCuentaHijo.map((e) => e).toList().where((e) => e.fecha == padreAhorroItem.fecha).toList();

                                                                                                        return ListView.separated(
                                                                                                          padding: EdgeInsets.zero,
                                                                                                          reverse: true,
                                                                                                          primary: false,
                                                                                                          shrinkWrap: true,
                                                                                                          scrollDirection: Axis.vertical,
                                                                                                          itemCount: hijoAhorro.length,
                                                                                                          separatorBuilder: (_, __) => const SizedBox(height: 0.0),
                                                                                                          itemBuilder: (context, hijoAhorroIndex) {
                                                                                                            final hijoAhorroItem = hijoAhorro[hijoAhorroIndex];
                                                                                                            return Container(
                                                                                                              width: 100.0,
                                                                                                              height: hijoAhorroItem.altura.toDouble(),
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: hijoAhorroItem.color,
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                                                ),
                                                                                                              ),
                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                formatNumber(
                                                                                                                  hijoAhorroItem.ahorroPorCuenta,
                                                                                                                  formatType: FormatType.compact,
                                                                                                                  currency: '\$',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Outfit',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      letterSpacing: 0.0,
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
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: functions.alturaModificada(FFAppState().alturaMaximaContainerPadreAhorroMenos, 30)?.toDouble(),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                        ),
                                                                                        alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final padreMenos = FFAppState().padreMenos.map((e) => e).toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              reverse: true,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: padreMenos.length,
                                                                                              separatorBuilder: (_, __) => const SizedBox(width: 50.0),
                                                                                              itemBuilder: (context, padreMenosIndex) {
                                                                                                final padreMenosItem = padreMenos[padreMenosIndex];
                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      padreMenosItem.fecha,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(8.0),
                                                                                                          bottomRight: Radius.circular(8.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(0.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: 70.0,
                                                                                                          height: padreMenosItem.alturaDataType.toDouble(),
                                                                                                          decoration: const BoxDecoration(
                                                                                                            borderRadius: BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(8.0),
                                                                                                              bottomRight: Radius.circular(8.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Builder(
                                                                                                            builder: (context) {
                                                                                                              final hijoMenos = FFAppState().hijoMenos.map((e) => e).toList().where((e) => e.fecha == padreMenosItem.fecha).toList();

                                                                                                              return ListView.separated(
                                                                                                                padding: EdgeInsets.zero,
                                                                                                                primary: false,
                                                                                                                shrinkWrap: true,
                                                                                                                scrollDirection: Axis.vertical,
                                                                                                                itemCount: hijoMenos.length,
                                                                                                                separatorBuilder: (_, __) => const SizedBox(height: 0.0),
                                                                                                                itemBuilder: (context, hijoMenosIndex) {
                                                                                                                  final hijoMenosItem = hijoMenos[hijoMenosIndex];
                                                                                                                  return Container(
                                                                                                                    width: 100.0,
                                                                                                                    height: hijoMenosItem.altura.toDouble(),
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: hijoMenosItem.color,
                                                                                                                      border: Border.all(
                                                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      formatNumber(
                                                                                                                        hijoMenosItem.ahorroPorCuenta,
                                                                                                                        formatType: FormatType.compact,
                                                                                                                        currency: '\$',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Outfit',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
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
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
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
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 32.0, 4.0, 32.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.6,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Cajas de ahorro',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        String>(
                                                                  controller: _model
                                                                          .dropdowncuentasahorroValueController ??=
                                                                      FormFieldController<
                                                                              String>(
                                                                          null),
                                                                  options:
                                                                      FFAppState()
                                                                          .cuentasDeAhorroDropdown,
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.dropdowncuentasahorroValue =
                                                                            val);
                                                                    FFAppState()
                                                                        .insertAtIndexInSeleccionCuentaAhorro(
                                                                            0,
                                                                            _model.dropdowncuentasahorroValue!);
                                                                    safeSetState(
                                                                        () {});
                                                                    await actions
                                                                        .procesarDatosHistoricoAhorroPorCuenta();

                                                                    context.pushNamed(
                                                                        'Estadisticas');
                                                                  },
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.05,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText:
                                                                      'Caja',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  elevation:
                                                                      0.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      100.0,
                                                                  margin: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          reverse:
                                                                              true,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: functions.alturaModificada(FFAppState().alturaMaximaPadreMas, 30)?.toDouble(),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                    ),
                                                                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final padreAhorro = FFAppState().cuentaAhorroPadreMas.map((e) => e).toList();

                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.zero,
                                                                                          reverse: true,
                                                                                          primary: false,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          itemCount: padreAhorro.length,
                                                                                          separatorBuilder: (_, __) => const SizedBox(width: 50.0),
                                                                                          itemBuilder: (context, padreAhorroIndex) {
                                                                                            final padreAhorroItem = padreAhorro[padreAhorroIndex];
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      padreAhorroItem.fecha,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                      child: Text(
                                                                                                        formatNumber(
                                                                                                          padreAhorroItem.tAhorro,
                                                                                                          formatType: FormatType.compact,
                                                                                                          currency: '\$',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Outfit',
                                                                                                              fontSize: 16.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                ClipRRect(
                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(8.0),
                                                                                                    topRight: Radius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: 70.0,
                                                                                                    height: padreAhorroItem.alturaDataType.toDouble(),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                                        bottomRight: Radius.circular(0.0),
                                                                                                        topLeft: Radius.circular(8.0),
                                                                                                        topRight: Radius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
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
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: functions.alturaModificada(FFAppState().alturaMaximaPadreMenos, 30)?.toDouble(),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                        ),
                                                                                        alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final padreMenos = FFAppState().cuentaAhorroPadreMenos.map((e) => e).toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              reverse: true,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: padreMenos.length,
                                                                                              separatorBuilder: (_, __) => const SizedBox(width: 50.0),
                                                                                              itemBuilder: (context, padreMenosIndex) {
                                                                                                final padreMenosItem = padreMenos[padreMenosIndex];
                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      padreMenosItem.fecha,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(8.0),
                                                                                                          bottomRight: Radius.circular(8.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(0.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: 70.0,
                                                                                                          height: padreMenosItem.alturaDataType.toDouble(),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                            borderRadius: const BorderRadius.only(
                                                                                                              bottomLeft: Radius.circular(8.0),
                                                                                                              bottomRight: Radius.circular(8.0),
                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                              topRight: Radius.circular(0.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
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
                                                                                ),
                                                                              ],
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
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      4.0, 32.0, 4.0, 0.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.14,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              multiSelectController: _model
                                                                      .dropDownValueController3 ??=
                                                                  FormListFieldController<
                                                                      String>(_model
                                                                          .dropDownValue3 ??=
                                                                      List<
                                                                          String>.from(
                                                                FFAppState()
                                                                        .seleccionPeriodos ??
                                                                    [],
                                                              )),
                                                              options: functions
                                                                  .calendarDropdown(),
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.4,
                                                              height: MediaQuery
                                                                          .sizeOf(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  'Períodos',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 14.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  30.0,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  true,
                                                              onMultiSelectChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.dropDownValue3 =
                                                                        val);
                                                                FFAppState()
                                                                        .seleccionPeriodos =
                                                                    _model
                                                                        .dropDownValue3!
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                safeSetState(
                                                                    () {});
                                                                await Future
                                                                    .wait([
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .procesarDatosGraficoPresupuesto();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .calcularGastosEIngresosTotales();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .calcularSaldoTotal();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .procesarDatosDeCuentas();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .obtenerCategoriasConTransacciones();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .obtenerCategoriasConTransaccionesHistorico();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .procesarDatosGraficoIngresoPorCategoria();
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    await actions
                                                                        .procesarDatosHistoricoIngreso();
                                                                  }),
                                                                ]);

                                                                context
                                                                    .pushNamed(
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: 110.0,
                                                                height: 44.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .call_received_rounded,
                                                                        color: Color(
                                                                            0xFF8C0017),
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            FFAppState().gastoTotalVariable,
                                                                            formatType:
                                                                                FormatType.compact,
                                                                            currency:
                                                                                '\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 110.0,
                                                                height: 44.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .savings_rounded,
                                                                        color: Color(
                                                                            0xFF015B96),
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            FFAppState().saldoAhorroGeneral,
                                                                            formatType:
                                                                                FormatType.compact,
                                                                            currency:
                                                                                '\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 110.0,
                                                                height: 44.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      const Icon(
                                                                        Icons
                                                                            .call_made_rounded,
                                                                        color: Color(
                                                                            0xFF008C6B),
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            FFAppState().ingresoTotalVariable,
                                                                            formatType:
                                                                                FormatType.compact,
                                                                            currency:
                                                                                '\$',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
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
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 0.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.234,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Saldo',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            formatNumber(
                                                              FFAppState()
                                                                  .saldoGeneral,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                              currency: '\$',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FFAppState()
                                                                              .saldoGeneral <
                                                                          0.0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .error
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  fontSize:
                                                                      28.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
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
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.18,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final saldosCuentas = FFAppState()
                                                                          .saldosCuentas
                                                                          .map((e) =>
                                                                              e)
                                                                          .toList()
                                                                          .where((e) =>
                                                                              e.saldo !=
                                                                              0.0)
                                                                          .toList();

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            saldosCuentas.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(width: 10.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                saldosCuentasIndex) {
                                                                          final saldosCuentasItem =
                                                                              saldosCuentas[saldosCuentasIndex];
                                                                          return Container(
                                                                            width:
                                                                                180.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.05,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                              borderRadius: BorderRadius.circular(30.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Flexible(
                                                                                    flex: 40,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          flex: 25,
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                            height: MediaQuery.sizeOf(context).width * 0.7,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: const BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              saldosCuentasItem.logo,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          flex: 75,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              saldosCuentasItem.cuenta,
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Flexible(
                                                                                    flex: 60,
                                                                                    child: Text(
                                                                                      formatNumber(
                                                                                        saldosCuentasItem.saldo,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.automatic,
                                                                                        currency: '\$',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: saldosCuentasItem.saldo < 0.0 ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).primaryText,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      4.0, 32.0, 4.0, 0.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.35,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            flex: 10,
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
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Historia',
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
                                                          ),
                                                          Flexible(
                                                            flex: 80,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: ListView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.25,
                                                                        child:
                                                                            FlutterFlowBarChart(
                                                                          barData: [
                                                                            FFBarChartData(
                                                                              yData: FFAppState().totalIngresoGraficoGeneral,
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                            FFBarChartData(
                                                                              yData: FFAppState().totalGastoGraficoGeneral,
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                            ),
                                                                            FFBarChartData(
                                                                              yData: FFAppState().totalAhorroGraficoGeneral,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                            )
                                                                          ],
                                                                          xLabels:
                                                                              FFAppState().fechaIngresoGastoAhorro,
                                                                          barWidth:
                                                                              40.0,
                                                                          barBorderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(8.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
                                                                          barSpace:
                                                                              0.0,
                                                                          groupSpace:
                                                                              20.0,
                                                                          alignment:
                                                                              BarChartAlignment.end,
                                                                          chartStylingInfo:
                                                                              ChartStylingInfo(
                                                                            enableTooltip:
                                                                                true,
                                                                            tooltipBackgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                            showBorder:
                                                                                false,
                                                                          ),
                                                                          axisBounds:
                                                                              const AxisBounds(),
                                                                          xAxisLabelInfo:
                                                                              AxisLabelInfo(
                                                                            showLabels:
                                                                                true,
                                                                            labelTextStyle:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                            ),
                                                                            labelInterval:
                                                                                10.0,
                                                                            reservedSize:
                                                                                28.0,
                                                                          ),
                                                                          yAxisLabelInfo:
                                                                              const AxisLabelInfo(
                                                                            reservedSize:
                                                                                42.0,
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
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 10,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Transacciones',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 0.0, 32.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.5,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final transacciones =
                                                        FFAppState()
                                                            .todasTransacciones
                                                            .map((e) => e)
                                                            .toList();

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          transacciones.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          transaccionesIndex) {
                                                        final transaccionesItem =
                                                            transacciones[
                                                                transaccionesIndex];
                                                        return SizedBox(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 66.0,
                                                          child: Stack(
                                                            children: [
                                                              if ((transaccionesItem
                                                                          .movimiento ==
                                                                      'Gasto') ||
                                                                  (transaccionesItem
                                                                          .movimiento ==
                                                                      'Ingreso'))
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'detalleTransaccion',
                                                                      queryParameters:
                                                                          {
                                                                        'parametroTransaccion':
                                                                            serializeParam(
                                                                          transaccionesItem,
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                        'divisa':
                                                                            serializeParam(
                                                                          transaccionesItem
                                                                              .divisaBool,
                                                                          ParamType
                                                                              .bool,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.12,
                                                                                height: MediaQuery.sizeOf(context).width * 0.12,
                                                                                decoration: BoxDecoration(
                                                                                  color: () {
                                                                                    if (transaccionesItem.movimiento == 'Gasto') {
                                                                                      return FlutterFlowTheme.of(context).error;
                                                                                    } else if (transaccionesItem.movimiento == 'Ingreso') {
                                                                                      return FlutterFlowTheme.of(context).success;
                                                                                    } else {
                                                                                      return FlutterFlowTheme.of(context).secondaryText;
                                                                                    }
                                                                                  }(),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    transaccionesItem.logo,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 45,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        transaccionesItem.categoria,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        transaccionesItem.etiqueta,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 45.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 35,
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat("relative", transaccionesItem.fecha!),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.06,
                                                                                            height: MediaQuery.sizeOf(context).width * 0.06,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: const BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              transaccionesItem.logoCuenta,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              transaccionesItem.cuenta,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  transaccionesItem.monto,
                                                                                  formatType: FormatType.compact,
                                                                                  currency: '\$',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (transaccionesItem
                                                                      .movimiento ==
                                                                  'Ahorro')
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (transaccionesItem
                                                                            .monto <
                                                                        0.0) {
                                                                      context
                                                                          .pushNamed(
                                                                        'detalleTransaccionAhorro',
                                                                        queryParameters:
                                                                            {
                                                                          'parametroTransaccion':
                                                                              serializeParam(
                                                                            transaccionesItem,
                                                                            ParamType.DataStruct,
                                                                          ),
                                                                          'divisa':
                                                                              serializeParam(
                                                                            transaccionesItem.divisaBool,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        'detalleTransaccionDesahorro',
                                                                        queryParameters:
                                                                            {
                                                                          'parametroTransaccion':
                                                                              serializeParam(
                                                                            transaccionesItem,
                                                                            ParamType.DataStruct,
                                                                          ),
                                                                          'divisa':
                                                                              serializeParam(
                                                                            transaccionesItem.divisaBool,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.12,
                                                                                height: MediaQuery.sizeOf(context).width * 0.12,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  shape: BoxShape.circle,
                                                                                  border: Border.all(
                                                                                    color: transaccionesItem.monto < 0.0 ? const Color(0x00000000) : FlutterFlowTheme.of(context).error,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.savings_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 34.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 45,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.06,
                                                                                        height: MediaQuery.sizeOf(context).width * 0.06,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: const BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          transaccionesItem.logoCuentaCredito,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          transaccionesItem.cuentaCredito,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 45.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 35,
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat("relative", transaccionesItem.fecha!),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.06,
                                                                                            height: MediaQuery.sizeOf(context).width * 0.06,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: const BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              transaccionesItem.logoCuenta,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              transaccionesItem.cuenta,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Text(
                                                                                transaccionesItem.montoDivisa > 0.0
                                                                                    ? formatNumber(
                                                                                        transaccionesItem.montoDivisa,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.automatic,
                                                                                      )
                                                                                    : formatNumber(
                                                                                        transaccionesItem.montoAhorro,
                                                                                        formatType: FormatType.compact,
                                                                                        currency: '\$',
                                                                                      ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (transaccionesItem
                                                                      .movimiento ==
                                                                  'Traspaso')
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'detalleTransaccionTraspaso',
                                                                      queryParameters:
                                                                          {
                                                                        'parametroTransaccion':
                                                                            serializeParam(
                                                                          transaccionesItem,
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                        'divisa':
                                                                            serializeParam(
                                                                          transaccionesItem
                                                                              .divisaBool,
                                                                          ParamType
                                                                              .bool,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.12,
                                                                                height: MediaQuery.sizeOf(context).width * 0.12,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.compare_arrows_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 34.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 45,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.06,
                                                                                              height: MediaQuery.sizeOf(context).width * 0.06,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: const BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                transaccionesItem.logoCuenta,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                transaccionesItem.cuenta,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.arrow_downward_rounded,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 12.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.06,
                                                                                              height: MediaQuery.sizeOf(context).width * 0.06,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: const BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                transaccionesItem.logoCuentaCredito,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                transaccionesItem.cuentaCredito,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
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
                                                                            SizedBox(
                                                                              height: 45.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 35,
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat("relative", transaccionesItem.fecha!),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  transaccionesItem.monto,
                                                                                  formatType: FormatType.compact,
                                                                                  currency: '\$',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (transaccionesItem
                                                                      .movimiento ==
                                                                  'Ajuste')
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'detalleTransaccionAjuste',
                                                                      queryParameters:
                                                                          {
                                                                        'parametroTransaccion':
                                                                            serializeParam(
                                                                          transaccionesItem,
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                        'divisa':
                                                                            serializeParam(
                                                                          transaccionesItem
                                                                              .divisaBool,
                                                                          ParamType
                                                                              .bool,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.12,
                                                                                height: MediaQuery.sizeOf(context).width * 0.12,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.border_color_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 28.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 45,
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.06,
                                                                                            height: MediaQuery.sizeOf(context).width * 0.06,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: const BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              transaccionesItem.logoCuenta == '' ? transaccionesItem.logoCuentaCredito : transaccionesItem.logoCuenta,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              transaccionesItem.cuenta == '' ? transaccionesItem.cuentaCredito : transaccionesItem.cuenta,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Outfit',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
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
                                                                            SizedBox(
                                                                              height: 45.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 35,
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat("relative", transaccionesItem.fecha!),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 20,
                                                                              child: Text(
                                                                                () {
                                                                                  if (transaccionesItem.montoDivisa != 0.0) {
                                                                                    return formatNumber(
                                                                                      transaccionesItem.montoDivisa,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.automatic,
                                                                                    );
                                                                                  } else if (transaccionesItem.montoAhorro != 0.0) {
                                                                                    return formatNumber(
                                                                                      transaccionesItem.montoAhorro,
                                                                                      formatType: FormatType.compact,
                                                                                      currency: '\$',
                                                                                    );
                                                                                  } else {
                                                                                    return formatNumber(
                                                                                      transaccionesItem.monto,
                                                                                      formatType: FormatType.compact,
                                                                                      currency: '\$',
                                                                                    );
                                                                                  }
                                                                                }(),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
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
      ),
    );
  }
}
