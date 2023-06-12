import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCourseModel extends FlutterFlowModel {
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
  // State field(s) for courseNameEdit widget.
  TextEditingController? courseNameEditController;
  String? Function(BuildContext, String?)? courseNameEditControllerValidator;
  String? _courseNameEditControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wbaqqytl' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for courseAbbreviationEdit widget.
  TextEditingController? courseAbbreviationEditController;
  String? Function(BuildContext, String?)?
      courseAbbreviationEditControllerValidator;
  String? _courseAbbreviationEditControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ezlxo015' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - isCourseNameTaken] action in Button widget.
  bool? courseNameTaken;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    courseNameEditControllerValidator = _courseNameEditControllerValidator;
    courseAbbreviationEditControllerValidator =
        _courseAbbreviationEditControllerValidator;
  }

  void dispose() {
    courseNameEditController?.dispose();
    courseAbbreviationEditController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
