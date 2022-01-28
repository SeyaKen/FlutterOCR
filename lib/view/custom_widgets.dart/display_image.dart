import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String? path;
  const DisplayImage(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ああああああああああ');
    print(path);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Image.file(
        File(path!),
        width: 300,
        height: 300,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
