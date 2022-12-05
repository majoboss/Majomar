function add(){
        document.getElementById("formNavi").style.display="inline";
        document.getElementById("formName").innerHTML="Aggiungi";
        document.getElementById("formNavi").setAttribute('action', '../Php/Back/Navi/Insertnavi.php');


        var form = document.getElementsByClassName("input_navi");
    

        form[0].value="";
        form[1].value="";
        form[2].value="";
        form[3].value="";
        form[4].value="";
        form[5].value="";
        form[6].value="";

}

function mod(nome, anno_costruzione, posti, lunghezza, stazza, potenza_motori, key){
    document.getElementById("formNavi").style.display="inline";
    document.getElementById("formName").innerHTML="Modifica";
    document.getElementById("formNavi").setAttribute('action', '../Php/Back/Navi/Modifynavi.php');
    var form = document.getElementsByClassName("input_navi");
    

    form[0].value=nome;
    form[1].value=anno_costruzione;
    form[2].value=posti;
    form[3].value=lunghezza;
    form[4].value=stazza;
    form[5].value=potenza_motori;
    form[6].value=key;

}

function closeForm(){
    document.getElementById("formNaviCancella").style.display="none";
}


function delet(key){
    document.getElementById("formNaviCancella").style.display="inline";
    var Key = document.getElementById("key");
    

    Key.value=key;

}