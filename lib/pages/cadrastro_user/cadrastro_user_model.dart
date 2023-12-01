import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cadrastro_user_widget.dart' show CadrastroUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadrastroUserModel extends FlutterFlowModel<CadrastroUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode1;
  TextEditingController? textFieldNomeController1;
  String? Function(BuildContext, String?)? textFieldNomeController1Validator;
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode2;
  TextEditingController? textFieldNomeController2;
  String? Function(BuildContext, String?)? textFieldNomeController2Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailController;
  String? Function(BuildContext, String?)? textFieldEmailControllerValidator;
  // State field(s) for TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode;
  TextEditingController? textFieldSenhaController;
  late bool textFieldSenhaVisibility;
  String? Function(BuildContext, String?)? textFieldSenhaControllerValidator;
  // State field(s) for TextFieldConfirmarSenha widget.
  FocusNode? textFieldConfirmarSenhaFocusNode;
  TextEditingController? textFieldConfirmarSenhaController;
  late bool textFieldConfirmarSenhaVisibility;
  String? Function(BuildContext, String?)?
      textFieldConfirmarSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldSenhaVisibility = false;
    textFieldConfirmarSenhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldNomeFocusNode1?.dispose();
    textFieldNomeController1?.dispose();

    textFieldNomeFocusNode2?.dispose();
    textFieldNomeController2?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailController?.dispose();

    textFieldSenhaFocusNode?.dispose();
    textFieldSenhaController?.dispose();

    textFieldConfirmarSenhaFocusNode?.dispose();
    textFieldConfirmarSenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
