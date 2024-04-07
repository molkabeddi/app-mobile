import 'package:flutter/material.dart';
import 'package:pfa2/components/button.dart';
import 'package:pfa2/components/snack_bar.dart';
import 'package:pfa2/models/snack_bar_types.dart';
import 'package:pfa2/providers/auth_service.dart';
import 'package:pfa2/utils/config.dart'; // Importez Config depuis le bon emplacement

// Import Provider package

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePass = !obsecurePass;
                  });
                },
                icon: obsecurePass
                    ? const Icon(Icons.visibility_off_outlined, color: Colors.black38)
                    : const Icon(Icons.visibility_outlined, color: Config.primaryColor),
              ),
            ),
          ),
          Config.spaceSmall,
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Button(
                  width: double.infinity,
                  title: 'Sign In',
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    //login here
                    final token = await AuthServices().login(_emailController.text, _passController.text);
                    if (token) {
                      Navigator.of(context).pushNamed('/main');
                    } else {
                      SnackBars(
                              label: "Wrong cridentials",
                              type: SnackBarsTypes.alert,
                              onTap: () {},
                              actionLabel: "Close",
                              context: context)
                          .showSnackBar();
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  disable: false,
                )
        ],
      ),
    );
  }
}
