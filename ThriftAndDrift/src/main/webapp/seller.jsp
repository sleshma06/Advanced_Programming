<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller - Thrift&amp;Drift</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/seller.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
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
        <a href="#" class="nav-icon" title="Search"><img src="${pageContext.request.contextPath}/images/search.png" alt="Search"></a>
        <a href="${pageContext.request.contextPath}/WishlistServlet" class="nav-icon" title="Wishlist"><img src="${pageContext.request.contextPath}/images/star.png" alt="Wishlist"></a>
        <a href="${pageContext.request.contextPath}/BagServlet" class="nav-icon" title="Bag"><img src="${pageContext.request.contextPath}/images/bag.png" alt="Bag"></a>
        <a href="#" class="nav-icon" title="Account"><img src="${pageContext.request.contextPath}/images/user.png" alt="Account"></a>
        <a href="${pageContext.request.contextPath}/SellerServlet" class="btn-seller">Be a Seller</a>
    </div>
</nav>

<main class="seller-page">
    <section class="seller-hero">
        <div class="seller-pill">SUSTAINABLE STYLE</div>
        <h1>Give your clothes a <span>new life</span></h1>
        <p>Join our community of thrifters. Turn your pre-loved pieces into someone else's new favorite outfit.</p>
    </section>

    <section class="seller-card">
        <c:if test="${not empty successMessage}">
            <div class="seller-success">${successMessage}</div>
        </c:if>

        <form class="seller-form" action="${pageContext.request.contextPath}/SellerServlet" method="post" enctype="multipart/form-data">
            <div class="form-column details-column">
                <div class="form-title">
                    <span class="title-icon">◇</span>
                    <h2>Item Details</h2>
                </div>

                <div class="field-group">
                    <label for="listingTitle">Listing Title</label>
                    <input type="text" id="listingTitle" name="listingTitle" placeholder="e.g. Vintage Levi's 501 Jeans">
                </div>

                <div class="field-row">
                    <div class="field-group">
                        <label for="category">Category</label>
                        <select id="category" name="category">
                            <option value="">Select Category</option>
                            <option>Tops</option>
                            <option>Skirts</option>
                            <option>Outerwear</option>
                            <option>Pants</option>
                            <option>Accessories</option>
                        </select>
                    </div>

                    <div class="field-group">
                        <label for="size">Size</label>
                        <select id="size" name="size">
                            <option value="">Select Size</option>
                            <option>XS</option>
                            <option>S</option>
                            <option>M</option>
                            <option>L</option>
                            <option>XL</option>
                        </select>
                    </div>
                </div>

                <div class="field-group">
                    <label>Condition</label>
                    <div class="condition-options">
                        <label><input type="radio" name="condition" value="New with tags"> <span>New with tags</span></label>
                        <label><input type="radio" name="condition" value="Like New" checked> <span>Like New</span></label>
                        <label><input type="radio" name="condition" value="Good"> <span>Good</span></label>
                        <label><input type="radio" name="condition" value="Fair"> <span>Fair</span></label>
                    </div>
                </div>

                <div class="field-group">
                    <label for="price">Price</label>
                    <input type="text" id="price" name="price" placeholder="Rs 0.00">
                </div>

                <div class="field-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Tell us about the item, its history, any flaws, and styling tips..."></textarea>
                </div>
            </div>

            <div class="form-column contact-column">
                <div class="form-title">
                    <span class="title-icon">▣</span>
                    <h2>Photos &amp; Contact</h2>
                </div>

                <div class="upload-box">
                    <div class="upload-icon">↟</div>
                    <strong>Drag and drop photos here</strong>
                    <span>or click to browse (up to 3 photos)</span>
                    <div class="photo-slots">
                        <label><input type="file" name="photoOne" accept="image/*"><span>▧</span></label>
                        <label><input type="file" name="photoTwo" accept="image/*"><span>▧</span></label>
                        <label><input type="file" name="photoThree" accept="image/*"><span>▧</span></label>
                    </div>
                </div>

                <div class="meetup-box">
                    <h3>Meetup Information</h3>

                    <div class="field-group">
                        <label for="whatsappNumber">WhatsApp Number</label>
                        <input type="tel" id="whatsappNumber" name="whatsappNumber" placeholder="+91 00000 00000">
                    </div>

                    <div class="field-group">
                        <label for="meetupLocation">Preferred Meetup Location</label>
                        <select id="meetupLocation" name="meetupLocation">
                            <option value="">Select Campus Area</option>
                            <option>College Gate</option>
                            <option>Cafeteria</option>
                            <option>Library Area</option>
                            <option>Reception</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="list-button">
                    <span>LIST MY ITEM</span>
                    <span>→</span>
                </button>
            </div>
        </form>
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
                <li><a href="#">About Us</a></li>
                <li><a href="#">Collections</a></li>
                <li><a href="${pageContext.request.contextPath}/ShopServlet">Explore products</a></li>
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
