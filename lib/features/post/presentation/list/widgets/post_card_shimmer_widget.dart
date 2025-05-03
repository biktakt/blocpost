import 'package:flutter/material.dart';

import 'package:blocpost/core/presentation/widgets/shimmer/shimmer_mask.dart';

class PostCardShimmerWidget extends StatelessWidget {
  const PostCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerMask(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SizedBox(width: double.infinity, height: 24),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(width: double.infinity, height: 24),
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(right: 80 * (index % 3)),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const SizedBox(
                          width: double.infinity,
                          height: 16,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
