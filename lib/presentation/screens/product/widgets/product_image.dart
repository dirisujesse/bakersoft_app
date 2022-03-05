import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_fav_icon.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  final bool showFavIcon;
  final double? width;
  final double? height;

  const ProductImage(this.product, {this.showFavIcon = true, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final placeHolderImage = Image.asset(
      product.imagePath,
      alignment: Alignment.center,
      fit: BoxFit.cover,
      height: height,
      width: width,
    );

    final image = CachedNetworkImage(
      fadeOutDuration: Duration(microseconds: 20),
      fadeInDuration: Duration(microseconds: 20),
      imageUrl: product.imageUrl,
      placeholder: (context, url) => placeHolderImage,
      errorWidget: (context, _, __) => placeHolderImage,
      alignment: Alignment.center,
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.darken,
      color: BakerColors.black.withOpacity(.1),
      height: height,
      width: width,
    );

    if (!showFavIcon) return image;

    return Stack(
      children: [
        Positioned.fill(
          child: Hero(
            tag: product.sku,
            child: image,
          ),
        ),
        if (showFavIcon)
          Positioned(
            top: 0,
            right: 0,
            child: ProductFavIcon(
              product,
              key: Key(product.sku),
            ),
          )
      ],
    );
  }
}
