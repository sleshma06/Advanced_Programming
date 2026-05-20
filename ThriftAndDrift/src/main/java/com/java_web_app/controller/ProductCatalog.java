package com.java_web_app.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

final class ProductCatalog {
    private ProductCatalog() {
    }

    static List<Map<String, String>> products() {
        List<Map<String, String>> products = new ArrayList<>();
        products.add(product("1", "Polka-dot Skirt", "Skirts", "750", "polkadot.jpg", "New-in", "L", "Like New", "5/5",
                "A graceful polka-dot skirt with a light vintage feel, perfect for brunch, college days, or a soft formal look."));
        
        products.add(product("2", "Short Jean Skirt", "Skirts", "290", "c3.jfif", "New-in", "M", "Good", "4/5",
                "A casual denim mini skirt with a clean waistline and easy everyday styling for warm days."));
        
        products.add(product("3", "Denim Midi Skirt", "Skirts", "300", "c4.jfif", "New-in", "M", "Good", "4/5",
                "A versatile midi skirt with a structured denim look that pairs well with fitted tees and oversized shirts."));
        
        products.add(product("4", "Flared Cotton Skirt", "Skirts", "456", "c2.jfif", "Vintage", "S", "Good", "4/5",
                "A soft flared skirt with comfortable movement and a simple shape for relaxed daily outfits."));
        
        products.add(product("5", "Wrinkled Satin Skirt", "Skirts", "500", "c1.jfif", "Vintage", "L", "Like New", "5/5",
                "A satin skirt with a subtle textured finish, made for dressier evenings while staying comfortable."));

        
        products.add(product("6", "Lace Crochet Top", "Tops", "340", "shirt.png", "Vintage", "S", "Like New", "5/5",
                "A delicate crochet-inspired top that works beautifully with denim, skirts, or layered styling."));
        
        products.add(product("7", "Striped Peasant Blouse", "Tops", "270", "allison-christine-wV7UfVeI84w-unsplash.jpg", "New-in", "M", "Fair", "3/5",
                "A relaxed blouse with a breezy silhouette for casual days and soft layered looks."));
        
        products.add(product("8", "Puff Sleeve Corset Top", "Tops", "490", "DiorEmb.jpg", "Designer", "M", "Good", "4/5",
                "A statement top with puff sleeves and a shaped bodice, ideal for party styling or elevated casual wear."));
        
        products.add(product("9", "Embroidered Boho Top", "Tops", "415", "gucci.jpg", "Designer", "L", "Like New", "5/5",
                "A detailed boho-style top with embroidery accents and a premium thrifted feel."));

        
        products.add(product("10", "Camel Wool Trench Coat", "Outerwear", "1850", "PradaCoat.jpg", "Designer", "L", "Good", "4/5",
                "A polished camel trench coat with a warm tone and timeless shape for cooler days."));
        
        products.add(product("11", "Denim Oversized Jacket", "Outerwear", "990", "denim.jpg", "New-in", "XL", "Like New", "5/5",
                "An oversized denim jacket with easy layering room and a dependable streetwear feel."));
        
        products.add(product("12", "Corduroy Blazer", "Outerwear", "1200", "clothesCloset.jpg", "Vintage", "M", "Fair", "3/5",
                "A textured blazer with character, great for semi-formal outfits and vintage-inspired layering."));
        
        products.add(product("13", "Knit Cardigan Coat", "Outerwear", "760", "hanger.jpg", "Vintage", "L", "Good", "4/5",
                "A cozy cardigan coat with soft structure, made for transitional weather and relaxed outfits."));

        
        products.add(product("14", "Straight-leg Cotton Pants", "Pants", "620", "comp.jpg", "New-in", "M", "Good", "4/5",
                "Comfortable straight-leg pants with a neat everyday fit and easy neutral styling."));
        
        products.add(product("15", "Wide-leg Linen Pants", "Pants", "700", "registration.jpg", "Vintage", "L", "Like New", "5/5",
                "Airy wide-leg pants for a clean, relaxed silhouette that works from errands to coffee dates."));
        
        products.add(product("16", "Black Tailored Pants", "Pants", "840", "ourStory.jpg", "Designer", "M", "Good", "4/5",
                "A smart pair of tailored black pants for office looks, presentations, and evening styling."));

        
        products.add(product("17", "Ditsy Floral Sundress", "Dresses", "680", "ContactUs.jpg", "Vintage", "S", "Like New", "5/5",
                "A sweet floral sundress with a light shape and easy charm for sunny days."));
        
        products.add(product("18", "Slip Satin Maxi Dress", "Dresses", "890", "PradaCoat.jpg", "New-in", "M", "Good", "4/5",
                "A smooth satin maxi dress with a simple drape, suited for dinners and minimal occasion styling."));
        
        products.add(product("19", "Smocked Prairie Dress", "Dresses", "750", "polkadot.jpg", "Vintage", "L", "Like New", "5/5",
                "A prairie-style dress with soft smocking details and a romantic thrifted look."));
        
        products.add(product("20", "Classic Black Midi Dress", "Dresses", "950", "DiorEmb.jpg", "Designer", "M", "Good", "4/5",
                "A clean black midi dress that can be styled up or down for reliable wardrobe mileage."));
        
        return products;
    }

    static List<Map<String, String>> categories(List<Map<String, String>> products) {
        Map<String, Integer> counts = new LinkedHashMap<>();
        for (Map<String, String> product : products) {
            String category = product.get("category");
            counts.put(category, counts.getOrDefault(category, 0) + 1);
        }

        List<Map<String, String>> categories = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : counts.entrySet()) {
            Map<String, String> category = new LinkedHashMap<>();
            category.put("name", entry.getKey());
            category.put("count", String.valueOf(entry.getValue()));
            category.put("anchor", entry.getKey().toLowerCase().replace(" ", "-"));
            categories.add(category);
        }
        return categories;
    }

    static List<Map<String, Object>> groupedByCategory(List<Map<String, String>> products) {
        Map<String, List<Map<String, String>>> grouped = new LinkedHashMap<>();
        for (Map<String, String> product : products) {
            String category = product.get("category");
            grouped.computeIfAbsent(category, key -> new ArrayList<>()).add(product);
        }

        List<Map<String, Object>> categories = new ArrayList<>();
        for (Map.Entry<String, List<Map<String, String>>> entry : grouped.entrySet()) {
            Map<String, Object> category = new LinkedHashMap<>();
            category.put("name", entry.getKey());
            category.put("count", entry.getValue().size());
            category.put("anchor", entry.getKey().toLowerCase().replace(" ", "-"));
            category.put("products", entry.getValue());
            categories.add(category);
        }
        return categories;
    }

    static Map<String, String> findById(String id) {
        for (Map<String, String> product : products()) {
            if (product.get("id").equals(id)) {
                return product;
            }
        }
        return null;
    }

    private static Map<String, String> product(String id, String name, String category, String price, String image,
            String badge, String size, String condition, String rating, String description) {
        Map<String, String> product = new LinkedHashMap<>();
        product.put("id", id);
        product.put("name", name);
        product.put("category", category);
        product.put("price", price);
        product.put("image", image);
        product.put("badge", badge);
        product.put("size", size);
        product.put("condition", condition);
        product.put("rating", rating);
        product.put("description", description);
        return product;
    }
}
