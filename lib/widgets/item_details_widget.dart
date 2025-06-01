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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quantity
          if (quantity != null) ...[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                quantity.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
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
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Consumed label and edit icon
          Column(
            children: [
              if (hasConsumedButton) ...[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color.fromARGB(122, 75, 194, 59),
                    minimumSize: Size(80, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
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
              ],
              if (hasEditButton)
                TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    minimumSize: Size(40, 40),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed:
                      () => Navigator.pushNamed(context, '/pantry_update'),
                  child: Icon(FontAwesomeIcons.penToSquare, size: 20),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
