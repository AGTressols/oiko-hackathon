import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'dropdown_cuentas_credito_model.dart';
export 'dropdown_cuentas_credito_model.dart';

class DropdownCuentasCreditoWidget extends StatefulWidget {
  const DropdownCuentasCreditoWidget({
    super.key,
    bool? ahorro,
  }) : ahorro = ahorro ?? false;

  final bool ahorro;

  @override
  State<DropdownCuentasCreditoWidget> createState() =>
      _DropdownCuentasCreditoWidgetState();
}

class _DropdownCuentasCreditoWidgetState
    extends State<DropdownCuentasCreditoWidget> {
  late DropdownCuentasCreditoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownCuentasCreditoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 300.0,
          height: 256.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, -0.25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: MediaQuery.sizeOf(context).height * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: StreamBuilder<List<CuentasRecord>>(
                  stream: queryCuentasRecord(
                    queryBuilder: (cuentasRecord) => cuentasRecord
                        .where(
                          'uid',
                          isEqualTo: currentUserUid,
                        )
                        .where(
                          'activa',
                          isEqualTo: true,
                        )
                        .where(
                          'ahorro',
                          isEqualTo: widget.ahorro,
                        )
                        .where(
                          'divisa',
                          isEqualTo: '\$ARS',
                        ),
                  ),
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
                    List<CuentasRecord> listViewCuentasRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewCuentasRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewCuentasRecord =
                            listViewCuentasRecordList[listViewIndex];
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 16.0, 8.0, 0.0),
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (widget.ahorro) {
                                      FFAppState().flowCuentaCredito =
                                          FlowCuentaStruct(
                                        nombre: listViewCuentasRecord.cuenta,
                                        cuentaRef:
                                            listViewCuentasRecord.reference,
                                        logo: listViewCuentasRecord.logo,
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().flowCuentaCredito =
                                          FlowCuentaStruct(
                                        nombre: listViewCuentasRecord.cuenta,
                                        cuentaRef:
                                            listViewCuentasRecord.reference,
                                        logo: listViewCuentasRecord.logo,
                                      );
                                      safeSetState(() {});
                                    }

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.85,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 0.0, 8.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
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
                                          flex: 10,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listViewCuentasRecord.cuenta,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
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
                                if (FFAppState().flowCuentaCredito.cuentaRef ==
                                    listViewCuentasRecord.reference)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.85,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 0.0, 8.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
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
                                          flex: 10,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listViewCuentasRecord.cuenta,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
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
      ],
    );
  }
}
