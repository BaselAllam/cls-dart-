// Stds
// name, email, age, upsent
// 5 Students

// 1- Validation for each email ( @, .com, lower case, white spaces ) //
// 2- validation if upsent > 5 : remove student
// 3- validation if upsent > 3 : add warning field into his map
// 4- avg students ages > reduce

bool emailValidator(String email) {

  email = email.trim();
  email = email.toLowerCase();

  if(!email.contains('@')){
    print('your email should contain @');
    return false;
  }else if(!email.endsWith('.com')){
    print('your email shoudl ends with .com');
    return false;
  }

  return true;
}


int checkStdUpsent(List<String> upsent) {

  if(upsent.length > 5){
    print('you are terminated');
    return 0;
  }else if(upsent.length > 3) {
    print('take care');
    return 1;
  }else{
    return 2;
  }
}


addStd(List<Map<String, dynamic>> lsitToAddTo, String stdName, String stdEmail, int stdAge, List<String> stdUpsent) {

  bool emailValid = emailValidator(stdEmail);

  int stdUpsentStatue = checkStdUpsent(stdUpsent);

  if(stdUpsentStatue != 0){
    if(emailValid == true){
      Map<String, dynamic> newStd = {
        'name' : stdName,
        'email' : stdEmail,
        'age' : stdAge,
        'upsent' : stdUpsent
      }; 

      lsitToAddTo.add(newStd);
    }else{
      print('sorry some thing went wring');
    }
  }else{
    print('this std canot be added');
  }

}




void main() {

  List<Map<String, dynamic>> stdss = [
    {
      'name': 'yousef',
      'email': 'yousefyahoo.com',
      'age': 19,
      'absent': ['10-6-2021', '20-6-2021', '3-5-2021', '6-6-2021']
    },
    {
      'name': 'ahmed',
      'email': 'ahmed@yahoo.com',
      'age': 25,
      'absent': ['15-6-2021']
    },
    {
      'name': 'ehab',
      'email': 'ehab@yahoo.com',
      'age': 18,
      'absent': [
        '10-6-2021',
        '20-6-2021',
        '3-5-2021',
        '6-6-2021',
        '30-6-2021',
        '5-6-2021'
      ]
    },
    {
      'name': 'mohamed',
      'email': 'mohamed@yahoo.com',
      'age': 26,
      'absent': ['1-6-2021', '2-6-2021']
    },
    {
      'name': 'kareem',
      'email': 'kareem@yahoo.com',
      'age': 20,
      'absent': ['16-6-2021', '21-6-2021', '4-5-2021', '8-6-2021']
    },
  ];

  List<Map<String, dynamic>> stds = [];

  for(var i in stdss){
    addStd(stds, i['name'], i['email'], i['age'], i['absent']);
  }


  print(stds);


}









// avg(List x) {

//   int total = x.reduce((i, y) => i + y);

//   int len = x.length;

//   double avg = total / len;

//   // print(avg);

//   return avg;

// }