import 'package:flutter/material.dart';

class MaterialInput extends StatelessWidget {
  const MaterialInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Material Input Page"),
        ),
      ),
    );
  }
}