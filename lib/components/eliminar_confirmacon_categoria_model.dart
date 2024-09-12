import '/flutter_flow/flutter_flow_util.dart';
import 'eliminar_confirmacon_categoria_widget.dart'
    show EliminarConfirmaconCategoriaWidget;
import 'package:flutter/material.dart';

class EliminarConfirmaconCategoriaModel
    extends FlutterFlowModel<EliminarConfirmaconCategoriaWidget> {
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
