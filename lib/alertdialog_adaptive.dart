
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:referral_app/text_button_adaptive.dart';

bool get isIos => foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

class AlertDialogAdaptive extends StatelessWidget {

  final String title;
  final Widget content;
  final List<Map<String, dynamic>> buttons;
  final bool barrierDismissible;

  const AlertDialogAdaptive({Key key, @required this.title, @required this.content, this.buttons, this.barrierDismissible})
      : super(key: key);

  void show(BuildContext context) {
    if(isIos) {
      showCupertinoDialog(
        barrierDismissible: (this.barrierDismissible == null ? true : this.barrierDismissible),
        context: context,
        builder: (context) {
          return buildDialog();
        },
      );
    }else {
      showDialog(
        barrierDismissible: (this.barrierDismissible == null ? true : this.barrierDismissible),
        context: context,
        builder: (context) {
          return buildDialog();
        },
      );
    }
  }

  Widget buildDialog() {
    List<Widget> actions = [];
    if(buttons != null && buttons.length > 0) {
      for (var button in buttons) {
        if(isIos) {
          actions.add(CupertinoDialogAction(onPressed: button["action"], child: Text(button["text"].toString().toUpperCase())));
        }else {
          actions.add(TextButtonAdaptive(text: button["text"], tapEvent: button["action"]));
        }
      }
    }

    if(isIos) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: content,
        actions: actions
      );
    }else {
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: actions
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

}