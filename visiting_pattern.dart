void main(){
  Car car = Car();
  car.accept(CarElementPrintVisitor());
  car.accept(CarElementDoVisitor());
}

abstract class CarElement{
  void accept(CarElementVisitor visitor);
}

abstract class CarElementVisitor{
  void visitBody(Body body);
  void visitCar(Car car);
  void visitEngine(Engine engine);
  void visitWheel(Wheel wheel);
}
class Wheel extends CarElement{
  final String name;
  Wheel(this.name);
  get getName => name;
  
  @override
  void accept(CarElementVisitor visitor){
    visitor.visitWheel(this);
  }
}
class Body extends CarElement{
  @override
  void accept(CarElementVisitor visitor){
    visitor.visitBody(this);
  }
}
class Engine extends CarElement{
  @override
  void accept(CarElementVisitor visitor){
    visitor.visitEngine(this);
  }
}
class Car extends CarElement{
  late final List<CarElement> _elements;
  Car(){
    _elements = [Wheel("front left"),Wheel("front right"),Wheel("back left"),Wheel("back right"),Body(),Engine()];
  }
  
  @override
  void accept(CarElementVisitor visitor){
    for (CarElement element in _elements){
      element.accept(visitor);
    }
    visitor.visitCar(this);
  }
}

class CarElementPrintVisitor extends CarElementVisitor{
  @override
     void visitBody(Body body) {
        print("Visiting body");
    }

    @override
     void visitCar(Car car) {
        print("Visiting car");
    }

    @override
    void visitEngine(Engine engine) {
        print("Visiting engine");
    }

    @override
    void visitWheel(Wheel wheel) {
        print("Visiting ${wheel.getName} wheel");
    }
}

class CarElementDoVisitor extends CarElementVisitor {
    @override
    void visitBody(Body body) {
        print("Moving my body");
    }

    @override
    void visitCar(Car car) {
        print("Starting my car");
    }

    @override
    void visitWheel(Wheel wheel) {
        print("Kicking my ${wheel.getName} wheel");
    }

    @override
    void visitEngine(Engine engine) {
       print("Starting my engine");
    }
}
