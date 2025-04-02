import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/shoes_provider.dart';
import 'repositories/shoes_repository.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()  async{

// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  final ShoesRepository repository = FirebaseShoesRepository();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ShoesProvider(repository),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    ),
  );
}
