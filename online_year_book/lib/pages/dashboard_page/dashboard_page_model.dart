import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int userCount = 0;

  int studentCount = 0;

  int yearBookCount = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getUsersCount] action in DashboardPage widget.
  int? fetchedUserCount;
  // Stores action output result for [Custom Action - getYearBookCount] action in DashboardPage widget.
  int? fetchedYearBookCount;
  // Stores action output result for [Custom Action - getStudentCount] action in DashboardPage widget.
  int? fetchedStudentsCount;
  // Model for webNav component.
  late WebNavModel webNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
