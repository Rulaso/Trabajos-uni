package Punto8;

import java.util.List;
import java.util.LinkedList;

public class Queue <T> extends Sequence{
	protected List<T> data;
	public Queue() {
		
	}
	
	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public void enqueue(T data) {
		if(this.isEmpty()) {
			this.data = new LinkedList<T>();
			this.data.add(data);
			
		} else {
			this.data.add(data);
		}
	
	}
	
	public Queue<T> dequeue() {
		if(!this.isEmpty()) {
			this.data.remove(0);
		} else {
			System.out.println("LA COLA ESTA VACIA");
		}
		
		return this;
	}
		
	public boolean isEmpty() {
		if(this.getData() == null) {
			return true;
		}
		return false;
	}
	
	public int size() {
		int cant = 0;
		int i=0;
		while((!this.isEmpty()) && (i< this.data.size())) {
			this.data.get(i);	
			i++;
			cant++;
		}
		return cant;
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