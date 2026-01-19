import 'package:flutter/material.dart';
import 'package:user_purchase/components/buttons.dart';

// ignore: must_be_immutable
class ApproveUserBox extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordConttoller;
  VoidCallback onAdd;
  ApproveUserBox({
    super.key,
    required this.userController,
    required this.passwordConttoller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        width: 300,
        height: 202,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  controller: userController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    labelText: 'username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  child: TextField(
                    controller: passwordConttoller,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      labelText: 'password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Buttons(buttonName: 'Add', onPressed: onAdd)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
