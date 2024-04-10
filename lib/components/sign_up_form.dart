import 'package:flutter/material.dart';
import 'package:pfa2/components/button.dart';
import 'package:pfa2/components/snack_bar.dart';
import 'package:pfa2/models/snack_bar_types.dart';
import 'package:pfa2/providers/auth_service.dart';
import 'package:pfa2/utils/config.dart' as config;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            cursorColor: config.Config.primaryColor, // Utilisation de l'alias config
            decoration: const InputDecoration(
              hintText: 'Username',
              labelText: 'Username',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.person_outlined),
              prefixIconColor: config.Config.primaryColor, // Utilisation de l'alias config
            ),
          ),
          config.Config.spaceSmall, // Utilisation de l'alias config
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: config.Config.primaryColor, // Utilisation de l'alias config
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: config.Config.primaryColor, // Utilisation de l'alias config
            ),
          ),
          config.Config.spaceSmall, // Utilisation de l'alias config
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: config.Config.primaryColor, // Utilisation de l'alias config
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: config.Config.primaryColor, // Utilisation de l'alias config
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePass = !obsecurePass;
                  });
                },
                icon: obsecurePass
                    ? const Icon(Icons.visibility_off_outlined, color: Colors.black38)
                    : const Icon(Icons.visibility_outlined, color: config.Config.primaryColor), // Utilisation de l'alias config
              ),
            ),
          ),
          config.Config.spaceSmall, // Utilisation de l'alias config
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Button(
                  width: double.infinity,
                  title: 'Sign Up',
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    final userRegistration =
                        await AuthServices().register(_nameController.text, _emailController.text, _passController.text);

                    // If registration is successful, proceed to login
                    if (userRegistration) {
                      Navigator.of(context).pushNamed('/main');
                    } else {
                      SnackBars(
                        label: "Email already exists",
                        type: SnackBarsTypes.alert,
                        onTap: () {},
                        actionLabel: "Close",
                      ).showSnackBar(context);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  disable: false,
                )
        ],
      ),
    );
  }
}
