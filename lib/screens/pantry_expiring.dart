import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbap_part2/widgets/item_details_widget.dart';

class PantryExpiring extends StatelessWidget {
  const PantryExpiring({super.key});

  @override
  Widget build(BuildContext context) {
    // sample pantry items data
    final List<Map<String, dynamic>> pantryItems = [
      {
        'title': 'Mom has leftovers from dinner',
        'description':
            'Prepped some meals! Remember to make hot before you eat!',
        'image': 'images/leftovers_container.png',
        'consumed': true,
        'expired': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'Sister has leftovers from lunch',
        'description': '"Couldn\'t finish this..might eat later"',
        'image': 'images/leftover_bluebowl.png',
        'consumed': true,
        'expired': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'Dad bought milk',
        'description': 'Done as requested by mom..',
        'image': 'images/meiji_milk.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'Mom bought yogurt',
        'description': 'Eat these with fruits!!',
        'image': 'images/chobani_yogurt.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'I bought ice cream',
        'description': 'Bought for everyone to share!!',
        'image': 'images/ben_jerry.png',
        'consumed': true,
        'quantity': 2,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(94, 170, 102, 1.0),
        shape: CircleBorder(),
        child: Icon(Icons.arrow_back, color: Colors.white),
        // Navigate back to the previous screen
        onPressed: () => Navigator.pop(context),
      ),
      // Dark green background
      backgroundColor: Color.fromRGBO(211, 212, 172, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'Expiring Soon',
              style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(30, 80, 42, 1.0),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              FontAwesomeIcons.clock,
              color: Color.fromRGBO(30, 80, 42, 1.0),
              size: 30,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(46, 94, 55, 1.0),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Text(
              "9 items are expiring soon",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(211, 212, 172, 1.0),
                fontSize: 26.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            // Expanded to fill the available space
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pantryItems.length,
              itemBuilder: (context, index) {
                final item = pantryItems[index];
                return ItemDetailsWidget(
                  title: item['title'],
                  description: item['description'],
                  image: item['image'],
                  bgColor: item['bgColor'],
                  hasConsumedButton: true,
                  hasExpiredButton: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
