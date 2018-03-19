package edu.grinnell.sortingvisualizer.sorts;

import static org.junit.Assert.*;

import org.junit.Test;

public class SortsTest {
	    
	    Sorts test = new Sorts();

	    @Test
	    public void testSelectionSort() {
	        //1
	        Integer [] arr1 = {1, 4, 2, 7, 6, 8, 9};
	        Sorts.selectionSort(arr1);
	        Integer [] expected1 = {1, 2, 4, 6, 7, 8, 9};
	        Assert.assertArrayEquals(expected1, arr1);
	        //2
	        Integer [] arr2 = {0, 0, 1, 0, 0};
	        Sorts.selectionSort(arr2);
	        Integer [] expected2 = {0, 0, 0, 0,1};
	        Assert.assertArrayEquals(expected2, arr2);
	        //3
	        Integer [] arr3 = {3};
	        Sorts.selectionSort(arr3);
	        Integer [] expected3 = {3};
	        Assert.assertArrayEquals(expected3, arr3);

	    }

	    @Test
	    public void testInsertionSort() {
	        //1
	        Integer [] arr1 = {1, 4, 2, 7, 6, 8, 9};
	        Sorts.insertionSort(arr1);
	        Integer [] expected1 = {1, 2, 4, 6, 7, 8, 9};
	        Assert.assertArrayEquals(expected1, arr1);
	        //2
	        Integer [] arr2 = {0, 0, 1, 0, 0};
	        Sorts.insertionSort(arr2);
	        Integer [] expected2 = {0, 0, 0, 0,1};
	        Assert.assertArrayEquals(expected2, arr2);
	        //3
	        Integer [] arr3 = {3};
	        Sorts.insertionSort(arr3);
	        Integer [] expected3 = {3};
	        Assert.assertArrayEquals(expected3, arr3);
	    }

	    @Test
	    public void testCombSort() {
	        //1
	        Integer [] arr1 = {1, 4, 2, 7, 6, 8, 9};
	        Sorts.combSort(arr1);
	        Integer [] expected1 = {1, 2, 4, 6, 7, 8, 9};
	        Assert.assertArrayEquals(expected1, arr1);
	        //2
	        Integer [] arr2 = {0, 0, 1, 0, 0};
	        Sorts.combSort(arr2);
	        Integer [] expected2 = {0, 0, 0, 0,1};
	        Assert.assertArrayEquals(expected2, arr2);
	        //3
	        Integer [] arr3 = {3};
	        Sorts.combSort(arr3);
	        Integer [] expected3 = {3};
	        Assert.assertArrayEquals(expected3, arr3);
	    }

	    @Test
	    public void testMergeSort() {
	        //1
	        Integer [] arr1 = {1, 4, 2, 7, 6, 8, 9};
	        Sorts.mergeSort(arr1);
	        Integer [] expected1 = {1, 2, 4, 6, 7, 8, 9};
	        Assert.assertArrayEquals(expected1, arr1);
	        //2
	        Integer [] arr2 = {0, 0, 1, 0, 0};
	        Sorts.mergeSort(arr2);
	        Integer [] expected2 = {0, 0, 0, 0,1};
	        Assert.assertArrayEquals(expected2, arr2);
	        //3
	        Integer [] arr3 = {3};
	        Sorts.mergeSort(arr3);
	        Integer [] expected3 = {3};
	        Assert.assertArrayEquals(expected3, arr3);
	        //4
	        String [] arr4 = {"cs", "love", "u", "ha"};
	        Sorts.mergeSort(arr4);
	        String[] expected4 = {"cs", "ha", "love", "u"};
	        Assert.assertArrayEquals(expected4, arr4);
	    }

	    @Test
	    public void testBubbleSort() {
	        //1
	        Integer [] arr1 = {1, 4, 2, 7, 6, 8, 9};
	        Sorts.bubbleSort(arr1);
	        Integer [] expected1 = {1, 2, 4, 6, 7, 8, 9};
	        Assert.assertArrayEquals(expected1, arr1);
	        //2
	        Integer [] arr2 = {0, 0, 1, 0, 0};
	        Sorts.bubbleSort(arr2);
	        Integer [] expected2 = {0, 0, 0, 0,1};
	        Assert.assertArrayEquals(expected2, arr2);
	        //3
	        Integer [] arr3 = {3};
	        Sorts.bubbleSort(arr3);
	        Integer [] expected3 = {3};
	        Assert.assertArrayEquals(expected3, arr3);
	    }

	    @Test
	    public void testQuicksort() {
	        //1
	        Integer [] arr1 = {1, 4, 2, 7, 6, 8, 9};
	        Sorts.quickSort(arr1);
	        Integer [] expected1 = {1, 2, 4, 6, 7, 8, 9};
	        Assert.assertArrayEquals(expected1, arr1);
	        //2
	        Integer [] arr2 = {0, 0, 1, 0, 0};
	        Sorts.quickSort(arr2);
	        Integer [] expected2 = {0, 0, 0, 0,1};
	        Assert.assertArrayEquals(expected2, arr2);
	        //3
	        Integer [] arr3 = {3};
	        Sorts.quickSort(arr3);
	        Integer [] expected3 = {3};
	        Assert.assertArrayEquals(expected3, arr3);
	    }


	}
