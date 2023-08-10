/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


if (parseInt(document.querySelector('.si_co').innerHTML) === 0) {
    document.querySelector('.si_co').style.display = "none";
} else {
    document.querySelector('.si_co').style.display = "block";
}

window.addEventListener("scroll", () => {
    var name_shop = document.querySelector('.container_fix');
    name_shop.classList.toggle('sticky', window.scrollY > 0);

});

function detail(id) {
    window.location = "detailproduct?id=" + id;
}

function Filter(){
    document.getElementById("fr").submit();
}