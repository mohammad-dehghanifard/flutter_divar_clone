import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';

class LoadNetworkImage extends StatelessWidget {
  const LoadNetworkImage({
    super.key, required this.imageUrl,this.radius = 12.0
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        placeholder: (context, url) => LoadingWidget(color: Theme.of(context).colorScheme.primary,),
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return const Icon(Icons.image_not_supported,size: 48);
        },
      ),
    );
  }
}