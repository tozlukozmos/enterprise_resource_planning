import 'package:flutter/material.dart';

class MaterialOutput extends StatelessWidget {
  const MaterialOutput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Material Output Page"),
        ),
      ),
    );
  }
}