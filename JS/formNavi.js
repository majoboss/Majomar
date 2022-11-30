function add(){
        document.getElementById("formNavi").style.display="inline";
        document.getElementById("formName").innerHTML="Aggiungi";

        var form = document.getElementsByClassName("input_navi");
    

        form[0].value="";
        form[1].value="";
        form[2].value="";
        form[3].value="";
        form[4].value="";
        form[5].value="";
}

function mod(nome, anno_costruzione, posti, lunghezza, stazza, potenza_motori){
    document.getElementById("formNavi").style.display="inline";
    document.getElementById("formName").innerHTML="Modifica";
    var form = document.getElementsByClassName("input_navi");
    

    form[0].value=nome;
    form[1].value=anno_costruzione;
    form[2].value=posti;
    form[3].value=lunghezza;
    form[4].value=stazza;
    form[5].value=potenza_motori;

}