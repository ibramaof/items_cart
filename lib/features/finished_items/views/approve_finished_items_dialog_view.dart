import 'package:flutter/material.dart';
import 'package:user_purchase/core/shared_widgets/buttons.dart';
import 'package:user_purchase/core/theme/colors.dart';

// ignore: must_be_immutable
class ApproveUserBox extends StatefulWidget {
  final TextEditingController userController;
  final TextEditingController passwordConttoller;
  final GlobalKey<FormState> formKey;
  VoidCallback onApprove;
  bool isPasswordShown = true;
  ApproveUserBox({
    super.key,

    required this.userController,
    required this.passwordConttoller,
    required this.onApprove,
    required this.formKey,
  });

  @override
  State<ApproveUserBox> createState() => _ApproveUserBoxState();
}

class _ApproveUserBoxState extends State<ApproveUserBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kWhiteColor,
      content: Container(
        width: 300,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 15),
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
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Color.fromARGB(255, 124, 85, 142),
                      ),
                      labelText: 'Email',
                      hintText: "name@example.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
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
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 124, 85, 142),
                        ),
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
                            color: Color.fromARGB(255, 124, 85, 142),
                          ),
                        ),
                        labelText: 'password',
                        hintText: '********',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyGradientButton(
                        isSecondary: false,
                        label: 'Approve',
                        onPressed: widget.onApprove,
                      ),
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
