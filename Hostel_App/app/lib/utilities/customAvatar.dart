import 'package:flutter/material.dart';

class customAvatar extends StatelessWidget {
  const customAvatar(
      {super.key, required this.name, required this.url, this.radius});
  final String name;
  final String? url;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: url != null ? NetworkImage(url!) : null,
      child: url != null
          ? null
          : Text(
              getInitials(name),
              style: TextStyle(fontSize: radius, color: Colors.white),
            ),
    );
  }
}

String getInitials(String name) {
  List<String> words = name.split(" ");
  String initials = "";

  for (int i = 0; i < words.length && i < 2; i++) {
    initials += words[i][0];
  }

  return initials;
}
