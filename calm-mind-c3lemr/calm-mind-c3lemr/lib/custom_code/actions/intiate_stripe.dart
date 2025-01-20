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

import 'package:flutter_stripe/flutter_stripe.dart';

Future intiateStripe() async {
  Stripe.publishableKey =
      "pk_test_51PTVnz04D1fiiyEW5gwbjg0EEpsAmTqwWAkPzYI5DmvYSDOhIm4HTcbznoK8DLUbeoBz1mabV1xRgw2vFOCIL8sr00oJsY5k4f";
}
