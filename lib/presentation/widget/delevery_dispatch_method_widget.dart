import 'package:flutter/material.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class DeliveryDispatchMethodWidget extends StatelessWidget {
  const DeliveryDispatchMethodWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        children: [
          // Dispatch Item Icon
          Icon(
            icon,
            size: 22,
          ),
          kWidth10,

          // Dispatch Item Title
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
