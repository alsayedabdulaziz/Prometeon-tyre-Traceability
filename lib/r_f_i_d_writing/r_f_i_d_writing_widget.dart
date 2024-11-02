import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/rssi_settings_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'r_f_i_d_writing_model.dart';
export 'r_f_i_d_writing_model.dart';

class RFIDWritingWidget extends StatefulWidget {
  const RFIDWritingWidget({super.key});

  @override
  State<RFIDWritingWidget> createState() => _RFIDWritingWidgetState();
}

class _RFIDWritingWidgetState extends State<RFIDWritingWidget> {
  late RFIDWritingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RFIDWritingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().RFIDTagsList = [];
      safeSetState(() {});
      _model.scannedTag = null;
      safeSetState(() {});
      await actions.setMode(
        false,
      );
      await Future.wait([
        Future(() async {
          _model.instantTimer = InstantTimer.periodic(
            duration: const Duration(milliseconds: 1000),
            callback: (timer) async {
              if (_model.epc != '-') {
                if (!_model.rfidmodeset) {
                  _model.rfidmodeset = true;
                  safeSetState(() {});
                  await actions.setMode(
                    true,
                  );
                }
                _model.newReadActionResponse = await actions.newReadAction(
                  false,
                  FFAppState().RssiFilter,
                );
                FFAppState().RFIDTagsList = _model.newReadActionResponse!
                    .toList()
                    .cast<RFIDDateStruct>();
                safeSetState(() {});
                if (functions
                    .isTagsListNotEmpty(FFAppState().RFIDTagsList.toList())) {
                  if (FFAppState().RFIDTagsList.length > 1) {
                    _model.currentState =
                        'More Than One Tag Found, Change Rssi Value';
                    safeSetState(() {});
                    await actions.newReadAction(
                      true,
                      -52.0,
                    );
                    FFAppState().RFIDTagsList = [];
                    safeSetState(() {});
                  } else {
                    _model.firstReadTag = await actions.getFirst(
                      FFAppState().RFIDTagsList.toList(),
                    );
                    _model.scannedTag = _model.firstReadTag;
                    safeSetState(() {});
                    if (!_model.haltwritemessage) {
                      if ((_model.epc != '') &&
                          (_model.scannedTag?.epc != null &&
                              _model.scannedTag?.epc != '')) {
                        if (_model.epc == _model.scannedTag?.epc) {
                          _model.currentState = 'Check Successful';
                          _model.writingstatus = true;
                          _model.waitingforwrite = true;
                          safeSetState(() {});
                        } else {
                          _model.currentState = 'Press RFID Write to Write Tag';
                          safeSetState(() {});
                          _model.haltwritemessage = true;
                          safeSetState(() {});
                        }
                      }
                    }
                  }
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
                if (_model.barcode != '') {
                  _model.getBarcodeDataReponse = await GetBarcodeDataCall.call(
                    barcode: _model.barcode,
                  );

                  if ((_model.getBarcodeDataReponse?.succeeded ?? true)) {
                    _model.ipcode = GetBarcodeDataCall.iPCode(
                      (_model.getBarcodeDataReponse?.jsonBody ?? ''),
                    )!;
                    _model.data = GetBarcodeDataCall.data(
                      (_model.getBarcodeDataReponse?.jsonBody ?? ''),
                    )!;
                    _model.epc = GetBarcodeDataCall.epc(
                      (_model.getBarcodeDataReponse?.jsonBody ?? ''),
                    )!;
                    safeSetState(() {});
                    safeSetState(() {
                      _model.textFieldTextController?.text =
                          FFAppState().ScannedBarcode.barcode;
                      _model.textFieldTextController?.selection =
                          TextSelection.collapsed(
                              offset:
                                  _model.textFieldTextController!.text.length);
                    });
                    if (GetBarcodeDataCall.presented(
                      (_model.getBarcodeDataReponse?.jsonBody ?? ''),
                    )!) {
                      _model.currentState = 'Write Tag';
                      _model.writingstatus = false;
                      _model.waitingforwrite = false;
                      safeSetState(() {});
                    } else {
                      _model.currentState = 'RFID With No Tire';
                      _model.writingstatus = false;
                      _model.waitingforwrite = true;
                      safeSetState(() {});
                    }
                  }
                }
              }
            },
            startImmediately: true,
          );
        }),
      ]);
    });

    _model.textFieldTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: const Color(0xFF21196B),
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
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
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              145.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 0.0,
                            borderWidth: 0.0,
                            buttonSize: 40.0,
                            icon: const Icon(
                              Icons.settings_suggest,
                              color: Colors.white,
                              size: 40.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 120.0,
                                        child: RssiSettingsWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'RFID Writing',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ],
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: TextFormField(
                          controller: _model.textFieldTextController,
                          focusNode: _model.textFieldFocusNode,
                          onFieldSubmitted: (_) async {
                            await Future.wait([
                              Future(() async {
                                _model.barcode =
                                    _model.textFieldTextController.text;
                                safeSetState(() {});
                              }),
                              Future(() async {
                                if (_model.textFieldTextController.text != '') {
                                  _model.gEtBarcodeDataResponse =
                                      await GetBarcodeDataCall.call(
                                    barcode:
                                        _model.textFieldTextController.text,
                                  );

                                  if ((_model
                                          .gEtBarcodeDataResponse?.succeeded ??
                                      true)) {
                                    _model.ipcode = GetBarcodeDataCall.iPCode(
                                      (_model.gEtBarcodeDataResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!;
                                    _model.data = GetBarcodeDataCall.data(
                                      (_model.gEtBarcodeDataResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!;
                                    _model.epc = GetBarcodeDataCall.epc(
                                      (_model.gEtBarcodeDataResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!;
                                    safeSetState(() {});
                                    if (GetBarcodeDataCall.presented(
                                      (_model.gEtBarcodeDataResponse
                                              ?.jsonBody ??
                                          ''),
                                    )!) {
                                      _model.currentState = 'Scan RFID TAG';
                                      _model.writingstatus = false;
                                      _model.waitingforwrite = false;
                                      safeSetState(() {});
                                    } else {
                                      _model.currentState = 'RFID With No Tire';
                                      _model.writingstatus = false;
                                      _model.waitingforwrite = true;
                                      safeSetState(() {});
                                    }
                                  }
                                }
                              }),
                            ]);

                            safeSetState(() {});
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Enter Barcode',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                          validator: _model.textFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          safeSetState(() {
                            _model.textFieldTextController?.clear();
                          });
                          _model.scannedTag = null;
                          _model.ipcode = '-';
                          _model.data = '-';
                          _model.epc = '-';
                          _model.currentState = 'Scan Barcode';
                          _model.waitingforwrite = false;
                          _model.barcode = '-';
                          _model.barcodemodeset = false;
                          _model.rfidmodeset = false;
                          safeSetState(() {});
                          FFAppState().RFIDTagsList = [];
                          FFAppState().ScannedBarcode = BarcodeDataStruct();
                          safeSetState(() {});
                          await actions.readBarcodeAction(
                            true,
                          );
                          await actions.newReadAction(
                            true,
                            -52.0,
                          );
                          await actions.stopRead();
                        },
                        text: 'Clear',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF21196B),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 340.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/barcode.png',
                              width: 30.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                              alignment: const Alignment(0.0, -1.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'Barcode',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.textFieldTextController.text,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        _model.data,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            'IP Code',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.ipcode,
                                                '-',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: 340.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 5.0, 25.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/rfid-chip_(1).png',
                                    width: 30.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, -1.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'RFID will be written',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  _model.epc,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              Text(
                                'RFID Read',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.scannedTag?.epc,
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: _model.waitingforwrite
                          ? (_model.writingstatus
                              ? const Color(0xFF159F15)
                              : const Color(0xFFA30202))
                          : const Color(0xFF21196B),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                _model.currentState,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.textFieldTextController.text != '') {
                        await actions.writeTag(
                          _model.epc,
                          _model.scannedTag!.epc,
                        );
                        _model.oldepc = _model.scannedTag!.epc;
                        _model.newepc = _model.epc;
                        safeSetState(() {});
                        await Future.delayed(
                            const Duration(milliseconds: 2000));
                        await actions.onRead();
                        _model.newReadActionResponse2 =
                            await actions.newReadAction(
                          false,
                          -70.0,
                        );
                        FFAppState().RFIDTagsList = _model
                            .newReadActionResponse2!
                            .toList()
                            .cast<RFIDDateStruct>();
                        safeSetState(() {});
                        _model.writingStatus = await actions.getWritingStatus(
                          _model.newepc,
                          FFAppState().RFIDTagsList.toList(),
                        );
                        _model.writingstatus = _model.writingStatus!;
                        _model.waitingforwrite = true;
                        safeSetState(() {});
                        if (_model.writingstatus) {
                          _model.currentState = 'Writing On Tag Success';
                          safeSetState(() {});
                          _model.verifyInsertionResponse =
                              await VerifyEPCInsertionCall.call(
                            readEPC: _model.oldepc,
                            writtenEPC: _model.newepc,
                            iPCode: _model.ipcode,
                            machineCode: 'TestGun',
                            barcode: _model.barcode,
                          );

                          if ((_model.verifyInsertionResponse?.succeeded ??
                              true)) {
                            if (VerifyEPCInsertionCall.response(
                              (_model.verifyInsertionResponse?.jsonBody ?? ''),
                            )!) {
                              _model.currentState = 'Write Success';
                              safeSetState(() {});
                            } else {
                              _model.currentState = 'Write Fail';
                              _model.writingstatus = false;
                              safeSetState(() {});
                            }
                          }
                        } else {
                          _model.currentState = 'Writing On Tag Failed';
                          safeSetState(() {});
                        }
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('E'),
                              content: const Text('Please Enter Barcode Value'),
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
                    text: 'RFID Write',
                    options: FFButtonOptions(
                      width: 300.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF21196B),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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
