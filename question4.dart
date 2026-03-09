// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐
/**
 * EXPECTED OUTPUT:
 * Vehicle Info: 2020 Toyota Camry (4 doors)
 * Starting the car engine...
 * Stopping the car engine...
 * * Vehicle Info: 2021 Honda CBR (Has windshield: true)
 * Starting the motorcycle engine...
 * Stopping the motorcycle engine...
 * * Car age: 6 years
 * Motorcycle age: 5 years
 */

// 1. Abstract Class Vehicle:
abstract class Vehicle {
  String brand;
  String model;
  int year;

  Vehicle(this.brand, this.model, this.year);

  // Abstract methods: Must be implemented by subclasses
  void start();
  void stop();

  // Concrete method: Can be used as is or overridden
  void displayInfo() {
    print("Vehicle Info: $year $brand $model");
  }

  // Method to calculate vehicle age (Current year is 2026)
  int calculateAge() {
    int currentYear = 2026; 
    return currentYear - year;
  }
}

// 2. Concrete Classes:
// Car extends Vehicle
class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);

  @override
  void start() {
    print("Starting the car engine...");
  }

  @override
  void stop() {
    print("Stopping the car engine...");
  }

  @override
  void displayInfo() {
    print("Vehicle Info: $year $brand $model ($numberOfDoors doors)");
  }
}

// Motorcycle extends Vehicle
class Motorcycle extends Vehicle {
  bool hasWindshield;

  Motorcycle(String brand, String model, int year, this.hasWindshield)
      : super(brand, model, year);

  @override
  void start() {
    print("Starting the motorcycle engine...");
  }

  @override
  void stop() {
    print("Stopping the motorcycle engine...");
  }

  @override
  void displayInfo() {
    print("Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)");
  }
}

void main() {
  // 3. Create a list of vehicles (Polymorphism)
  List<Vehicle> vehicles = [
    Car("Toyota", "Camry", 2020, 4),
    Motorcycle("Honda", "CBR", 2021, true)
  ];

  // Loop through the list and demonstrate polymorphism
  for (var vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();
    print(""); // Adding a newline for clean output
  }

  // Print the age of each vehicle
  // Accessing specific objects from the list
  print("Car age: ${vehicles[0].calculateAge()} years");
  print("Motorcycle age: ${vehicles[1].calculateAge()} years");
}