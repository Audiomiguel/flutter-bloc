import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<UsernameCubit>(),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => getIt<RouterSimpleCubit>(),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => getIt<CounterCubit>(),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => getIt<ThemeCubit>(),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => getIt<GuestsBloc>(),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => getIt<PokemonBloc>(),
        lazy: false,
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // se cambió el router read a watch porque puede cambiar
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
    );
  }
}
