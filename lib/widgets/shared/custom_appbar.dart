import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const Icon(
              Icons.movie_outlined,
              color: Colors.indigo,
            ),
            const SizedBox(width: 5),
            const Text(
              'Cinemapedia',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
      ),
    ));
  }
}
