

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


addStd(List<Map<String, dynamic>> lsitToAddTo, String stdName, String stdEmail, int stdAge, List<String> stdUpsent, {bool? graduated}) {

  bool emailValid = emailValidator(stdEmail);

  int stdUpsentStatue = checkStdUpsent(stdUpsent);

  if(stdUpsentStatue != 0){
    if(emailValid == true){
      Map<String, dynamic> newStd = {
        'name' : stdName,
        'email' : stdEmail,
        'age' : stdAge,
        'upsent' : stdUpsent,
        'graduated' : graduated
      };

      if(newStd['graduated'] == null){
        newStd.remove('graduated');
      }

      lsitToAddTo.add(newStd);
    }else{
      print('sorry some thing went wring');
    }
  }else{
    print('this std canot be added');
  }

}


avg(List x) {

  try{
    int total = x.reduce((i, y) => i + y);

    int len = x.length;

    double avg = total / len;

    // print(avg);

    return avg;
  }catch(e) {
    print(e);
  }

}


void main() {

  List<Map<String, dynamic>> stdss = [
    {
      'name': 'yousef',
      'email': 'yousef@yahoo.com',
      'age': 19,
      'absent': ['10-6-2021', '20-6-2021', '3-5-2021', '6-6-2021'],
      'graduated' : true,
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

  List x = [10, 20, '30'];

  print(avg(x));

  // for(var i in stdss){
  //   addStd(stds, i['name'], i['email'], i['age'], i['absent'], graduated : i['graduated']);
  // }


  // print(stds);


}









