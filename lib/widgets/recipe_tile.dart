import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepku/models/recipe.dart';
import 'package:resepku/pages/detail_page.dart';
import 'package:resepku/providers/favorite_provider.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<FavoriteProvider>().isFavorite(recipe);
    return ListTile(
      leading: CircleAvatar(child: Text(recipe.name[0])),
      title: Text(recipe.name),
      subtitle: Text(
        '${recipe.cuisine} • ${recipe.totalTimeMinutes} menit • ★ ${recipe.rating}',
      ),
      trailing: IconButton(
        tooltip: isFavorite ? 'Hapus dari favorit' : 'Tambah ke favorit',
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
        onPressed: () => context.read<FavoriteProvider>().toggle(recipe),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage(recipe: recipe)),
      ),
    );
  }
}
