function showAwards(){
    var type = document.getElementById("exhibition").value;
//    document.getElementById("text").innerHTML=x;

    $.get("/results/filtrado?exhibition="+type);
}