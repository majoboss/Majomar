function add(){
    document.getElementById("formPorti").style.display="inline";
    document.getElementById("formName").innerHTML="Aggiungi";
    document.getElementById("formPorti").setAttribute('action', '../Php/Back/Porti/Insertporti.php');

    var form = document.getElementsByClassName("input_porti");


    form[0].value="";
    form[1].value="";
    form[2].value="";
    form[3].value="";
    form[4].value="";
    form[5].value="";
}

function mod(nome, citta, posti, latitudine, longitudine, key)
{
    document.getElementById("formPorti").style.display="inline";
    document.getElementById("formName").innerHTML="Modifica";
    document.getElementById("formPorti").setAttribute('action', '../Php/Back/Porti/Modifyporti.php');
    var form = document.getElementsByClassName("input_porti");


    form[0].value=nome;
    form[1].value=citta;
    form[2].value=posti;
    form[3].value=latitudine;
    form[4].value=longitudine;
    form[5].value=key;
}

function closeForm(){
    document.getElementById("formPortiCancella").style.display="none";
}

function delet(key){
    document.getElementById("formPortiCancella").style.display="inline";
    var Key = document.getElementById("key");
    

    Key.value=key;

}