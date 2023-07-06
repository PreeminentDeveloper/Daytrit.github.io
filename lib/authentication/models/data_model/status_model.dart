import 'package:daytrit/utils/constants.dart';

class StatusModel {
  final String image;
  final String name;

  StatusModel({required this.image, required this.name});
}

List<StatusModel> stats = [
  StatusModel(
    image: AppImages.status1,
    name: "Jesam Titi",
  ),
  StatusModel(
    image: AppImages.status3,
    name: "Patrick O",
  ),
  StatusModel(
    image: AppImages.status4,
    name: "Silver",
  ),
  StatusModel(
    image: AppImages.status3,
    name: "Segun",
  ),
  StatusModel(
    image: AppImages.status4,
    name: "Jessy",
  ),
  StatusModel(
    image: AppImages.status1,
    name: "Chidinma",
  ),
  StatusModel(
    image: AppImages.status4,
    name: "Tobi",
  ),
];
