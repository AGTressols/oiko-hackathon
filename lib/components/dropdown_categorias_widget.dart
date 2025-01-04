import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'dropdown_categorias_model.dart';
export 'dropdown_categorias_model.dart';

class DropdownCategoriasWidget extends StatefulWidget {
  const DropdownCategoriasWidget({
    super.key,
    required this.movimiento,
  });

  final List<String>? movimiento;

  @override
  State<DropdownCategoriasWidget> createState() =>
      _DropdownCategoriasWidgetState();
}

class _DropdownCategoriasWidgetState extends State<DropdownCategoriasWidget> {
  late DropdownCategoriasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownCategoriasModel());
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
                child: StreamBuilder<List<CategoriasRecord>>(
                  stream: queryCategoriasRecord(
                    queryBuilder: (categoriasRecord) => categoriasRecord
                        .where(
                          'uid',
                          isEqualTo: currentUserUid,
                        )
                        .where(
                          'activa',
                          isEqualTo: true,
                        )
                        .whereIn('movimiento', widget.movimiento),
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
                    List<CategoriasRecord> listViewCategoriasRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewCategoriasRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewCategoriasRecord =
                            listViewCategoriasRecordList[listViewIndex];
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
                                    FFAppState().flowCategoria =
                                        FlowCategoriaStruct(
                                      nombre:
                                          listViewCategoriasRecord.categoria,
                                      categoriaRef:
                                          listViewCategoriasRecord.reference,
                                      logo: listViewCategoriasRecord.logo,
                                    );
                                    safeSetState(() {});
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
                                      mainAxisSize: MainAxisSize.min,
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
                                                width: double.infinity,
                                                height: double.infinity,
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
                                          flex: 10,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listViewCategoriasRecord
                                                    .categoria,
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
                                if (FFAppState()
                                        .flowCategoria
                                        .categoriaRef
                                        ?.id ==
                                    listViewCategoriasRecord.reference.id)
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
                                      mainAxisSize: MainAxisSize.min,
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
                                                width: double.infinity,
                                                height: double.infinity,
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
                                          flex: 10,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                listViewCategoriasRecord
                                                    .categoria,
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
