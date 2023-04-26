import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget keyboardDismisser(
    {required BuildContext context,
    required Widget child,
    //required FocusNode focusNode,
    required TextEditingController controller}) {
  final gesture = GestureDetector(
    onTap: () {
      //focusNode.unfocus();
      controller.clear();
      FocusScope.of(context).requestFocus(FocusNode());
      // I don't know what ⬇⬇ doing
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    },
    child: child,
  );
  return gesture;
}
