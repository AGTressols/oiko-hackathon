import '/flutter_flow/flutter_flow_util.dart';
import 'flow_registro_widget.dart' show FlowRegistroWidget;
import 'package:flutter/material.dart';

class FlowRegistroModel extends FlutterFlowModel<FlowRegistroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for setMonto widget.
  FocusNode? setMontoFocusNode;
  TextEditingController? setMontoTextController;
  String? Function(BuildContext, String?)? setMontoTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    setMontoFocusNode?.dispose();
    setMontoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
