import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_divar_clone/helpers/widgets/loading_widget.dart';

class LoadNetworkImage extends StatelessWidget {
  const LoadNetworkImage({
    super.key, required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => LoadingWidget(color: Theme.of(context).colorScheme.primary,),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return const Icon(Icons.image_not_supported,size: 48);
      },
    );
  }
}