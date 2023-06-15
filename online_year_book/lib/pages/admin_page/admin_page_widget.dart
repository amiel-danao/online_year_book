import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'admin_page_model.dart';
export 'admin_page_model.dart';

class AdminPageWidget extends StatefulWidget {
  const AdminPageWidget({Key? key}) : super(key: key);

  @override
  _AdminPageWidgetState createState() => _AdminPageWidgetState();
}

class _AdminPageWidgetState extends State<AdminPageWidget>
    with TickerProviderStateMixin {
  late AdminPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AdminPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADMIN_PAGE_PAGE_AdminPage_ON_INIT_STATE');
      _model.isAdmin = await actions.checkIfAdmin(
        currentUserUid,
      );
      if (_model.isAdmin != true) {
        context.pushNamed('YearBooksPage');

        return;
      } else {
        return;
      }
    });

    _model.searchFieldController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: !isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  FFLocalizations.of(context).getText(
                    'fcyoodds' /* Customers */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall,
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              wrapWithModel(
                model: _model.webNavModel,
                updateCallback: () => setState(() {}),
                child: WebNavWidget(
                  iconOne: Icon(
                    Icons.dashboard_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  iconTwo: Icon(
                    Icons.group,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  iconThree: Icon(
                    Icons.menu_book,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  iconFour: Icon(
                    Icons.account_circle,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  colorBgOne: FlutterFlowTheme.of(context).secondaryBackground,
                  colorBgTwo: FlutterFlowTheme.of(context).primaryBackground,
                  colorBgThree:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  colorBgFour: FlutterFlowTheme.of(context).secondaryBackground,
                  textOne: FlutterFlowTheme.of(context).secondaryText,
                  textTwo: FlutterFlowTheme.of(context).primary,
                  textThree: FlutterFlowTheme.of(context).secondaryText,
                  textFour: FlutterFlowTheme.of(context).secondaryText,
                  iconFive: Icon(
                    Icons.reduce_capacity,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  colorBgFive: FlutterFlowTheme.of(context).secondaryBackground,
                  textFive: FlutterFlowTheme.of(context).secondaryText,
                  iconSix: Icon(
                    Icons.panorama_photosphere_select,
                  ),
                  iconSeven: Icon(
                    Icons.golf_course,
                  ),
                ),
              ),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 1.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 16.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'vhzpchl9' /* Admins */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 24.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADMIN_search_rounded_ICN_ON_TAP');

                                    context.pushNamed(
                                      'searchPage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                          duration: Duration(milliseconds: 250),
                                        ),
                                      },
                                    );
                                  },
                                ),
                              ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ADMIN_PAGE_PAGE_NEW_ADMIN_BTN_ON_TAP');

                                context.pushNamed(
                                  'CreateAdmin',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '5z27n8vy' /* New Admin */,
                              ),
                              icon: Icon(
                                Icons.add,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 16.0, 8.0),
                              child: TextFormField(
                                controller: _model.searchFieldController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchFieldController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    logFirebaseEvent(
                                        'ADMIN_searchField_ON_TEXTFIELD_CHANGE');
                                    setState(() {
                                      _model.filterUsername =
                                          _model.searchFieldController.text;
                                    });
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'chpydjbm' /* Search for admin... */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 20.0, 12.0),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.searchFieldControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Container(
                        width: double.infinity,
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 44.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x1F000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'rcwp8lni' /* Email */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'dia1avfi' /* Username */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'zzys2jjp' /* Date created */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'e0cpxjda' /* Action */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: PagedListView<
                                      DocumentSnapshot<Object?>?, UsersRecord>(
                                    pagingController: () {
                                      final Query<Object?> Function(
                                              Query<Object?>) queryBuilder =
                                          (usersRecord) => usersRecord
                                              .where('isAdmin', isEqualTo: true)
                                              .where('display_name',
                                                  isEqualTo: _model
                                                              .filterUsername !=
                                                          ''
                                                      ? _model.filterUsername
                                                      : null);
                                      if (_model.pagingController != null) {
                                        final query = queryBuilder(
                                            UsersRecord.collection);
                                        if (query != _model.pagingQuery) {
                                          // The query has changed
                                          _model.pagingQuery = query;
                                          _model.streamSubscriptions
                                              .forEach((s) => s?.cancel());
                                          _model.streamSubscriptions.clear();
                                          _model.pagingController!.refresh();
                                        }
                                        return _model.pagingController!;
                                      }

                                      _model.pagingController =
                                          PagingController(firstPageKey: null);
                                      _model.pagingQuery =
                                          queryBuilder(UsersRecord.collection);
                                      _model.pagingController!
                                          .addPageRequestListener(
                                              (nextPageMarker) {
                                        queryUsersRecordPage(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord
                                                  .where('isAdmin',
                                                      isEqualTo: true)
                                                  .where('display_name',
                                                      isEqualTo:
                                                          _model.filterUsername !=
                                                                  ''
                                                              ? _model
                                                                  .filterUsername
                                                              : null),
                                          nextPageMarker: nextPageMarker,
                                          pageSize: 25,
                                          isStream: true,
                                        ).then((page) {
                                          _model.pagingController!.appendPage(
                                            page.data,
                                            page.nextPageMarker,
                                          );
                                          final streamSubscription =
                                              page.dataStream?.listen((data) {
                                            data.forEach((item) {
                                              final itemIndexes = _model
                                                  .pagingController!.itemList!
                                                  .asMap()
                                                  .map((k, v) => MapEntry(
                                                      v.reference.id, k));
                                              final index = itemIndexes[
                                                  item.reference.id];
                                              final items = _model
                                                  .pagingController!.itemList!;
                                              if (index != null) {
                                                items.replaceRange(
                                                    index, index + 1, [item]);
                                                _model.pagingController!
                                                    .itemList = {
                                                  for (var item in items)
                                                    item.reference: item
                                                }.values.toList();
                                              }
                                            });
                                            setState(() {});
                                          });
                                          _model.streamSubscriptions
                                              .add(streamSubscription);
                                        });
                                      });
                                      return _model.pagingController!;
                                    }(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate:
                                        PagedChildBuilderDelegate<UsersRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                          ),
                                        ),
                                      ),

                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewUsersRecord = _model
                                            .pagingController!
                                            .itemList![listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewUsersRecord
                                                                    .photoUrl,
                                                                'https://firebasestorage.googleapis.com/v0/b/online-year-book.appspot.com/o/OYG%20LOGO.png?alt=media&token=ad86d63c-396e-4455-991c-3436ea5507a9&_gl=1*1qrxbb6*_ga*NzAzNzIxMjgwLjE2ODQzOTA2OTY.*_ga_CW55HF8NVT*MTY4NjQ4NDA4OS45MC4xLjE2ODY0ODQxNzMuMC4wLjA.',
                                                              ),
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AutoSizeText(
                                                                listViewUsersRecord
                                                                    .email
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 32,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                tabletLandscape:
                                                                    false,
                                                                desktop: false,
                                                              ))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'g9q5ppgd' /* user@domainname.com */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'yMMMd',
                                                        listViewUsersRecord
                                                            .createdTime!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'ADMIN_PAGE_PAGE_editAdmintButton_ON_TAP');

                                                              context.pushNamed(
                                                                'CreateAdmin',
                                                                queryParameters:
                                                                    {
                                                                  'adminToEdit':
                                                                      serializeParam(
                                                                    listViewUsersRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'adminToEdit':
                                                                      listViewUsersRecord,
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'bbpctf3o' /* Edit */,
                                                            ),
                                                            icon: Icon(
                                                              Icons.edit,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                        if (listViewUsersRecord
                                                                .email !=
                                                            currentUserEmail)
                                                          Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ADMIN_PAGE_PAGE_DELETE_BTN_ON_TAP');
                                                                var _shouldSetState =
                                                                    false;
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Confirm delete'),
                                                                              content: Text(valueOrDefault<String>(
                                                                                'Are you sure you want to delete this admin?${'${listViewUsersRecord.displayName}'}',
                                                                                'Are you sure you want to delete this student?',
                                                                              )),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Confirm'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  _model.deleteAdminResult =
                                                                      await actions
                                                                          .deleteAdminAccount(
                                                                    listViewUsersRecord
                                                                        .reference,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if (_model
                                                                          .deleteAdminResult ==
                                                                      'Success') {
                                                                    await listViewUsersRecord
                                                                        .reference
                                                                        .delete();
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .clearSnackBars();
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Admin was deleted successfully',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            Colors.black,
                                                                      ),
                                                                    );

                                                                    context.goNamed(
                                                                        'AdminPage');

                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Error'),
                                                                          content:
                                                                              Text(_model.deleteAdminResult!),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'vlqvasmh' /* Delete */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .delete_forever,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 100.0,
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
