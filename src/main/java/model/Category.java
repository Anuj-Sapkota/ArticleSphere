package model;
public class Category
{
	private int categoryId;
	private String categoryName;
	//Constructor without the Id for data that will be sent to database
	public Category(String categoryName) {
		super();
		this.categoryName = categoryName;
	}
	// Constructor with id that will be retrieved from the database
	public Category(int categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}
	//getters and setters methods
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}