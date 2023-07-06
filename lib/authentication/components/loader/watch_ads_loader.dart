import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WatchAdsLoader extends StatelessWidget {
  const WatchAdsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 129),
      child: Shimmer.fromColors(
        baseColor: Colors.black38,
        highlightColor: Colors.black.withOpacity(0.04),
        child: Container(
          width: double.infinity,
          height: 219,
          color: AppColours.lemon3,
        ),
      ),
    );
  }
}
