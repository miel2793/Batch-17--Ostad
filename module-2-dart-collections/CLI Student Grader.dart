import 'dart:io';

void main() {
  const appTitle = "Student Grader v1.0";

  final availableSubjects = {"Math", "English", "Science", "ICT"};

  var students = <Map<String, dynamic>>[];
  var isRunning = true;

  do {
    print("""
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:
""");

    var choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {

      case 1:
        print("Enter student name:");
        var name = stdin.readLineSync();

        var student = {
          "name": name,
          "scores": <String, int>{},
          "subjects": {...availableSubjects},
          "bonus": null,
          "comment": null
        };

        students.add(student);
        print("Student added successfully.\n");
        break;

      case 2:
        if (students.isEmpty) {
          print("No students available.\n");
          break;
        }

        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["name"]}");
        }

        print("Select a student:");
        var index = int.parse(stdin.readLineSync()!) - 1;

        if (index < 0 || index >= students.length) {
          print("Invalid student.\n");
          break;
        }

        var subjectsList = availableSubjects.toList();

        print("Choose subject:");
        for (int i = 0; i < subjectsList.length; i++) {
          print("${i + 1}. ${subjectsList[i]}");
        }

        var subIndex = int.parse(stdin.readLineSync()!) - 1;

        if (subIndex < 0 || subIndex >= subjectsList.length) {
          print("Invalid subject.\n");
          break;
        }

        int score;

        while (true) {
          print("Enter score (0-100):");
          score = int.parse(stdin.readLineSync()!);

          if (score >= 0 && score <= 100) break;

          print("Invalid score. Try again.");
        }

        var subject = subjectsList[subIndex];
        var scores = students[index]["scores"] as Map<String, int>;
        scores[subject] = score;

        print("Score recorded.\n");
        break;

      case 3:
        if (students.isEmpty) break;

        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["name"]}");
        }

        print("Select a student:");
        var index = int.parse(stdin.readLineSync()!) - 1;

        if (index < 0 || index >= students.length) break;

        print("Enter bonus (1-10):");
        var bonus = int.parse(stdin.readLineSync()!);

        if (bonus < 1 || bonus > 10) {
          print("Invalid bonus.\n");
          break;
        }

        students[index]["bonus"] ??= bonus;
        print("Bonus added.\n");
        break;

      case 4:
        if (students.isEmpty) break;

        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["name"]}");
        }

        print("Select a student:");
        var index = int.parse(stdin.readLineSync()!) - 1;

        if (index < 0 || index >= students.length) break;

        print("Enter comment:");
        var comment = stdin.readLineSync();

        students[index]["comment"] = comment;
        print("Comment added.\n");
        break;

      case 5:
        if (students.isEmpty) {
          print("No students found.\n");
          break;
        }

        for (var s in students) {
          var tags = [
            s["name"],
            "${(s["scores"] as Map).length} subjects",
            if (s["bonus"] != null) "Bonus"
          ];

          print(tags.join(" | "));
        }

        print("");
        break;

      case 6:
        if (students.isEmpty) break;

        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["name"]}");
        }

        print("Select a student:");
        var index = int.parse(stdin.readLineSync()!) - 1;

        if (index < 0 || index >= students.length) break;

        var student = students[index];
        var scores = student["scores"] as Map<String, int>;

        if (scores.isEmpty) {
          print("No scores available.\n");
          break;
        }

        int sum = 0;
        scores.forEach((k, v) => sum += v);

        var avg = sum / scores.length;
        var finalAvg = avg + (student["bonus"] ?? 0);

        if (finalAvg > 100) finalAvg = 100;

        String grade;

        if (finalAvg >= 90) {
          grade = "A";
        } else if (finalAvg >= 80) {
          grade = "B";
        } else if (finalAvg >= 70) {
          grade = "C";
        } else if (finalAvg >= 60) {
          grade = "D";
        } else {
          grade = "F";
        }

        String feedback = switch (grade) {
          "A" => "Outstanding performance!",
          "B" => "Good work, keep it up!",
          "C" => "Satisfactory. Room to improve.",
          "D" => "Needs improvement.",
          "F" => "Failing. Please seek help.",
          _ => "Unknown grade."
        };

        String comment =
            student["comment"]?.toUpperCase() ?? "No comment provided";

        print("""
╔══════════════════════════════╗
║        REPORT CARD           ║
╠══════════════════════════════╣
║ Name: ${student["name"]}
║ Scores: ${student["scores"]}
║ Bonus: ${student["bonus"] ?? 0}
║ Average: ${finalAvg.toStringAsFixed(2)}
║ Grade: $grade
║ Comment: $comment
║ Feedback: $feedback
╚══════════════════════════════╝
""");
        break;

      case 7:
        if (students.isEmpty) break;

        double totalAvg = 0;
        int count = 0;
        Set<String> gradeSet = {};

        for (var s in students) {
          var scores = s["scores"] as Map<String, int>;

          if (scores.isNotEmpty) {
            int sum = 0;
            scores.forEach((k, v) => sum += v);

            var avg = sum / scores.length;
            totalAvg += avg;
            count++;

            String g;
            if (avg >= 90) g = "A";
            else if (avg >= 80) g = "B";
            else if (avg >= 70) g = "C";
            else if (avg >= 60) g = "D";
            else g = "F";

            gradeSet.add(g);
          }
        }

        var classAvg = count == 0 ? 0 : totalAvg / count;

        print("Total Students: ${students.length}");
        print("Class Average: ${classAvg.toStringAsFixed(2)}");
        print("Unique Grades: $gradeSet");

        var summaryLines = [
          for (var s in students)
            "${s["name"]}: ${(s["scores"] as Map).values}"
        ];

        print("\nStudent Summary:");
        for (var line in summaryLines) {
          print(line);
        }

        print("");
        break;

      case 8:
        isRunning = false;
        print("Program ended.");
        break;

      default:
        print("Invalid option.\n");
    }
  } while (isRunning);
}