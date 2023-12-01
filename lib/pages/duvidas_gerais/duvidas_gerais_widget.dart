import '/backend/supabase/supabase.dart';
import '/components/user_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'duvidas_gerais_model.dart';
export 'duvidas_gerais_model.dart';

class DuvidasGeraisWidget extends StatefulWidget {
  const DuvidasGeraisWidget({Key? key}) : super(key: key);

  @override
  _DuvidasGeraisWidgetState createState() => _DuvidasGeraisWidgetState();
}

class _DuvidasGeraisWidgetState extends State<DuvidasGeraisWidget> {
  late DuvidasGeraisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DuvidasGeraisModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().StatusNavBar = 1;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF835EFF),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed(
                'Home',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            'Dúvidas Gerais',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: wrapWithModel(
                      model: _model.userModel,
                      updateCallback: () => setState(() {}),
                      child: UserWidget(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 5.0),
                      child: FutureBuilder<List<DuvidasGeraisRow>>(
                        future: FFAppState()
                            .duvidasbanco(
                          requestFn: () => DuvidasGeraisTable().queryRows(
                            queryFn: (q) => q.order('titulo', ascending: true),
                          ),
                        )
                            .then((result) {
                          _model.requestCompleted = true;
                          return result;
                        }),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<DuvidasGeraisRow> listViewDuvidasGeraisRowList =
                              snapshot.data!;
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewDuvidasGeraisRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewDuvidasGeraisRow =
                                  listViewDuvidasGeraisRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    listViewDuvidasGeraisRow
                                                        .titulo,
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (listViewDuvidasGeraisRow
                                                    .status ==
                                                true)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await DuvidasGeraisTable()
                                                      .update(
                                                    data: {
                                                      'status': false,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      listViewDuvidasGeraisRow
                                                          .id,
                                                    ),
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                        .clearDuvidasbancoCache();
                                                    _model.requestCompleted =
                                                        false;
                                                  });
                                                  await _model
                                                      .waitForRequestCompleted(
                                                          minWait: 200,
                                                          maxWait: 200);
                                                },
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_up_rounded,
                                                  color: Color(0xFF291F88),
                                                  size: 40.0,
                                                ),
                                              ),
                                            if (listViewDuvidasGeraisRow
                                                    .status ==
                                                false)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await DuvidasGeraisTable()
                                                      .update(
                                                    data: {
                                                      'status': true,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      listViewDuvidasGeraisRow
                                                          .id,
                                                    ),
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                        .clearDuvidasbancoCache();
                                                    _model.requestCompleted =
                                                        false;
                                                  });
                                                  await _model
                                                      .waitForRequestCompleted(
                                                          minWait: 200,
                                                          maxWait: 200);
                                                },
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: Color(0xFF291F88),
                                                  size: 40.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (listViewDuvidasGeraisRow.status ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 15.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewDuvidasGeraisRow
                                                  .informacao,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
