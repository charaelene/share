import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbap_part2/widgets/item_details_widget.dart';
import 'package:mbap_part2/widgets/quick_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> latestItems = [
    {
      "title": "Mom bought yogurt",
      "description": "Eat these with fruits!!",
      "image": "images/chobani_yogurt.png",
    },
    {
      "title": "Dad bought milk",
      "description": "Done as requested by mom..",
      "image": "images/meiji_milk.png",
    },
    {
      "title": "I bought Ice Cream",
      "description": "Bought for everyone to share!!",
      "image": "images/ben_jerry.png",
    },
    {
      "title": "I bought Ice Cream",
      "description": "Bought for everyone to share!!",
      "image": "images/ben_jerry.png",
    },
    {
      "title": "I bought Ice Cream",
      "description": "Bought for everyone to share!!",
      "image": "images/ben_jerry.png",
    },
  ];

  Future<List<Map<String, dynamic>>> fetchLatestItems() async {
    await Future.delayed(Duration(seconds: 3)); // simulate delay
    return latestItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        child: FaIcon(
          FontAwesomeIcons.rightFromBracket,
          color: Color.fromRGBO(211, 212, 172, 1.0),
          size: 40,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(30, 80, 42, 1.0)),
        child: Column(
          children: [
            Text(
              "Welcome Back,",
              style: TextStyle(
                color: Color.fromRGBO(211, 212, 172, 1.0),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "PantryBuddy,",
              style: TextStyle(
                color: Color.fromRGBO(211, 212, 172, 1.0),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(211, 212, 172, 1.0),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Total Leftovers:",
                    style: TextStyle(
                      color: Color.fromRGBO(46, 94, 55, 1.0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "4",
                    style: TextStyle(
                      color: Color.fromRGBO(46, 94, 55, 1.0),
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuickNavigationWidget(
                    onPressed:
                        () => Navigator.pushNamed(context, '/pantry_editor'),
                    icon: FontAwesomeIcons.plus,
                    label: "Add Item",
                    bgColor: Color.fromRGBO(170, 210, 191, 1.0),
                  ),
                  QuickNavigationWidget(
                    onPressed:
                        () => Navigator.pushNamed(context, '/pantry_inventory'),
                    icon: FontAwesomeIcons.utensils,
                    label: "Pantry",
                    bgColor: Color.fromRGBO(170, 210, 170, 1.0),
                  ),
                  QuickNavigationWidget(
                    icon: FontAwesomeIcons.clock,
                    label: "Expiring",
                    bgColor: Color.fromRGBO(210, 184, 170, 1.0),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Recents:",
                  style: TextStyle(
                    color: Color.fromRGBO(211, 212, 172, 1.0),
                    fontSize: 26.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/blurred_food_background.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: FutureBuilder(
                  future: fetchLatestItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(
                              color: Color.fromRGBO(211, 212, 172, 1.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Loading...',
                              style: TextStyle(
                                color: Color.fromRGBO(211, 212, 172, 1.0),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ); // Loading spinner
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return ItemDetailsWidget(
                            bgColor: Color.fromRGBO(211, 212, 172, 0.6),
                            image: item['image'],
                            title: item['title'],
                            description: item['description'],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
