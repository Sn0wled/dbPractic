const classSelect = document.querySelector(".class-selector select")
const placeTableTBody = document.querySelector(".place-table tbody")
const eqTableTBody = document.querySelector(".eq-table tbody")

let selectedPlaceRow = null

fillSelector()

classSelect.onchange = fillClasses


function fillSelector(){
    fetch('http://localhost:8080/classes/addresses')
    .then(r => r.text())
    .then(text => classSelect.innerHTML=text)
    .then(fillClasses)
}

function fillClasses(){
    if (classSelect.value != ""){
        fetch("http://localhost:8080/place/by-class?classId=" + classSelect.value)
        .then(r => r.text())
        .then(text => placeTableTBody.innerHTML=text)
        .then(() => AddSelectToPlaces())
    }
}

function AddSelectToPlaces(){
    for (let row of placeTableTBody.children){
        row.onclick = () => {
            selectPlaceRow(row)
        }
    }
}

function selectPlaceRow(row){
    if (selectedPlaceRow === row){
        selectedPlaceRow.classList.remove("selected")
        selectedPlaceRow = null
    }
    else {
        if (selectedPlaceRow != null){
            selectedPlaceRow.classList.remove("selected")
        }
        row.classList.add('selected')
        selectedPlaceRow = row
    }
    updateEqTable()
}

function updateEqTable(){
    if (selectedPlaceRow == null){
        eqTableTBody.innerHTML = ""
        return
    }
    fetch("http://localhost:8080/eq/byPlace?placeId="+selectedPlaceRow.id)
    .then(r => r.text())
    .then(text => eqTableTBody.innerHTML=text)
}

document.createElement('div')
document.getElementById()