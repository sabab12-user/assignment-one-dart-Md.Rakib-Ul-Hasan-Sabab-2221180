// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/**
 * EXPECTED OUTPUT:
 * Student Scores: {Alice: <random>, Bob: <random>, ...}
 * Highest Score: <Name> with <Score>
 * Lowest Score: <Name> with <Score>
 * Average Score: <Value>
 * Alice: <Score> (Category)
 * ...
 */

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];

  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};

  // 3. Use a for loop to assign random scores (60-100) to each student
  Random random = Random();
  for (String name in studentNames) {
    // nextInt(41) gives 0-40, + 60 gives 60-100
    studentScores[name] = random.nextInt(41) + 60;
  }

  // 4. Find and display: Highest, Lowest, and Average
  String highestStudent = "";
  int highestScore = -1; // Initialize lower than possible score
  String lowestStudent = "";
  int lowestScore = 101; // Initialize higher than possible score
  int totalScore = 0;

  studentScores.forEach((name, score) {
    totalScore += score;

    if (score > highestScore) {
      highestScore = score;
      highestStudent = name;
    }

    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = name;
    }
  });

  double averageScore = totalScore / studentNames.length;

  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  print("Average Score: ${averageScore.toStringAsFixed(2)}");

  // 5. Use a switch statement (or switch expression) to categorize students
  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;
    String category = "";

    // Categorization logic
    switch (score) {
      case >= 90:
        category = "Excellent";
        break;
      case >= 80:
        category = "Good";
        break;
      case >= 70:
        category = "Average";
        break;
      default:
        category = "Needs Improvement";
    }

    print("$student: $score ($category)");
  }
}