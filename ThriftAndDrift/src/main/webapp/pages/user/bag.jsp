<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bag - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bag.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

<nav class="navbar">
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/ShopServlet">Shop</a></li>
        <li><a href="${pageContext.request.contextPath}/AboutServlet">About</a></li>
        <li><a href="${pageContext.request.contextPath}/HomeServlet#contact-us">Contact</a></li>
    </ul>

    <div class="nav-right">
        <form class="nav-search" action="${pageContext.request.contextPath}/ShopServlet" method="get">
            <input class="nav-search-input" type="search" name="q" placeholder="Search products">
            <button class="nav-search-button" type="submit" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></button>
        </form>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="Account"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<main class="bag-page">
    <section class="bag-layout">
        <div class="bag-main">
            <c:if test="${not empty error}">
                <div class="safety-box">
                    <div class="safety-icon">!</div>
                    <div><p>${error}</p></div>
                </div>
            </c:if>

            <c:if test="${param.added eq 'true'}">
                <div class="safety-box">
                    <div class="safety-icon">+</div>
                    <div><p>Item added to your bag.</p></div>
                </div>
            </c:if>

            <c:if test="${param.exists eq 'true'}">
                <div class="safety-box">
                    <div class="safety-icon">i</div>
                    <div><p>This item is already in your bag.</p></div>
                </div>
            </c:if>

            <c:if test="${param.removed eq 'true'}">
                <div class="safety-box">
                    <div class="safety-icon">-</div>
                    <div><p>Item removed from your bag.</p></div>
                </div>
            </c:if>

            <c:if test="${param.ordered eq 'true'}">
                <div class="safety-box">
                    <div class="safety-icon">OK</div>
                    <div><p>Your order has been placed.</p></div>
                </div>
            </c:if>

            <div class="bag-heading">
                <h1>Your Bag</h1>
                <span>${cartCount} Items</span>
            </div>

            <div class="bag-items">
                <c:choose>
                    <c:when test="${empty cartProducts}">
                        <p>Your bag is empty. Add products from the shop.</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="product" items="${cartProducts}">
                            <article class="bag-item">
                                <img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="${product.name}">
                                <div class="item-details">
                                    <h2>${product.name}</h2>
                                    <p>${product.size} <span>${product.condition}</span></p>
                                    <div class="item-note">Sold by: <strong>Thrift&amp;Drift Store</strong></div>
                                    <div class="item-note">Fulfillment: <strong>Delivery or In-store Pickup</strong></div>
                                </div>
                                <strong class="item-price">Rs ${product.price}</strong>
                                <form method="post" action="${pageContext.request.contextPath}/BagServlet">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <button type="submit" class="remove-link">Remove</button>
                                </form>
                            </article>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="safety-box">
                <div class="safety-icon">T</div>
                <div>
                    <h3>Choose Fulfillment</h3>
                    <p>Select delivery to your address or free in-store pickup from the Thrift&amp;Drift store at checkout.</p>
                    <a href="#">View store pickup address</a>
                </div>
            </div>
        </div>

        <aside class="bag-side">
            <div class="summary-box">
                <h2>Order Summary</h2>

                <div class="summary-row">
                    <span>Subtotal</span>
                    <strong>Rs ${subtotal}</strong>
                </div>

                <div class="summary-row">
                    <span>Platform Fee</span>
                    <strong>Rs ${platformFee}</strong>
                </div>

                <label for="promoCode">Promo Code</label>
                <div class="promo-row">
                    <input type="text" id="promoCode" name="promoCode" placeholder="Enter code">
                    <button type="button">Apply</button>
                </div>

                <div class="total-row">
                    <span>Total</span>
                    <strong>Rs ${total}</strong>
                </div>

                <a href="${pageContext.request.contextPath}/CheckoutServlet" class="checkout-button">
                    <span>Checkout</span>
                    <span>&rarr;</span>
                </a>
            </div>

            <div class="sell-box">
                <div class="sell-icon">◇</div>
                <h2>Clear Your Closet</h2>
                <p>Turn your pre-loved pieces into cash. List an item in under 2 minutes and join our community of sustainable fashion.</p>
                <a href="${pageContext.request.contextPath}/SellerServlet">Sell Now</a>
            </div>
        </aside>
    </section>
</main>

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
                <li><a href="${pageContext.request.contextPath}/SellerServlet">Sell</a></li>
                <li><a href="${pageContext.request.contextPath}/AboutServlet">About Us</a></li>
                <li><a href="#">Collections</a></li>
                <li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li>
                <li><a href="${pageContext.request.contextPath}/HomeServlet#contact-us">Contact</a></li>
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
