<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift & Drift - Wear Stories, Not Just Threads</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">

    <!-- CORRECTED FONTS: Bebas Neue + Montserrat + Inter fallback -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>

<body>

<!-- ========================
     SECTION 1 — NAVBAR
     (LEFT: text links | RIGHT: icons + Be a Seller)
     ======================== -->
<nav class="navbar">

    <%-- LEFT group: text nav links --%>
    <ul class="navbar-links">
        <li><a href="${pageContext.request.contextPath}/home">HOME</a></li>
        <li><a href="${pageContext.request.contextPath}/shop">SHOP</a></li>
        <li><a href="${pageContext.request.contextPath}/about">ABOUT</a></li>
        <li><a href="${pageContext.request.contextPath}/contact">CONTACT</a></li>
    </ul>

    <%-- RIGHT group: SVG icons + Be a Seller pill --%>
    <div class="navbar-icons">

        <%-- Search icon --%>
        <a href="${pageContext.request.contextPath}/search" title="Search">
            <svg class="icon-svg" viewBox="0 0 24 24">
                <circle cx="11" cy="11" r="7"/>
                <line x1="21" y1="21" x2="16.65" y2="16.65"/>
            </svg>
        </a>

        <%-- Wishlist / Star icon (matching reference) --%>
        <a href="${pageContext.request.contextPath}/wishlist" title="Wishlist">
            <svg class="icon-svg" viewBox="0 0 24 24">
                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
            </svg>
        </a>

        <%-- Bag / Cart icon --%>
        <a href="${pageContext.request.contextPath}/cart" title="Cart">
            <svg class="icon-svg" viewBox="0 0 24 24">
                <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/>
                <line x1="3" y1="6" x2="21" y2="6"/>
                <path d="M16 10a4 4 0 0 1-8 0"/>
            </svg>
        </a>

        <%-- Person / Account icon --%>
        <a href="${pageContext.request.contextPath}/login" title="Account">
            <svg class="icon-svg" viewBox="0 0 24 24">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                <circle cx="12" cy="7" r="4"/>
            </svg>
        </a>

        <%-- "Be a Seller" pill button --%>
        <a class="btn-sell" href="${pageContext.request.contextPath}/sell">Be a Seller</a>
    </div>
</nav>

<!-- ========================
     BRAND HEADING BLOCK
     Big THRIFT&DRIFT title + tagline row
     ======================== -->
<div class="brand-heading-block">
    <span class="brand-title">THRIFT&amp;DRIFT</span>
    <div class="brand-tagline-row">
        <span>Browse Pre-loved Pieces &nbsp;&rarr;&nbsp; Pick Your Size &amp; Condition &nbsp;&rarr;&nbsp; Checkout Securely &nbsp;&rarr;&nbsp; Wear the Story &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Browse Pre-loved Pieces &nbsp;&rarr;&nbsp; Pick Your Size &amp; Condition &nbsp;&rarr;&nbsp; Checkout Securely &nbsp;&rarr;&nbsp; Wear the Story &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</div>

<!-- ========================
     SECTION 2 — HERO IMAGE
     Full-width clothing rack photo
     ======================== -->
<section class="hero">

    <img class="hero-img"
         src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=1600&q=80"
         alt="Clothing rack - Thrift and Drift">

    <%-- Frosted glass center card --%>
    <div class="hero-overlay">
        <h1>Wear Stories,<br>Not just Threads.</h1>
        <p>Drift Into What&#39;s Yours</p>
        <a href="${pageContext.request.contextPath}/shop" class="btn-primary">Shop Now</a>
    </div>

    <%-- Bottom-right circle badge --%>
    <div class="hero-badge">PRELOVED PIECES.<br>NEW ENERGY</div>
</section>

<!-- ========================
     SECTION 3 — CATEGORY SCROLL STRIP (red belt)
     ======================== -->
<div class="category-bar">
    <div class="category-bar-track">
        <span>CURATED FINDS &nbsp;&#8226;&nbsp; SUSTAINABLE STYLE &nbsp;&#8226;&nbsp; PRE-LOVED &nbsp;&#8226;&nbsp; UNIQUE PIECES &nbsp;&#8226;&nbsp; MOVE FREELY &nbsp;&#8226;&nbsp; LOOK FIERCE &nbsp;&#8226;&nbsp; CURATED FINDS &nbsp;&#8226;&nbsp; SUSTAINABLE STYLE &nbsp;&#8226;&nbsp; PRE-LOVED &nbsp;&#8226;&nbsp; UNIQUE PIECES &nbsp;&#8226;&nbsp; MOVE FREELY &nbsp;&#8226;&nbsp; LOOK FIERCE &nbsp;&nbsp;&nbsp;&nbsp;</span>
        <span>CURATED FINDS &nbsp;&#8226;&nbsp; SUSTAINABLE STYLE &nbsp;&#8226;&nbsp; PRE-LOVED &nbsp;&#8226;&nbsp; UNIQUE PIECES &nbsp;&#8226;&nbsp; MOVE FREELY &nbsp;&#8226;&nbsp; LOOK FIERCE &nbsp;&#8226;&nbsp; CURATED FINDS &nbsp;&#8226;&nbsp; SUSTAINABLE STYLE &nbsp;&#8226;&nbsp; PRE-LOVED &nbsp;&#8226;&nbsp; UNIQUE PIECES &nbsp;&#8226;&nbsp; MOVE FREELY &nbsp;&#8226;&nbsp; LOOK FIERCE &nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>
