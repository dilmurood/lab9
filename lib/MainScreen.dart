import 'package:flutter/material.dart';
import 'package:lab_9/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List<User> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main Screen"),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return ListTile(
              leading: Text(data[index].username),
              title: Text(
                  data[index].address +
                  data[index].phone),
              trailing: Text(data[index].email),
              
            );
          },
        )));
  }
  @override
  void initState() {
    super.initState();
    _fetchUsers(); // Fetch all users when the screen loads
  }
  Future<void> _fetchUsers() async {
    // Fetch all users from DBHelper
    DBHelper dbHelper = DBHelper();
    List<User> fetchedUsers =
        (await dbHelper.test_read('users.db')).cast<User>();

    setState(() {
      data = fetchedUsers;
    });
  }
}
