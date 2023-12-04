import 'package:flutter/material.dart';

class LoadPages extends StatefulWidget {
  const LoadPages({super.key});

  @override
  State<LoadPages> createState() => _LoadPagesState();
}

class _LoadPagesState extends State<LoadPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // RefreshProgressIndicator(),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Carregando....",
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
