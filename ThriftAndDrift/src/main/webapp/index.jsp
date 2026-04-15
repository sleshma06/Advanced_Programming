<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Thrift&Drift</title>
  <!-- External CSS using page context -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>

  <!-- ══ 1. TOP NAV ══ -->
  <nav class="topnav">
    <ul class="nav-links">
      <li><a href="#">Home</a></li>
      <li><a href="#">Shop</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
    <div class="nav-right">
      <span class="ico">🔍</span>
      <span class="ico">♥</span>
      <span class="ico">👤</span>
      <span class="ico">🛒</span>
      <button class="btn-seller">Be a Seller</button>
    </div>
  </nav>

  <!-- ══ 2. LOGO BAR ══ -->
  <div class="logobar">
    <div class="site-logo">THRIFT&amp;DRIFT</div>
    <p class="breadcrumb">Home &rsaquo; Shop &rsaquo; New Arrivals &rsaquo; Denim Skirts &rsaquo; ...</p>
  </div>

  <!-- All your existing HTML content from HERO to FOOTER stays exactly the same -->
  <!-- ... (copy all sections from your original HTML) ... -->

  <!-- ══ JS: Filter tabs ══ -->
  <script>
    var tabs = document.querySelectorAll('.ftab');
    tabs.forEach(function(tab) {
      tab.addEventListener('click', function() {
        tabs.forEach(function(t) { t.classList.remove('active'); });
        tab.classList.add('active');
      });
    });
  </script>

</body>
</html>