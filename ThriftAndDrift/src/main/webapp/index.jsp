<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift & Drift - Wear Stories, Not Just Threads</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,400;0,800;1,400;1,800&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>

<!-- ========================
     SECTION 1 — NAVBAR
     ======================== -->
<nav class="navbar">
    <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">Shop</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>

    <div class="nav-right">
        <a href="#" class="nav-icon" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></a>
        <a href="#" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Star"></a>
        <a href="#" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="#" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="User"></a>
        <a href="#" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<!-- ========================
     BRAND HEADING BLOCK
     ======================== -->
<div class="brand-heading-block">
    <span class="brand-title">THRIFT&amp;DRIFT</span>
    <div class="brand-tagline-row">
        <span>Browse Pre-loved Pieces &nbsp;&rarr;&nbsp; Pick Your Size &amp; Condition &nbsp;&rarr;&nbsp; Checkout Securely &nbsp;&rarr;&nbsp; Wear the Story &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</div>

<!-- ========================
     SECTION 2 — HERO IMAGE
     ======================== -->
<section class="hero">
    <img class="hero-img" src="${pageContext.request.contextPath}/images/hanger.jpg" alt="Clothing rack - Thrift and Drift">

    <div class="hero-overlay">
        <h1>Wear Stories,<br>Not just Threads.</h1>
        <p>Drift Into What's Yours</p>
        <a href="${pageContext.request.contextPath}/shop" class="btn-primary">Shop Now</a>
    </div>

    <div class="hero-badge">PRELOVED PIECES.<br>NEW ENERGY</div>
</section>

<!-- ========================
     SECTION 3 — CATEGORY SCROLL STRIP
     ======================== -->
<div class="category-bar">
    <div class="category-bar-track">
        <span>CURATED FINDS &nbsp;&#8226;&nbsp; SUSTAINABLE STYLE &nbsp;&#8226;&nbsp; PRE-LOVED &nbsp;&#8226;&nbsp; UNIQUE PIECES &nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</div>

<!-- ========================
     SECTION 4 — NEW-IN FRESH DROPS
     ======================== -->
<section class="new-in-section">
    <h2 class="section-heading">New-In fresh drops</h2>

    <div class="filter-tabs">
        <!-- MODEL: categories expected as List<Category> categories -->
        <c:forEach var="cat" items="${categories}">
            <span class="filter-tab ${cat.id == currentCategoryId ? 'active' : ''}">${cat.name}</span>
        </c:forEach>
    </div>

    <div class="products-grid">
        <!-- MODEL: products list expected as List<Product> productsList -->
        <c:forEach var="product" items="${productsList}">
            <div class="product-card">
                <c:if test="${product.newIn}">
                    <span class="product-badge">New In</span>
                </c:if>
                <span class="product-wishlist">
                    <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
                </span>
                <img class="product-card-img" src="${pageContext.request.contextPath}/images/${product.image}" alt="${product.name}">
                <div class="product-name"><c:out value="${product.name}"/></div>
                <div class="product-rating">
                    <svg viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                    <span>${product.rating} (${product.reviewCount})</span>
                </div>
                <span class="product-price">Rs. <c:out value="${product.price}"/></span>
                <a href="${pageContext.request.contextPath}/cart/add?id=${product.id}" class="btn-add-cart">ADD NOW</a>
            </div>
        </c:forEach>
    </div>

    <div class="view-more-link">
        <a href="${pageContext.request.contextPath}/shop">FOR BETTER FINDS &rarr;</a>
    </div>
</section>

<!-- ========================
     SECTION 5 — DESIGNER FINDS
     ======================== -->
<section class="designer-section">
    <h2 class="section-heading">Some Of Our Designer Finds</h2>
    <div class="designer-grid">
        <!-- MODEL: designerProducts expected as List<Product> designerProducts -->
        <c:forEach var="dProduct" items="${designerProducts}">
            <a href="${pageContext.request.contextPath}/product?id=${dProduct.id}" class="designer-card">
                <img src="${pageContext.request.contextPath}/images/${dProduct.image}" alt="${dProduct.name}">
                <div class="designer-card-label"><c:out value="${dProduct.displayName}"/></div>
            </a>
        </c:forEach>
    </div>
</section>

<!-- ========================
     SECTION 6 — OUR STORY
     ======================== -->
<section class="story-section">
    <img class="story-bg-img" src="${pageContext.request.contextPath}/images/ourStory.jpg" alt="Our Story background">
    <div class="story-overlay"></div>

    <div class="story-content">
        <span class="story-tag">OUR STORY</span>
        <h2>Crafted with purpose, worn with pride.</h2>
        <p>We take pre-loved fashion and give it a second life — each piece cleaned, steamed, and ready for decades more.</p>
        <div class="story-btns">
            <a href="${pageContext.request.contextPath}/about" class="btn-outline-white">Meet the team</a>
            <a href="${pageContext.request.contextPath}/about#process" class="btn-outline-white">Get to know the process</a>
        </div>
    </div>

    <div class="story-footer">
        <span>Est. 2018 &middot; Kathmandu, Nepal &middot; 100% circular sourcing</span>
        <a href="${pageContext.request.contextPath}/about">Full story &rarr;</a>
    </div>
