import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductContainer extends StatelessWidget {
  final String productName, brandName, price, imageUrl, currency;
  const ProductContainer({
    Key? key,
    required this.productName,
    required this.brandName,
    required this.price,
    required this.imageUrl,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            brandName.toUpperCase(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            productName,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
            overflow: TextOverflow.fade,
            maxLines: 3,
            textAlign: TextAlign.left,
          ),
          Image(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.scaleDown,
          ),
          Text(
            '$currency $price',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.fade,
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
