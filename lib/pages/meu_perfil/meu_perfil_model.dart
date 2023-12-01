import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/request_manager.dart';

import 'meu_perfil_widget.dart' show MeuPerfilWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MeuPerfilModel extends FlutterFlowModel<MeuPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  final textFieldMask = MaskTextInputFormatter(mask: '(##) # ####-####');
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Query cache managers for this widget.

  final _usuariosdadosManager = FutureRequestManager<List<UsuariosRow>>();
  Future<List<UsuariosRow>> usuariosdados({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsuariosRow>> Function() requestFn,
  }) =>
      _usuariosdadosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsuariosdadosCache() => _usuariosdadosManager.clear();
  void clearUsuariosdadosCacheKey(String? uniqueKey) =>
      _usuariosdadosManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    navBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearUsuariosdadosCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
