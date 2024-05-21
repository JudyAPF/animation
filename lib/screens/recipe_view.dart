import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeViewScreen extends StatefulWidget {
  RecipeViewScreen(this.recipe, {super.key});

  Recipe recipe;

  @override
  State<RecipeViewScreen> createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.recipe.isFavorite = !widget.recipe.isFavorite;
              });
            },
            icon: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              transitionBuilder: (child, animation) {
                // return ScaleTransition(
                //   scale: animation,
                //   child: child,
                // );
                return RotationTransition(turns: Tween<double>(begin: 0,end: 20).animate(animation), child: child);
              }, 
              child: Icon(
                widget.recipe.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline,
                key: ValueKey(widget.recipe.isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: widget.recipe.imageUrl == null
                  ? const Center(
                      child: Text('No Image'),
                    )
                  : Hero(
                      tag: widget.recipe.id,
                      child: Image.network(
                        widget.recipe.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.recipe.ingredients != null)
            ...widget.recipe.ingredients!
                .map((item) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text('• $item'),
                    ))
                .toList()
          else
            Text('No Ingredients'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              'Steps',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.recipe.steps != null)
            ...widget.recipe.steps!
                .map(
                  (item) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item),
                    ),
                  ),
                )
                .toList()
          else
            Text('No Steps'),
        ],
      ),
    );
  }
}
