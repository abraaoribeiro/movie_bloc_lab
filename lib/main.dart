import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc_lab/app.dart';
import 'package:movie_bloc_lab/app_oberver.dart';
import 'package:movie_bloc_lab/config/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  BlocOverrides.runZoned(() => runApp(const MovieApp()),
    blocObserver: MovieAppObserver());
}
