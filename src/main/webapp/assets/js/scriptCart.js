const buyBtns = document.querySelectorAll('.js-buy-ticket')
const modal = document.querySelector('.js-modal')
const modalContainer = document.querySelector('.js-modal-container')
const modalCLose = document.querySelector('.js-modal-close')

function showBuyTickets(){
    modal.classList.add('open')
}

function hideShowTickets(){
    modal.classList.remove('open')
}

for (const buyBtn of buyBtns){
    buyBtn.addEventListener('click', showBuyTickets)
}
modalCLose.addEventListener('click', hideShowTickets)
modal.addEventListener('click', hideShowTickets)
modalContainer.addEventListener('click', function (event){
    event.stopPropagation()
})