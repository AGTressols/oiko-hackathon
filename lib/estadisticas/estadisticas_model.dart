import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'estadisticas_widget.dart' show EstadisticasWidget;
import 'package:flutter/material.dart';

class EstadisticasModel extends FlutterFlowModel<EstadisticasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for dropdownetiquetas widget.
  String? dropdownetiquetasValue;
  FormFieldController<String>? dropdownetiquetasValueController;
  // State field(s) for categoriashistorico widget.
  String? categoriashistoricoValue;
  FormFieldController<String>? categoriashistoricoValueController;
  // State field(s) for etiquetashistorico widget.
  String? etiquetashistoricoValue;
  FormFieldController<String>? etiquetashistoricoValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
