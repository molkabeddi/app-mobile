import 'package:pfa2/utils/config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.social}) : super(key: key);

  final String social;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        side: const BorderSide(width: 1, color: Colors.black),
      ),
      onPressed: () {},
      child: SizedBox(
        width: Config.widthSize * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Supprimer l'image pour ne conserver que le texte
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                color: Color.fromARGB(255, 240, 28, 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
