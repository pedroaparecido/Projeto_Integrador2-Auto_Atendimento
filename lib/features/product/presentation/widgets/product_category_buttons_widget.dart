import 'package:flutter/material.dart';

import '../../../../core/fakes/category.dart';

class ProductCategoryButtonsWidget extends StatelessWidget {
  const ProductCategoryButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: fakeCategory.length,
                    itemBuilder: (context, index) => ElevatedButton(
                      onPressed: () {},
                      child: Text(fakeCategory[index]),
                    ),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
