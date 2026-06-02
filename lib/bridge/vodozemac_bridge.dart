// Bridge that pretends to be Vodozemac but uses Olm on web
// This file replaces the real Vodozemac on web platform

import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:js_util' as js_util;
import 'package:flutter/foundation.dart';

// This is the main bridge class
class VodozemacBridge {
  static bool _initialized = false;
  
  // Called by the app to start encryption
  static Future<void> init({String? wasmPath}) async {
    if (_initialized) return;
    
    if (!kIsWeb) {
      // Not on web - use real Vodozemac
      throw Exception("Bridge only works on web");
    }
    
    print("🌉 VodozemacBridge: Starting Olm instead of Vodozemac");
    
    // Load Olm from the assets folder
    await _loadOlm();
    
    _initialized = true;
    print("🌉 VodozemacBridge: Olm is ready!");
  }
  
  static Future<void> _loadOlm() async {
    // Wait for Olm to be available
    int attempts = 0;
    while (attempts < 50) {
      if (js.context.hasProperty('Olm')) {
        // Initialize Olm
        js.context.callMethod('Olm', []);
        js.context['Olm'].callMethod('init');
        return;
      }
      await Future.delayed(Duration(milliseconds: 100));
      attempts++;
    }
    throw Exception("Olm failed to load - check if olm.js is in assets/olm/");
  }
  
  static bool isInitialized() => _initialized;
  
  // Pretend to create an Olm account (returns a fake account ID)
  static String createAccount() {
    _checkInit();
    // Create a new Olm account
    var account = js.context['Olm']['Account']();
    var fingerprint = js_util.getProperty<String>(account, 'fingerprint');
    return fingerprint ?? "account_${DateTime.now().millisecondsSinceEpoch}";
  }
  
  static void _checkInit() {
    if (!_initialized) {
      throw Exception("VodozemacBridge not initialized. Call init() first.");
    }
  }
}

// This is the fake vodozemac object that replaces the real one
final vod = VodozemacBridge();

