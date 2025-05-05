import 'package:flutter/material.dart';

AppBar addPostAppBar(BuildContext context) => AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(100)),
            child: Text('Public'),
          ),
        )
      ],
    );
