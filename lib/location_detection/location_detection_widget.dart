import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      await actions.setMode(
        false,
      );
      await Future.wait([
        Future(() async {
          _model.instantTimer = InstantTimer.periodic(
            duration: const Duration(milliseconds: 1000),
            callback: (timer) async {
              if (_model.tagID != '-') {
                if (!_model.rfidmodeset) {
                  _model.rfidmodeset = true;
                  safeSetState(() {});
                  await actions.setMode(
                    true,
                  );
                }
              } else {
                if (!_model.barcodemodeset) {
                  _model.barcodemodeset = true;
                  safeSetState(() {});
                  await actions.setMode(
                    false,
                  );
                }
                _model.readBarcodeActionResponse =
                    await actions.readBarcodeAction(
                  false,
                );
                FFAppState().ScannedBarcode = _model.readBarcodeActionResponse!;
                safeSetState(() {});
                _model.barcode = FFAppState().ScannedBarcode.barcode;
                safeSetState(() {});
                if (_model.barcode != null && _model.barcode != '') {
                  _model.getBarcodeDataReponse = await GetBarcodeDataCall.call(
                    barcode: _model.barcode,
                  );

                  if ((_model.getBarcodeDataReponse?.succeeded ?? true)) {
                    _model.tagID = GetBarcodeDataCall.epc(
                      (_model.getBarcodeDataReponse?.jsonBody ?? ''),
                    )!;
                    safeSetState(() {});
                    safeSetState(() {
                      _model.tagIDInputFieldTextController?.text =
                          _model.barcode!;
                      _model.tagIDInputFieldTextController?.selection =
                          TextSelection.collapsed(
                              offset: _model
                                  .tagIDInputFieldTextController!.text.length);
                    });
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('Press Start To Track'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              }
            },
            startImmediately: true,
          );
        }),
      ]);
    });

    _model.tagIDInputFieldTextController ??= TextEditingController();
    _model.tagIDInputFieldFocusNode ??= FocusNode();
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
        backgroundColor: const Color(0xFFFBFBFB),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: const Color(0xFF21196B),
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: const Icon(
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                  child: TextFormField(
                    controller: _model.tagIDInputFieldTextController,
                    focusNode: _model.tagIDInputFieldFocusNode,
                    onFieldSubmitted: (_) async {
                      _model.getEPCDataResponse = await GetBarcodeDataCall.call(
                        barcode: _model.tagIDInputFieldTextController.text,
                      );

                      if ((_model.getEPCDataResponse?.succeeded ?? true)) {
                        _model.tagID = GetBarcodeDataCall.epc(
                          (_model.getEPCDataResponse?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Success'),
                              content:
                                  const Text('Please Press Start to Begin Tracking'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      safeSetState(() {});
                    },
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Scan Barcode',
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
                      prefixIcon: const Icon(
                        Icons.barcode_reader,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                    validator: _model.tagIDInputFieldTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              _model.getstatusResponse =
                                  await actions.getstatus();
                              if (_model.getstatusResponse == 'Connected') {
                                if (_model.tagIDInputFieldTextController.text !=
                                        '') {
                                  _model.trackingstatus = 'Tracking Started';
                                  safeSetState(() {});
                                  await actions.trackAction(
                                    true,
                                    _model.tagID,
                                  );
                                  _model.instantTimer2 = InstantTimer.periodic(
                                    duration: const Duration(milliseconds: 10),
                                    callback: (timer) async {
                                      _model.newReadActionResponse =
                                          await actions.newReadAction(
                                        false,
                                        -70.0,
                                      );
                                      FFAppState().RFIDTagsList = _model
                                          .newReadActionResponse!
                                          .toList()
                                          .cast<RFIDDateStruct>();
                                      safeSetState(() {});
                                      if (functions.isTagsListNotEmpty(
                                          FFAppState().RFIDTagsList.toList())) {
                                        _model.trackedTag =
                                            await actions.getFirst(
                                          FFAppState().RFIDTagsList.toList(),
                                        );
                                        _model.rssi =
                                            functions.progressBarCalculator(
                                                _model.trackedTag!.rssi);
                                        safeSetState(() {});
                                      } else {
                                        _model.rssi = 0.0;
                                        safeSetState(() {});
                                      }
                                    },
                                    startImmediately: true,
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text(
                                            'Please Scan Barcode First To Track'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                await actions.rFIDConnectAction();
                              }

                              safeSetState(() {});
                            },
                            text: 'Start',
                            options: FFButtonOptions(
                              width: 75.0,
                              height: 70.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                              _model.barcodemodeset = false;
                              _model.rfidmodeset = false;
                              _model.barcode = '-';
                              _model.tagID = '-';
                              safeSetState(() {});
                              FFAppState().ScannedBarcode = BarcodeDataStruct();
                              FFAppState().RFIDTagsList = [];
                              safeSetState(() {});
                              safeSetState(() {
                                _model.tagIDInputFieldTextController?.clear();
                              });
                              await actions.trackAction(
                                false,
                                '--',
                              );
                              _model.instantTimer2?.cancel();
                            },
                            text: 'Stop',
                            options: FFButtonOptions(
                              width: 75.0,
                              height: 70.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(height: 10.0))
                            .around(const SizedBox(height: 10.0)),
                      ),
                    ].divide(const SizedBox(width: 5.0)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _model.trackingstatus,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Container(
                        width: 320.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: LinearPercentIndicator(
                            percent: _model.rssi,
                            width: 300.0,
                            lineHeight: 30.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
