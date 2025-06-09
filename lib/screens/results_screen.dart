import 'package:flutter/material.dart';
import 'dart:math';
import '../models/user_profile.dart';
import '../models/jahez_calculation.dart';
import '../widgets/decorative_pattern.dart';
import 'final_screen.dart';

class ResultsScreen extends StatelessWidget {
  final UserProfile userProfile;
  
  const ResultsScreen({
    super.key,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the jahez result
    final jahezResult = calculateJahez(userProfile);
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Your Jahez Results',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          const DecorativePattern(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Based on your profile",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Here's Your Jahez Calculation",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.amber,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            size: 14,
                            color: Colors.amber[800],
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              "This app aims to raise awareness against dowry practices. Demanding or giving dowry is prohibited by law in Pakistan. We don't support any dowry practices.",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.amber[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Money section
                    if (jahezResult.money > 0) ...[
                      _buildResultCard(
                        context,
                        'Money',
                        'PKR ${jahezResult.money.toStringAsFixed(0)}',
                        Icons.attach_money,
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    // Vehicle section
                    if (jahezResult.vehicle.isNotEmpty) ...[
                      _buildResultCard(
                        context,
                        'Vehicle',
                        jahezResult.vehicle,
                        Icons.directions_car,
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    // Property section
                    if (jahezResult.property.isNotEmpty) ...[
                      _buildResultCard(
                        context,
                        'Property',
                        jahezResult.property,
                        Icons.home,
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    // Items section
                    if (jahezResult.items.isNotEmpty) ...[
                      _buildResultCard(
                        context,
                        'Items',
                        jahezResult.items.join(', '),
                        Icons.shopping_bag,
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    const SizedBox(height: 40),
                    
                    // Call to action button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FinalScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                        child: const Text(
                          "Get Your Jahez Right Now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildResultCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
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
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 