import 'package:amazon_clone_tutorial/features/account/services/account_services.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/account_button.dart';
import 'package:amazon_clone_tutorial/common/widgets/dialogues.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onTap: () {},
            ),
            AccountButton(
              text: 'Delete Account',
              onTap: () {
                actionDialogue(context, onAction: () async {
                  Navigator.of(context).pop();
                  await AccountServices().deleteUser(currentUser);
                }, title: "Delete Account");
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTap: () => AccountServices().logOut(context),
            ),
            AccountButton(
              text: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
