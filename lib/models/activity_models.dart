class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTime;
  int rating;
  int price;

  Activity(
      {required this.imageUrl,
      required this.name,
      required this.price,
      required this.rating,
      required this.startTime,
      required this.type});
}
