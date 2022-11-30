function add(){
    document.getElementById("formPorti").style.display="inline";
    document.getElementById("formName").innerHTML="Aggiungi";

    var form = document.getElementsByClassName("input_porti");


    form[0].value="";
    form[1].value="";
    form[2].value="";
    form[3].value="";
    form[4].value="";
}

function mod(nome, citta, posti, latitudine, longitudine){
document.getElementById("formPorti").style.display="inline";
document.getElementById("formName").innerHTML="Modifica";
var form = document.getElementsByClassName("input_porti");


form[0].value=nome;
form[1].value=citta;
form[2].value=posti;
form[3].value=latitudine;
form[4].value=longitudine;

}