import '/flutter_flow/flutter_flow_util.dart';
import 'nueva_etiqueta_widget.dart' show NuevaEtiquetaWidget;
import 'package:flutter/material.dart';

class NuevaEtiquetaModel extends FlutterFlowModel<NuevaEtiquetaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
