import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbap_part2/widgets/item_details_widget.dart';

class PantryInventory extends StatelessWidget {
  const PantryInventory({super.key});

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
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'Sister has leftovers from lunch',
        'description': '"Couldn\'t finish this..might eat later"',
        'image': 'images/leftover_bluebowl.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(181, 211, 131, 131),
      },
      {
        'title': 'Dad bought milk',
        'description': 'Done as requested by mom..',
        'image': 'images/meiji_milk.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
      {
        'title': 'Mom bought yogurt',
        'description': 'Eat these with fruits!!',
        'image': 'images/chobani_yogurt.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
      {
        'title': 'I bought ice cream',
        'description': 'Bought for everyone to share!!',
        'image': 'images/ben_jerry.png',
        'consumed': true,
        'quantity': 2,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
      {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
      {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
       {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
       {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
       {
        'title': 'I bought milo',
        'description': 'Bought for everyone to share!!',
        'image': 'images/milo_resized.png',
        'consumed': true,
        'quantity': 1,
        'bgColor': const Color.fromARGB(122, 75, 194, 59),
      },
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(94, 170, 102, 1.0),
        shape: CircleBorder(),
        child: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
      ),
      backgroundColor: Color.fromRGBO(30, 80, 42, 1.0), // Dark green background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'Our Pantry',
              style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(211, 212, 172, 1.0),
              ),
            ),
            SizedBox(width: 10),
            Icon(
              FontAwesomeIcons.utensils,
              color: Color.fromRGBO(211, 212, 172, 1.0),
              size: 30,
            ),
            Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pantry_editor');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA3B18A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Color.fromRGBO(211, 212, 172, 1.0),
                    width: 2, // Border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                minimumSize: const Size(100, 50),
              ),
              child: const Text(
                'Add Item',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
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
                  quantity: item['quantity'],
                  bgColor: item['bgColor'],
                  hasConsumedButton: true,
                  hasEditButton: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
