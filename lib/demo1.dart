import 'package:fitness/custom/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dispute extends StatefulWidget {
  const Dispute({super.key});

  @override
  State<Dispute> createState() => _DisputeState();
}

class _DisputeState extends State<Dispute> {
  String? selectedValue;
  final List<String> options = [
    "Customer denies to take the delivery",
    "Customer doesn't reside on given address",
    "Property is locked"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "You have selected Oven for delivery:",
              fontSize: 4,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 15),
            CustomText(
              text: "Please select anyone of the below scenarios:",
              fontSize: 4,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: options
                  .map(
                    (option) => RadioListTile<String>(
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 12),
                  ),
                  value: option,
                  groupValue: selectedValue,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0), // Reduces left padding
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
