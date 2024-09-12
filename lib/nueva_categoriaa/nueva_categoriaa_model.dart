import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_categoriaa_widget.dart' show NuevaCategoriaaWidget;
import 'package:flutter/material.dart';

class NuevaCategoriaaModel extends FlutterFlowModel<NuevaCategoriaaWidget> {
  ///  Local state fields for this page.

  String imagenCategoria =
      'gs://oiko-oficial-45p72k.appspot.com/cms_uploads/iconosCategorias/A75D416B-719F-49CC-8C64-8F539CD2BFD1.png';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoriasRecord? nuevaCategoria;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
