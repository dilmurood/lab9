import 'package:flutter/material.dart';
import 'package:lab_9/MainScreen.dart';
import 'package:lab_9/db_helper.dart';
import 'package:lab_9/widgets/customTextFields.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Center(
              child: Icon(
                Icons.person, // Change this to your preferred icon
                size: 100, // Change this to your preferred size
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            customTextFields(labelText: 'username'),
            const SizedBox(
              height: 20,
            ),
            customTextFields(labelText: 'email'),
            const SizedBox(
              height: 20,
            ),
            customTextFields(labelText: 'password'),
            const SizedBox(
              height: 20,
            ),
            customTextFields(labelText: 'phone'),
            const SizedBox(
              height: 20,
            ),
            customTextFields(labelText: 'address'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Create a User object from the input data
                    User user = User(
                      username: customTextFields(labelText: 'username')
                          .getController(),
                      password: customTextFields(labelText: 'password')
                          .getController(),
                      phone:
                          customTextFields(labelText: 'phone').getController(),
                      email:
                          customTextFields(labelText: 'email').getController(),
                      address: customTextFields(labelText: 'address')
                          .getController(),
                    );

                    // Save the user data to the database
                    DBHelper dbHelper = DBHelper();
                    await dbHelper.saveUser(user);

                    // Show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User data saved')));
                    await dbHelper.test_read('user.db');
                  }
                },
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                child: const Text('Submit', style: TextStyle(color: Colors.white),),

              ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
            }, 
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),
            child: const Text('Next', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),)
    );
  }
}
