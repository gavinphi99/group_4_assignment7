class RectInvader extends Invader{
  
  float w, h;
  
  RectInvader(PVector _pos, PVector _vel, float _w, float _h, color _c, float _health){
    super(_pos, _vel, _c, _health);
    w  = _w;
    h = _h;
  }
  
  void drawShape(){
    println("draws");
    fill(c);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
  }
  
}
