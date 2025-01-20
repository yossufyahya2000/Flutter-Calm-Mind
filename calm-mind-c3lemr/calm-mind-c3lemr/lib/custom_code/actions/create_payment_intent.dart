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

import 'index.dart'; // Imports other custom actions

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> createPaymentIntent(int amount) async {
  final response = await http.post(
    Uri.parse('https://aichatbot-ten-henna.vercel.app/create-payment-intent'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'amount': amount,
      'currency': 'usd',
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['client_secret'];
  } else {
    throw Exception('Failed to create payment intent');
  }
}
