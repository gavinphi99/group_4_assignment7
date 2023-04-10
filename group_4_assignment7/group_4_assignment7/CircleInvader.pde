class CircleInvader extends Invader{
  
  float r;
  
    CircleInvader(PVector _pos, PVector _vel, float _r, color _c, float _health){
    super(_pos, _vel, _c, _health);
    r = _r;
  }
  
  void drawShape(){
    fill(c);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, r, r);
  }
  
}