</div>

<!-- ========================
     SECTION 4 — NEW-IN FRESH DROPS
     ======================== -->
<section class="new-in-section">

    <h2 class="section-heading">New-In fresh drops</h2>

    <%-- Filter tabs --%>
    <div class="filter-tabs">
        <span class="filter-tab active">TOP BEFORE</span>
        <span class="filter-tab">DRESSES</span>
        <span class="filter-tab">TROUSERS</span>
        <span class="filter-tab">FORMALS</span>
        <span class="filter-tab">NIGHT</span>
    </div>

    <%-- 3-column product grid --%>
    <div class="products-grid">

        <%-- Card 1 --%>
        <div class="product-card">
            <span class="product-badge">New In</span>
            <span class="product-wishlist">
                <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </span>
            <img class="product-card-img" src="https://picsum.photos/seed/dress1/300/280" alt="Flouncy Lace">
            <div class="product-name">Flouncy Lace</div>
            <div class="product-rating">
                <svg viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                <span>4.5 (122)</span>
            </div>
            <span class="product-price">Rs. 2,500</span>
            <a href="${pageContext.request.contextPath}/product?id=1" class="btn-add-cart">ADD NOW</a>
        </div>

        <%-- Card 2 --%>
        <div class="product-card">
            <span class="product-badge">New In</span>
            <span class="product-wishlist">
                <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </span>
            <img class="product-card-img" src="https://picsum.photos/seed/denim2/300/280" alt="Denim Jeans">
            <div class="product-name">Denim Jeans</div>
            <div class="product-rating">
                <svg viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                <span>4.3 (98)</span>
            </div>
            <span class="product-price">Rs. 1,800</span>
            <a href="${pageContext.request.contextPath}/product?id=2" class="btn-add-cart">ADD NOW</a>
        </div>

        <%-- Card 3 --%>
        <div class="product-card">
            <span class="product-badge">New In</span>
            <span class="product-wishlist">
                <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </span>
            <img class="product-card-img" src="https://picsum.photos/seed/black3/300/280" alt="Denim Skirt">
            <div class="product-name">Denim Skirt</div>
            <div class="product-rating">
                <svg viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                <span>4.7 (204)</span>
            </div>
            <span class="product-price">Rs. 1,500</span>
            <a href="${pageContext.request.contextPath}/product?id=3" class="btn-add-cart">ADD NOW</a>
        </div>

    </div>

    <%-- Pagination dots --%>
    <div class="pagination-dots">
        <span class="active"></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <%-- For Better Finds link --%>
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

        <a href="${pageContext.request.contextPath}/product?id=10" class="designer-card">
            <img src="https://picsum.photos/seed/lace10/400/340" alt="Zara Patterned Maxi Dress">
            <div class="designer-card-label">ZARA PATTERNED MAXI DRESS</div>
        </a>

        <a href="${pageContext.request.contextPath}/product?id=11" class="designer-card">
            <img src="https://picsum.photos/seed/green11/400/340" alt="Prada Corbell Coat">
            <div class="designer-card-label">PRADA CORBELL BRIGHT UP LET HER COAT</div>
        </a>

        <a href="${pageContext.request.contextPath}/product?id=12" class="designer-card">
            <img src="https://picsum.photos/seed/beige12/400/340" alt="Gucci Canvas Coat">
            <div class="designer-card-label">GUCCI COTTON CANVAS NAOMI COAT</div>
        </a>

    </div>
</section>

<!-- ========================
     SECTION 6 — OUR STORY
     ======================== -->
<section class="story-section">

    <img class="story-bg-img" src="https://picsum.photos/seed/fabric20/1400/480" alt="Our Story background">
    <div class="story-overlay"></div>

    <div class="story-content">
        <span class="story-tag">OUR STORY</span>
        <h2>Crafted with purpose, worn with pride.</h2>
        <p>We take pre-loved fashion and give it a second life — each piece cleaned, steamed, and ready for decades more. Every item tells a story, and we believe in keeping those stories alive.</p>
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
     SECTION 7 — WHERE SUSTAINABLE MEETS STYLE
     ======================== -->
