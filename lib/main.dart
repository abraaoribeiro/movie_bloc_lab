import 'package:flutter/material.dart';
import 'package:movie_bloc_lab/app.dart';
import 'package:movie_bloc_lab/config/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MovieApp());
}
