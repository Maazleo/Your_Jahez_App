import 'dart:math';
import 'user_profile.dart';

class JahezResult {
  final double money;
  final String vehicle;
  final String property;
  final List<String> items;

  JahezResult({
    required this.money,
    required this.vehicle,
    required this.property,
    required this.items,
  });
}

// List of common household items
final List<String> _householdItems = [
  'Refrigerator',
  'Television',
  'Washing Machine',
  'Microwave Oven',
  'Air Conditioner',
  'Sofa Set',
  'Dining Table with Chairs',
  'Queen Size Bed',
  'Dressing Table',
  'Wardrobe',
  'Kitchen Utensils Set',
  'Dinner Set',
  'Kitchen Appliances Set',
  'Iron and Ironing Board',
  'Water Dispenser',
  'Vacuum Cleaner',
  'Home Theater System',
  'Jewelry Set',
  'Designer Clothes',
  'Laptop/Computer',
  'Electric Kettle',
  'Toaster',
  'Blender',
  'Pressure Cooker',
];

// Function to calculate jahez based on user profile
JahezResult calculateJahez(UserProfile profile) {
  final random = Random();
  
  // Initialize variables
  double money = 0;
  String vehicle = '';
  String property = '';
  List<String> items = [];

  // Calculate money based on salary
  if (profile.salary.contains('Less than PKR 50,000')) {
    money = 50000 + random.nextDouble() * 50000;
  } else if (profile.salary.contains('PKR 50,000 - 100,000')) {
    money = 100000 + random.nextDouble() * 200000;
  } else if (profile.salary.contains('PKR 100,000 - 200,000')) {
    money = 300000 + random.nextDouble() * 300000;
  } else if (profile.salary.contains('PKR 200,000 - 500,000')) {
    money = 600000 + random.nextDouble() * 400000;
  } else if (profile.salary.contains('PKR 500,000 - 1,000,000')) {
    money = 1000000 + random.nextDouble() * 1000000;
  } else if (profile.salary.contains('Above PKR 1,000,000')) {
    money = 2000000 + random.nextDouble() * 3000000;
  }

  // Adjust money based on social class
  if (profile.socialClass.contains('Upper class')) {
    money *= 2;
  } else if (profile.socialClass.contains('Upper middle class')) {
    money *= 1.5;
  } else if (profile.socialClass.contains('Lower middle class')) {
    money *= 0.8;
  } else if (profile.socialClass.contains('Working class')) {
    money *= 0.6;
  }

  // Determine vehicle based on salary and vehicle ownership
  if (profile.vehicle.contains('Luxury car')) {
    if (random.nextBool()) {
      vehicle = 'Mercedes Benz E-Class';
    } else {
      vehicle = 'BMW 5 Series';
    }
  } else if (profile.vehicle.contains('SUV') || profile.vehicle.contains('Toyota')) {
    if (random.nextBool()) {
      vehicle = 'Toyota Fortuner';
    } else {
      vehicle = 'Honda Vezel';
    }
  } else if (profile.vehicle.contains('Honda')) {
    if (random.nextBool()) {
      vehicle = 'Honda City';
    } else {
      vehicle = 'Honda Civic';
    }
  } else if (profile.vehicle.contains('Suzuki')) {
    if (random.nextBool()) {
      vehicle = 'Suzuki Alto';
    } else {
      vehicle = 'Suzuki Cultus';
    }
  } else if (profile.vehicle.contains('Motorcycle')) {
    if (random.nextBool()) {
      vehicle = 'Honda 125';
    } else {
      vehicle = 'Yamaha YBR';
    }
  } else {
    // 50% chance to get a vehicle even if they don't own one
    if (money > 500000 && random.nextBool()) {
      vehicle = 'Suzuki Mehran';
    }
  }

  // Determine property based on salary and social class
  if (profile.socialClass.contains('Upper class') || 
      (profile.salary.contains('Above PKR 1,000,000') && random.nextBool())) {
    if (random.nextBool()) {
      property = '1 Kanal Plot in DHA';
    } else {
      property = 'Luxury Apartment in an Upscale Area';
    }
  } else if ((profile.socialClass.contains('Upper middle class') || 
              profile.salary.contains('PKR 500,000 - 1,000,000')) && 
             random.nextDouble() > 0.6) {
    if (random.nextBool()) {
      property = '10 Marla Plot in Bahria Town';
    } else {
      property = 'Apartment in a Good Area';
    }
  } else if ((profile.socialClass.contains('Middle class') || 
              profile.salary.contains('PKR 200,000 - 500,000')) && 
             random.nextDouble() > 0.8) {
    property = '5 Marla Plot in a Developing Society';
  }

  // Select random household items
  int numberOfItems = 5 + random.nextInt(10); // between 5-14 items
  List<String> availableItems = List<String>.from(_householdItems);
  for (int i = 0; i < numberOfItems && availableItems.isNotEmpty; i++) {
    int index = random.nextInt(availableItems.length);
    items.add(availableItems[index]);
    availableItems.removeAt(index);
  }

  // Adjust items based on social class
  if (profile.socialClass.contains('Upper class')) {
    if (!items.contains('Jewelry Set')) items.add('Jewelry Set');
    if (!items.contains('Designer Clothes')) items.add('Designer Clothes');
  }

  // Foreign residence gets more items
  if (profile.residence.contains('Foreign')) {
    money *= 1.5;
    if (vehicle.isEmpty && random.nextBool()) {
      vehicle = 'Toyota Corolla';
    }
  }

  // Adjust for marriage type
  if (profile.marriageType.contains('Love marriage')) {
    // Love marriages might get slightly less jahez in traditional contexts
    money *= 0.9;
  }

  return JahezResult(
    money: money,
    vehicle: vehicle,
    property: property,
    items: items,
  );
} 