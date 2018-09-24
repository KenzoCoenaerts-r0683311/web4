package db;

import domain.WkResultaat;

import java.util.ArrayList;
import java.util.List;

public class WkDB {
    private List<WkResultaat> resultaten = new ArrayList<>();

    public void addResultaat(WkResultaat resultaat) {
        resultaten.add(resultaat);
    }

    public List<WkResultaat> getResultaten(){
        return resultaten;
    }
}
