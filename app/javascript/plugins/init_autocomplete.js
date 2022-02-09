import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('tour_destination');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
