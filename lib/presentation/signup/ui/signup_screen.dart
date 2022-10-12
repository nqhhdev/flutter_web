import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/signup/ui/widget/signup_body_widget.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 650,
            padding: const EdgeInsets.only(top: 20),
            child: SignUpBodyWidget(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              nameController: _nameController,
            ),
          ),
        ),
      ),
    );
  }
}
