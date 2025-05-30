import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/textfield_widget.dart';
import '../widgets/dropdown_widget.dart';

class PantryEditor extends StatefulWidget {
  static const List<String> categoryList = [
    "Fruits",
    "Vegetables",
    "Dairy",
    "Meat",
  ];

  const PantryEditor({super.key});

  @override
  State<PantryEditor> createState() => _PantryEditorState();
}

class _PantryEditorState extends State<PantryEditor> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(94, 170, 102, 1.0),
              onPrimary: Colors.white,
              onSurface: Color.fromRGBO(44, 93, 54, 1.0),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromRGBO(44, 93, 54, 1.0),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(94, 170, 102, 1.0),
        shape: CircleBorder(),
        child: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(208, 210, 170, 1.0),
        title: Row(
          children: [
            Text(
              "Add Item",
              style: TextStyle(
                color: Color.fromRGBO(44, 93, 54, 1.0),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
              ),
            ),
            SizedBox(width: 10.0),
            Transform(
              transform: Matrix4.skewX(-0.2),
              child: Icon(
                Icons.emoji_emotions,
                color: Color.fromRGBO(44, 93, 54, 1.0),
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(208, 210, 170, 1.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image:
                      image != null
                          ? DecorationImage(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          )
                          : null,
                ),
                width: 180.0,
                height: 180.0,
                child:
                    image == null
                        ? Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: const Color.fromRGBO(94, 170, 102, 1.0),
                            size: 60,
                          ),
                        )
                        : null,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Add Photo",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(44, 93, 54, 1.0),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextfieldWidget(
              controller: productNameController,
              hintText: "Product Name",
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color.fromRGBO(94, 170, 102, 1.0),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: DropdownExample(
                hint: "Category",
                items: PantryEditor.categoryList,
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () => selectDate(context),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(94, 170, 102, 1.0),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
                child: Text(
                  selectedDate == null
                      ? 'Select Date'
                      : '${selectedDate!.toLocal()}'.split(' ')[0],
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextfieldWidget(
              controller: descriptionController,
              hintText: "Description",
              lines: 5,
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(94, 170, 102, 1.0),
                  visualDensity: VisualDensity.compact,
                  minimumSize: Size(150, 40),
                ),
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Color.fromRGBO(44, 93, 54, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}