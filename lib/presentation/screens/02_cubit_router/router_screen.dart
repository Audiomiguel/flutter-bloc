import 'package:blocs_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cubit + Go Router'),
        ),
        floatingActionButton: BlocBuilder<RouterSimpleCubit, GoRouter>(
          builder: (context, state) {
            return Container();
          },
        ));
  }
}
