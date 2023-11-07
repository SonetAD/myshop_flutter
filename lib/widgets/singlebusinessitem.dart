import 'package:flutter/material.dart';

class SingleBusinessItem extends StatelessWidget {
  final String title;
  final String url;

  const SingleBusinessItem(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      title: Text(title),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ]),
    );
  }
}
