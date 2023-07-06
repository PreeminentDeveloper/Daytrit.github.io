import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: SpinKitRotatingCircle(
          color: AppColours.navyBlue,
          size: 50.0,
        ),
      ),
    );
  }
}
