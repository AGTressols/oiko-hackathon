
class ObtenerTransaccionesResueltasCloudFunctionCallResponse {
  ObtenerTransaccionesResueltasCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  List<dynamic>? data;
}
