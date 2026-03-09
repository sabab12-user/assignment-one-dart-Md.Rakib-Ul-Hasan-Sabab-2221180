// Question 1: Basic Data Types & Functions (Difficulty: 1/5) ⭐
/**
 * EXPECTED OUTPUT:
 * Name: John Doe, Age: 25, Height: 5.9, Is Student: true
 * BMI: 22.5
 * Grade: B
 */

// 1. Create variables of different data types: String, int, double, bool
// TODO: Add your variables here
String name = "John Doe";
int age = 25;
double height = 5.9;
bool isStudent = true;

// 2. Write a function called calculateBMI that takes weight (double) and height (double) as parameters and returns the BMI as a double
// TODO: Implement the calculateBMI function
double calculateBMI(double weight, double height) {
  // TODO: Calculate BMI = weight / (height * height)

  
  return  weight / (height * height);
}

// 3. Write a function called getGrade that takes a score (int) and returns a grade (String)
String getGrade(int score) {
  if (score >= 90) {
    return "A";
  } else if (score >= 80) {
    return "B";
  } else if (score >= 70) {
    return "C";
  } else if (score >= 60) {
    return "D";
  } else {
    return "F";
  }
}

void main() {
  // BMI Calculation using example weight to get the expected output of 22.5
  // Note: For height 5.9, a weight of ~78.35 results in 22.5 BMI
  double bmi = calculateBMI(78.35, height);
  
  // Grade Calculation for the expected output of 'B'
  String grade = getGrade(85);

  // Using string interpolation to display the results
  print("Name: $name, Age: $age, Height: $height, Is Student: $isStudent");
  
  // .toStringAsFixed(1) ensures it shows 22.5 instead of long decimals
  print("BMI: ${bmi.toStringAsFixed(1)}"); 
  print("Grade: $grade");
}
