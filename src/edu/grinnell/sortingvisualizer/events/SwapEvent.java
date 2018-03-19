package edu.grinnell.sortingvisualizer.events;

import java.util.ArrayList;
import java.util.List;

public class SwapEvent<T> implements SortEvent<T>{

    public List<Integer> affectedIndices;
    
    public SwapEvent(int x, int y) {
    	affectedIndices = new ArrayList<Integer>();
        affectedIndices.add(x);
        affectedIndices.add(y);
    }
    

	public void apply(ArrayList<T> lst) {
        T temp = lst.get(affectedIndices.get(0));
        lst.set(affectedIndices.get(0), 
        		lst.get(affectedIndices.get(1)));
        lst.set(affectedIndices.get(1), temp);
    }
    
    public List<Integer> getAffectedIndices() {
        return affectedIndices;
    }

    public boolean isEmphasized() {
        return true;
    }
    
}