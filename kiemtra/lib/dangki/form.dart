import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Đăng kí tài khoản',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              inputContainer(
                Icons.person,
                'Họ tên',
                'Nhập họ tên của bạn',
                (value) {
                  if (value == null || value.isEmpty) return 'Không được để trống';
                  return null;
                },
                (value) => fullName = value,
              ),
              SizedBox(height: 20),
              inputContainer(
                Icons.email,
                'Email',
                'Nhập Email của bạn',
                (value) {
                  if (value == null || value.isEmpty) return 'Không được để trống';
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return 'Email không hợp lệ';
                  return null;
                },
                (value) => email = value,
              ),
              SizedBox(height: 20),
              inputContainer(
                Icons.lock,
                'Mật khẩu',
                'Nhập mật khẩu của bạn',
                (value) {
                  if (value == null || value.isEmpty) return 'Không được để trống';
                  if (value.length < 6) return 'Mật khẩu tối thiểu 6 ký tự';
                  return null;
                },
                (value) => password = value,
              ),
              SizedBox(height: 20),
              inputContainer(
                Icons.lock,
                'Xác nhận mật khẩu',
                'Nhập lại mật khẩu của bạn',
                (value) {
                  if (value == null || value.isEmpty) return 'Không được để trống';
                  if (value != password) return 'Mật khẩu không trùng khớp';
                  return null;
                },
                (value) => confirmPassword = value,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Xin chào: $fullName\nEmail: $email',
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.person),
                label: Text("Đăng kí"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo TextFormField có validator và onSaved
  TextFormField inputContainer(
    IconData icon,
    String label,
    String hint,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  ) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      validator: validator,
      onSaved: onSaved,
      obscureText: label.toLowerCase().contains('mật khẩu'), // ẩn mật khẩu
    );
  }
}
