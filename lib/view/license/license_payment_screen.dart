import 'package:flutter/material.dart';

import '../../model/license_model.dart';

class LicensePaymentScreen extends StatefulWidget {
  final LicenseModel license;

  const LicensePaymentScreen(this.license, {super.key});

  @override
  State<LicensePaymentScreen> createState() => _LicensePaymentScreenState();
}

class _LicensePaymentScreenState extends State<LicensePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
        child: Column(children: [Text("Payment Successful")]),
      ),
    );
  }
}
