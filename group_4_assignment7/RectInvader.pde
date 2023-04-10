class RectInvader extends Invader {

  float w, h;

  RectInvader(PVector _pos, PVector _vel, float _w, float _h, color _c, float _health) {
    super(_pos, _vel, _c, _health);
    w  = _w;
    h = _h;
  }

  void update() {



    fill(c);
    rectMode(CENTER);
    pos.x += vel.x;
    pos.y += vel.y;
    rect(pos.x, pos.y, w, h);

    textSize(10);

    fill(255);
    text(str(health), pos.x, pos.y - 25);

    if (pos.x > width || pos.x < 0) {
      vel.x = -vel.x;
    }
    rect(pos.x, pos.y, w, h);
  }

  //see if bullet position overlaps with the shape of the rectangle
  boolean wasHit(Bullet bullet) {
    boolean xHit = bullet.x >= pos.x - w / 2 && bullet.x <= pos.x + w / 2;
    boolean yHit = bullet.y >= pos.y - h / 2 && bullet.y <= pos.y + h / 2;

    return xHit && yHit;
  }
}
