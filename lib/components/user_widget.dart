import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
export 'user_model.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late UserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsuariosRow>>(
      future: FFAppState().nomeUSer(
        requestFn: () => UsuariosTable().querySingleRow(
          queryFn: (q) => q.eq(
            'uid',
            currentUserUid,
          ),
        ),
      ),
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
        List<UsuariosRow> containerUsuariosRowList = snapshot.data!;
        final containerUsuariosRow = containerUsuariosRowList.isNotEmpty
            ? containerUsuariosRowList.first
            : null;
        return Container(
          width: double.infinity,
          height: 140.0,
          decoration: BoxDecoration(
            color: Color(0xFFDFD3FF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 35.0, 20.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Olá, ${containerUsuariosRow?.primeiroNome}',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF0D1B34),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xC6291F88),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/user_(1)_1.png',
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 55.0,
                        height: 55.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            containerUsuariosRow?.foto,
                            '0',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 122.0)),
            ),
          ),
        );
      },
    );
  }
}
