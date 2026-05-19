<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
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
                <span>Showing 1-4 of 4 products &nbsp;&nbsp; Sort by: <strong>Newest First &#8964;</strong></span>
            </div>
        </div>

        <div class="product-grid">
            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="badge-new">Good</span>
                    <img src="${pageContext.request.contextPath}/images/c4.jfif" alt="Brown skirt">
                    <a class="wishlist-btn" href="${pageContext.request.contextPath}/WishlistServlet" title="Add to Wishlist">&#9734;</a>
                </div>
                <div class="product-info">
                    <p class="product-name">Brown Skirt</p>
                    <p class="product-meta-line">Sold by Thrift&amp;Drift Store</p>
                    <div class="product-bottom">
                        <span class="product-price">Rs 450</span>
                        <a href="${pageContext.request.contextPath}/BagServlet" class="btn-add-bag">Add to Cart</a>
                    </div>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="badge-new">Like New</span>
                    <img src="${pageContext.request.contextPath}/images/c3.jfif" alt="Short jean skirt">
                    <a class="wishlist-btn" href="${pageContext.request.contextPath}/WishlistServlet" title="Add to Wishlist">&#9734;</a>
                </div>
                <div class="product-info">
                    <p class="product-name">Short Jean Skirt</p>
                    <p class="product-meta-line">Sold by Thrift&amp;Drift Store</p>
                    <div class="product-bottom">
                        <span class="product-price">Rs 290</span>
                        <a href="${pageContext.request.contextPath}/BagServlet" class="btn-add-bag">Add to Cart</a>
                    </div>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="badge-new">Good</span>
                    <img src="${pageContext.request.contextPath}/images/denim.jpg" alt="Denim jacket">
                    <a class="wishlist-btn" href="${pageContext.request.contextPath}/WishlistServlet" title="Add to Wishlist">&#9734;</a>
                </div>
                <div class="product-info">
                    <p class="product-name">Vintage Denim Jacket</p>
                    <p class="product-meta-line">Sold by Thrift&amp;Drift Store</p>
                    <div class="product-bottom">
                        <span class="product-price">Rs 780</span>
                        <a href="${pageContext.request.contextPath}/BagServlet" class="btn-add-bag">Add to Cart</a>
                    </div>
                </div>
            </div>

            <div class="product-card">
                <div class="product-img-wrap">
                    <span class="badge-new">Like New</span>
                    <img src="${pageContext.request.contextPath}/images/polkadot.jpg" alt="Floral skirt">
                    <a class="wishlist-btn" href="${pageContext.request.contextPath}/WishlistServlet" title="Add to Wishlist">&#9734;</a>
                </div>
                <div class="product-info">
                    <p class="product-name">Floral Midi Skirt</p>
                    <p class="product-meta-line">Sold by Thrift&amp;Drift Store</p>
                    <div class="product-bottom">
                        <span class="product-price">Rs 899</span>
                        <a href="${pageContext.request.contextPath}/BagServlet" class="btn-add-bag">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<footer class="footer">
    <div class="footer-top">
        <div class="footer-brand">
            <p>Islington College</p>
            <p>Kamalpokhari, Dhobidhara</p>
            <p class="phone">+977 9810349297</p>
            <p>01 4335544</p>
            <a href="#" class="site-link">thrift&amp;drift.com</a>
        </div>
        <div class="footer-col"><h4>Quick Links</h4><ul><li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li><li><a href="#">About Us</a></li><li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li></ul></div>
        <div class="footer-col"><h4>Services</h4><ul><li><a href="#">FAQ</a></li><li><a href="#">Privacy Policy</a></li><li><a href="#">Shipping &amp; Returns</a></li></ul></div>
    </div>
    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
