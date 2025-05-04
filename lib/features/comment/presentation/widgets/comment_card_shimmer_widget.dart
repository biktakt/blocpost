import 'package:flutter/material.dart';

import 'package:blocpost/core/presentation/widgets/shimmer/shimmer_mask.dart';

class CommentCardShimmerWidget extends StatelessWidget {
  const CommentCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerMask(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(backgroundColor: Colors.black, radius: 20),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border.all(color: Colors.black, width: 4),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SizedBox(width: double.infinity, height: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(width: double.infinity, height: 16),
                    ),

                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SizedBox(width: double.infinity, height: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
