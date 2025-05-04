import 'package:flutter/material.dart';
import 'package:tamenny_app/core/functions/validator.dart';
import 'package:tamenny_app/core/widgets/custom_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.text = 'Password'});
  final String text;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late String password;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: widget.text,
      onChanged: (data) {
        password = data;
      },
      validate: Validator.validatePassword,
      obscure: isObscure,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: isObscure
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.visibility_off),
      ),
    );
  }
}
