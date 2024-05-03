class TripModel {
  final String departureTime;
  final String stops;
  final String returnTime;
  final bool viewDetails;

  TripModel(
      {required this.departureTime,
      required this.viewDetails,
      required this.stops,
      required this.returnTime});
}

List<TripModel> trips = [
  TripModel(
      departureTime: '22:55',
      stops: 'Non-stop',
      returnTime: '05:25',
      viewDetails: false),
  TripModel(
      departureTime: '23:00',
      stops: '2-stops',
      returnTime: '22:10',
      viewDetails: true),
  TripModel(
      departureTime: '23:00',
      stops: '2-stops',
      returnTime: '02:10',
      viewDetails: true),
];
