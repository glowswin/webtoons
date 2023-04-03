import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/episode_model.dart';
import 'package:webtoon/models/webtoons_detail_model.dart';
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

  static Future<WebtoonDetail> getDetailToonByID(var id) async {
    final response = await http.get(
      Uri.parse(
        "$url/$id",
      ),
    );
    if (response.statusCode == 200) {
      final dynamic webtoonJson = jsonDecode(response.body);
      final webtoonDetail = WebtoonDetail.fromJson(webtoonJson);
      return webtoonDetail;
    } else {
      throw Error();
    }
  }

  static Future<List<Episode>> getEpisodesByID(var id) async {
    List<Episode> episodeInstances = [];
    final response = await http.get(
      Uri.parse(
        "$url/$id/episodes",
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsons = jsonDecode(response.body);
      for (var json in jsons) {
        final episode = Episode.fromJson(json);
        episodeInstances.add(episode);
      }
      return episodeInstances;
    } else {
      throw Error();
    }
  }
}
