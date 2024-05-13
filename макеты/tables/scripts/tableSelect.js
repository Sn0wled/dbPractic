let rows = document.querySelectorAll(".table tbody tr")
let lastSelected = null;

for (let row of rows){
    row.onclick = () => selectRow(row)
}

function selectRow(row){
    if (lastSelected === row){
        lastSelected.classList.remove("selected")
        lastSelected= null
        return
    }
    if (lastSelected != null){
        lastSelected.classList.remove("selected")
    }
    row.classList.add('selected')
    lastSelected = row
}