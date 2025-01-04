import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'q_divisa_model.dart';
export 'q_divisa_model.dart';

class QDivisaWidget extends StatefulWidget {
  const QDivisaWidget({
    super.key,
    required this.divisa,
    required this.tapOrTad,
    required this.ahorro,
  });

  final String? divisa;
  final double? tapOrTad;
  final bool? ahorro;

  @override
  State<QDivisaWidget> createState() => _QDivisaWidgetState();
}

class _QDivisaWidgetState extends State<QDivisaWidget> {
  late QDivisaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QDivisaModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            width: 320.0,
            height: 190.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.divisa,
                    'Moneda',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
                SizedBox(
                  width: 200.0,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Outfit',
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Cantidad de ${widget.divisa}',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                        ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        FFAppState().flowMontoDivisa =
                            double.parse(_model.textController.text);
                        safeSetState(() {});
                        if (!widget.ahorro!) {
                          if (FFAppState().flowMontoDivisa >
                              widget.tapOrTad!) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('No hay saldo'),
                                  content: const Text(
                                      'No hay suficiente saldo para realizar la transacción'),
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
                            FFAppState().flowMontoDivisa = 0.0;
                            safeSetState(() {});
                            return;
                          }
                        }
                        Navigator.pop(context);
                      },
                      text: 'Confirmar',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
