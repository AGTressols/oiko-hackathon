import '/flutter_flow/flutter_flow_util.dart';
import 'nueva_etiqueta_nueva_categoria_widget.dart'
    show NuevaEtiquetaNuevaCategoriaWidget;
import 'package:flutter/material.dart';

class NuevaEtiquetaNuevaCategoriaModel
    extends FlutterFlowModel<NuevaEtiquetaNuevaCategoriaWidget> {
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
