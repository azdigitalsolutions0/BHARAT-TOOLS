(() => {
  const image = document.getElementById("heroSlideImage");
  if (!image) return;
  const photos = [
    "https://images.unsplash.com/photo-1504148455328-c376907d081c?auto=format&fit=crop&w=1400&q=90",
    "https://images.unsplash.com/photo-1581147036324-c1c89c2c8a?auto=format&fit=crop&w=1400&q=90",
    "https://images.unsplash.com/photo-1530124566582-a618bc2615dc?auto=format&fit=crop&w=1400&q=90",
    "https://images.unsplash.com/photo-1581783898377-1c85bf937427?auto=format&fit=crop&w=1400&q=90",
    "https://images.unsplash.com/photo-1581244277943-fe4a9c777189?auto=format&fit=crop&w=1400&q=90"
  ];
  let index = 0;
  photos.forEach(src => { const preload = new Image(); preload.src = src; });
  window.setInterval(() => {
    index = (index + 1) % photos.length;
    image.classList.add("changing");
    window.setTimeout(() => {
      image.src = photos[index];
      image.onload = () => image.classList.remove("changing");
    }, 350);
  }, 4500);
})();