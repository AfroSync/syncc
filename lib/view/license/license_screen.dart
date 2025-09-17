import 'package:flutter/material.dart';

import '../widget/text_title_widget.dart';
import 'license_tile.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              TextTitleWidget("Licenses"),
              Spacer(),
              IconButton(onPressed: null, icon: Icon(Icons.add)),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [LicenseTile(), LicenseTile()]),
            ),
          ),
        ],
      ),
    );
  }
}
