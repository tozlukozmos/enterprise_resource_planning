import 'package:flutter/material.dart';

class MaterialReporting extends StatelessWidget {
  const MaterialReporting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Material Reporting Page"),
        ),
      ),
    );
  }
}