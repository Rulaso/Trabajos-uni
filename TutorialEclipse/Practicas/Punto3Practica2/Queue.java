package Punto3Practica2;

import java.util.List;
import java.util.LinkedList;

public class Queue <T> extends Sequence{
	protected List<T> data;
	public Queue() {
		this.data = new LinkedList<T>();
	}
	
	public T getData() {
		if(data != null) {
			return data.get(0);
		}
		return null;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public void enqueue(T data) {
		this.data.add(data);
	}
	
	public T dequeue() {
		if(!this.isEmpty()) {
			T aux = this.data.get(0);
			this.data.remove(0);
			
			return aux;
		} else {
			System.out.println("LA COLA ESTA VACIA");
			return null;
		}
	}
		
	public boolean isEmpty() {
		if(this.size() == 0) {
			return true;
		}
		return false;
	}
	
	public int size() {
		if (this.data == null) {
	        return 0;
	    }
	    return this.data.size();
	}
	
	@Override
	public String toString(){
		String aux = "";
		int i=0;
		while((!this.isEmpty()) && (i< this.data.size())) {
			aux+= this.data.get(i) + ", ";
			i++;
		}
		
		return aux;
	}
	
	public T head(){
		if(!this.isEmpty()) {
			return this.data.getFirst();
		} else {
			return null;
		}
	}
	
	
	
}