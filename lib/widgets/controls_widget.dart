import 'package:flutter/material.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;
  final VoidCallback onClickedScanImage;

  const ControlsWidget({
    required this.onClickedPickImage,
    required this.onClickedScanText,
    required this.onClickedClear,
    required this.onClickedScanImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: onClickedPickImage,
                  child: const Text('Pick Image')),
              ElevatedButton(
                  onPressed: onClickedScanImage,
                  child: const Text('Scan Image')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: onClickedScanText,
                  child: const Text('Scan For Text')),
              ElevatedButton(
                  onPressed: onClickedClear, child: const Text('Clear'))
            ],
          ),
        ],
      );
}
