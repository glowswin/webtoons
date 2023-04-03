import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon/models/episode_model.dart';

class EpsodeWidget extends StatelessWidget {
  const EpsodeWidget({
    super.key,
    required this.episode,
    required this.comicId,
  });

  final Episode episode;
  final String comicId;
  void onTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$comicId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              episode.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
