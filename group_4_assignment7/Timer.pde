class Timer {
  //some functionality from this class was inspired from the in-class example on 3/24
  //Written by Leonardo Guardione
  
  int interval; //how long from start until timer is triggered in ms
  float start; //time in ms when timer began
  float pauseTime; //time when pause occured
  boolean isPaused, isRepeatable, isExecuted; //true if paused, false if not paused
  
  
  Timer(int _interval, boolean _isRepeatable){
    interval = _interval;
    start = 0;
    isPaused = false;
    isRepeatable = _isRepeatable;
    isExecuted = false;
  }
  
  int getInterval(){
    return interval;
  }
  
  float getStart(){
    return start;
  }
  
  float getPause() {
    return pauseTime;
  }
  
  void setInterval(int _interval){
    interval = _interval;
  }
  
  void setStart(float _start){
    start = _start;
  }
  
  boolean trigger(){
    if (!isPaused && !isExecuted && (millis() - start) >= interval) {
      start = millis();
      
      if (!isRepeatable){
        isExecuted = true;
      }
      return true;
    }
    else{
      return false;
    }
  }
  
  void reset(){
    isExecuted = false;
    start = millis();
  }
  
  //called with specified key pressing event
  void pause() {
    isPaused = true;
    pauseTime = millis() - start;
  }
  
  //called with specified key pressing event
  void resume() {
    isPaused = false;
    start = millis() - pauseTime;
  }
  
}
