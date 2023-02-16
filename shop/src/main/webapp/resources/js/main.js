'use strict';

const navbarMenu = document.querySelector('.navbar__menu');
const navbarMember = document.querySelector('.navbar__member');
const navbarSearch = document.querySelector('.navbar__serach');
const navbarToggleBtn = document.querySelector('.navbar__toggle-btn');

navbarToggleBtn.addEventListener('click', () => {
  navbarMenu.classList.toggle('open');
  navbarMember.classList.toggle('open');
  navbarSearch.classList.toggle('open');
});

navbarMenu.addEventListener('click', (event) => {
  const target = event.target;
  navbarMenu.classList.remove('open');
  navbarMember.classList.remove('open');
  navbarSearch.classList.remove('open');
});
