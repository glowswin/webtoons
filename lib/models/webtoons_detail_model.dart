class WebtoonDetail {
  final String about, genre, age;

  WebtoonDetail.fromJson(Map<String, dynamic> json)
      : about = json["about"],
        genre = json["genre"],
        age = json["age"];
}
