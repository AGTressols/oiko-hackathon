import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'bienvenida_oiko_model.dart';
export 'bienvenida_oiko_model.dart';

class BienvenidaOikoWidget extends StatefulWidget {
  /// Primera pagina que verá el usuario al registrarse
  const BienvenidaOikoWidget({super.key});

  @override
  State<BienvenidaOikoWidget> createState() => _BienvenidaOikoWidgetState();
}

class _BienvenidaOikoWidgetState extends State<BienvenidaOikoWidget> {
  late BienvenidaOikoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BienvenidaOikoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await CategoriasRecord.collection.doc().set(createCategoriasRecordData(
            uid: currentUserUid,
            movimiento: 'Mixta',
            categoria: 'Resultados',
            activa: false,
            logo:
                'https://firebasestorage.googleapis.com/v0/b/oiko-oficial-45p72k.appspot.com/o/cms_uploads%2Ftrending_up_40dp_FFFFFF.png?alt=media&token=5a674425-e4c7-42c3-93ad-4ce5c0e683f9',
          ));
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                    flex: 80,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimatedDefaultTextStyle(
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            duration: const Duration(milliseconds: 2745),
                            curve: Curves.linear,
                            child: const Text(
                              'Empecemos por completar algunos datos sobre vos ...',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 70.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('newlsignupInfoUsuario');
                          },
                          text: '¡Sigamos!',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            hoverColor: FlutterFlowTheme.of(context).tertiary,
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
    );
  }
}
