import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserFollowInfo extends StatelessWidget {
  const UserFollowInfo({
    super.key,
    required this.nums,
    required this.property,
  });

  final String nums;
  final String property;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nums,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v5,
        Text(
          property,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        )
      ],
    );
  }
}
