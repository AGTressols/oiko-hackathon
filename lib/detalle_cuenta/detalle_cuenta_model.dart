import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_cuenta_widget.dart' show DetalleCuentaWidget;
import 'package:flutter/material.dart';

class DetalleCuentaModel extends FlutterFlowModel<DetalleCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ajuste widget.
  FocusNode? ajusteFocusNode;
  TextEditingController? ajusteTextController;
  String? Function(BuildContext, String?)? ajusteTextControllerValidator;
  // State field(s) for tipoDeCambio widget.
  FocusNode? tipoDeCambioFocusNode;
  TextEditingController? tipoDeCambioTextController;
  String? Function(BuildContext, String?)? tipoDeCambioTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransaccionesRecord? ajusteDivisa;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransaccionesRecord? ajustePesoAhorro;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransaccionesRecord? ajustePeso;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    ajusteFocusNode?.dispose();
    ajusteTextController?.dispose();

    tipoDeCambioFocusNode?.dispose();
    tipoDeCambioTextController?.dispose();
  }
}
