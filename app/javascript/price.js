const price = () => {
 const priceInput = document.getElementById("item-price");
 priceInput.addEventListener("input", () => {
  let inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  let roundedTax = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = roundedTax;
  let profitNumber = inputValue  - roundedTax;
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = (Math.floor(profitNumber));
 })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);