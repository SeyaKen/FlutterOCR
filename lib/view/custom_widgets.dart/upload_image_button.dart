import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function() onTap;
  const CustomButton({Key? key, this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: Alignment.center,
      child: ElevatedButton(
        // onTap,textは引数としてされて受け渡されたもの
        onPressed: onTap,
        child: Text(
          text!,
        )
      )
    );
  }
}
