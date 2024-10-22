import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'rssi_settings_model.dart';
export 'rssi_settings_model.dart';

class RssiSettingsWidget extends StatefulWidget {
  const RssiSettingsWidget({super.key});

  @override
  State<RssiSettingsWidget> createState() => _RssiSettingsWidgetState();
}

class _RssiSettingsWidgetState extends State<RssiSettingsWidget> {
  late RssiSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RssiSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: Text(
              'RSSI',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
        Slider(
          activeColor: FlutterFlowTheme.of(context).primary,
          inactiveColor: FlutterFlowTheme.of(context).alternate,
          min: -100.0,
          max: 0.0,
          value: _model.sliderValue ??= -52.0,
          label: _model.sliderValue?.toString(),
          divisions: 100,
          onChanged: (newValue) {
            safeSetState(() => _model.sliderValue = newValue);
          },
          onChangeEnd: (newValue) async {
            safeSetState(() => _model.sliderValue = newValue);
            FFAppState().RssiFilter = _model.sliderValue!;
            safeSetState(() {});
          },
        ),
      ],
    );
  }
}
