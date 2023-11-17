import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    double keyboardSize = 0.0;
    DraggableScrollableController controller = DraggableScrollableController();
    final TextTheme textTheme = Theme.of(context).textTheme;
    bool expanded = false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('lib/Resources/Images/Designer.png'),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              )),
              child: DraggableScrollableSheet(
                  controller: controller,
                  initialChildSize: 0.13,
                  snap: true,
                  snapSizes: const [0.6],
                  minChildSize: 0.13,
                  maxChildSize: 0.6,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Container(
                        color: Theme.of(context).colorScheme.background,
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (expanded) {
                                      expanded = false;
                                      controller.animateTo(0.1,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.linear);
                                    } else {
                                      expanded = true;
                                      controller.animateTo(0.6,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.linear);
                                    }
                                  },
                                  child: Container(
                                    height: height * 0.1,
                                    width: width,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 5,
                                      width: width * 0.25,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color:
                                            Color.fromARGB(255, 191, 190, 190),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                SizedBox(
                                  height: height * 0.3,
                                  width: width * 0.8,
                                  child: Card(
                                    child: Container(
                                      padding: EdgeInsets.all(width * 0.07),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextField(
                                            obscureText: false,
                                            decoration: InputDecoration(
                                                labelText: "Conductor Id",
                                                border: UnderlineInputBorder()),
                                          ),
                                          TextField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                labelText: "Password",
                                                border: UnderlineInputBorder()),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0.05 * height),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        Positioned(
          right: width * 0.1,
          bottom: height * 0.0275,
          child: ElevatedButton(
            onPressed: () {
              if (expanded) {
                expanded = false;
                controller.animateTo(0.13,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              } else {
                expanded = true;

                controller.animateTo(0.6,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(width * 0.8, height * 0.07)),
            child: const Text("Login"),
          ),
        )
      ],
    );
  }
}
