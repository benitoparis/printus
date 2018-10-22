

  function showmonth() {

    var yearlist = document.querySelectorAll("#yearlist li");

    yearlist.forEach((elem)=>{

    elem.addEventListener("click", displaymonth);
    });



  function displaymonth(e){


  // if (hasClass(document.getElementById("#yearlist li"),active) == false){

  // }; replace("", "hidden");

    if (e.target.classList.contains("active")){

    }
    else{

      yearlist.forEach((elem)=>{elem.classList.remove('active');});

      e.target.classList.add('active');
    }

    var year = e.target.innerText;
    console.log(year);


    document.getElementById("range").classList.replace("hidden", "show");
    var monthlist = document.querySelectorAll("#monthlist li a");
    console.log(monthlist);
    var yearlink = document.querySelector("#yearlink a");

    console.log(yearlink);

    yearlink.href= `/gig?year=${year}`;

  for(let i = 0; i < monthlist.length ; i++){

    monthlist[i].href= `/gig?month=${i+1}&year=${year}`;

  }

  };

}


export { showmonth };


