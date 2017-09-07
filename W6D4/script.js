document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addPlaces = (e) => {
    e.preventDefault();

    const placeInput = document.querySelector(".favorite-input");
    const place = placeInput.value;
    placeInput.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");

    li.textContent = place;
    ul.appendChild(li);
  };

  document.querySelector(".favorite-submit")
          .addEventListener("click", addPlaces);



  // adding new photos

  const showForm = (e) => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container") {
      photoForm.className = "photo-form-container hidden";
    } else {
      photoForm.className = "photo-form-container";
    }
  };

  document.querySelector(".photo-show-button")
          .addEventListener("click", showForm);

  const addPhoto = (e) => {
    e.preventDefault();

    const photoInput = document.querySelector(".photo-url-input");
    const photoUrl = photoInput.value;
    photoInput.value = "";

    const img = document.createElement("img");
    img.src = photoUrl;

    const li = document.createElement("li");
    li.appendChild(img);

    const photoList = document.querySelector(".dog-photos");
    photoList.appendChild(li);
  };

  document.querySelector(".photo-url-submit")
          .addEventListener("click", addPhoto);

});
