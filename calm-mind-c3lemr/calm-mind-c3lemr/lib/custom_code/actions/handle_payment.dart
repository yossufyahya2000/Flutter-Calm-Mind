// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import './create_payment_intent.dart';

Future<void> handlePayment(
  BuildContext context,
  int amount,
) async {
  try {
    // 1. Create Payment Intent
    final clientSecret = await createPaymentIntent(amount);

    // 2. Initialize the Payment Sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Your Store Name',
        appearance: PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            primary: FlutterFlowTheme.of(context).primary,
          ),
        ),
      ),
    );

    // 3. Display the Payment Sheet
    await Stripe.instance.presentPaymentSheet();

    // 4. Handle Success
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment Successful!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    // 5. Handle Errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: ${e.toString()}'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
