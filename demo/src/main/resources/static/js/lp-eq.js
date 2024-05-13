const classSelect = document.getElementById('class-select')
const placeSelect = document.getElementById('place-select')
const wsNameValue = document.getElementById('ws-name-value')
const ipValue = document.getElementById('ip-value')
const placeTBody = document.getElementById('place-tbody')


let selectedEqRow = null
classSelect.onchange = loadPlaces
placeSelect.onchange = onPlaceSelect

onPageLoad()

function loadPlaces() {
    if (classSelect.value == "") {
        placeSelect.innerHTML = ""
        return
    }
    fetch('/place/opts/by-class?classId='+classSelect.value)
    .then(r => r.text())
    .then(text => placeSelect.innerHTML = text)
    .then(onPlaceSelect)
}

function fillPlaceChars(){
    if(placeSelect.value == '') {
        wsNameValue.textContent = ""
        ipValue.textContent = ""
        return
    }
    fetch("/place/by-id/json?id="+placeSelect.value)
    .then(r => r.json())
    .then(json => {
        wsNameValue.textContent = json.name
        ipValue.textContent = json.ip
    })
}

function fillPlaceTable(){
    if (placeSelect.value == '') {
        placeTBody.innerHTML = ''
        return
    }
    fetch('/eq/byPlace?placeId='+placeSelect.value)
    .then(r => r.text())
    .then(text => placeTBody.innerHTML=text)
    .then(() => {
        for (let row of placeTBody.children){
            row.onclick = () => selectEq(row)
        }
    })
}

function onPageLoad(){
    loadPlaces()
}

function onPlaceSelect(){
    fillPlaceChars()
    fillPlaceTable()
    selectedEqRow = null
}

function selectEq(row){
    if (selectedEqRow === row){
        selectedEqRow.classList.remove('selected')
        selectedEqRow = null
    } else {
        if (selectedEqRow != null) selectedEqRow.classList.remove('selected')
        selectedEqRow = row
        row.classList.add('selected')
    }
}