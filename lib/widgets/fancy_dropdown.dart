import 'package:flutter/material.dart';

class FancyDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hint;
  final void Function(String?)? onChanged;

  const FancyDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint = 'Select an option',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        icon: Icon(
          Icons.arrow_drop_down_circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        elevation: 16,
        isExpanded: true,
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        hint: Text(
          hint,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
} 