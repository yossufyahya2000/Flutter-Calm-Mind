import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'auth_sheet_widget.dart' show AuthSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthSheetModel extends FlutterFlowModel<AuthSheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cofw3l4f' /* Please enter your email */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'nob7t76m' /* Please enter a correct email */,
      );
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1iwwt5rb' /* Please enter your password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '378t4w15' /* Please enter a password having... */,
      );
    }

    return null;
  }

  // State field(s) for CANameTextField widget.
  FocusNode? cANameTextFieldFocusNode;
  TextEditingController? cANameTextFieldTextController;
  String? Function(BuildContext, String?)?
      cANameTextFieldTextControllerValidator;
  String? _cANameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3fb482sl' /* Please enter your name */,
      );
    }

    return null;
  }

  // State field(s) for CAEmailTextField widget.
  FocusNode? cAEmailTextFieldFocusNode;
  TextEditingController? cAEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      cAEmailTextFieldTextControllerValidator;
  String? _cAEmailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6ksfaaiw' /* Please enter your email */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ucqz0ad1' /* Please enter a correct email */,
      );
    }
    return null;
  }

  // State field(s) for CAPasswordTextField widget.
  FocusNode? cAPasswordTextFieldFocusNode;
  TextEditingController? cAPasswordTextFieldTextController;
  late bool cAPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      cAPasswordTextFieldTextControllerValidator;
  String? _cAPasswordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tcafayzn' /* Please enter a password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '1o2gpbgp' /* Password should have at least ... */,
      );
    }

    return null;
  }

  // State field(s) for CAConfirmPasswordTextField widget.
  FocusNode? cAConfirmPasswordTextFieldFocusNode;
  TextEditingController? cAConfirmPasswordTextFieldTextController;
  late bool cAConfirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      cAConfirmPasswordTextFieldTextControllerValidator;
  String? _cAConfirmPasswordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dh3oorrf' /* Please confirm the password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'zx3mv395' /* Password should have at least ... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    cANameTextFieldTextControllerValidator =
        _cANameTextFieldTextControllerValidator;
    cAEmailTextFieldTextControllerValidator =
        _cAEmailTextFieldTextControllerValidator;
    cAPasswordTextFieldVisibility = false;
    cAPasswordTextFieldTextControllerValidator =
        _cAPasswordTextFieldTextControllerValidator;
    cAConfirmPasswordTextFieldVisibility = false;
    cAConfirmPasswordTextFieldTextControllerValidator =
        _cAConfirmPasswordTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    cANameTextFieldFocusNode?.dispose();
    cANameTextFieldTextController?.dispose();

    cAEmailTextFieldFocusNode?.dispose();
    cAEmailTextFieldTextController?.dispose();

    cAPasswordTextFieldFocusNode?.dispose();
    cAPasswordTextFieldTextController?.dispose();

    cAConfirmPasswordTextFieldFocusNode?.dispose();
    cAConfirmPasswordTextFieldTextController?.dispose();
  }
}
