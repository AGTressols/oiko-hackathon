import '/components/switch_dark_light_mode_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for switchDarkLightMode component.
  late SwitchDarkLightModeModel switchDarkLightModeModel;

  @override
  void initState(BuildContext context) {
    switchDarkLightModeModel =
        createModel(context, () => SwitchDarkLightModeModel());
  }

  @override
  void dispose() {
    switchDarkLightModeModel.dispose();
  }
}
