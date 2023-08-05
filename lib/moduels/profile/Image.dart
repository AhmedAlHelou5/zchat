import 'package:flutter/material.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

class ImageProfileScreen extends StatelessWidget {
  const ImageProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.count(
        crossAxisCount: 3,
        // shrinkWrap: true,
        children: List.generate(20, (i) => GridAnimatorWidget(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey,
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),).toList()
    );
  }
}
