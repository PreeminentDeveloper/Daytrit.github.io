import 'dart:io';

import 'package:daytrit/home/repo/logout_service.dart';
import 'package:daytrit/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../models/dataModel/userPofile_response.dart';
import '../repo/api_status.dart';
import '../repo/userProfile_service.dart';

class ProfileViewModel extends ChangeNotifier {
  UserProfileService service = UserProfileService();
  LogOutService logOutService = LogOutService();

  bool _loading = false;
  UserData? userData;
  UserProfileResponse? _userProfileResponse;
  UserProfileFailure? _userProfileFailure;

  bool get loading => _loading;

  UserData? get uData => userData;

  UserProfileResponse? get userProfileResponse => _userProfileResponse;

  UserProfileFailure? get userProfileFailure => _userProfileFailure;

  ProfileViewModel();

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserProfileResponse(dynamic userProfileResponse) =>
      _userProfileResponse = userProfileResponse;

  setUserProfileFailure(UserProfileFailure userProfileFailure) =>
      _userProfileFailure = userProfileFailure;

  Future<ProfileState> getUserProfile() async {
    try {
      setLoading(true);
      UserProfileResponse res = await UserProfileService.getUserDetails();
      userData = res.data;
      setLoading(false);
      return UserProfileSuccess(userData!);
    } on SocketException catch (_) {
      return UserProfileFailure(
          message: "Kindly, check your internet connection.");
    } catch (e) {
      return UserProfileFailure(message: "${decodedData!['message']}");
    }
  }

  Future<Object> logOut() async {
    await AuthService.logout();
    return true;
  }
}

//
// FutureBuilder(
// future: _initializeVideoPlayerFuture,
// builder: (ctx, snapshot){
// if(snapshot.connectionState == ConnectionState.done){
// return AspectRatio(
// aspectRatio: _controller!.value.aspectRatio,
// child: VideoPlayer(_controller!),
// );
// } else {
// return Center(
// child: CircularProgressIndicator(),
// );
// }
// },
// // child: Container(
// //   width: double.infinity,
// //   height: 219,
// //   color: AppColours.lemon3,
// //
// //   // child: IconButton(icon: Icon(Icons.play_circle_fill_outlined,size: 70,),onPressed: (){
// //   //   rewardedAd!.show(onUserEarnedReward: (ad,reward){
// //   //     print('the earned reward is ${reward.amount}');
// //   //   });
// //   // },),
// // ),
// ),