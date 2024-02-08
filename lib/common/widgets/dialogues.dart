import 'package:flutter/material.dart';

void actionDialogue(
  BuildContext context, {
  required void Function() onAction,
  Color? actionButtonColor,
  required String title,
  String? subTitle,
  Icon? icon,
  bool? barrierDismissible,
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
      content: subTitle != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  subTitle,
                ),
              ],
            )
          : null,
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
            width: 100,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Center(
              child: Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
