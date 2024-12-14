import 'package:blocs_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit + Go Router'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<RouterSimpleCubit>().goBack();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 50,
          ),
        ));
  }
}
