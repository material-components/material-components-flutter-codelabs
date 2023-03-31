import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _EmailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            // TODO: Remove filled: true values (103)
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                // else if(){
                //   return 'Username is invalid';
                // }
                return null;
              },
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (_confirmPasswordController != _passwordController) {
                  return 'Confirm Password doesnʼt match Password';
                }
                return null;
              },
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: _EmailAddressController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Email Address',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                // TODO: Add a beveled rectangular border to CANCEL (103
                ElevatedButton(
                  child: const Text('SIGN UP'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
