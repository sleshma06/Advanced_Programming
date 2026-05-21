<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} | Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>
        <li><a href="${pageContext.request.contextPath}/AboutServlet">About</a></li>
        <li><a href="${pageContext.request.contextPath}/HomeServlet#contact-us">Contact</a></li>
    </ul>

    <div class="nav-right">
        <a href="${pageContext.request.contextPath}/ShopServlet" class="nav-icon" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></a>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="${pageContext.request.contextPath}/LoginServlet" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="User"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<main class="product-detail">
    <a class="back-link" href="${pageContext.request.contextPath}/ShopServlet">&larr; Back to shop</a>
    <section class="detail-card">
        <div class="detail-image">
            <span class="condition-chip">${product.condition}</span>
            <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
        </div>

        <div class="detail-info">
            <p class="detail-category">${product.category}</p>
            <h1>${product.name}</h1>
            <p class="detail-price">Rs ${product.price}</p>
            <p class="detail-description">${product.description}</p>

            <dl class="detail-list">
                <div>
                    <dt>Condition</dt>
                    <dd>${product.condition}</dd>
                </div>
                <div>
                    <dt>Rating</dt>
                    <dd>${product.rating}</dd>
                </div>
                <div>
                    <dt>Size</dt>
                    <dd>${product.size}</dd>
                </div>
                <div>
                    <dt>Category</dt>
                    <dd>${product.category}</dd>
                </div>
            </dl>

            <div class="detail-actions">
                <form method="post" action="${pageContext.request.contextPath}/BagServlet">
                    <input type="hidden" name="productId" value="${product.id}">
                    <input type="hidden" name="productName" value="${product.name}">
                    <input type="hidden" name="productPrice" value="${product.price}">
                    <button type="submit" class="btn-detail-primary">Add to Bag</button>
                </form>
                <form method="post" action="${pageContext.request.contextPath}/WishlistServlet">
                    <input type="hidden" name="productId" value="${product.id}">
                    <input type="hidden" name="returnUrl" value="${pageContext.request.contextPath}/ProductDetailServlet?id=${product.id}">
                    <button type="submit" class="btn-detail-secondary">Add to Wishlist</button>
                </form>
            </div>
        </div>
    </section>
</main>

<footer class="footer" id="footer">
    <div class="footer-top">
        <div class="footer-brand">
            <p>Islington College</p>
            <p>Kamalpokhari, Dhobidhara</p>
            <p class="phone">+977 9810349297</p>
            <p>01 4335544</p>
            <a href="#" class="site-link">thrift&amp;drift.com</a>
        </div>

        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li>
                <li><a href="${pageContext.request.contextPath}/AboutServlet">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/ShopServlet">Collections</a></li>
                <li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li>
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
    </div>

    <div class="footer-brand-name">THRIFT&amp;DRIFT</div>
    <div class="footer-copy">&copy; 2024 Thrift&amp;Drift. All rights reserved.</div>
</footer>

</body>
</html>
