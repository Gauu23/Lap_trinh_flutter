import 'package:flutter/material.dart';
import 'package:kiemtra/profile/api.dart';
import 'package:kiemtra/profile/profile.dart';
import 'package:kiemtra/profile/user.dart';

class FormLogin extends StatefulWidget {
  FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  var _isHidden = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form đăng nhập", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: 'Tên người dùng',
                    prefixIcon: Icon(Icons.person),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Vui lòng nhập tên người dùng!';
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: 'Mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _isHidden = !_isHidden),
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _isHidden,

                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Vui lòng nhập mật khẩu!';
                    else if (value.length < 6)
                      return 'Vui lòng nhập mật khẩu dài hơn!';
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                try {
                  User user = await test_api.fetchLogin(
                    _usernameController.text,
                    _passwordController.text,
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Login success!')));
                  print("Login success!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Profile(user: user)),
                  );
                } catch (e) {
                  print("Login failed: $e");
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Login fail!')));
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Icon(Icons.login),
                  SizedBox(width: 8),
                  Text("Đăng nhập"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
