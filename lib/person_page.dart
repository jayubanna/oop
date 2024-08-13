import 'package:dart_day1/task_page.dart';
import 'package:flutter/material.dart';

class User {
  String _username;
  String _password;

  User(this._username, this._password);

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get password => _password;

  set password(String value) {
    if (value.length >= 8) {
      _password = value;
    } else {
      _password = 'Invalid password';
    }
  }
}

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final _formKey = GlobalKey<FormState>();
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = User('Jayveer', 'password15856');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TaskPage();
          }));
        },
        child: Icon(Icons.arrow_forward,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('User Info App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Username: ${_user.username}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Password: ${_user.password}',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                onSaved: (value) => _user.username = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                onSaved: (value) => _user.password = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    setState(() {

                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("not save successfully..")),
                    );
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
