import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class StudentsPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? searchText;

  DocumentReference? selectedCourse;

  int? selectedYear;

  bool showList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // State field(s) for courseDropDown widget.
  String? courseDropDownValue;
  FormFieldController<String>? courseDropDownValueController;
  // State field(s) for schoolYearDropDown widget.
  String? schoolYearDropDownValue;
  FormFieldController<String>? schoolYearDropDownValueController;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, StudentsRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  // Stores action output result for [Custom Action - deleteStudentAccount] action in Button widget.
  bool? deleteStudentResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    searchFieldController?.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
