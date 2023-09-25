import 'package:flutter/material.dart';

Widget customButton({
  required VoidCallback onTap,
  required Image image,
  required Color color,})
{
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(360),
      ),
      child: image,
    ),
  );
}