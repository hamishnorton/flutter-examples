import 'dart:js';

class JavaScript {
  static void callJavaScript(String message) {
    //context.callMethod('alert', [message]);
    context.callMethod('calledFromDart', [message]);
  }

  static String calledFromDartWithReturn() {
    return context.callMethod('calledFromDartWithReturn');
  }

  static Future<String> calledFromDartReturnAfterDelay(int delay) async {
    return await context.callMethod('calledFromDartReturnAfterDelay', [delay]);
  }
}
