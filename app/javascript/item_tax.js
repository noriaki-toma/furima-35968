window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", function() {
    const tax = price.value / 10; 
    const tax_price = document.getElementById('add-tax-price');
    tax_price.textContent = Math.round(tax);
    const profit = document.getElementById('profit');
    const profit_value = price.value * 0.9

    profit.textContent = (Math.round(profit_value));
  })
});