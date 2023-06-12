import '/auth/base_auth_user_provider.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateStudentModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> courseList = [];
  void addToCourseList(String item) => courseList.add(item);
  void removeFromCourseList(String item) => courseList.remove(item);
  void removeAtIndexFromCourseList(int index) => courseList.removeAt(index);
  void updateCourseListAtIndex(int index, Function(String) updateFn) =>
      courseList[index] = updateFn(courseList[index]);

  DocumentReference? selectedSection;

  DocumentReference? selectedCourse;

  int selectedYear = 2000;

  List<String> yearList = [];
  void addToYearList(String item) => yearList.add(item);
  void removeFromYearList(String item) => yearList.remove(item);
  void removeAtIndexFromYearList(int index) => yearList.removeAt(index);
  void updateYearListAtIndex(int index, Function(String) updateFn) =>
      yearList[index] = updateFn(yearList[index]);

  List<String> sectionList = [];
  void addToSectionList(String item) => sectionList.add(item);
  void removeFromSectionList(String item) => sectionList.remove(item);
  void removeAtIndexFromSectionList(int index) => sectionList.removeAt(index);
  void updateSectionListAtIndex(int index, Function(String) updateFn) =>
      sectionList[index] = updateFn(sectionList[index]);

  String uploadedPhoto =
      'https://firebasestorage.googleapis.com/v0/b/online-year-book.appspot.com/o/OYG%20LOGO.png?alt=media&token=ad86d63c-396e-4455-991c-3436ea5507a9&_gl=1*kl33t4*_ga*NzAzNzIxMjgwLjE2ODQzOTA2OTY.*_ga_CW55HF8NVT*MTY4NjM3OTg1NC44Ni4xLjE2ODYzODI0ODAuMC4wLjA.';

  String? selectedSectionName;

  String? selectedCourseName;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - generateYears] action in CreateStudent widget.
  List<String>? years;
  // Stores action output result for [Custom Action - getAllCourses] action in CreateStudent widget.
  List<String>? allCourses;
  // Stores action output result for [Custom Action - getAllSections] action in CreateStudent widget.
  List<String>? allSections;
  // Stores action output result for [Custom Action - getSectionNameByReference] action in CreateStudent widget.
  String? defaultSectionName;
  // Stores action output result for [Custom Action - getCourseNameByReference] action in CreateStudent widget.
  String? defaultCourseName;
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
        'amyqsihx' /* Field is required */,
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
        'x109p2ky' /* Field is required */,
      );
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
        'gpnmn7tl' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for firstNameEdit widget.
  TextEditingController? firstNameEditController;
  String? Function(BuildContext, String?)? firstNameEditControllerValidator;
  String? _firstNameEditControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1ihereyj' /* Field is required */,
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
        'dkub1i8s' /* Field is required */,
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
  // Stores action output result for [Custom Action - stringToInt] action in yearGraduatedDropdown widget.
  int? convertedYear;
  // State field(s) for courseDropdown widget.
  String? courseDropdownValue;
  FormFieldController<String>? courseDropdownValueController;
  // Stores action output result for [Custom Action - getCourseReferenceByName] action in courseDropdown widget.
  DocumentReference? selectedCourseReference;
  // Stores action output result for [Custom Action - isStudentNameValid] action in Button widget.
  bool? studentNameValid;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StudentsRecord? createdStudent;

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
