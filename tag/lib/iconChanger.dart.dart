import "package:flutter/material.dart";

class IconChanger extends StatefulWidget {
  const IconChanger({super.key});

  @override
  State<IconChanger> createState() => _IconChangerState();
}

class _IconChangerState extends State<IconChanger> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      icon: isPressed ? const Icon(Icons.pin) : const Icon(Icons.schedule),
    );
  }
}
