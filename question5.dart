// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/**
 * EXPECTED OUTPUT:
 * Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
 * Job Title: Manager
 * Base Salary: 8000.0
 * Calculated Salary: 9000.0
 * Payment processed: 9000.0
 * Report: Monthly report for John Smith in IT department
 * * Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
 * Job Title: Senior Developer
 * Base Salary: 6000.0
 * Calculated Salary: 6500.0
 * Payment processed: 6500.0
 */

// 1. Mixin Payable: Reusable logic for salary and payments
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    print("Payment processed: $amount");
  }
}

// 2. Mixin Reportable: Reusable logic for generating reports
mixin Reportable {
  String generateReport(String employeeName, String department) {
    return "Report: Monthly report for $employeeName in $department department";
  }
}

// 3. Abstract Class Employee
abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  String getJobTitle();
  double getBaseSalary();

  void displayInfo();
}

// 4. Concrete Classes
// Manager uses both Payable and Reportable mixins
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);

  @override
  String getJobTitle() => "Manager";

  @override
  double getBaseSalary() => 8000.0;

  @override
  void displayInfo() {
    print("Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)");
  }
}

// Developer only uses the Payable mixin
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);

  @override
  String getJobTitle() => "Senior Developer";

  @override
  double getBaseSalary() => 6000.0;

  @override
  void displayInfo() {
    print("Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)");
  }
}

void main() {
  // 5. Create employees based on expected output
  Manager mgr = Manager("John Smith", "M001", "IT", 5);
  Developer dev = Developer("Alice Johnson", "D001", "IT", "Dart");

  // Demonstrate Manager logic
  mgr.displayInfo();
  print("Job Title: ${mgr.getJobTitle()}");
  print("Base Salary: ${mgr.getBaseSalary()}");
  double mgrTotal = mgr.calculateSalary(mgr.getBaseSalary(), 1000.0);
  print("Calculated Salary: $mgrTotal");
  mgr.processPayment(mgrTotal);
  print(mgr.generateReport(mgr.name, mgr.department));

  print(""); // Formatting break

  // Demonstrate Developer logic
  dev.displayInfo();
  print("Job Title: ${dev.getJobTitle()}");
  print("Base Salary: ${dev.getBaseSalary()}");
  double devTotal = dev.calculateSalary(dev.getBaseSalary(), 500.0);
  print("Calculated Salary: $devTotal");
  dev.processPayment(devTotal);
}