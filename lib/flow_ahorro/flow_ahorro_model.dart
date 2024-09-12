import '/flutter_flow/flutter_flow_util.dart';
import 'flow_ahorro_widget.dart' show FlowAhorroWidget;
import 'package:flutter/material.dart';

class FlowAhorroModel extends FlutterFlowModel<FlowAhorroWidget> {
  ///  Local state fields for this page.

  List<String> categoriasFiltro = [];
  void addToCategoriasFiltro(String item) => categoriasFiltro.add(item);
  void removeFromCategoriasFiltro(String item) => categoriasFiltro.remove(item);
  void removeAtIndexFromCategoriasFiltro(int index) =>
      categoriasFiltro.removeAt(index);
  void insertAtIndexInCategoriasFiltro(int index, String item) =>
      categoriasFiltro.insert(index, item);
  void updateCategoriasFiltroAtIndex(int index, Function(String) updateFn) =>
      categoriasFiltro[index] = updateFn(categoriasFiltro[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for setMonto widget.
  FocusNode? setMontoFocusNode;
  TextEditingController? setMontoTextController;
  String? Function(BuildContext, String?)? setMontoTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    setMontoFocusNode?.dispose();
    setMontoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
