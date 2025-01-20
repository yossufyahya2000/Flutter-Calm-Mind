import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowWebView(
                content:
                    '<!DOCTYPE html>\n<html>\n<head>\n  <title>Stripe Payment</title>\n  <script src=\"https://js.stripe.com/v3/\"></script>\n</head>\n<body>\n  <button id=\"payment-button\">Pay Now</button>\n  <script>\n    const stripe = Stripe(\'your_stripe_publishable_key\');\n\n    document.getElementById(\'payment-button\').addEventListener(\'click\', async () => {\n      const { error } = await stripe.confirmPayment({\n        clientSecret: \'{{CLIENT_SECRET}}\',\n        elementsOptions: {\n          layout: \'tabs\',\n        },\n      });\n\n      if (error) {\n        alert(error.message);\n      } else {\n        window.flutter_inappwebview.callHandler(\'paymentSuccess\');\n      }\n    });\n  </script>\n</body>\n</html>',
                height: 500.0,
                verticalScroll: false,
                horizontalScroll: false,
                html: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
