class WebtoonsModel {
  final String title, thumb, id;

  WebtoonsModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