</section>

<!-- ========================
     SECTION 7 — SUSTAINABLE FEATURES
     ======================== -->
<section class="features-section">
    <h2 class="section-heading">Where Sustainable Meets Style</h2>
    <div class="features-grid">
        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
            <h4>Browse</h4>
            <p>Explore our curated collection of pre-loved fashion, filtered by style, era, and condition.</p>
        </div>
        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24"><path d="M20.38 3.46L16 2a4 4 0 0 1-8 0L3.62 3.46a2 2 0 0 0-1.34 2.23l.58 3.57a1 1 0 0 0 .99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 0 0 2-2V10h2.15a1 1 0 0 0 .99-.84l.58-3.57a2 2 0 0 0-1.34-2.23z"/></svg>
            <h4>Pick Your Size</h4>
            <p>Choose from a wide variety — filter by size, condition, and category.</p>
        </div>
        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
            <h4>Buy Securely</h4>
            <p>Safe, easy checkout with multiple payment options.</p>
        </div>
        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            <h4>Wear And Cherish</h4>
            <p>Your next favourite piece arrives clean, verified, and ready.</p>
        </div>
    </div>

    <div class="sell-banner">
        <div class="sell-banner-text">
            <h3>CLOTHES SITTING IN YOUR CLOSET? GIVE THEM A NEW LIFE</h3>
            <p>List your pre-loved fashion and give someone else a chance to love it.</p>
            <a href="${pageContext.request.contextPath}/sell" class="btn-white">SELL NOW</a>
        </div>
        <div class="sell-banner-images">
            <img src="${pageContext.request.contextPath}/images/clothesCloset.jpg" alt="Closet Shelf">
        </div>
    </div>
</section>

<!-- ========================
     SECTION 8 — STATS
     ======================== -->
<section class="stats-section">
    <div class="curated-watermark">Curated for Character</div>
    <div class="stats-row">
        <div class="stat-item">
            <div class="stat-number">15,000+</div>
            <div class="stat-label">Items available for you to explore</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">Rs 5 lakhs</div>
            <div class="stat-label">Successfully saved by our community</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">100%</div>
            <div class="stat-label">Items verified and quality checked</div>
        </div>
    </div>
</section>

<!-- ========================
     SECTION 9 — CONTACT
     ======================== -->
<section class="contact-section">
    <div class="contact-img-side">
        <img src="${pageContext.request.contextPath}/images/ContactUs.jpg" alt="Contact us">
    </div>
    <div class="contact-form-side">
        <h3>CONTACT US</h3>
        <form action="${pageContext.request.contextPath}/contact" method="POST">
            <div class="contact-fields">
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="tel" name="phone" placeholder="Phone Number">
                <textarea name="message" rows="4" placeholder="Message" required></textarea>
            </div>
            <button type="submit" class="btn-submit">SUBMIT</button>
        </form>
    </div>
</section>

<!-- ── FOOTER ── -->
<footer class="footer">
    <div class="footer-top">
        <div class="footer-brand">
            <p>Islington College</p>
            <p>Kamalpokhari, Dhobidhara</p>
            <p class="phone">+977 9810349297</p>
            <p>01 4335544</p>
            <a href="#" class="site-link">thrift&amp;drift.com</a>
            <div class="footer-social">
                <a href="https://www.instagram.com" target="_blank" title="Instagram"><img src="${pageContext.request.contextPath}/images/social.png" alt="Instagram"></a>
				<a href="https://www.tiktok.com" target="_blank" title="TikTok"><img src="${pageContext.request.contextPath}/images/tik-tok.png" alt="TikTok"></a>
				<a href="https://www.twitter.com" target="_blank" title="Twitter"><img src="${pageContext.request.contextPath}/images/twitter.png" alt="Twitter"></a>
				<a href="https://www.whatsapp.com" target="_blank" title="WhatsApp"><img src="${pageContext.request.contextPath}/images/whatsapp (1).png" alt="WhatsApp"></a>
				<a href="https://www.youtube.com" target="_blank" title="YouTube"><img src="${pageContext.request.contextPath}/images/youtube.png" alt="YouTube"></a>
            </div>
        </div>

        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="#">Sell</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Collections</a></li>
                <li><a href="#">Explore products</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Services</h4>
            <ul>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms &amp; Conditions</a></li>
                <li><a href="#">Shipping &amp; Returns</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <div class="footer-logos">
                <div class="footer-logo-box"></div>
                <div class="footer-logo-box"></div>
            </div>
        </div>
    </div>

    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
