
import 'package:flutter/material.dart';

abstract class PlatformDuyarliWidget extends StatelessWidget {
  Widget buildAndroidWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildAndroidWidget(context);
  }
}