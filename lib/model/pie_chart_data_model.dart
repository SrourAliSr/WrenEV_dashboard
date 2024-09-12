class PieChartData {
  final String title;
  final int titleNumber;
  final String firstPointTitle;
  final double firstPoint;
  final String secondPointTitle;
  final double secondPoint;
  final String thirdPointTitle;
  final double thirdPoint;

  PieChartData(
      {required this.title,
      required this.titleNumber,
      required this.firstPointTitle,
      required this.firstPoint,
      required this.secondPointTitle,
      required this.secondPoint,
      required this.thirdPointTitle,
      required this.thirdPoint});

  Map toMap() {
    return {
      "title": title,
      "titleNumber": titleNumber,
      "firstPointTitle": firstPointTitle,
      "firstPoint": firstPoint,
      "secondPointTitle": secondPointTitle,
      "secondPoint": secondPoint,
      "thirdPointTitle": thirdPointTitle,
      "thirdPoint": thirdPoint,
    };
  }
}
