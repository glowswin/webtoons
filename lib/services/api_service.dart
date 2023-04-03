import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoons_model.dart';

class ApiService {
  static const url = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const today = "today";

  static Future<List<WebtoonsModel>> getTodaysToons() async {
    List<WebtoonsModel> webtoonInstances = [];
    final response = await http.get(
      Uri.parse(
        "$url/$today",
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsons = jsonDecode(response.body);
      for (var json in jsons) {
        final webtoon = WebtoonsModel.fromJson(json);
        webtoonInstances.add(webtoon);
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }
}
