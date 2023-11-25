import 'package:flutter/material.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.025,
        ),
        SizedBox(
          width: width * 0.9,
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            child: Container(
              height: height * 0.25,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bus Details",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bus Id",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "12312",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bus Type",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Your MOM",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bus Number",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "12312",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ])
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.025,
        ),
        SizedBox(
          width: width * 0.9,
          height: height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: width * 0.43,
                  child: FilledButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Update Availabel",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ))),
              SizedBox(
                width: width * 0.43,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    "View Passengers",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
