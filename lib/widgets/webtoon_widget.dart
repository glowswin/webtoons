import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => DetailScreen(
                  title: title,
                  thumb: thumb,
                  id: id,
                ),
              ),
            );
          },
          child: Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              child: Image.network(
                thumb,
                width: 250,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
