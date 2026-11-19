(() => {
  const image = document.getElementById("heroSlideImage");
  if (!image) return;
  const photos = [
    "https://asia.stanleytools.global/ASIA/PRODUCT/IMAGES/HIRES/SCH12S2K_1.jpg?resize=900x900",
    "https://asia.stanleytools.global/ASIA/PRODUCT/IMAGES/HIRES/STHR272KS_1.jpg?resize=900x900",
    "https://asia.stanleytools.global/ASIA/PRODUCT/IMAGES/HIRES/SDH600_1.jpg?resize=900x900",
    "https://asia.stanleytools.global/ASIA/PRODUCT/IMAGES/HIRES/STGS7100_1.jpg?resize=900x900",
    "https://asia.stanleytools.global/ASIA/PRODUCT/IMAGES/HIRES/STEL101_1.jpg?resize=900x900",
    "https://asia.stanleytools.global/ASIA/PRODUCT/IMAGES/HIRES/SCC500_1.jpg?resize=900x900"
  ];
  let index = 0;
  photos.forEach(src => { const preload = new Image(); preload.src = src; });
  const changePhoto = () => {
    const next = (index + 1) % photos.length;
    const preload = new Image();
    preload.onload = () => {
      image.classList.add("changing");
      window.setTimeout(() => {
        image.src = photos[next];
        image.alt = "Power tools product showcase";
        image.classList.remove("changing");
        index = next;
      }, 250);
    };
    preload.onerror = () => { index = next; };
    preload.src = photos[next];
  };
  window.setInterval(changePhoto, 4000);
})();