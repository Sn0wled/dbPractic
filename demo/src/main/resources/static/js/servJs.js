const classSelect = document.getElementById('class-select')
const placeSelect = document.getElementById('place-select')
const servTBody = document.getElementById('serv-table-tbody')
const noteP = document.getElementById('serv-note')
const urlParams = new URLSearchParams(document.location.search)
const searchClassId = urlParams.get('classId')
const searchPlaceId = urlParams.get('placeId')

let selectedServRow = null
classSelect.onchange = loadPlaces
placeSelect.onchange = onPlaceSelect

onPageLoad()

function loadPlaces() {
    if (classSelect.value == "") {
        placeSelect.innerHTML = ""
        return
    }
    fetch('/place/opts/by-class?classId='+classSelect.value+'&placeId='+searchPlaceId)
    .then(r => r.text())
    .then(text => placeSelect.innerHTML = text)
    .then(onPlaceSelect)
}

function onPageLoad(){
    loadPlaces()
}

function fillServTable(){
    if (placeSelect.value == '') {
        servTBody.innerHTML = ''
        return
    }
    fetch('/serv/by-place-id?placeId='+placeSelect.value)
    .then(r => r.text())
    .then(text => servTBody.innerHTML=text)
    .then(() => {
        for (let row of servTBody.children){
            row.onclick = () => {
                selectServ(row)
            }
        }
    })
}

function selectServ(row){
    if (selectedServRow === row){
        selectedServRow.classList.remove('selected')
        selectedServRow = null
        noteP.textContent = ""
    } else {
        if (selectedServRow != null) {
            selectedServRow.classList.remove('selected')
        }
        selectedServRow = row
        row.classList.add('selected')
        noteP.textContent = row.lastElementChild.textContent
    }
}

function onPlaceSelect(){
    fillServTable()
    selectedEqRow = null
    noteP.textContent = ""
}