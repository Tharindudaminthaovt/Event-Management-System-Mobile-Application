import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/events/profile_widget.dart';
import 'package:test_app/events/user_preferences.dart';
import 'package:test_app/events/user_profile.dart';
import 'package:test_app/pages/editing_profile_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _logOut() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Logout?',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Do you want to log out?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            elevation: 24.0,
            icon: Icon(Icons.logout),
            iconColor: Colors.white,
            backgroundColor: Color(0xff7270C2),
            actions: [
              MaterialButton(
                  child: Text('Ok',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    print("Clicked");
                  }),
              MaterialButton(
                  child: Text('Cancel',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Color(0xffECECFE),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 65,
          ),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
              //setState(() {});
            },
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Text(
              user.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff4B38AC)),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff4B38AC)),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    user.address,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff4B38AC)),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Contact Number',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff4B38AC)),
                ),
                Text(
                  user.contactno,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFC8E94)),
                      onPressed: _logOut,
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
