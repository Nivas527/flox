import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String gender = 'Select Gender';

  @override
  void initState() {
    super.initState();
    // Set initial values
    nameController.text = 'Harry';
    emailController.text = 'harry123@gmail.com';
    phoneController.text = '1234567890';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true, // Center the title
                    title: Text(
                      'User Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                    ],
                  ),
                ],
              ),
            ),
            // Main content over the background
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // AppBar aligned at the top using SafeArea
                  SizedBox(height: 100),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 52,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  buildTextField('Name', nameController, false),
                  buildTextField('Contact Number', phoneController, true),
                  buildTextField('E-mail ID', emailController, false),
                  buildDropdownButton(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Update action
                      print('User profile updated');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        maxLines: maxLines, // Set maximum lines for address
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          hintStyle: TextStyle(color: Colors.grey), // Hint text style
          hintMaxLines: 1, // Ensure hint stays on a single line
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: isPhone || labelText == 'E-mail ID'
              ? TextButton(
                  onPressed: () {
                    // Handle change action
                  },
                  child: Text('CHANGE', style: TextStyle(color: Colors.red)),
                )
              : null,
        ),
      ),
    );
  }

  Widget buildDropdownButton() {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.black,
      value: gender,
      items: ['Select Gender', 'Male', 'Female', 'Other'].map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(
            gender,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (String? newGender) {
        setState(() {
          gender = newGender!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Gender',
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}