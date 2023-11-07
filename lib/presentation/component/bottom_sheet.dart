import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final VoidCallback onPressLeft;
  final VoidCallback onPressRight;
  final int currentIndex;

  const CustomBottomSheet({
    Key? key,
    required this.onPressLeft,
    required this.onPressRight,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          backgroundColor: const Color(0x00ffffff),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "left",
              icon: IconButton(
                onPressed: onPressLeft,
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 25,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "1",
              icon: (currentIndex == 0)
                  ? const Icon(
                      Icons.circle,
                      size: 20,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      size: 20,
                    ),
            ),
            BottomNavigationBarItem(
              label: "2",
              icon: (currentIndex == 1)
                  ? const Icon(
                      Icons.circle,
                      size: 20,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      size: 20,
                    ),
            ),
            BottomNavigationBarItem(
              label: "3",
              icon: (currentIndex == 2)
                  ? const Icon(
                      Icons.circle,
                      size: 20,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      size: 20,
                    ),
            ),
            BottomNavigationBarItem(
              label: "right",
              icon: IconButton(
                onPressed: onPressRight,
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
