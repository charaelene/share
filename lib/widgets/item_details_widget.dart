import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemDetailsWidget extends StatelessWidget {
  final Color bgColor;
  final String description;
  final String image;
  final int? quantity;
  final String title;
  final bool hasConsumedButton;
  final bool hasEditButton;

  const ItemDetailsWidget({
    super.key,
    required this.bgColor,
    required this.description,
    required this.image,
    this.quantity,
    required this.title,
    this.hasConsumedButton = false,
    this.hasEditButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Quantity
          if (quantity != null) ...[
            Text(
              quantity.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(width: 10),
          ],

          // Image
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 10),

          // Text details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Consumed label and edit icon
          Column(
            children: [
              if (hasConsumedButton) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(122, 75, 194, 59),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Consumed',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              if (hasEditButton) Icon(FontAwesomeIcons.penToSquare, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
