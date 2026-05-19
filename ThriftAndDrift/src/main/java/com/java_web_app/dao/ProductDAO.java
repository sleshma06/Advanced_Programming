package com.java_web_app.dao;

import com.java_web_app.model.ProductModel;
import com.java_web_app.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<ProductModel> getListedProducts() throws SQLException {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE status = 'Listed' ORDER BY id DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                products.add(mapProduct(rs));
            }
        }
        return products;
    }

    private ProductModel mapProduct(ResultSet rs) throws SQLException {
        ProductModel product = new ProductModel();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setCategory(rs.getString("category"));
        product.setCondition(rs.getString("item_condition"));
        product.setSize(rs.getString("size"));
        product.setPrice(rs.getDouble("price"));
        product.setStatus(rs.getString("status"));
        product.setImageUrl(rs.getString("image_url"));
        return product;
    }
}
