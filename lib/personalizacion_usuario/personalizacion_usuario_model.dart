import '/flutter_flow/flutter_flow_util.dart';
import 'personalizacion_usuario_widget.dart' show PersonalizacionUsuarioWidget;
import 'package:flutter/material.dart';

class PersonalizacionUsuarioModel
    extends FlutterFlowModel<PersonalizacionUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
