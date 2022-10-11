import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecentProductContainer extends StatelessWidget {
  final String brandName, imageUrl;
  const RecentProductContainer({
    Key? key,
    required this.brandName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //height: MediaQuery.of(context).size.height / 2,
        //width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.scaleDown,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
