import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStudentOldModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<CourseRecord> courseList = [];
  void addToCourseList(CourseRecord item) => courseList.add(item);
  void removeFromCourseList(CourseRecord item) => courseList.remove(item);
  void removeAtIndexFromCourseList(int index) => courseList.removeAt(index);
  void updateCourseListAtIndex(int index, Function(CourseRecord) updateFn) =>
      courseList[index] = updateFn(courseList[index]);

  DocumentReference? selectedSection;

  DocumentReference? selectedCourse;

  int selectedYear = 2000;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - generateYears] action in CreateStudentOld widget.
  List<String>? years;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for emailEdit widget.
  TextEditingController? emailEditController;
  String? Function(BuildContext, String?)? emailEditControllerValidator;
  String? _emailEditControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9qpj2n8x' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordEdit widget.
  TextEditingController? passwordEditController;
  late bool passwordEditVisibility;
  String? Function(BuildContext, String?)? passwordEditControllerValidator;
  String? _passwordEditControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zzksesyv' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for passwordConfirmEdit widget.
  TextEditingController? passwordConfirmEditController;
  late bool passwordConfirmEditVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmEditControllerValidator;
  String? _passwordConfirmEditControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7ny5dozu' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for firstNameEdit widget.
  TextEditingController? firstNameEditController;
  String? Function(BuildContext, String?)? firstNameEditControllerValidator;
  String? _firstNameEditControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '75d9m067' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for middleNameEdit widget.
  TextEditingController? middleNameEditController;
  String? Function(BuildContext, String?)? middleNameEditControllerValidator;
  // State field(s) for lastNameEdit widget.
  TextEditingController? lastNameEditController;
  String? Function(BuildContext, String?)? lastNameEditControllerValidator;
  String? _lastNameEditControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2v5zp82f' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for sectionDropdown widget.
  String? sectionDropdownValue;
  FormFieldController<String>? sectionDropdownValueController;
  // Stores action output result for [Custom Action - getSectionReferenceByName] action in sectionDropdown widget.
  DocumentReference? selectedSectionReference;
  // State field(s) for yearGraduatedDropdown widget.
  String? yearGraduatedDropdownValue;
  FormFieldController<String>? yearGraduatedDropdownValueController;
  // State field(s) for courseDropdown widget.
  String? courseDropdownValue;
  FormFieldController<String>? courseDropdownValueController;
  // Stores action output result for [Custom Action - getCourseReferenceByName] action in courseDropdown widget.
  DocumentReference? selectedCourseReference;
  // Stores action output result for [Custom Action - isStudentNameValid] action in Button widget.
  bool? studentNameValid;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailEditControllerValidator = _emailEditControllerValidator;
    passwordEditVisibility = false;
    passwordEditControllerValidator = _passwordEditControllerValidator;
    passwordConfirmEditVisibility = false;
    passwordConfirmEditControllerValidator =
        _passwordConfirmEditControllerValidator;
    firstNameEditControllerValidator = _firstNameEditControllerValidator;
    lastNameEditControllerValidator = _lastNameEditControllerValidator;
  }

  void dispose() {
    emailEditController?.dispose();
    passwordEditController?.dispose();
    passwordConfirmEditController?.dispose();
    firstNameEditController?.dispose();
    middleNameEditController?.dispose();
    lastNameEditController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
