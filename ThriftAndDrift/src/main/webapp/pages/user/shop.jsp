<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
</head>
<body>

<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>

    <div class="nav-right">
        <form class="nav-search" action="${pageContext.request.contextPath}/ShopServlet" method="get">
            <input class="nav-search-input" type="search" name="q" placeholder="Search products">
            <button class="nav-search-button" type="submit" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></button>
        </form>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="User"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<div class="page-title">
    <h1>Explore Products</h1>
    <p>All items are inspected, priced, and sold by Thrift&amp;Drift.</p>
</div>

<div class="main-layout">
    <aside class="sidebar">
        <div class="sidebar-header">
            <span>Filters</span>
            <span class="filter-icon">&#9776;</span>
        </div>

        <div class="filter-section">
            <div class="filter-item"><span>Tops</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Skirts</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Outerwear</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Pants</span><span>&#8250;</span></div>
        </div>

        <div class="filter-section">
            <div class="filter-section-title"><span>Condition</span><span>&#8743;</span></div>
            <div class="filter-item"><span>Like New</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Good</span><span>&#8250;</span></div>
            <div class="filter-item"><span>Fair</span><span>&#8250;</span></div>
        </div>

        <button class="btn-apply">Apply Filter</button>
    </aside>

    <main class="product-area">
        <div class="product-area-header">
            <h2>Store Picks</h2>
            <div class="product-meta">
                <span>Showing approved store products &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
            </div>
        </div>

        <div class="product-grid">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <div class="product-img-wrap">
                        <span class="badge-new">${product.condition}</span>
                        <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
                        <a class="wishlist-btn" href="${pageContext.request.contextPath}/WishlistServlet" title="Add to Wishlist">&#9734;</a>
                    </div>
                    <div class="product-info">
                        <p class="product-name">${product.name}</p>
                        <p class="product-meta-line">Sold by Thrift&amp;Drift Store | ${product.size}</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs ${product.price}</span>
                            <a href="${pageContext.request.contextPath}/BagServlet" class="btn-add-bag">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty products}">
                <p>No approved products are listed yet.</p>
            </c:if>
        </div>
    </main>
</div>

<!-- ── NEWSLETTER BANNER ── -->
<div class="newsletter-banner">
    <div class="newsletter-text">
    Not only sell, but share the memories<br>
    behind your wardrobe.
</div>
    <div class="newsletter-form">
        <form method="post" action="${pageContext.request.contextPath}/NewsletterServlet">
            <div class="newsletter-input-wrap">
                <span>&#9993;</span>
                <input type="email" name="email" placeholder="Enter your email address" required>
            </div>
            <button type="submit" class="btn-subscribe">Subscribe to Newsletter</button>
        </form>
    </div>
</div>

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
        <div class="footer-col"><h4>Quick Links</h4><ul><li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li><li><a href="#">About Us</a></li><li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li></ul></div>
        <div class="footer-col"><h4>Services</h4><ul><li><a href="#">FAQ</a></li><li><a href="#">Privacy Policy</a></li><li><a href="#">Shipping &amp; Returns</a></li></ul></div>
    </div>
    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
