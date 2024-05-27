// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"


// Rating functionality

document.addEventListener('DOMContentLoaded', () => {
  const stars = document.querySelectorAll('.star-rating .star');
  console.log("Hello World")
  const ratingInput = document.getElementById('rating-input');

  stars.forEach((star, index) => {
    star.addEventListener('click', () => {
      const value = index + 1; // Get the value based on index
      ratingInput.value = value;

      // Update star selection
      stars.forEach((s, i) => {
        s.classList.toggle('selected', i < value);
      });
    });

    star.addEventListener('mouseover', () => {
      const value = index + 1; // Get the value based on index
      stars.forEach((s, i) => {
        s.classList.toggle('hovered', i < value);
      });
    });

    star.addEventListener('mouseout', () => {
      stars.forEach(s => s.classList.remove('hovered'));
    });
  });
});
