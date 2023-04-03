import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoons_model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonsModel> webtoonInstances = [];
  bool isLoading = true;
  void getWebtoons() async {
    webtoonInstances = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoonInstances);
    print(isLoading);
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
    );
  }
}
