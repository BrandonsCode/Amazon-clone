import 'package:amazon_clone_tutorial/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_tutorial/common/widgets/dialogues.dart';
import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:amazon_clone_tutorial/features/account/services/account_services.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/account_button.dart';
import 'package:amazon_clone_tutorial/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                TextEditingController nameCtr = TextEditingController();
                actionDialogue(
                  context,
                  onAction: () async {
                    Navigator.of(context).pop();
                    if (nameCtr.text ==
                        Provider.of<UserProvider>(context, listen: false).user.name) {
                      await AccountServices().deleteAccount(context);
                    } else {
                      showSnackBar(context, 'Name doesn\'t match');
                    }
                  },
                  title: 'Delete Account',
                  subTitle: 'Enter your whole name to confirm account deletion',
                  actionButtonText: 'Delete Account',
                  body: CustomTextField(
                    controller: nameCtr,
                    hintText: 'Full Name',
                  ),
                );
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
