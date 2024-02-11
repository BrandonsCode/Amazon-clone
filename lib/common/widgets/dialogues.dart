import 'package:flutter/material.dart';

void actionDialogue(
  BuildContext context, {
  required void Function() onAction,
  Color? actionButtonColor,
  required String title,
  String? subTitle,
  Icon? icon,
  bool? barrierDismissible,
  Widget? body,
  String? actionButtonText,
}) async {
  showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.grey[100],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
      icon: icon,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subTitle != null) Text(subTitle),
          if (body != null) body,
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Close",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
        GestureDetector(
          onTap: onAction,
          child: Container(
            width: 120,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                actionButtonText ?? "Log out",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
