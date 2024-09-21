//weather states is created to be passed to the cubit
//the main reason is that we can make all the states inheriet it
//and then have access through all states via the partent class
class WeatherStates {}

class InitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {}

class ErrorState extends WeatherStates {}
