import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerLoading {
  static Widget loadImage() {
    return Container(
      color: Colors.red,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}