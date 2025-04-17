import 'package:e_commerce_app/core/widgets/customize_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../searching_by_taking_photo_view.dart';

class VisualSearchViewBody extends StatelessWidget {
  const VisualSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/image.png",
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width > 500 ? 20 : 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Search for an outfit by taking a photo or uploading an image",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomizeButton(
                isLoading: false,
                color: Colors.red,
                hasBorder: false,
                onTap: () {
                  context.push(SearchingByTakingPhotoView.route);
                },
                text: "Take a photo",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomizeButton(
                isLoading: false,
                color: Colors.transparent,
                hasBorder: true,
                onTap: () {},
                text: "Upload an image",
              ),
            ],
          ),
        )
      ],
    );
  }
}
