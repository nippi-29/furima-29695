function price(){
  const priceInput = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const sales = document.getElementById("profit");

    priceInput.addEventListener('keyup', () => {
        const value = priceInput.value;
        let fee = value * 0.1
        let gains = value - fee
        tax.textContent = Math.floor(fee);
        sales.textContent = Math.floor(gains);
      
    });
  
  }
  window.addEventListener('load', price);
  