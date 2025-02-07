import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppImageAsset extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final bool isFile;

  const AppImageAsset({super.key, required this.image, this.fit, this.height, this.width, this.color, this.isFile = false});

  @override
  Widget build(BuildContext context) {
    return ((image.isEmpty) || (image.contains('http')))
        ? CachedNetworkImage(
            imageUrl: image,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.black,
              child: SizedBox(height: height, width: width),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
          )
        : Image.asset(image, fit: fit, height: height, width: width, color: color);
  }
}
