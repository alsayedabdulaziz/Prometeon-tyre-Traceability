import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  String loginstatus = 'false';

  String scannerStatus = 'disconnected';

  String serverStatus = 'disconnected';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getstatus] action in Login widget.
  String? getStatusResponse;
  // Stores action output result for [Backend Call - API (Ping)] action in Login widget.
  ApiCallResponse? pingResponse;
  // Stores action output result for [Backend Call - API (Ping)] action in ServerStatus widget.
  ApiCallResponse? pingResponse2;
  // Stores action output result for [Custom Action - getstatus] action in RFIDStatus widget.
  String? getStatusResponse2;
  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - API (LogInRequest)] action in Button widget.
  ApiCallResponse? logInRequestResponse;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
