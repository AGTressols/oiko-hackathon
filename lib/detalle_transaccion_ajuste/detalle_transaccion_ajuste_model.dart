import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_transaccion_ajuste_widget.dart'
    show DetalleTransaccionAjusteWidget;
import 'package:flutter/material.dart';

class DetalleTransaccionAjusteModel
    extends FlutterFlowModel<DetalleTransaccionAjusteWidget> {
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
  // State field(s) for aumentarDisminuir widget.
  bool? aumentarDisminuirValue;
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
