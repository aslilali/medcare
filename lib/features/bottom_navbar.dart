import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  bool _showExtraButtons = false;

  void _toggleExtraButtons() {
    setState(() {
      _showExtraButtons = !_showExtraButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // NAVIGATION BACKGROUND
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'lib/images/navigation.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // HOME BUTTON
          Positioned(
            left: 90,
            bottom: 22,
            child: ImageButton(
              assetPath: 'lib/images/Home.png',
              onTap: () {
                Navigator.pushNamed(context, 'homescreen');
              },
            ),
          ),

          // NOTES BUTTON
          Positioned(
            right: 90,
            bottom: 22,
            child: ImageButton(
              assetPath: 'lib/images/Notes.png',
              onTap: () {
                // TODO: Notes functionality
              },
            ),
          ),

          // TOGGLABLE CENTER BUTTON (+ or X)
          Positioned(
            bottom: 20,
            child: ImageButton(
              assetPath:
                  _showExtraButtons
                      ? 'lib/images/ButtonClose.png' // this should be the X button image
                      : 'lib/images/ButtonPlus.png', // this is the default +
              width: 105,
              height: 105,
              borderRadius: 52,
              onTap: _toggleExtraButtons,
            ),
          ),

          // FIVE EXTRA BUTTONS (ONLY WHEN TOGGLED)
          if (_showExtraButtons) ...[
            // PROFILE BUTTON
            Positioned(
              bottom: 100,
              child: ImageButton(
                assetPath: 'lib/images/Profile.png',
                onTap: () {
                  // TODO: Profile functionality
                },
              ),
            ),

            // HEART BUTTON
            Positioned(
              bottom: 100,
              right: 60,
              child: ImageButton(
                assetPath: 'lib/images/Heart.png',
                onTap: () {
                  // TODO: Heart functionality
                },
              ),
            ),

            // SYRINGE BUTTON
            Positioned(
              bottom: 100,
              right: 120,
              child: ImageButton(
                assetPath: 'lib/images/Syringe.png',
                onTap: () {
                  // TODO: Syringe functionality
                },
              ),
            ),

            // CARDIOGRAM BUTTON
            Positioned(
              bottom: 100,
              left: 60,
              child: ImageButton(
                assetPath: 'lib/images/Cardiogram.png',
                onTap: () {
                  // TODO: Cardiogram functionality
                },
              ),
            ),

            // MEDICINES BUTTON
            Positioned(
              bottom: 100,
              left: 120,
              child: ImageButton(
                assetPath: 'lib/images/Medicines.png',
                onTap: () {
                  // TODO: Medicines functionality
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// REUSABLE BUTTON WIDGET
class ImageButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double borderRadius;

  const ImageButton({
    required this.assetPath,
    required this.onTap,
    this.width = 36,
    this.height = 36,
    this.borderRadius = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Image.asset(assetPath, width: width, height: height),
      ),
    );
  }
}
