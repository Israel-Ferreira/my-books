document.addEventListener('DOMContentLoaded', () => {
  let burger = document.querySelector('.burger')
  let menu = document.querySelector(`#${burger.dataset.target}`)

  burger.addEventListener('click', () => {
    burger.classList.toggle('is-active')
    menu.classList.toggle('is-active')
  })
})