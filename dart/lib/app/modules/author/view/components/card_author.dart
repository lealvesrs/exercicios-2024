import 'package:cached_network_image/cached_network_image.dart';
import 'package:chuva_dart/app/helper/my_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardAuthor extends StatelessWidget {
  const CardAuthor(
      {Key? key,
      required this.name,
      required this.id,
      required this.institution,
      required this.image})
      : super(key: key);

  final String name;
  final String institution;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/author");
      },
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            image.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: image,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Icon(
                    Icons.person,
                    size: 60,
                    color: MyColor.gray,
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                children: [
                  Text(name),
                  Text(
                    institution,
                    style: TextStyle(fontSize: 14, color: MyColor.gray),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
