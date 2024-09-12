import '/flutter_flow/flutter_flow_util.dart';
import 'eliminar_confimacion_cuenta_widget.dart'
    show EliminarConfimacionCuentaWidget;
import 'package:flutter/material.dart';

class EliminarConfimacionCuentaModel
    extends FlutterFlowModel<EliminarConfimacionCuentaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
