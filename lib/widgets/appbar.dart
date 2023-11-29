import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.onProfilePressed,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onProfilePressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Column(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      tileMode: TileMode.clamp,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Color.fromRGBO(11, 240, 255, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 75,
                  child: Text(
                    'Shivam Raj,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Container(
          margin: const EdgeInsets.only(
              right: 20.0, left: 8.0, top: 8.0, bottom: 8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.person),
            onPressed: onProfilePressed,
            color: const Color.fromRGBO(11, 240, 255, 1),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
