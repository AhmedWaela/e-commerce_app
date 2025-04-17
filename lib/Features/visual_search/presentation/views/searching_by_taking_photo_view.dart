import 'package:flutter/material.dart';
import '../../../../core/widgets/arrow_back_ios_icon_button.dart';
import 'widgets/searching_by_taking_photo_view_body.dart';

class SearchingByTakingPhotoView extends StatelessWidget {
  const SearchingByTakingPhotoView({super.key});
  static const String route = "/searching-by-taking-photo-view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:const SearchingByTakingPhotoViewBody() ,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: ArrowBackIosIconButton(),
      title: const Text(
        "Searching By Taking Photo",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }
}
