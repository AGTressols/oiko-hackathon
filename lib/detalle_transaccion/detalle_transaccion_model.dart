import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_transaccion_widget.dart' show DetalleTransaccionWidget;
import 'package:flutter/material.dart';

class DetalleTransaccionModel
    extends FlutterFlowModel<DetalleTransaccionWidget> {
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
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

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
