import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void MessageFeedback(BuildContext context, String msg,
    {String? posBtnName, VoidCallback? posFunction,bool isCancelable = true}) {
  List<Widget> actions = [];
  if (posBtnName != null) {
    actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (posFunction != null) {
            posFunction();
          }
        },
        child: Text(posBtnName)));
  }
  showDialog(
    context: context,
    builder: (buildContext) {
      return AlertDialog(
        content: Text(msg),
        actions: actions,
      );
    },
    barrierDismissible:isCancelable
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
void loadingCircular(BuildContext context, String loadingName,
    {bool isCancelable = true}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 15,
          ),
          Text(loadingName)
        ]),
      );
    },barrierDismissible: isCancelable
  );
}
