import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../widgets/fancy_dropdown.dart';
import '../widgets/decorative_pattern.dart';
import 'results_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final PageController _pageController = PageController();
  final UserProfile _userProfile = UserProfile();
  int _currentPage = 0;
  final int _totalPages = 8;

  // Lists of options for each question
  final List<String> _ageOptions = [
    '18-22 years',
    '23-27 years',
    '28-32 years',
    '33-40 years',
    'Above 40 years',
  ];

  final List<String> _maritalStatusOptions = [
    'Never married',
    'Divorced',
    'Widowed',
    'Separated',
  ];

  final List<String> _professionOptions = [
    'Doctor',
    'Engineer',
    'Teacher',
    'Businessman',
    'Government Employee',
    'Banker',
    'IT Professional',
    'Lawyer',
    'Accountant',
    'Self-employed',
    'Other',
  ];

  final List<String> _socialClassOptions = [
    'Upper class',
    'Upper middle class',
    'Middle class',
    'Lower middle class',
    'Working class',
  ];

  final List<String> _salaryOptions = [
    'Less than PKR 50,000',
    'PKR 50,000 - 100,000',
    'PKR 100,000 - 200,000',
    'PKR 200,000 - 500,000',
    'PKR 500,000 - 1,000,000',
    'Above PKR 1,000,000',
  ];

  final List<String> _vehicleOptions = [
    'No vehicle',
    'Motorcycle',
    'Suzuki or similar car',
    'Honda Civic or similar car',
    'Toyota Corolla or similar car',
    'SUV or Crossover',
    'Luxury car (Mercedes, BMW, etc.)',
  ];

  final List<String> _marriageTypeOptions = [
    'Arranged marriage',
    'Love marriage',
    'Arranged-cum-love marriage',
  ];

  final List<String> _residenceOptions = [
    'Pakistan',
    'Foreign country',
  ];

  // Track selected options for each question
  String? _selectedAge;
  String? _selectedMaritalStatus;
  String? _selectedProfession;
  String? _selectedSocialClass;
  String? _selectedSalary;
  String? _selectedVehicle;
  String? _selectedMarriageType;
  String? _selectedResidence;

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Save all selections to user profile
      _userProfile.age = _selectedAge ?? '';
      _userProfile.maritalStatus = _selectedMaritalStatus ?? '';
      _userProfile.profession = _selectedProfession ?? '';
      _userProfile.socialClass = _selectedSocialClass ?? '';
      _userProfile.salary = _selectedSalary ?? '';
      _userProfile.vehicle = _selectedVehicle ?? '';
      _userProfile.marriageType = _selectedMarriageType ?? '';
      _userProfile.residence = _selectedResidence ?? '';

      // Navigate to results screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(userProfile: _userProfile),
        ),
      );
    }
  }

  bool _canMoveNext() {
    switch (_currentPage) {
      case 0:
        return _selectedAge != null;
      case 1:
        return _selectedMaritalStatus != null;
      case 2:
        return _selectedProfession != null;
      case 3:
        return _selectedSocialClass != null;
      case 4:
        return _selectedSalary != null;
      case 5:
        return _selectedVehicle != null;
      case 6:
        return _selectedMarriageType != null;
      case 7:
        return _selectedResidence != null;
      default:
        return false;
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Question ${_currentPage + 1} of $_totalPages',
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
          onPressed: _previousPage,
        ),
      ),
      body: Stack(
        children: [
          const DecorativePattern(),
          SafeArea(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // Age question
                _buildQuestionPage(
                  "What is your age?",
                  _ageOptions,
                  _selectedAge,
                  (value) {
                    setState(() {
                      _selectedAge = value;
                    });
                  },
                ),
                
                // Marital status question
                _buildQuestionPage(
                  "What is your marital status?",
                  _maritalStatusOptions,
                  _selectedMaritalStatus,
                  (value) {
                    setState(() {
                      _selectedMaritalStatus = value;
                    });
                  },
                ),
                
                // Profession question
                _buildQuestionPage(
                  "What is your profession?",
                  _professionOptions,
                  _selectedProfession,
                  (value) {
                    setState(() {
                      _selectedProfession = value;
                    });
                  },
                ),
                
                // Social class question
                _buildQuestionPage(
                  "What is your social class?",
                  _socialClassOptions,
                  _selectedSocialClass,
                  (value) {
                    setState(() {
                      _selectedSocialClass = value;
                    });
                  },
                ),
                
                // Salary question
                _buildQuestionPage(
                  "What is your monthly salary range?",
                  _salaryOptions,
                  _selectedSalary,
                  (value) {
                    setState(() {
                      _selectedSalary = value;
                    });
                  },
                ),
                
                // Vehicle question
                _buildQuestionPage(
                  "What type of vehicle do you own?",
                  _vehicleOptions,
                  _selectedVehicle,
                  (value) {
                    setState(() {
                      _selectedVehicle = value;
                    });
                  },
                ),
                
                // Marriage type question
                _buildQuestionPage(
                  "What type of marriage are you planning?",
                  _marriageTypeOptions,
                  _selectedMarriageType,
                  (value) {
                    setState(() {
                      _selectedMarriageType = value;
                    });
                  },
                ),
                
                // Residence question
                _buildQuestionPage(
                  "Where do you currently reside?",
                  _residenceOptions,
                  _selectedResidence,
                  (value) {
                    setState(() {
                      _selectedResidence = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _canMoveNext() ? _nextPage : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            _currentPage < _totalPages - 1 ? "Next Question" : "Calculate My Jahez",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionPage(
    String question,
    List<String> options,
    String? selectedValue,
    void Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            question,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 40),
          FancyDropdown(
            items: options,
            value: selectedValue,
            onChanged: onChanged,
            hint: "Select an option",
          ),
        ],
      ),
    );
  }
} 