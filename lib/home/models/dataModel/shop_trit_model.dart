import 'package:daytrit/utils/constants.dart';

class ShopTritModel {
  final int amount;
  final String coinIcon;
  final String coinBoxImage;
  final int qty;

  ShopTritModel(
      {required this.amount,
      required this.coinBoxImage,
      required this.coinIcon,
      required this.qty});
}

List<ShopTritModel> shopTrit = [
  ShopTritModel(
      qty: 1000,
      amount: 2000,
      coinBoxImage: AppImages.coinBox,
      coinIcon: AppImages.coinIcon),
  ShopTritModel(
      qty: 3000,
      amount: 5000,
      coinBoxImage: AppImages.coinBox,
      coinIcon: AppImages.coinIcon),
  ShopTritModel(
      qty: 6000,
      amount: 9000,
      coinBoxImage: AppImages.coinBox,
      coinIcon: AppImages.coinIcon),
];
