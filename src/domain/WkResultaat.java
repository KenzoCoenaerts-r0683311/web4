package domain;

public class WkResultaat {
    private String score;

    public WkResultaat(String score){
        this.setScore(score);
    }

    private void setScore(String score){
        this.score = score;
    }

    public String getScore(){
        return score;
    }
}
