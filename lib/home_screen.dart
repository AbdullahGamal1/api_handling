import 'package:apis/cubit/my_cubit.dart';
import 'package:apis/cubit/result_stat.dart';
import 'package:apis/network_exceptions.dart';
import 'package:apis/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> userList = [];
  User user = User();
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUser();
    // BlocProvider.of<MyCubit>(context).emitGetUserDetails(5848526);
    BlocProvider.of<MyCubit>(context).myRepo.createNewUser(User(
        name: 'Abdullah Gamal',
        email: 'abdullah.gamaal55933@hotmail.com',
        gender: 'male',
        status: 'active'));
    // BlocProvider.of<MyCubit>(context).myRepo.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          BlocBuilder<MyCubit, ResultState<User>>(
            builder: (context, ResultState<User> state) {
              return state.when(
                idle: () {
                  return const Center(child: CircularProgressIndicator());
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (User userData) {
                  return Container(
                    height: 50,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      userData.email.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
                  );
                },
                error: (NetworkExceptions error) {
                  return Center(
                      child: Text(NetworkExceptions.getErrorMessage(error)));
                },
              );
            },
          ),

          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetUserDetails) {
          //       user = (state).userDetails;
          //       return  Container(
          //               height: 50,
          //               color: Colors.amberAccent,
          //               child: Center(
          //                   child: Text(user.name.toString())),
          //             );
          //     } else {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )

          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is CreatNewUser) {
          //       user = (state).newUser;
          //       return Container(
          //         height: 50,
          //         color: Colors.amberAccent,
          //         child: Center(child: Text(user.name.toString())),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )

          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is DeleteUser) {
          //       // user = (state).newUser;
          //       return Container(
          //         height: 50,
          //         color: Colors.amberAccent,
          //         child: Center(child: Text(state.data.toString())),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
