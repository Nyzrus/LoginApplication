package surzyn.loginapplication.model;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="ORDERS")
public class OrderModel {

	@Id
	private int tableNumber;
	@Embedded
	private FoodItemModel item;
	
	public int getTableNumber() {
		return tableNumber;
	}
	public void setTableNumber(int tableNumber) {
		this.tableNumber = tableNumber;
	}
	public FoodItemModel getItem() {
		return item;
	}
	public void setItem(FoodItemModel item) {
		this.item = item;
	}
	
	
}
