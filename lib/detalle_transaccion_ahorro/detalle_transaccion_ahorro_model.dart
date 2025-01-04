import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_transaccion_ahorro_widget.dart'
    show DetalleTransaccionAhorroWidget;
import 'package:flutter/material.dart';

class DetalleTransaccionAhorroModel
    extends FlutterFlowModel<DetalleTransaccionAhorroWidget> {
  ///  Local state fields for this page.

  List<String> movimiento = [];
  void addToMovimiento(String item) => movimiento.add(item);
  void removeFromMovimiento(String item) => movimiento.remove(item);
  void removeAtIndexFromMovimiento(int index) => movimiento.removeAt(index);
  void insertAtIndexInMovimiento(int index, String item) =>
      movimiento.insert(index, item);
  void updateMovimientoAtIndex(int index, Function(String) updateFn) =>
      movimiento[index] = updateFn(movimiento[index]);

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for monto widget.
  FocusNode? montoFocusNode;
  TextEditingController? montoTextController;
  String? Function(BuildContext, String?)? montoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    montoFocusNode?.dispose();
    montoTextController?.dispose();
  }
}
