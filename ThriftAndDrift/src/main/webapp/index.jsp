<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift & Drift | Pre-Loved Fashion</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <a href="index.jsp" class="logo">
        Thrift<span>&amp;</span>Drift
        <span class="tagline">Pre-Loved Fashion</span>
    </a>

    <ul class="nav-links">
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="pages/user/browse.jsp">Shop</a></li>
        <li><a href="pages/user/about.jsp">About Us</a></li>
        <li><a href="pages/user/contact.jsp">Contact</a></li>
    </ul>

    <div class="nav-right">
        <div class="search-bar">
            <span>&#128269;</span>
            <input type="text" placeholder="Search...">
        </div>

        <div class="nav-icons">
            <a href="pages/user/wishlist.jsp" class="nav-icon-btn">
                &#9829;
                <span class="badge">0</span>
            </a>
            <a href="pages/user/cart.jsp" class="nav-icon-btn">
                &#128722;
                <span class="badge">0</span>
            </a>
        </div>

        <a href="pages/user/login.jsp" class="btn-login">
            &#128100; Log In
        </a>

        <a href="pages/user/sell.jsp" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="hero-text">
        <h1>Give Clothes a <span>Second</span> Chance</h1>
        <p>Buy and sell pre-loved fashion at unbeatable prices.
           Sustainable, stylish and affordable.</p>
        <div class="hero-buttons">
            <a href="pages/user/browse.jsp" class="btn-primary">Start Thrifting</a>
            <a href="pages/user/sell.jsp" class="btn-secondary">Sell Your Clothes</a>
        </div>
    </div>
    <div class="hero-badge">
        100%<br>Authentic<br>Items
    </div>
</section>

<!-- CATEGORIES -->
<section class="section">
    <h2 class="section-title">Shop by Category</h2>
    <p class="section-subtitle">Find exactly what you are looking for</p>
    <div class="categories-grid">
        <a href="pages/user/browse.jsp" class="category-card">
            <div class="icon">&#128085;</div>
            <h3>Tops</h3>
        </a>
        <a href="pages/user/browse.jsp" class="category-card">
            <div class="icon">&#128086;</div>
            <h3>Bottoms</h3>
        </a>
        <a href="pages/user/browse.jsp" class="category-card">
            <div class="icon">&#128095;</div>
            <h3>Shoes</h3>
        </a>
        <a href="pages/user/browse.jsp" class="category-card">
            <div class="icon">&#128092;</div>
            <h3>Accessories</h3>
        </a>
    </div>
</section>

<!-- FEATURED ITEMS -->
<section class="featured">
    <h2 class="section-title">Featured Items</h2>
    <p class="section-subtitle">Fresh drops from our community</p>
    <div class="products-grid">
        <div class="product-card">
            <div class="product-img">&#128085;</div>
            <div class="product-info">
                <h4>Vintage Denim Jacket</h4>
                <div class="condition">&#11088;&#11088;&#11088;&#11088;&#11088; Excellent</div>
                <div class="price">Rs. 1,200</div>
                <button class="btn-card">Add to Cart</button>
            </div>
        </div>
        <div class="product-card">
            <div class="product-img">&#128087;</div>
            <div class="product-info">
                <h4>Floral Summer Dress</h4>
                <div class="condition">&#11088;&#11088;&#11088;&#11088; Good</div>
                <div class="price">Rs. 850</div>
                <button class="btn-card">Add to Cart</button>
            </div>
        </div>
        <div class="product-card">
            <div class="product-img">&#128095;</div>
            <div class="product-info">
                <h4>Classic White Sneakers</h4>
                <div class="condition">&#11088;&#11088;&#11088;&#11088;&#11088; Excellent</div>
                <div class="price">Rs. 2,000</div>
                <button class="btn-card">Add to Cart</button>
            </div>
        </div>
        <div class="product-card">
            <div class="product-img">&#129509;</div>
            <div class="product-info">
                <h4>Wool Coat</h4>
                <div class="condition">&#11088;&#11088;&#11088; Fair</div>
                <div class="price">Rs. 1,500</div>
                <button class="btn-card">Add to Cart</button>
            </div>
        </div>
    </div>
</section>

<!-- HOW IT WORKS -->
<section class="how-it-works">
    <h2 class="section-title">How It Works</h2>
    <p class="section-subtitle">Simple, easy, sustainable</p>
    <div class="steps-grid">
        <div class="step-card">
            <div class="step-number">1</div>
            <h3>Browse Items</h3>
            <p>Explore hundreds of pre-loved clothing items from our community of sellers.</p>
        </div>
        <div class="step-card">
            <div class="step-number">2</div>
            <h3>Buy or Sell</h3>
            <p>Purchase items you love or list your own clothes for sale in minutes.</p>
        </div>
        <div class="step-card">
            <div class="step-number">3</div>
            <h3>Get Delivered</h3>
            <p>Receive your order at your doorstep quickly and safely.</p>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="footer">
    <div class="footer-grid">
        <div>
            <h4>Thrift &amp; Drift</h4>
            <p>Pre-loved fashion for everyone. Sustainable, stylish and affordable.</p>
        </div>
        <div>
            <h4>Quick Links</h4>
            <a href="index.jsp">Home</a>
            <a href="pages/user/browse.jsp">Shop</a>
            <a href="pages/user/about.jsp">About Us</a>
            <a href="pages/user/contact.jsp">Contact</a>
        </div>
        <div>
            <h4>Contact Us</h4>
            <p>&#128231; hello@thriftanddrift.com</p>
            <p>&#128222; +977 9800000000</p>
            <p>&#128205; Kathmandu, Nepal</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2026 Thrift &amp; Drift. All rights reserved.</p>
    </div>
</footer>

<script src="js/main.js"></script>

</body>
</html>