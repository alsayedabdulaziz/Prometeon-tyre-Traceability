import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'location_detection_model.dart';
export 'location_detection_model.dart';

class LocationDetectionWidget extends StatefulWidget {
  const LocationDetectionWidget({super.key});

  @override
  State<LocationDetectionWidget> createState() =>
      _LocationDetectionWidgetState();
}

class _LocationDetectionWidgetState extends State<LocationDetectionWidget> {
  late LocationDetectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationDetectionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.rFIDConnectAction();
      _model.getstatusresponse2 = await actions.getstatus();
      _model.readerstatus = _model.getstatusresponse2!;
      safeSetState(() {});
    });

    _model.scanthebarcodeTextController ??= TextEditingController();
    _model.scanthebarcodeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFBFBFB),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color(0xFF21196B),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Back',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'RFID Tracking',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                child: TextFormField(
                  controller: _model.scanthebarcodeTextController,
                  focusNode: _model.scanthebarcodeFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Enter Tag ID',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.barcode_reader,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                  validator: _model.scanthebarcodeTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            _model.getstatusResponse =
                                await actions.getstatus();
                            if (_model.getstatusResponse == 'Connected') {
                              _model.trackingstatus = 'Tracking Started';
                              safeSetState(() {});
                              await actions.trackAction(
                                true,
                                _model.scanthebarcodeTextController.text,
                              );
                              _model.instantTimer = InstantTimer.periodic(
                                duration: Duration(milliseconds: 10),
                                callback: (timer) async {
                                  _model.newReadActionResponse =
                                      await actions.newReadAction(
                                    false,
                                  );
                                  FFAppState().RFIDTagsList = _model
                                      .newReadActionResponse!
                                      .toList()
                                      .cast<RFIDDateStruct>();
                                  safeSetState(() {});
                                },
                                startImmediately: true,
                              );
                            } else {
                              await actions.rFIDConnectAction();
                            }

                            safeSetState(() {});
                          },
                          text: 'Start',
                          options: FFButtonOptions(
                            width: 75.0,
                            height: 70.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            _model.trackingstatus = 'Tracking Stopped';
                            safeSetState(() {});
                            await actions.trackAction(
                              false,
                              '--',
                            );
                            _model.instantTimer?.cancel();
                          },
                          text: 'Stop',
                          options: FFButtonOptions(
                            width: 75.0,
                            height: 70.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .around(SizedBox(height: 10.0)),
                    ),
                  ].divide(SizedBox(width: 5.0)),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            _model.trackingstatus,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 70.0, 10.0, 0.0),
                            child: LinearPercentIndicator(
                              percent: FFAppState()
                                  .RFIDTagsList
                                  .first
                                  .rssi
                                  .toDouble(),
                              width: 300.0,
                              lineHeight: 30.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
