import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaItem extends StatelessWidget {
  final String logo;
  final void Function()? onTap;
  final bool isLoading;

  const SocialMediaItem({
    super.key,
    required this.logo,
    this.onTap, required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height * 0.1,
        width: MediaQuery.sizeOf(context).width * 0.19,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width > 500 ? 40:25),
        ),
        child: isLoading ? const CircularProgressIndicator() : SvgPicture.asset(logo,height: MediaQuery.sizeOf(context).height * 0.05,),
      ),
    );
  }
}
