import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'detalle_categoria_widget.dart' show DetalleCategoriaWidget;
import 'package:flutter/material.dart';

class DetalleCategoriaModel extends FlutterFlowModel<DetalleCategoriaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for presupuesto widget.
  FocusNode? presupuestoFocusNode;
  TextEditingController? presupuestoTextController;
  String? Function(BuildContext, String?)? presupuestoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    presupuestoFocusNode?.dispose();
    presupuestoTextController?.dispose();
  }
}
