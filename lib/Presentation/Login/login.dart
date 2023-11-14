import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Center(
                child: Image(
              image: const AssetImage('lib/Resources/Images/login.png'),
              height: height * 0.2,
              width: width * 0.5,
            )),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: Card(
                child: SizedBox(
                  height: height * 0.4,
                  width: width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.64,
                        height: height * 0.08,
                        child: const TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Conductor Id',
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.08),
                      SizedBox(
                        width: width * 0.64,
                        height: height * 0.08,
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.8, height * 0.08)),
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
// Text(
//             "data",
//             textAlign: TextAlign.center,
//             style: textTheme.bodyMedium,
//           )