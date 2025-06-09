class UserProfile {
  String age = '';
  String maritalStatus = '';
  String profession = '';
  String socialClass = '';
  String salary = '';
  String vehicle = '';
  String marriageType = '';
  String residence = '';
  
  Map<String, dynamic> toJson() => {
    'age': age,
    'maritalStatus': maritalStatus,
    'profession': profession,
    'socialClass': socialClass,
    'salary': salary,
    'vehicle': vehicle,
    'marriageType': marriageType,
    'residence': residence,
  };
} 