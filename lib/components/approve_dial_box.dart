import 'package:flutter/material.dart';
import 'package:user_purchase/components/buttons.dart';

// ignore: must_be_immutable
class ApproveUserBox extends StatefulWidget {
  final TextEditingController userController;
  final TextEditingController passwordConttoller;
  final GlobalKey<FormState> formKey;
  VoidCallback onAdd;
  bool isPasswordShown = true;
  ApproveUserBox({
    super.key,

    required this.userController,
    required this.passwordConttoller,
    required this.onAdd,
    required this.formKey,
  });

  @override
  State<ApproveUserBox> createState() => _ApproveUserBoxState();
}

class _ApproveUserBoxState extends State<ApproveUserBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Form(
            key: widget.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email required";
                      }
                      return null;
                    },
                    controller: widget.userController,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password required";
                        }
                        return null;
                      },
                      controller: widget.passwordConttoller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: widget.isPasswordShown,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isPasswordShown = !widget.isPasswordShown;
                            });
                          },
                          icon: Icon(
                            widget.isPasswordShown
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
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
                    children: [
                      Buttons(buttonName: 'Approve', onPressed: widget.onAdd),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
