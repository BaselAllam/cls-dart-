// Breakfast, Dinner, Launch, Snacks => buy 

// انا عايز العميل يختار وجبات الشهر كلها مرة واحدة

// Calendar Object => Month Days
// Meals Object => Meal Data
// Meal Type Object => Meal Type Data

// Subscribtion Object => Collection of all Above 


// 1- Open Calendar 
// 2- one day => List<MealTypes> 
// 3- Add each meal inside each meal type
// 4- Add All meals for each meal types for each day 


// CalendarDay Object => Date, Available Meal Type<List<MealTypeObject>

// Meal Type => Name, List<Meals>

// Meal Object => Name, price, description


///////////////// Date Section ////////////////////


List<Map<String, dynamic>> createCalendarDayObjList(int numberOfDays, List mealTypesDataSets, List mealSets) {

  List<Map<String, dynamic>> allCalendarDays = [];

  for(int i = 0; i < numberOfDays; i++) {
    List<Map<String, dynamic>> newMealTypeObjList = createListOfMealTypeObj(mealTypesDataSets, mealSets);
    Map<String, dynamic> newDayObj = calendarDayObj('10-15-2021', newMealTypeObjList);
    allCalendarDays.add(newDayObj);
  }

  return allCalendarDays;
}



Map<String, dynamic> calendarDayObj(String date, List mealTypes) {


  Map<String, dynamic> dateObj = {
    'date' : date,
    'mealTypes' : mealTypes
  };

  return dateObj;
}


///////////////// Date Section ////////////////////


///////////////// Meal Type Section ////////////////////


List<Map<String, dynamic>> createListOfMealTypeObj(List mealTypeSet, List mealsSets) {

  List<Map<String, dynamic>> allMealTypes = [];

  for(var i in mealTypeSet) {
    List<Map<String, dynamic>> mealsList = createMealObjList(mealsSets);
    Map<String, dynamic> newMealTypeObj = mealTypeObj(i, mealsList);
    allMealTypes.add(newMealTypeObj);
  }

  return allMealTypes;
}


Map<String, dynamic> mealTypeObj(String mealTypeName, List meals) {

  Map<String, dynamic> mealTypeObj = {
    'mealTypeName' : mealTypeName,
    'meals' : meals,
  };

  return mealTypeObj;
}


///////////////// End of Meal Type Section ////////////////////


///////////////// Meal Section ////////////////////


List<Map<String, dynamic>> createMealObjList(List meals) {

  List<Map<String, dynamic>> allMeals = [];

  for(var i in meals) {
    Map<String, dynamic> newMealObj = mealObj(i['mealName'], i['mealPrice'], i['description']);
    allMeals.add(newMealObj);
  }

  return allMeals;
}

Map<String, dynamic> mealObj(String mealName, int mealPrice, String description) {

  Map<String, dynamic> mealObj = {
    'mealName' : mealName,
    'mealPrice' : mealPrice,
    'description' : description,
  };

  return mealObj;
}


///////////////// End of Meal Type Section ////////////////////



void main() {

  List mealTypesDataSet = ['Breakfast', 'Dinner', 'Snacks', 'Launch'];

  List mealsSet = [
    {
      'mealName' : 'Fol',
      'mealPrice' : 200,
      'description' : 'Fol Meal',
    },
    {
      'mealName' : 'Chicken',
      'mealPrice' : 250,
      'description' : 'Chicken Meal',
    },
    {
      'mealName' : 'Fish',
      'mealPrice' : 300,
      'description' : 'Fish Meal',
    },
  ];

  List<Map<String, dynamic>> allDates = createCalendarDayObjList(3, mealTypesDataSet, mealsSet);

  print(allDates);

}