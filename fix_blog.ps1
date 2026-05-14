$css = Get-Content 'assets/css/style.css' -Raw

$addCss = @"

/* ---- Blog slider: equal card and image height ---- */
.blog-slider-one .swiper-slide {
  height: auto;
  display: flex;
}
.blog-slider-one .swiper-slide .blog-card.style-one {
  display: flex;
  flex-direction: column;
  width: 100%;
}
.blog-slider-one .blog-card.style-one .blog-img {
  height: 220px;
  flex-shrink: 0;
  overflow: hidden;
}
.blog-slider-one .blog-card.style-one .blog-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.blog-slider-one .blog-card.style-one .blog-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}
.blog-slider-one .blog-card.style-one .blog-info h3 {
  font-size: 17px;
  line-height: 1.5;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  min-height: 51px;
}
"@

$css = $css + $addCss
$css | Set-Content 'assets/css/style.css' -Encoding UTF8
Write-Host "CSS updated successfully"
