/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var check = document.getElementsByClassName('slide');
var i = 0;
function auto() {
    if (i + 1 < check.length) {
        i = i + 1;
    } else {
        i = 0;
    }
    check[i].checked = true;
}
setInterval(auto, 3000);
window.addEventListener("scroll", () => {
    var name_shop = document.querySelector('.container_fix');
    name_shop.classList.toggle('sticky', window.scrollY > 0);

});
//slick-slide for sale
$(document).ready(function () {
    $('.slick_slide').slick({
        slidesToShow: 4,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 3000,
        draggable: false,
        prevArrow:
                "<button type='button' class='slick-prev pull-left'>\n\
        <ion-icon name='chevron-back-outline'></ion-icon></button>",
        nextArrow:
                "<button type='button' class='slick-next pull-right'>\n\
        <ion-icon name='chevron-forward-outline'></ion-icon></button>"

    });
});

if (parseInt(document.querySelector('.si_co').innerHTML) === 0) {
    document.querySelector('.si_co').style.display = "none";
} else {
    document.querySelector('.si_co').style.display = "block";
}

function detail(id) {
    window.location = "detailproduct?id=" + id;
}
if (parseInt(document.querySelector('.si_co').innerHTML) === 0) {
    document.querySelector('.si_co').style.display = "none";
} else {
    document.querySelector('.si_co').style.display = "block";
}

function submit(){
    document.getElementById('frm').submit();
}



