import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/components/custom_list_tile/customlist_tile.dart';
import 'package:daytrit/home/view_models/delete_account_view_model.dart';
import 'package:daytrit/home/view_models/delete_user_account_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../authentication/components/buttons/regular/custom_botton.dart';
import '../../authentication/components/custom_text/get_text.dart';
import '../../authentication/components/input_field/custom_input_field.dart';
import '../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileViewModel>(context);
    final deleAccountviewModel = Provider.of<DeleteAccountViewModel>(context);
    print("LOADING ${deleAccountviewModel.loading}");
    return ModalProgressHUD(
      inAsyncCall: deleAccountviewModel.loading,
      progressIndicator: Loader(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 390,
                  color: AppColours.deepBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        getText(
                            context: context,
                            title: "Profile",
                            fontSize: 31.4,
                            color: AppColours.cream2,
                            weight: FontWeight.w700),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 94,
                          height: 94,
                          decoration: BoxDecoration(
                              image: profileModel.userData?.photo != null
                                  ? DecorationImage(
                                      image: NetworkImage(
                                          "https://daytrit.net${profileModel.userData!.photo}"),
                                      fit: BoxFit.cover)
                                  : DecorationImage(
                                      image: AssetImage(AppImages.avatar),
                                      fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              color: Colors.grey),
                        ),
                        addVerticalSpace(12),
                        getText(
                            context: context,
                            title: profileModel.userData?.name ?? "",
                            fontSize: 24,
                            color: AppColours.cream,
                            weight: FontWeight.w400),
                        addVerticalSpace(8),
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0, right: 80),
                          child: Divider(
                            color: AppColours.cream,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getText(
                                  context: context,
                                  title: profileModel.uData?.referralCode ?? "",
                                  fontSize: 12,
                                  letterSpacing: 3,
                                  color: AppColours.cream2,
                                  weight: FontWeight.w500),
                              addHorizontalSpace(8),
                              InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: profileModel.uData!.referralCode));
                                  // copied successfully
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "✓   Referral code copied to clipboard")));
                                },
                                child: Container(
                                  height: 30,
                                  width: 58,
                                  decoration: BoxDecoration(
                                      color: AppColours.dayTritBlueMain,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: getText(
                                        textAlign: TextAlign.center,
                                        context: context,
                                        title: "Copy",
                                        color: AppColours.blue2,
                                        weight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),

              SizedBox(
                height: 30,
              ),
              CustomListTile(
                  onTap: () {
                    openWalletScreen(context);
                  },
                  leading: SvgPicture.asset('assets/svgs/wallet.svg'),
                  title: 'Wallet'),
              CustomListTile(
                  onTap: () {
                    editProfileScreen(context);
                  },
                  leading: Image.asset(AppImages.edit),
                  title: 'Edit Profile'),
              GestureDetector(
                onTap: () async {
                  const urlPreview = "https://daytrit.com/#download";
                  await Share.share(
                      "Experience thrilling adventures and enjoy abundant rewards with the DayTrit app! By using my referral link, you'll earn a whopping 500 trit coins when you download the app and create an account. Start your journey now! \n\n$urlPreview\n\nMy Referral code is ${profileModel.uData!.referralCode}");
                },
                child: CustomListTile(
                    leading: Image.asset(AppImages.share),
                    title: 'Share Referral Link'),
              ),
              CustomListTile(
                onTap: () {
                  bottomSheet(context);
                },
                leading: SvgPicture.asset(AppImages.headset),
                title: 'Get Help & Support',
              ),
              CustomListTile(
                  onTap: () {
                    privacyPolicyScreen(context);
                  },
                  leading: SvgPicture.asset(AppImages.privacy),
                  title: 'Privacy policy'),
              //Spacer(),
              SizedBox(
                height: 120,
              ),
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    var data = await profileModel.logOut();
                    if (data == true) {
                      openLogOut(context);
                    }
                  },
                  icon: SvgPicture.asset(
                    AppImages.logout,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                  label: getText(
                      context: context,
                      title: "Log out",
                      fontSize: 14,
                      color: AppColours.red,
                      weight: FontWeight.w700),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: CustomButton(
                    buttonName: "Delete Account",
                    buttonTextColor: AppColours.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 52,
                    width: double.infinity,
                    buttonColor: Colors.red,
                    onPressed: () => openCustomDialogOnDeleteAccount(
                        context: context,
                        okBtnFunction: () {
                          Provider.of<DeleteUserAccountViewModel>(context,
                                  listen: false)
                              .deleteAccount(context);
                          Navigator.of(context).pop();
                        },
                        content:
                            "By clicking the 'Delete Account' button, you have agreed that your account will be temporaily suspended and your data will be completely deleted from our server after 30 days.")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PersistentBottomSheetController<dynamic> bottomSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 580,
            color: Color(0xff323231),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: 36,
                          height: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.colorheadset),
                      SizedBox(
                        width: 10,
                      ),
                      getText(
                          context: context,
                          title: "Get Help & Support",
                          fontSize: 18,
                          color: AppColours.lemon2,
                          weight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getText(
                            context: context,
                            title: "Please fill in the required \ntext boxes",
                            fontSize: 24,
                            color: AppColours.white,
                            weight: FontWeight.w700),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInputField(
                          hintText: "Full Name",
                          hintColor: AppColours.cream2,
                          borderColor: AppColours.darkLemon3,
                          fillColor: AppColours.grey,
                          isFilledColor: true,
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (String? value) => validators.validateEmail(value),
                          // onSave: (dynamic value) {
                          //   setState(() {
                          //     _email = value;
                          //     print("Email: $_email");
                          //   });
                          // }
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                          hintText: "Email",
                          hintColor: AppColours.cream2,
                          borderColor: AppColours.darkLemon3,
                          fillColor: AppColours.grey,
                          isFilledColor: true,
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //controller: address,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColours.grey,
                              hintText: 'Message',
                              hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColours.cream2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColours.darkLemon3, width: 1.0),
                              )),
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          buttonName: "Submit",
                          buttonTextColor: AppColours.white,
                          borderRadius: 4,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 52,
                          width: double.infinity,
                          buttonColor: AppColours.red3,
                          onPressed: () {},
                        ),
                      ]),
                ],
              ),
            ),
          );
        });
  }
}
