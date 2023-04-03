import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoons_model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonsModel>> webtoonInstances =
      ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoonInstances,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (var webtoon in snapshot.data!) Text(webtoon.title),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
