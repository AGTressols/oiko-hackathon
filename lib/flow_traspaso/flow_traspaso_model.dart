import '/flutter_flow/flutter_flow_util.dart';
import 'flow_traspaso_widget.dart' show FlowTraspasoWidget;
import 'package:flutter/material.dart';

class FlowTraspasoModel extends FlutterFlowModel<FlowTraspasoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for setMonto widget.
  FocusNode? setMontoFocusNode;
  TextEditingController? setMontoTextController;
  String? Function(BuildContext, String?)? setMontoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    setMontoFocusNode?.dispose();
    setMontoTextController?.dispose();
  }
}
