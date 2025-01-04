import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'dropdown_etiquetas_model.dart';
export 'dropdown_etiquetas_model.dart';

class DropdownEtiquetasWidget extends StatefulWidget {
  const DropdownEtiquetasWidget({
    super.key,
    required this.cateogoria,
  });

  final DocumentReference? cateogoria;

  @override
  State<DropdownEtiquetasWidget> createState() =>
      _DropdownEtiquetasWidgetState();
}

class _DropdownEtiquetasWidgetState extends State<DropdownEtiquetasWidget> {
  late DropdownEtiquetasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownEtiquetasModel());
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 300.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, -0.25),
            child: Container(
              width: 260.0,
              height: 170.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: StreamBuilder<List<EtiquetasRecord>>(
                stream: queryEtiquetasRecord(
                  queryBuilder: (etiquetasRecord) => etiquetasRecord
                      .where(
                        'uid',
                        isEqualTo: currentUserUid,
                      )
                      .where(
                        'categoria',
                        isEqualTo: widget.cateogoria,
                      )
                      .where(
                        'activa',
                        isEqualTo: true,
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
                  List<EtiquetasRecord> listViewEtiquetasRecordList =
                      snapshot.data!;

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewEtiquetasRecordList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewEtiquetasRecord =
                          listViewEtiquetasRecordList[listViewIndex];
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().flowEtiqueta = FlowEtiquetaStruct(
                                  nombre: listViewEtiquetasRecord.etiqueta,
                                  etiquetaRef:
                                      listViewEtiquetasRecord.reference,
                                );
                                safeSetState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  listViewEtiquetasRecord.etiqueta,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            if (FFAppState().flowEtiqueta.etiquetaRef?.id ==
                                listViewEtiquetasRecord.reference.id)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().flowEtiqueta =
                                      FlowEtiquetaStruct();
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    listViewEtiquetasRecord.etiqueta,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
          ),
        ),
      ],
    );
  }
}
