import 'package:enterprise_resource_planning/views/barcode_scanner.dart';
import 'package:flutter/material.dart';

import '../views/home.dart';
import '../views/login.dart';
import '../views/material_details.dart';
import '../views/material_input.dart';
import '../views/material_output.dart';
import '../views/material_reporting.dart';
import '../views/product_input.dart';
import '../views/product_output.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "login_view": (context) => const Login(),
  "home_view": (context) => const Home(),
  "material_input_view": (context) => const MaterialInput(),
  "material_output_view": (context) => const MaterialOutput(),
  "material_reporting_view": (context) => const MaterialReporting(),
  "material_details_view": (context) => MaterialDetails(),
  "barcode_scanner_view" :(context) => const BarcodeScanner(),
  "product_output_view": (context) => ProductOutput(),
  "product_input_view": (context) => ProductInput(),
};
