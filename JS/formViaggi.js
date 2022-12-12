function add(){
    document.getElementById("formViaggi").style.display="inline";
    document.getElementById("formName").innerHTML="Aggiungi";
    document.getElementById("formViaggi").setAttribute('action', '../Php/Back/Viaggi/Insertviaggi.php');


    var form = document.getElementsByClassName("input_viaggi");


    form[0].value="";
    form[1].value="";
    form[2].value="";
    form[3].value="";
    form[4].value="";
    form[5].value="";
    form[6].value="";

}

function mod(nome, codice_nave, orario_partenza_completo, orario_arrivo_completo, prezzo, peso_carico, codice_viaggio){
document.getElementById("formViaggi").style.display="inline";
document.getElementById("formName").innerHTML="Modifica";
document.getElementById("formViaggi").setAttribute('action', '../Php/Back/Viaggi/Modifyviaggi.php');
var form = document.getElementsByClassName("input_viaggi");


form[0].value=nome;
form[1].value=anno_costruzione;
form[2].value=posti;
form[3].value=lunghezza;
form[4].value=stazza;
form[5].value=potenza_motori;
form[6].value=key;

}

function closeForm(){
document.getElementById("formViaggiCancella").style.display="none";
}


function delet(key){
document.getElementById("formViaggiCancella").style.display="inline";
var Key = document.getElementById("key");


Key.value=key;

}