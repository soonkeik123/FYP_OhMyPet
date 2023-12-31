import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ohmypet/utils/colors.dart';
import 'package:ohmypet/widgets/admin_header.dart';
import 'package:ohmypet/widgets/admin_navigation_bar.dart';

class LoyaltyManagement extends StatefulWidget {
  static const routeName = '/loyaltyManagement';
  const LoyaltyManagement({super.key});

  @override
  State<LoyaltyManagement> createState() => _LoyaltyManagementState();
}

class _LoyaltyManagementState extends State<LoyaltyManagement> {
  // Create a reference to Firebase database
  late DatabaseReference profileRef;

  String staffName = "";
  String staffEmail = "";
  String staffRole = "";
  String staffID = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController servIDController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    User? staff = FirebaseAuth.instance.currentUser;
    if (staff != null) {
      String sid = staff.uid;
      profileRef = FirebaseDatabase.instance
          .ref()
          .child('staffs')
          .child(sid)
          .child('Profile');
      getStaffByID(sid);
    }
  }

  // Get a specific user data by ID
  Future<void> getStaffByID(String UID) async {
    final snapshot = await profileRef.get();
    if (snapshot.exists) {
      Map<dynamic, dynamic> staffData = snapshot.value as Map;

      // Access individual properties of the user data
      String name = staffData['full_name'];
      String role = staffData['role'];
      String email = staffData['email'];
      String id = UID;

      setState(() {
        staffName = name;
        staffRole = role;
        staffEmail = email;
        staffID = id;
      });
    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const AdminHeader(pageTitle: "MANAGE LOYALTY"),

            // Body content
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 640,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Search user
                  const Text(
                    "Search User",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Textfield for user email
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter user email',
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  // Reservation ID
                  const Text(
                    "Resv. ID / Serv. ID",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Textfield
                  TextField(
                    controller: servIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter ID',
                      labelText: 'Reservation ID / Service ID',
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  // Reservation ID
                  const Text(
                    "Total Point",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Textfield
                  TextField(
                    controller: pointController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Points',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Reservation ID
                  const Text(
                    "Reference",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: referenceController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Reason of adding',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // submit button
                  InkWell(
                    child: Container(
                      width: 160,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.mainColor),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _updateUserPoints();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AdminBottomNavBar(
        activePage: 1,
        role: staffRole,
      ),
    );
  }

  void showMessageDialog(
      BuildContext context, String titleText, String contentText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(contentText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void Clear() {
    emailController.clear();
    servIDController.clear();
    pointController.clear();
    referenceController.clear();
  }

  void _updateUserPoints() {
    // Check if all textfields are filled
    if (emailController.text.isNotEmpty) {
      if (servIDController.text.isNotEmpty) {
        if (pointController.text.isNotEmpty &&
            (int.parse(pointController.text) > 0)) {
          if (referenceController.text.isNotEmpty) {
            DatabaseReference ref =
                FirebaseDatabase.instance.ref().child('users');

            String uid = '';
            int currentPoint = 0;

            // Listen for the value event
            ref.onValue.listen((DatabaseEvent event) {
              // Access the DataSnapshot from the event
              DataSnapshot snapshot = event.snapshot;
              // Check if the snapshot's value is not null and is of type Map<dynamic, dynamic>
              if (snapshot.value != null) {
                // Convert the value to a Map<dynamic, dynamic>
                Map adminUsers = snapshot.value as Map;
                // Loop through the snapshot's children (admin users)
                // print('stage = $adminUsers'); // Checking purpose
                adminUsers.forEach((key, userData) {
                  var profileData = userData['Profile'];
                  if (profileData != null &&
                      profileData['email'] == emailController.text) {
                    // print(key); // Checking purpose
                    uid = key;
                    currentPoint = profileData['point'] as int;
                    // print('current point = $currentPoint'); // Checking purpose

                    // Accumulate the points become newPoint
                    int newPoint =
                        currentPoint + int.parse(pointController.text);

                    // print("NewPoint =  $newPoint");

                    DatabaseReference userRef = FirebaseDatabase.instance
                        .ref('users/$uid')
                        .child('Profile');
                    // Update the newPoint into the user's account
                    userRef.update({'point': newPoint}).then((value) {
                      print("Point updated successfully!");
                    }).catchError((error) {
                      print("Error updating point: $error");
                    });

                    // Identify the current user (staff/admin)
                    User? user = FirebaseAuth.instance.currentUser;
                    String executor = user!.uid;

                    // Prepare to post data to record this add point action
                    final loyaltyPointData = {
                      'user_id': uid,
                      'email': emailController.text,
                      'serv_id': servIDController.text,
                      'point': pointController.text,
                      'reference': referenceController.text,
                      'executor': executor,
                    };
                    Clear();
                    final newKey = FirebaseDatabase.instance
                        .ref()
                        .child('addLoyaltyRecord')
                        .push()
                        .key;

                    if (newKey != null) {
                      // Use the newKey to create a new node with the loyaltyPointData
                      FirebaseDatabase.instance
                          .ref()
                          .child('addLoyaltyRecord')
                          .child(newKey)
                          .set(loyaltyPointData)
                          .then((value) {
                        // Data is successfully stored in the database
                        print('Loyalty point data added successfully.');
                        showMessageDialog(context, "Points Added",
                            "You have added points into this account successfully!");
                        Clear();
                      }).catchError((error) {
                        // Handle any errors that occur during the process
                        showMessageDialog(context, "Fail to Add",
                            "You failed to add points to this account.");
                        print('Error adding loyalty point data: $error');
                      });
                    }
                  }
                });
              }
            });
          } else {
            // point empty
            showMessageDialog(context, "Reference Is Missing",
                "Please make sure you have entered the reason of cancellation.");
          }
        } else {
          // point empty
          showMessageDialog(context, "Point Is Missing/Negative",
              "Please make sure you have entered a positive number of points.");
        }
      } else {
        // serv empty
        showMessageDialog(context, "ID Is Missing",
            "Please make sure you have entered the relevant service's or reservation's ID.");
      }
    } else {
      // email empty
      showMessageDialog(context, "Email Is Missing",
          "Please make sure you have entered the customer's E-mail.");
    }
  }
}
