import '/flutter_flow/flutter_flow_util.dart';
import 'cuentas_widget.dart' show CuentasWidget;
import 'package:flutter/material.dart';

class CuentasModel extends FlutterFlowModel<CuentasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
