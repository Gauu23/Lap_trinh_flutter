import 'package:flutter/material.dart';

class FormScreenDN extends StatefulWidget {
  @override
  State<FormScreenDN> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormScreenDN> {
  final _formKey = GlobalKey<FormState>();

  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Đăng nhập',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                inputContainer(
                  icon: Icons.person,
                  label: 'Tên người dùng',
                  hint: 'Nhập tên đăng nhập',
                  onSaved: (value) => username = value,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tên người dùng không được để trống';
                    }
                    if (value.trim().length < 3) {
                      return 'Tên người dùng phải ít nhất 1 ký tự';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                inputContainer(
                  icon: Icons.lock,
                  label: 'Mật khẩu',
                  hint: 'Nhập mật khẩu',
                  obscureText: true,
                  onSaved: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mật khẩu không được để trống';
                    }
                    if (value.length < 6) {
                      return 'Mật khẩu phải ít nhất 6 ký tự';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.login),
                  label: const Text("Đăng nhập"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đăng nhập thành công')));

      debugPrint('Username: $username');
      debugPrint('Password: $password');
    }
  }

  // ================= INPUT FIELD =================
  TextFormField inputContainer({
    required IconData icon,
    required String label,
    required String hint,
    bool obscureText = false,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
