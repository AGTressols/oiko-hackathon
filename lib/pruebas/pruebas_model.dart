import '/flutter_flow/flutter_flow_util.dart';
import 'pruebas_widget.dart' show PruebasWidget;
import 'package:flutter/material.dart';

class PruebasModel extends FlutterFlowModel<PruebasWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
