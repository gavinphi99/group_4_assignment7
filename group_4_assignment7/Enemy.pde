class Invader{
  
  float health;
  color c;
  PVector pos, vel;
  
  Invader(PVector _pos, PVector _vel, color _c, float _health){
    pos = _pos;
    vel = _vel;
    w = _w;
    h = _h;
    health = _health;
    c = _c;
  }
  
  void display(){
    
  }
  
  //to be called in subclasses either ellipse or rect
  void drawShape(){}
  
  //to be called in subclasses either based on ellipse or rect
  boolean hit(Bullet bullet){
    health -= bullet.damage;
    return true;
  }

}
