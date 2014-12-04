function showAward(){
    var type = document.getElementById("exhibition").value;
//    document.getElementById("text").innerHTML=x;
    var id = location.pathname;
    $.get("/admin/results/filtrado?exhibition="+type+"&id="+id.split("/")[3]);
}