<section class="features-section">

    <h2 class="section-heading">Where Sustainable Meets Style</h2>

    <%-- 4-column icon + text grid --%>
    <div class="features-grid">

        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24">
                <rect x="2" y="3" width="20" height="14" rx="2"/>
                <line x1="8" y1="21" x2="16" y2="21"/>
                <line x1="12" y1="17" x2="12" y2="21"/>
            </svg>
            <h4>Browse</h4>
            <p>Explore our curated collection of pre-loved fashion, filtered by style, era, and condition.</p>
        </div>

        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24">
                <path d="M20.38 3.46L16 2a4 4 0 0 1-8 0L3.62 3.46a2 2 0 0 0-1.34 2.23l.58 3.57a1 1 0 0 0 .99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 0 0 2-2V10h2.15a1 1 0 0 0 .99-.84l.58-3.57a2 2 0 0 0-1.34-2.23z"/>
            </svg>
            <h4>Pick Your Size And Condition</h4>
            <p>Choose from a wide variety — filter by size, condition, and category to find your perfect match.</p>
        </div>

        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24">
                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
            </svg>
            <h4>Buy Securely</h4>
            <p>Safe, easy checkout with multiple payment options — your purchase is always protected.</p>
        </div>

        <div class="feature-item">
            <svg class="feature-icon" viewBox="0 0 24 24">
                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
            </svg>
            <h4>Wear And Cherish</h4>
            <p>Your next favourite piece arrives clean, verified, and ready to become part of your story.</p>
        </div>

    </div>

    <%-- Full-width CTA sell banner --%>
    <div class="sell-banner">

        <%-- Left: text + button --%>
        <div class="sell-banner-text">
            <h3>CLOTHES SITTING IN YOUR CLOSET? GIVE THEM A NEW LIFE</h3>
            <p>List your pre-loved fashion and give someone else a chance to love it as much as you did.</p>
            <a href="${pageContext.request.contextPath}/sell" class="btn-white">SELL NOW</a>
        </div>

        <%-- Right: 2x2 image grid --%>
        <div class="sell-banner-images">
            <img src="https://picsum.photos/seed/sell1/250/150" alt="">
            <img src="https://picsum.photos/seed/sell2/250/150" alt="">
            <img src="https://picsum.photos/seed/sell3/250/150" alt="">
            <img src="https://picsum.photos/seed/sell4/250/150" alt="">
        </div>

    </div>

</section>

<!-- ========================
     SECTION 8 — CURATED FOR CHARACTER / STATS
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
     SECTION 9 — CONTACT US
     ======================== -->
<section class="contact-section">

    <%-- Left: image --%>
    <div class="contact-img-side">
        <img src="https://picsum.photos/seed/contact30/700/400" alt="Contact us">
    </div>

    <%-- Right: form --%>
    <div class="contact-form-side">
        <h3>CONTACT US</h3>
        <div class="contact-fields">
            <input type="text"  name="name"    placeholder="Name">
            <input type="email" name="email"   placeholder="Email">
            <input type="tel"   name="phone"   placeholder="Phone Number">
            <textarea name="message" rows="4"  placeholder="Message"></textarea>
        </div>
        <button type="submit" class="btn-submit">SUBMIT</button>
    </div>

</section>

<!-- ========================
     SECTION 10 — FOOTER
     ======================== -->

<%-- Part A: Links row --%>
<div class="footer-top">

    <%-- Column 1: Logo + socials --%>
    <div class="footer-col">
        <span class="footer-logo">THRIFT&amp;DRIFT</span>
        <div class="footer-social">
            <%-- Instagram --%>
            <a href="#" title="Instagram">
                <svg viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"/>
                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/>
                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"/>
                </svg>
            </a>
            <%-- TikTok (music note outline) --%>
            <a href="#" title="TikTok">
                <svg viewBox="0 0 24 24">
                    <path d="M9 18V5l12-2v4"/>
                    <circle cx="6" cy="18" r="3"/>
                    <circle cx="18" cy="16" r="3"/>
                </svg>
            </a>
            <%-- Facebook --%>
            <a href="#" title="Facebook">
                <svg viewBox="0 0 24 24">
                    <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/>
                </svg>
            </a>
        </div>
    </div>

    <%-- Column 2: Quick Links --%>
    <div class="footer-col">
        <h4>Quick Links</h4>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/cart">Add Cart</a>
        <a href="${pageContext.request.contextPath}/sell">Sell With Us</a>
        <a href="${pageContext.request.contextPath}/shop">Explore Items</a>
    </div>

    <%-- Column 3: Policies --%>
    <div class="footer-col">
        <h4>Policies</h4>
        <a href="${pageContext.request.contextPath}/privacy">Privacy Policy</a>
        <a href="${pageContext.request.contextPath}/terms">Terms of Use</a>
        <a href="${pageContext.request.contextPath}/shipping">Shipping &amp; Returns</a>
    </div>

    <%-- Column 4: Newsletter --%>
    <div class="footer-col">
        <h4>Newsletter</h4>
        <a href="mailto:hello@thriftanddrift.com">hello@thriftanddrift.com</a>
        <a href="tel:+9771234567">+977 123 4567</a>
        <a href="#">Kathmandu, Nepal</a>
    </div>

</div>

<%-- Part B: Display logo bar --%>
<div class="footer-brand-bar">
    <span class="brand-display">THRIFT&amp;DRIFT</span>
</div>

<%-- Part C: Copyright --%>
<div class="footer-copy">
    &copy; 2025 Thrift and Drift. All rights reserved.
</div>

</body>
</html>
