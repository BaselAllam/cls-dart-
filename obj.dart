
// Models

class Meal{

  String? mealName;
  int? mealPrice;
  String? description;

  Meal(this.mealName, this.mealPrice, this.description);

}


class MealType{

  String? mealTypeName;
  List<Meal>? meals;
  int _numberOfAvailableMeal = 5;
  int get numberOfAvailableMeal => _numberOfAvailableMeal;

  MealType(this.mealTypeName, this.meals);

}


class CalendarDay{

  String? date;
  List<MealType>? mealTypes;

  CalendarDay(this.date, this.mealTypes);
}


// Controllers

class MealController{

  List<Meal> createMealObjList(List meals) {

  List<Meal> allMeals = [];

  for(var i in meals) {
    Meal newMealObj = mealObj(i['mealName'], i['mealPrice'], i['description']);
    allMeals.add(newMealObj);
  }

  return allMeals;
}


  Meal mealObj(String mealName, int mealPrice, String description) {

    Meal mealObj = Meal(mealName, mealPrice, description);

    return mealObj;
  }

}


class MealTypeController{

  MealController meal = MealController();

  List<MealType> createListOfMealTypeObj(List mealTypeSet, List mealsSets) {

  List<MealType> allMealTypes = [];

  for(var i in mealTypeSet) {
    List<Meal> mealsList = meal.createMealObjList(mealsSets);
    MealType newMealTypeObj = mealTypeObj(i, mealsList);
    if(mealsList.length > newMealTypeObj.numberOfAvailableMeal) {
      print('cant add more meals');
    }else{
      allMealTypes.add(newMealTypeObj);
    }
  }

  return allMealTypes;
}


  MealType mealTypeObj(String mealTypeName, List<Meal> meals) {

    MealType mealTypeObj = MealType(mealTypeName, meals);

    return mealTypeObj;
  }
}


class CalendarDayController{

  MealTypeController mealType = MealTypeController();

  List<CalendarDay> createCalendarDayObjList(int numberOfDays, List mealTypesDataSets, List mealSets) {

  List<CalendarDay> allCalendarDays = [];

  for(int i = 0; i < numberOfDays; i++) {
    List<MealType> newMealTypeObjList = mealType.createListOfMealTypeObj(mealTypesDataSets, mealSets);
    CalendarDay newDayObj = calendarDayObj('10-15-2021', newMealTypeObjList);
    allCalendarDays.add(newDayObj);
  }

  return allCalendarDays;
}



  CalendarDay calendarDayObj(String date, List<MealType> mealTypes) {


    CalendarDay dateObj = CalendarDay('10-2-2021', mealTypes);

    return dateObj;
  }
}


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
    {
      'mealName' : 'Fish',
      'mealPrice' : 300,
      'description' : 'Fish Meal',
    },
    {
      'mealName' : 'Fish',
      'mealPrice' : 300,
      'description' : 'Fish Meal',
    },
  ];

  CalendarDayController calendarDayController = CalendarDayController();

  List<CalendarDay> allDates = calendarDayController.createCalendarDayObjList(3, mealTypesDataSet, mealsSet);

  for(var i in allDates){
    for(var x in i.mealTypes!){
      for(var o in x.meals!) {
        print(o.mealName);
      }
    }
  }

  print(allDates);

}