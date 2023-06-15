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
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_year_book_model.dart';
export 'create_year_book_model.dart';

class CreateYearBookWidget extends StatefulWidget {
  const CreateYearBookWidget({
    Key? key,
    this.yearBookToEdit,
  }) : super(key: key);

  final YearBooksRecord? yearBookToEdit;

  @override
  _CreateYearBookWidgetState createState() => _CreateYearBookWidgetState();
}

class _CreateYearBookWidgetState extends State<CreateYearBookWidget> {
  late CreateYearBookModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateYearBookModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateYearBook'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_YEAR_BOOK_CreateYearBook_ON_INIT_');
      _model.years = await actions.generateYears();
      setState(() {
        _model.yearList = _model.years!.toList().cast<String>();
      });
      if (widget.yearBookToEdit != null) {
        setState(() {
          _model.selectedColumns = valueOrDefault<int>(
            widget.yearBookToEdit!.columns,
            12,
          );
          _model.selectedCourse = widget.yearBookToEdit!.course;
          _model.selectedYear = widget.yearBookToEdit!.schoolYear;
          _model.selectedSection = widget.yearBookToEdit!.section;
        });
        setState(() {
          _model.yearBookTitleTextFieldController?.text =
              widget.yearBookToEdit!.title;
        });
        setState(() {
          _model.countControllerValue = valueOrDefault<int>(
            widget.yearBookToEdit!.columns,
            12,
          );
        });
        setState(() {
          _model.yearGraduatedDropdownValueController?.value =
              widget.yearBookToEdit!.schoolYear.toString();
        });
        _model.defaultSection = await actions.getSectionNameByReference(
          widget.yearBookToEdit!.section!.id,
        );
        _model.defaultCourse = await actions.getCourseNameByReference(
          widget.yearBookToEdit!.course!.id,
        );
        setState(() {
          _model.sectionDropdownValueController?.value = _model.defaultSection!;
        });
        setState(() {
          _model.courseDropdownValueController?.value = _model.defaultCourse!;
        });
        setState(() => _model.firestoreRequestCompleter = null);
        await _model.waitForFirestoreRequestCompleted();
        return;
      } else {
        return;
      }
    });

    _model.yearBookTitleTextFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_YEAR_BOOK_arrow_back_rounded_ICN_');
                                context.pop();
                              },
                            ),
                          ),
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isAdmin, false))
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CREATE_YEAR_BOOK_PAGE_SAVE_BTN_ON_TAP');
                                        var _shouldSetState = false;
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.yearGraduatedDropdownValue ==
                                            null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Invalid'),
                                                content: Text(
                                                    'Year graduated is required!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (_model.sectionDropdownValue ==
                                            null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Invalid'),
                                                content: Text(
                                                    'Section field is required'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (_model.courseDropdownValue ==
                                            null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Invalid'),
                                                content: Text(
                                                    'Course field is required'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (widget.yearBookToEdit != null) {
                                          _model.updateFilteredStudent =
                                              await actions
                                                  .getFilteredStudentList(
                                            _model.selectedSection!,
                                            _model.selectedCourse!,
                                            _model.selectedYear,
                                          );
                                          _shouldSetState = true;

                                          final yearBooksUpdateData = {
                                            ...createYearBooksRecordData(
                                              title: _model
                                                  .yearBookTitleTextFieldController
                                                  .text,
                                              course: _model.selectedCourse,
                                              schoolYear: _model.selectedYear,
                                              section: _model.selectedSection,
                                              columns: _model.selectedColumns,
                                            ),
                                            'students':
                                                _model.updateFilteredStudent,
                                          };
                                          await widget.yearBookToEdit!.reference
                                              .update(yearBooksUpdateData);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Success'),
                                                content: Text(
                                                    'Year Book was saved successfully'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          context.goNamed(
                                            'YearBooksPage',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          _model.filteredStudent = await actions
                                              .getFilteredStudentList(
                                            _model.selectedSection!,
                                            _model.selectedCourse!,
                                            _model.selectedYear,
                                          );
                                          _shouldSetState = true;

                                          final yearBooksCreateData = {
                                            ...createYearBooksRecordData(
                                              title: _model
                                                  .yearBookTitleTextFieldController
                                                  .text,
                                              section: _model.selectedSection,
                                              course: _model.selectedCourse,
                                              schoolYear: _model.selectedYear,
                                              columns: _model.selectedColumns,
                                            ),
                                            'time_posted':
                                                FieldValue.serverTimestamp(),
                                            'students': _model.filteredStudent,
                                          };
                                          await YearBooksRecord.collection
                                              .doc()
                                              .set(yearBooksCreateData);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Success'),
                                                content: Text(
                                                    'Year Book was saved successfully'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          context.goNamed(
                                            'YearBooksPage',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                              ),
                                            },
                                          );

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'kzvkk28p' /* Save */,
                                      ),
                                      icon: Icon(
                                        Icons.save,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (valueOrDefault<bool>(
                        currentUserDocument?.isAdmin, false))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            FFLocalizations.of(context).getText(
                              '7na6p6q6' /* Edit Year Book Details */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 22.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.yearBookTitleTextFieldController,
                                    autofocus: true,
                                    readOnly: valueOrDefault<bool>(
                                            currentUserDocument?.isAdmin,
                                            false) !=
                                        true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily,
                                            fontSize: () {
                                              if (MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 20.0;
                                              } else if (MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 30.0;
                                              } else if (MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 40.0;
                                              } else {
                                                return 57.0;
                                              }
                                            }(),
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily),
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '8aoxuf9l' /* Year Book Title */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily,
                                            color: Color(0xFFA8A8A8),
                                            fontSize: () {
                                              if (MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 20.0;
                                              } else if (MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 30.0;
                                              } else if (MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 40.0;
                                              } else {
                                                return 57.0;
                                              }
                                            }(),
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily),
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily,
                                          color: Colors.white,
                                          fontSize: () {
                                            if (MediaQuery.of(context)
                                                    .size
                                                    .width <
                                                kBreakpointSmall) {
                                              return 20.0;
                                            } else if (MediaQuery.of(context)
                                                    .size
                                                    .width <
                                                kBreakpointMedium) {
                                              return 30.0;
                                            } else if (MediaQuery.of(context)
                                                    .size
                                                    .width <
                                                kBreakpointLarge) {
                                              return 40.0;
                                            } else {
                                              return 57.0;
                                            }
                                          }(),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily),
                                        ),
                                    textAlign: TextAlign.center,
                                    maxLines: null,
                                    validator: _model
                                        .yearBookTitleTextFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'duazdfjy' /* Number of columns */,
                                      ),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 18.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false))
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 20.0,
                                        ),
                                        incrementIconBuilder: (enabled) =>
                                            FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 20.0,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                        count: _model.countControllerValue ??=
                                            _model.selectedColumns,
                                        updateCount: (count) async {
                                          setState(() => _model
                                              .countControllerValue = count);
                                          logFirebaseEvent(
                                              'CREATE_YEAR_BOOK_CountController_2ca2a7g');
                                          setState(() {
                                            _model.selectedColumns =
                                                _model.countControllerValue!;
                                          });
                                        },
                                        stepSize: 1,
                                        minimum: 1,
                                        maximum: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      FlutterFlowDropDown<String>(
                                    controller: _model
                                            .yearGraduatedDropdownValueController ??=
                                        FormFieldController<String>(null),
                                    options: _model.yearList,
                                    onChanged: (val) async {
                                      setState(() => _model
                                          .yearGraduatedDropdownValue = val);
                                      logFirebaseEvent(
                                          'CREATE_YEAR_BOOK_yearGraduatedDropdown_O');
                                      _model.convertedYear =
                                          await actions.stringToInt(
                                        _model.yearGraduatedDropdownValue!,
                                      );
                                      setState(() {
                                        _model.selectedYear =
                                            _model.convertedYear!;
                                      });

                                      setState(() {});
                                    },
                                    width: double.infinity,
                                    height: 56.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'yqwj6rjk' /* Select Year Graduated */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 15.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<CourseRecord>>(
                                    future: queryCourseRecordOnce(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          ),
                                        );
                                      }
                                      List<CourseRecord>
                                          courseDropdownCourseRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .courseDropdownValueController ??=
                                            FormFieldController<String>(null),
                                        options: courseDropdownCourseRecordList
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.courseDropdownValue = val);
                                          logFirebaseEvent(
                                              'CREATE_YEAR_BOOK_courseDropdown_ON_FORM_');
                                          _model.courseActionOutput =
                                              await actions
                                                  .getCourseReferenceByName(
                                            _model.courseDropdownValue!,
                                          );
                                          setState(() {
                                            _model.selectedCourse =
                                                _model.courseActionOutput;
                                          });

                                          setState(() {});
                                        },
                                        width: double.infinity,
                                        height: 56.0,
                                        searchHintTextStyle: TextStyle(),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'm1lvgo01' /* Select Course */,
                                        ),
                                        searchHintText:
                                            FFLocalizations.of(context).getText(
                                          '78e5kdps' /* search course... */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 15.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineColor,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<SectionRecord>>(
                                    future: querySectionRecordOnce(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          ),
                                        );
                                      }
                                      List<SectionRecord>
                                          sectionDropdownSectionRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .sectionDropdownValueController ??=
                                            FormFieldController<String>(null),
                                        options:
                                            sectionDropdownSectionRecordList
                                                .map((e) => e.name)
                                                .toList(),
                                        onChanged: (val) async {
                                          setState(() => _model
                                              .sectionDropdownValue = val);
                                          logFirebaseEvent(
                                              'CREATE_YEAR_BOOK_sectionDropdown_ON_FORM');
                                          _model.sectionActionOutput =
                                              await actions
                                                  .getSectionReferenceByName(
                                            _model.sectionDropdownValue!,
                                          );
                                          setState(() {
                                            _model.selectedSection =
                                                _model.sectionActionOutput;
                                          });

                                          setState(() {});
                                        },
                                        width: double.infinity,
                                        height: 56.0,
                                        searchHintTextStyle: TextStyle(),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '82fuxw4s' /* Select Section */,
                                        ),
                                        searchHintText:
                                            FFLocalizations.of(context).getText(
                                          'hr5iq91f' /* search section... */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 15.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineColor,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 1.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: FutureBuilder<List<StudentsRecord>>(
                            future: (_model.firestoreRequestCompleter ??=
                                    Completer<List<StudentsRecord>>()
                                      ..complete(queryStudentsRecordOnce(
                                        queryBuilder: (studentsRecord) =>
                                            studentsRecord
                                                .where(
                                                    'section',
                                                    isEqualTo:
                                                        _model.selectedSection)
                                                .where('year_graduated',
                                                    isEqualTo:
                                                        _model.selectedYear)
                                                .where('course',
                                                    isEqualTo:
                                                        _model.selectedCourse)
                                                .orderBy('last_name'),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  ),
                                );
                              }
                              List<StudentsRecord>
                                  studentGridViewStudentsRecordList =
                                  snapshot.data!;
                              if (studentGridViewStudentsRecordList.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: EmptyResultWidget(),
                                  ),
                                );
                              }
                              return RefreshIndicator(
                                onRefresh: () async {
                                  logFirebaseEvent(
                                      'CREATE_YEAR_BOOK_studentGridView_ON_PULL');
                                  setState(() =>
                                      _model.firestoreRequestCompleter = null);
                                  await _model
                                      .waitForFirestoreRequestCompleted();
                                },
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: valueOrDefault<int>(
                                      _model.selectedColumns,
                                      12,
                                    ),
                                    crossAxisSpacing: 24.0,
                                    mainAxisSpacing: 24.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      studentGridViewStudentsRecordList.length,
                                  itemBuilder: (context, studentGridViewIndex) {
                                    final studentGridViewStudentsRecord =
                                        studentGridViewStudentsRecordList[
                                            studentGridViewIndex];
                                    return Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  studentGridViewStudentsRecord
                                                      .photoUrl,
                                                  'https://firebasestorage.googleapis.com/v0/b/online-year-book.appspot.com/o/graduate-man-silhouette.png?alt=media&token=8c510cca-3c52-4804-bf57-6f63828120a1&_gl=1*7x9nm3*_ga*NzAzNzIxMjgwLjE2ODQzOTA2OTY.*_ga_CW55HF8NVT*MTY4NjU0NDk4My45NC4xLjE2ODY1NDY3NzguMC4wLjA.',
                                                ),
                                                width: double.infinity,
                                                height: 80.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: AutoSizeText(
                                              '${studentGridViewStudentsRecord.lastName} ${studentGridViewStudentsRecord.firstName}',
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
