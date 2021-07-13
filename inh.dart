

class User{

  String name;
  String email;

  User(this.name, this.email);


  String objData() {
    return 'User name; $name, User email: $email';
  }
}



class Emp extends User{

  int salary;
  String position;

  Emp(name, email, this.salary, this.position) : super(name, email);
}


class Manager extends Emp{

  String roles;

  Manager(name, email, this.roles, salary, position) : super(name, email, salary, position);
}


class Visitor extends User{

  String visitReason;

  Visitor(name, email, this.visitReason) : super(name, email);
}


class Driver extends User{

  String carType;

  Driver(name, email, this.carType) : super(name, email);
}


void main() {

  Emp emp = Emp('name', 'email', 2000, 'Software Developer');

  Manager manager = Manager('Manager', 'manager email', 'role', 2000, 'Software Developer');

  print(emp.objData());
  print(manager.objData());

}