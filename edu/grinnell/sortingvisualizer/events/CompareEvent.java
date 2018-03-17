package edu.grinnell.sortingvisualizer.events;


import java.util.ArrayList;
import java.util.List;

public class CompareEvent<T> implements SortEvent<T>{
    
    public List<Integer> affectedIndices;
    
    public CompareEvent(int x, int y) {
    	affectedIndices = new ArrayList<Integer>();
        affectedIndices.add(x);
        affectedIndices.add(y);
    }

    public void apply(ArrayList<T> lst) {
    }

    public List<Integer> getAffectedIndices() {
        return affectedIndices;
    }

    public boolean isEmphasized() {
        return false;
    }

}