import java.util.Comparator;

class ScoreScreens {
  JSONArray infos;
  ArrayList<Score> scoreList;
  PFont font;
  boolean isHigh;
  boolean isTop;

  ScoreScreens() {
    infos = loadJSONArray("player_data.json");
    scoreList = new ArrayList<Score>();
    convert();
    font = createFont("RetroGaming.ttf", 20);
    textFont(font);
    isHigh = false;
    isTop = false;
  }

  void convert() {
    for (int i = 0; i < infos.size(); i++) {
      scoreList.add(new Score(infos.getJSONObject(i).getString("player"),
        infos.getJSONObject(i).getFloat("score")));
    }

    scoreList.sort(comparator);
  }

  Comparator<Score> comparator = new Comparator<Score>() {
    public int compare(Score s1, Score s2) {
      if (s1.score > s2.score) {
        return -1;
      } else if (s1.score < s2.score) {
        return 1;
      } else {
        return 0;
      }
    }
  };

  void popScore() {
    scoreList.remove(scoreList.size()-1);
  }

  void insertScore(Score scoreObj) {
    int index = 0;
    for (int i = 0; i < scoreList.size(); i++) {
      if (scoreObj.score > scoreList.get(i).score) {
        index = i + 1;
      }
    }
    if (index == scoreList.size()) {
      popScore();
      isHigh = false;
      isTop = false;
      
    } else {
      scoreList.add(index, scoreObj);
      if (index == 0) {
        isHigh = true;
      } else {
        isHigh = false;
      }
      isTop = true;
      
      
    }
    
  }
  
}
