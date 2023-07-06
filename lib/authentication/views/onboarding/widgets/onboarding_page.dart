import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title1,
    required this.title2,
    this.title1More = "",
    required this.subTitle1,
    required this.subTitle2,
    required this.packageType,
    required this.isLogoVisible,
    this.bottonName = "Next",
    this.isTitle1MoreVisible = false,
    required this.bottonClick,
  }) : super(key: key);

  final String image;
  final String title1, title2, title1More, subTitle1, subTitle2, packageType;
  final String bottonName;
  final bool isLogoVisible, isTitle1MoreVisible;
  final Function bottonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 44.5, left: 10, right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
          image: AssetImage(image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // height: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText(
                  context: context,
                  textHeight: 67.3,
                  title: title1,
                  weight: FontWeight.w700,
                  fontSize: 70,
                  color: Colors.white,
                ),
                Visibility(
                  visible: isTitle1MoreVisible,
                  child: getText(
                    context: context,
                    textHeight: 67.3,
                    title: title1More,
                    weight: FontWeight.w700,
                    fontSize: 70,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getText(
                      context: context,
                      textHeight: 67.3,
                      title: title2,
                      weight: FontWeight.w700,
                      fontSize: 70,
                      color: Colors.white,
                    ),
                    addHorizontalSpace(3),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 43,
                        child: const VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 10,
                          endIndent: 0,
                          width: 0,
                        ),
                      ),
                    ),
                    addHorizontalSpace(6),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // width: 250,
                            child: getText(
                              context: context,
                              title: subTitle1,
                              weight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getText(
                                context: context,
                                title: packageType,
                                weight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              getText(
                                context: context,
                                title: subTitle2,
                                weight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          addVerticalSpace(52.5),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(
                buttonName: bottonName,
                buttonColor: Colors.transparent,
                borderColor: Colors.white,
                onPressed: bottonClick),
          ),
        ],
      ),
    );
  }
}
