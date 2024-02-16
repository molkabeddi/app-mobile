import 'package:flutter/material.dart';
import 'package:pfa2/components/login_form.dart';
import 'package:pfa2/utils/config.dart';
import 'package:pfa2/utils/text.dart';
import 'package:pfa2/components/social_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    String welcomeText = AppText.enText['Welcome'] ?? ' Welcome';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                welcomeText,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              Text(
                AppText.enText['signIn_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              // Utilisation de `const` pour déclarer un widget constant
              const LoginForm(),
              Config.spaceSmall,
              Text(
                AppText.enText['forgot-password']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Ajout d'un espace flexible (Spacer) pour pousser le texte vers le bas
              const Spacer(),
              Center(
                child: Text(
                  AppText.enText['social-login']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey, // Correction du nom de la couleur
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  SocialButton(social: 'google'),
                  SocialButton(social: 'facebook'),
                ],
              ),
              Config.spaceSmall, // Espace supplémentaire ajouté ici
            ],
          ),
        ),
      ),
    );
  }
}
