import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omdb_practical/app/ui/app_image_asset.dart';

class AppImageExpandedView extends StatelessWidget {
  const AppImageExpandedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['title'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.pink.withValues(alpha: 0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Hero(
            tag: "moviePoster",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                child: AppImageAsset(
                  image: Get.arguments['poster'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
