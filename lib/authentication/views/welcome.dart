import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../vendor/view/vendor_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColours.dayTritBlue2,
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const VendorContainerNav())),
            child: Center(
              child: getText(
                  context: context,
                  title: "Welcome \nDaniela",
                  color: AppColours.blue2,
                  fontSize: 40,
                  weight: FontWeight.w200)),)),
    );
  }
}
