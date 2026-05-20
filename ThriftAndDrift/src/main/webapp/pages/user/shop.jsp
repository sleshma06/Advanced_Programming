<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty shopLoaded}">
    <c:redirect url="/ShopServlet"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Shop | Thrift&amp;Drift</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,400;0,800;1,400;1,800&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
        <li><a href="#footer">Contact</a></li>
    </ul>

  
    <div class="nav-right">
        <form class="nav-search" action="${pageContext.request.contextPath}/ShopServlet" method="get">
            <input class="nav-search-input" type="search" name="q" placeholder="Search products" value="${searchQuery}">
            <button class="nav-search-button" type="submit" title="Search">
            <img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></button>
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

<div class="shop-shell" id="shop-products">

    <aside class="sidebar">
    <form class="filter-form" method="get" action="${pageContext.request.contextPath}/ShopServlet">
        <div class="sidebar-header">
            <span>Filters</span>
            <span class="filter-icon">&#9881;</span>
        </div>

        <div class="filter-section">

            <div class="filter-section-title"><span>Category</span></div>
            <label class="filter-item">
                <input type="radio" name="category" value="" ${empty selCategory ? 'checked' : ''}>
                <span>All</span><span>&#8250;</span>
            </label>
            
            <c:forEach var="category" items="${categories}">
                <label class="filter-item">
                    <input type="radio" name="category" value="${category.name}" ${selCategory eq category.name ? 'checked' : ''}>
                    <span>${category.name}</span><span>${category.count}</span>
                </label>
            </c:forEach>
        </div>

        <div class="filter-section">
            <div class="filter-section-title"><span>Price</span></div>
            <div class="price-inputs">
                <label>
                    <span>Min</span>
                    <input type="number" name="minPrice" min="99" max="10000" value="${not empty param.minPrice ? selMinPrice : ''}">
                </label>
                <label>
                    <span>Max</span>
                    <input type="number" name="maxPrice" min="99" max="10000" value="${not empty param.maxPrice ? selMaxPrice : ''}">
                </label>
            </div>
            <div class="price-labels"><span>Rs 99</span><span>Rs 10000</span></div>
        </div>

        <div class="filter-section">
            <div class="filter-section-title"><span>Size</span></div>
            <div class="size-grid">
                <label class="size-btn">
                    <input type="radio" name="size" value="" ${empty selSize ? 'checked' : ''}>
                    All
                </label>
                
                <c:forEach var="size" items="${sizes}">
                    <label class="size-btn">
                        <input type="radio" name="size" value="${size}" ${selSize eq size ? 'checked' : ''}>
                        ${size}
                    </label>
                </c:forEach>
            </div>
        </div>

        <div class="filter-section">
            <div class="filter-section-title"><span>Condition</span></div>
            <label class="filter-item">
                <input type="radio" name="condition" value="" ${empty selCondition ? 'checked' : ''}>
                <span>All</span><span>&#8250;</span>
            </label>
            
            <c:forEach var="condition" items="${conditions}">
                <label class="filter-item">
                    <input type="radio" name="condition" value="${condition}" ${selCondition eq condition ? 'checked' : ''}>
                    <span>${condition}</span><span>&#8250;</span>
                </label>
            </c:forEach>
        </div>

        <button class="btn-apply" type="submit">Apply Filter</button>
        <a class="btn-clear" href="${pageContext.request.contextPath}/ShopServlet">Clear Filters</a>
    </form>
</aside>

    <main class="product-area">

        <div class="product-area-header">
            <h2>All Products</h2>
            <p class="product-meta">Showing ${productCount} approved store products</p>
        </div>

        <div class="product-grid">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <div class="product-img-wrap">
                        <a class="product-image-link" href="${pageContext.request.contextPath}/ProductDetailServlet?id=${product.id}">
                            <span class="condition-chip">${product.condition}</span>
                            <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
                        </a>
                        <form method="post" action="${pageContext.request.contextPath}/WishlistServlet">
                            <input type="hidden" name="productId" value="${product.id}">
                            <input type="hidden" name="returnUrl" value="${currentShopUrl}">
                            <button type="submit" class="wishlist-btn" title="Add to Wishlist">&#9734;</button>
                        </form>
                    </div>
                    <div class="product-info">
                        <a class="product-name" href="${pageContext.request.contextPath}/ProductDetailServlet?id=${product.id}">${product.name}</a>
                        <p class="product-meta-line">Sold by Thrift&amp;Drift Store | Size ${product.size}</p>
                        <div class="product-bottom">
                            <span class="product-price">Rs ${product.price}</span>
                            <form method="post" action="${pageContext.request.contextPath}/BagServlet">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="productName" value="${product.name}">
                                <input type="hidden" name="productPrice" value="${product.price}">
                                <button type="submit" class="btn-add-bag">Add to Bag</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty products}">
                <section class="empty-products">
                    <h2>No products found</h2>
                    <p>Try changing the category, size, condition, or price range.</p>
                    <a href="${pageContext.request.contextPath}/ShopServlet">View all products</a>
                </section>
            </c:if>
        </div>

    </main>
</div>

<section class="newsletter-banner">

    <div class="newsletter-text">
        <span>
        Not only sell, but share the memories behind your wardrobe.
        </span>
    </div>
    
    <div class="newsletter-form">
    
        <form method="post" action="${pageContext.request.contextPath}/NewsletterServlet">
            
            <div class="newsletter-input-wrap">
            
                <span>&#9993;</span>
                
                <input type="email" name="email" placeholder="Enter your email address" required>
            </div>
            
            <button type="submit" class="btn-subscribe">Subscribe to Newsletter</button>
             </form>
             
             <c:if test="${not empty newsletterSuccess}">
            <p class="newsletter-success">
                ${newsletterSuccess}
            </p>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty newsletterError}">
            <p class="newsletter-error">
                ${newsletterError}
            </p>
        </c:if>
    </div>
</section>

<footer class="footer" id="footer">
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
                <li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li>
                <li><a href="${pageContext.request.contextPath}/AboutServlet">About Us</a></li>
                <li><a href="#shop-products">Collections</a></li>
                <li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li>
                <li><a href="#footer">Contact</a></li>
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
