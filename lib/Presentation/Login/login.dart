// ignore_for_file: non_constant_identifier_names

import 'package:conductor_app/Business%20Logic/Login/bloc/login_bloc.dart';
import 'package:conductor_app/Business%20Logic/Network/bloc/network_bloc.dart';
import 'package:conductor_app/Data/Repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController conductoridController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DraggableScrollableController controller = DraggableScrollableController();
    final TextTheme textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(loginRepository: LoginRepository())),
        BlocProvider<NetworkBloc>(
            create: (context) => NetworkBloc()..add(ListenNetwork()))
      ],
      child: BlocListener<NetworkBloc, NetworkState>(
          listener: (context, state) {
            if (state is NetworkFailure) {
              BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
                  conductorId: conductoridController.text,
                  password: passwordController.text));
              Navigator.pushNamed(context, '/dashboard');
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
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
                          snapSizes: const [0.13, 0.6],
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
                                            if (controller.pixels >
                                                controller.sizeToPixels(0.13)) {
                                              controller.animateTo(0.13,
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.linear);
                                            } else {
                                              controller.animateTo(0.6,
                                                  duration: const Duration(
                                                      milliseconds: 200),
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
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Color.fromARGB(
                                                    255, 191, 190, 190),
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
                                              padding:
                                                  EdgeInsets.all(width * 0.07),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  TextField(
                                                    controller:
                                                        conductoridController,
                                                    obscureText: false,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText:
                                                                "Conductor Id",
                                                            border:
                                                                UnderlineInputBorder()),
                                                  ),
                                                  TextField(
                                                    controller:
                                                        passwordController,
                                                    obscureText: true,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText:
                                                                "Password",
                                                            border:
                                                                UnderlineInputBorder()),
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
                Builder(builder: (context) {
                  return Positioned(
                    right: width * 0.1,
                    bottom: height * 0.0275,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.pixels > controller.sizeToPixels(0.13)) {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginSubmitted(
                                  conductorId: conductoridController.text,
                                  password: passwordController.text));
                        } else {
                          controller.animateTo(0.6,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.8, height * 0.07)),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushNamed(context, '/dashboard',
                                arguments: {
                                  'ConductorID': conductoridController.text,
                                  'password': passwordController.text
                                });
                          } else if (state is LoginFailure) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Login failure"),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 2),
                            ));
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator();
                          }
                          return const Text('Login');
                        },
                      ),
                    ),
                  );
                  // );
                }),
              ],
            ),
          )),
    );
  }
}
