
import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/notification_model.dart';
import 'package:daytrit/home/repo/notification_service.dart';
import 'package:daytrit/services/auth_service.dart';
import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  NotificationService service = NotificationService();

  bool _loading = false;
  List<NotificationModel> notify = <NotificationModel>[];

  NotificationModel? notifications;

  bool get loading => _loading;

  //ProfileViewModel();

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<bool> getNotification() async {
    setLoading(true);
    try {
      final ApiResponse response =
          await NotificationService().getNotification();
      if (response is Success) {
        notify = response.data as List<NotificationModel>;
      } else {
        return false;
      }
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      print("HELLO");
      return false;
    }
  }

  Future<Object> logOut({
    required String email,
  }) async {
    await AuthService.logout();
    return true;
  }

  

  String getRelativeTime(DateTime dateTime,) {
    DateTime now = DateTime.now();
    final difference = now.difference(dateTime);
    if (isSameDay(dateTime, now)) {
      return 'Today';
    } else if (isYesterday(dateTime, now)) {
      return 'Yesterday';
    } else if (isWithinNDays(dateTime, now)) {
      final days = difference.inDays;
      return '$days day${days > 1 ? 's' : ''} ago';
    } else if (isWithinNWeeks(dateTime, now)) {
      final weeks = difference.inDays ~/ 7;
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (isWithinNMonths(dateTime, now)) {
      final months = now.month - dateTime.month;
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (isWithinNYears(dateTime, now)) {
      final years = now.year - dateTime.year;
      return '$years year${years > 1 ? 's' : ''} ago';
    } else {
      return 'in the future';
    }
  }

  bool isSameDay(DateTime dateTime1, DateTime dateTime2) {
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month &&
        dateTime1.day == dateTime2.day;
  }

  bool isYesterday(DateTime dateTime, DateTime now) {
    final yesterday = now.subtract(Duration(days: 1));
    return isSameDay(dateTime, yesterday);
  }

  bool isWithinNDays(DateTime dateTime1, DateTime dateTime2) {
    final difference = dateTime2.difference(dateTime1).inDays;
    return difference >= 1 && difference < 7;
  }

  bool isWithinNWeeks(DateTime dateTime1, DateTime dateTime2) {
    final difference = dateTime2.difference(dateTime1).inDays;
    return difference >= 7 && difference < 30;
  }

  bool isWithinNMonths(DateTime dateTime1, DateTime dateTime2) {
    final difference = (dateTime2.year - dateTime1.year) * 12 +
        dateTime2.month -
        dateTime1.month;
    return difference >= 1 && difference < 12;
  }

  bool isWithinNYears(DateTime dateTime1, DateTime dateTime2) {
    final difference = dateTime2.year - dateTime1.year;
    return difference >= 1;
  }
}

//
