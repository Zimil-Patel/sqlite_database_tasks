import 'package:flutter/material.dart';
import '../home screen/components/search_button.dart';
import 'components/category_list_view.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter by category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),

        actions: const [
          SearchButton(),
        ],
      ),


      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [

            // CATEGORY LIST
            CategoryListView(),


            // SELECTED CATEGORY RESULT

          ],
        ),
      ),
    );
  }
}
