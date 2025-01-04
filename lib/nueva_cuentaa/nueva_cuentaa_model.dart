import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_cuentaa_widget.dart' show NuevaCuentaaWidget;
import 'package:flutter/material.dart';

class NuevaCuentaaModel extends FlutterFlowModel<NuevaCuentaaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for esAhorro widget.
  bool? esAhorroValue;
  // State field(s) for moneda widget.
  String? monedaValue;
  FormFieldController<String>? monedaValueController;
  // State field(s) for saldoInicial widget.
  FocusNode? saldoInicialFocusNode;
  TextEditingController? saldoInicialTextController;
  String? Function(BuildContext, String?)? saldoInicialTextControllerValidator;
  // State field(s) for tipoDeCambio widget.
  FocusNode? tipoDeCambioFocusNode;
  TextEditingController? tipoDeCambioTextController;
  String? Function(BuildContext, String?)? tipoDeCambioTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CuentasRecord? ahorroDivisaSaldo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CuentasRecord? ahorroArsSaldo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CuentasRecord? ahorroDivisa;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CuentasRecord? pesosSinSaldo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CuentasRecord? noAhorro;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    saldoInicialFocusNode?.dispose();
    saldoInicialTextController?.dispose();

    tipoDeCambioFocusNode?.dispose();
    tipoDeCambioTextController?.dispose();
  }
}
