package edu.grinnell.sortingvisualizer.events;

import java.util.ArrayList;
import java.util.List;

public class CopyEvent<T> implements SortEvent<T>{

    public int index;
    public  T value;
    public ArrayList<T> recordedValue;
    
    public CopyEvent(int x, T value) {
        this.index = x;
        this.value = value;
    }
    
    public void apply(ArrayList<T> lst) {
        lst.set(index, value);
    }

    public List<Integer> getAffectedIndices() {
        List<Integer> lst = new ArrayList<Integer>();
        lst.add(index);
        return lst;
    }

    public boolean isEmphasized() {
        return true;
    }
    
}