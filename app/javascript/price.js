const price = () => {
 const priceInput = document.getElementById("item-price");
 priceInput.addEventListener("input", () => {
  let inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  let profitNumber = inputValue * 0.9
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = (Math.floor(profitNumber));
 })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);