import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_result_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateYearBookModel extends FlutterFlowModel {
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

  List<String> yearList = [];
  void addToYearList(String item) => yearList.add(item);
  void removeFromYearList(String item) => yearList.remove(item);
  void removeAtIndexFromYearList(int index) => yearList.removeAt(index);
  void updateYearListAtIndex(int index, Function(String) updateFn) =>
      yearList[index] = updateFn(yearList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - generateYears] action in CreateYearBook widget.
  List<String>? years;
  // State field(s) for yearBookTitleTextField widget.
  TextEditingController? yearBookTitleTextFieldController;
  String? Function(BuildContext, String?)?
      yearBookTitleTextFieldControllerValidator;
  String? _yearBookTitleTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ceomipr4' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for yearGraduatedDropdown widget.
  String? yearGraduatedDropdownValue;
  FormFieldController<String>? yearGraduatedDropdownValueController;
  // Stores action output result for [Custom Action - stringToInt] action in yearGraduatedDropdown widget.
  int? convertedYear;
  // State field(s) for sectionDropdown widget.
  String? sectionDropdownValue;
  FormFieldController<String>? sectionDropdownValueController;
  // Stores action output result for [Custom Action - getSectionReferenceByName] action in sectionDropdown widget.
  DocumentReference? sectionActionOutput;
  // State field(s) for courseDropdown widget.
  String? courseDropdownValue;
  FormFieldController<String>? courseDropdownValueController;
  // Stores action output result for [Custom Action - getCourseReferenceByName] action in courseDropdown widget.
  DocumentReference? courseActionOutput;
  // Stores action output result for [Custom Action - getFilteredStudentList] action in Button widget.
  List<DocumentReference>? filteredStudent;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    yearBookTitleTextFieldControllerValidator =
        _yearBookTitleTextFieldControllerValidator;
  }

  void dispose() {
    yearBookTitleTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
