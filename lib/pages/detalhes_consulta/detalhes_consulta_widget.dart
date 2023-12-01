import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalhes_consulta_model.dart';
export 'detalhes_consulta_model.dart';

class DetalhesConsultaWidget extends StatefulWidget {
  const DetalhesConsultaWidget({
    Key? key,
    required this.dadosConsulta,
  }) : super(key: key);

  final ConsultasRow? dadosConsulta;

  @override
  _DetalhesConsultaWidgetState createState() => _DetalhesConsultaWidgetState();
}

class _DetalhesConsultaWidgetState extends State<DetalhesConsultaWidget> {
  late DetalhesConsultaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesConsultaModel());

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
                'Consultas',
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
            'Consultas',
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
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: () {
                        if (widget.dadosConsulta?.status == 1) {
                          return Color(0xFFFFB900);
                        } else if (widget.dadosConsulta?.status == 2) {
                          return Color(0xFF00B146);
                        } else {
                          return Color(0xFFF51E2B);
                        }
                      }(),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            FFIcons.kcalendar1,
                            color: Color(0xE8FFFFFF),
                            size: 40.0,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat('dd/MM/yyyy',
                                      widget.dadosConsulta?.dataField),
                                  'null',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 5.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.dadosConsulta?.medico,
                                  'null',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 5.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  () {
                                    if (widget.dadosConsulta?.status == 1) {
                                      return 'Em andamento';
                                    } else if (widget.dadosConsulta?.status ==
                                        2) {
                                      return 'Finalizado';
                                    } else {
                                      return 'Cancelado';
                                    }
                                  }(),
                                  'null',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.dadosConsulta?.queixa != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Queixas:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ),
                            if (widget.dadosConsulta?.queixa != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.dadosConsulta?.queixa,
                                    'null',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            if (widget.dadosConsulta?.queixa != '')
                              Divider(
                                thickness: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                                color: Color(0xCCBCBCBC),
                              ),
                            if (widget.dadosConsulta?.procedimentoRealizado !=
                                '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Procedimentos realizados:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ),
                            if (widget.dadosConsulta?.procedimentoRealizado !=
                                '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.dadosConsulta?.procedimentoRealizado,
                                    'null',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            if (widget.dadosConsulta?.procedimentoRealizado !=
                                '')
                              Divider(
                                thickness: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                                color: Color(0xCCBCBCBC),
                              ),
                            if (widget.dadosConsulta?.anexos != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Anexos:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ),
                            if (widget.dadosConsulta?.anexos != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.dadosConsulta?.anexos,
                                    'null',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            if (widget.dadosConsulta?.anexos != '')
                              Divider(
                                thickness: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                                color: Color(0xCCBCBCBC),
                              ),
                            if (widget.dadosConsulta?.motivoCancelamento != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Motivo:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ),
                            if (widget.dadosConsulta?.motivoCancelamento != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.dadosConsulta?.motivoCancelamento,
                                    'null',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                          ],
                        ),
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
