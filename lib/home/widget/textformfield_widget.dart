import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
   TextFormFieldWidget({super.key});

  TextEditingController searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(Icons.search_rounded),
        hintText: 'Search which is you like food',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
