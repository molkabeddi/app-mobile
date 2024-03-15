import 'package:flutter/material.dart';
import 'package:pfa2/utils/config.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key, required this.route}) : super(key: key);
  final String route;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(route);
          },
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset('assets/amanda.jpg'),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dr Ahmed ben amor",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'category',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text('4.5'),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text('Reviews'),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text('(20)'),
                          const Spacer(
                            flex: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
