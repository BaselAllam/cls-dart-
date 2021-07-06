
// List
// Set
// Map


void main() {

  List<Map<String, Map<String, dynamic>>>? stds = [
    {
      'data' : {
        'name' : 'Ahmed',
        'email' : 'ahmed.com',
        'age' : 20,
        'married' : false,
        'upsent' : ['10-10-2021', '13-12-2021']
      },
    },
    {
      'data' : {
        'name' : 'ali',
        'email' : 'ali.com',
        'age' : 22,
        'married' : false,
        'upsent' : ['13-12-2021']
      }
    },
  ];


  for(var i in stds) {
      i['data']!.forEach((x , o) {
      print('the key is: $x and the value is: $o');
    });
  }



  // if(stds[0]['data']!['name'] == 'ahmed') {
  //   stds[0]['data']!['age'] = 30;
  //   print(stds);
  // }else if(stds[0]['data']!['name'] == 'Ahmed'){
  //   stds[0]['data']!['age'] = 35;
  //   print(stds);
  // }else{
  //   stds[0]['data']!['age'] = 25;
  //   print(stds);
  // }

  List x = [10, 10, 20, 30];

  for(int i = 0; i < x.length; i++) {
    x[i] += 10;
  } // Index

  print(x);


  for(int i in x) {
    i += 10;
  } // Value

  print(x);

  x.forEach((i) {
    i += 10;
  });

  print(x);

  int w = 10;

  while(w != 10) {
    print('w == 10');
  }

  do{
    print('w != 10');
  }while(w != 10);

}