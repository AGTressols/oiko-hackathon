import '/flutter_flow/flutter_flow_util.dart';
import 'q_divisa_widget.dart' show QDivisaWidget;
import 'package:flutter/material.dart';

class QDivisaModel extends FlutterFlowModel<QDivisaWidget> {
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
