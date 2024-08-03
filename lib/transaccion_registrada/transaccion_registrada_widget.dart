import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'transaccion_registrada_model.dart';
export 'transaccion_registrada_model.dart';

class TransaccionRegistradaWidget extends StatefulWidget {
  const TransaccionRegistradaWidget({super.key});

  @override
  State<TransaccionRegistradaWidget> createState() =>
      _TransaccionRegistradaWidgetState();
}

class _TransaccionRegistradaWidgetState
    extends State<TransaccionRegistradaWidget> {
  late TransaccionRegistradaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransaccionRegistradaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Icon(
                      Icons.check_rounded,
                      color: FlutterFlowTheme.of(context).accent2,
                      size: 120.0,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '¡Registrado!',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).accent2,
                          letterSpacing: 0.0,
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
