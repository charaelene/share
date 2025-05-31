import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            SizedBox(width: 95),

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
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: item['bgColor'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quantity
                      Text(
                        '${item['quantity']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Image
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(item['image']),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 10),

                      // Text details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item['description'],
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
                          Icon(FontAwesomeIcons.penToSquare, size: 20),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
