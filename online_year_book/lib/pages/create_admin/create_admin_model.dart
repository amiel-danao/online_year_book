import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAdminModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String uploadedPhoto =
      'https://firebasestorage.googleapis.com/v0/b/online-year-book.appspot.com/o/OYG%20LOGO.png?alt=media&token=ad86d63c-396e-4455-991c-3436ea5507a9&_gl=1*kl33t4*_ga*NzAzNzIxMjgwLjE2ODQzOTA2OTY.*_ga_CW55HF8NVT*MTY4NjM3OTg1NC44Ni4xLjE2ODYzODI0ODAuMC4wLjA.';

  bool isAdminPage = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for emailEdit widget.
  TextEditingController? emailEditController;
  String? Function(BuildContext, String?)? emailEditControllerValidator;
  // State field(s) for passwordEdit widget.
  TextEditingController? passwordEditController;
  late bool passwordEditVisibility;
  String? Function(BuildContext, String?)? passwordEditControllerValidator;
  // State field(s) for passwordConfirmEdit widget.
  TextEditingController? passwordConfirmEditController;
  late bool passwordConfirmEditVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmEditControllerValidator;
  // State field(s) for userNameEdit widget.
  TextEditingController? userNameEditController;
  String? Function(BuildContext, String?)? userNameEditControllerValidator;
  // Stores action output result for [Custom Action - isAdminUserNameValid] action in Button widget.
  bool? adminUserNameValid;
  // Stores action output result for [Custom Action - createUserAccount] action in Button widget.
  String? createdUserAccount;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordEditVisibility = false;
    passwordConfirmEditVisibility = false;
  }

  void dispose() {
    emailEditController?.dispose();
    passwordEditController?.dispose();
    passwordConfirmEditController?.dispose();
    userNameEditController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
