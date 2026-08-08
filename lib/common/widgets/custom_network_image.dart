import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final double effectiveHeight = height ?? 200.h;
    final double effectiveWidth = width ?? double.infinity;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: effectiveHeight,
        width: effectiveWidth,
        fit: fit,

        /// shimmer while loading
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: effectiveHeight,
            width: effectiveWidth,
            color: Colors.grey.shade300,
          ),
        ),

        /// error placeholder
        errorWidget: (context, url, error) => Container(
          height: effectiveHeight,
          width: effectiveWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.broken_image,
            color: Colors.grey,
            size: 40,
          ),
        ),
      ),
    );
  }
}