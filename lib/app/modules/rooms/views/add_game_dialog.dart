import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/routes/app_pages.dart';
import 'package:tictactoe/utils/colors.dart';

class AddGameAlertDialog extends StatefulWidget {
  const AddGameAlertDialog({Key? key}) : super(key: key);

  @override
  State<AddGameAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddGameAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'Создать игру',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: AppColors.white),
      ),
      content: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: TextField(),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Создать'),
          onPressed: () => Get.toNamed(Routes.GAME),
        ),
      ],
    );
  }

  void back(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Widget _buildForm() {
  //   return Form(
  //     child: Column(
  //       children: <Widget>[
  //         TextField(
  //           controller: taskNameController,
  //           labelText: 'Заметка',
  //           icon: const Icon(CupertinoIcons.square_list, color: Colors.brown),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
