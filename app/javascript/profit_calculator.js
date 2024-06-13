function profit (){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const addTaxValue = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = addTaxValue.toLocaleString(); 

  const profitDom = document.getElementById("profit");
  const profitValue = Number(inputValue) - addTaxValue;
  profitDom.innerHTML = profitValue.toLocaleString();
})
}

window.addEventListener('turbo:load', profit);
window.addEventListener('turbo:render', profit);