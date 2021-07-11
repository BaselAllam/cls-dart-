

class Meal{

  String? mealName;
  int? mealPrice;
  String? description;

  Meal(this.mealName, this.mealPrice, this.description);

}


class MealType{

  String? mealTypeName;
  List<Meal>? meals;

  MealType(this.mealTypeName, this.meals);
}


class CalendarDay{

  String? date;
  List<MealType>? mealTypes;

  CalendarDay(this.date, this.mealTypes);
}



///////////////// Date Section ////////////////////


List<CalendarDay> createCalendarDayObjList(int numberOfDays, List mealTypesDataSets, List mealSets) {

  List<CalendarDay> allCalendarDays = [];

  for(int i = 0; i < numberOfDays; i++) {
    List<MealType> newMealTypeObjList = createListOfMealTypeObj(mealTypesDataSets, mealSets);
    CalendarDay newDayObj = calendarDayObj('10-15-2021', newMealTypeObjList);
    allCalendarDays.add(newDayObj);
  }

  return allCalendarDays;
}



CalendarDay calendarDayObj(String date, List<MealType> mealTypes) {


  CalendarDay dateObj = CalendarDay('10-2-2021', mealTypes);

  return dateObj;
}


///////////////// Date Section ////////////////////


///////////////// Meal Type Section ////////////////////


List<MealType> createListOfMealTypeObj(List mealTypeSet, List mealsSets) {

  List<MealType> allMealTypes = [];

  for(var i in mealTypeSet) {
    List<Meal> mealsList = createMealObjList(mealsSets);
    MealType newMealTypeObj = mealTypeObj(i, mealsList);
    allMealTypes.add(newMealTypeObj);
  }

  return allMealTypes;
}


MealType mealTypeObj(String mealTypeName, List<Meal> meals) {

  MealType mealTypeObj = MealType(mealTypeName, meals);

  return mealTypeObj;
}


///////////////// End of Meal Type Section ////////////////////


///////////////// Meal Section ////////////////////


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

  List<CalendarDay> allDates = createCalendarDayObjList(3, mealTypesDataSet, mealsSet);

  print(allDates);

}