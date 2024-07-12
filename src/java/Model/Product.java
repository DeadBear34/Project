package Model;

public class Product {
    private String id;
    private String name;
    private double price;
    private String image;
    private String category;

    public Product(String id, String name, double price, String imageUrl, String category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = imageUrl;
        this.category = category;
    }

    // Getters and Setters for all fields

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // Optional: getImageUrl() method if needed
    public String getImageUrl() {
        return this.image;
    }
}
