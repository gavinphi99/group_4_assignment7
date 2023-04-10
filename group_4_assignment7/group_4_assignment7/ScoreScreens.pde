import java.util.Comparator;
import java.util.Collections;

class ScoreScreens {
  JSONArray infos;
  ArrayList<Score> scoreList;
  PFont font;
  boolean isHigh;
  boolean isTop;
  boolean on;
  Score current;
  

  ScoreScreens(ArrayList<Score> scoreList) {
    infos = loadJSONArray("player_data.json");
    this.scoreList = scoreList;
    //println(scoreList);
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

  void popFirstScore() {
    scoreList.remove(0);
  }
  
  void popLastScore() {
    scoreList.remove(scoreList.size()-1);
  }
  
  

  void checkScore() {
    current = scoreList.get(0);
    //println(current.score);
    if (current.score <= scoreList.get(scoreList.size()-1).score) {
      isHigh = false;
      isTop = false;
      popFirstScore();
    }
    else {
      scoreList.sort(comparator);

      if (scoreList.get(0).score == current.score) {
        isHigh = true;
      }
      isTop = true;
      popLastScore();
    }
  }
  
  void saveScore() {
    saveJSONArray(new JSONArray(), "data/player_data.json");
    //println("here");
    JSONArray new_infos = new JSONArray();
    for (int i = 0; i < scoreList.size(); i++) {
      JSONObject new_players = new JSONObject();
      new_players.setFloat("score", scoreList.get(i).score);
      new_players.setString("player", scoreList.get(i).player);   
      new_infos.append(new_players);
    }
    saveJSONArray(new_infos, "data/player_data.json");
  }
  
}
