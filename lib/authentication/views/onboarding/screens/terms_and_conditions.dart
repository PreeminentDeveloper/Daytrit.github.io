import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/string_assets.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
   TermsAndConditions({super.key});
  final dataKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
           Scrollable.ensureVisible(dataKey.currentContext ?? context); },
      child: Icon(Icons.arrow_downward,color: Colors.white,)),
      body: SingleChildScrollView(
        child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 100, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                      context: context,
                      title: StringAssets.termsAndCondition,
                      fontSize: 12,
                      weight: FontWeight.w700,
                    ),
                    getText(
                        context: context,
                        title: StringAssets.termsAndConditionText,
                        fontSize: 12,
                        textHeight: 20),
                    Padding(
                      key: dataKey,
                      padding: EdgeInsets.only(bottom: 59,
                      left: 0,
                      top:20,
                      right: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomButton(
                          height: 44,
                          width: 114,
                          borderRadius: 8,
                          buttonName: "I Agree",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          buttonColor: AppColours.black,
                          onPressed: () => openSignUpScreen(context),
                        ),
                      ),
                    ),
                  ],
                )),


      ),
    );
  }
}
