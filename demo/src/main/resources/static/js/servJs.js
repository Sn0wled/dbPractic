const classSelect = document.getElementById('class-select')
const placeSelect = document.getElementById('place-select')
const servTBody = document.getElementById('serv-table-tbody')
const noteP = document.getElementById('serv-note')
const urlParams = new URLSearchParams(document.location.search)
const searchClassId = urlParams.get('classId')
const searchPlaceId = searchClassId == null ? null : urlParams.get('placeId')

let selectedServRow = null

init()

classSelect.onchange = () => {
    loadPlaces(classSelect.value)
    .then(() => {
        loadServs(placeSelect.value)
        .then(() => {
            selectServRow(null)
            updateNote(null)
        })
    })
}

placeSelect.onchange = () => {
    loadServs(placeSelect.value)
    .then(() => {
        selectServRow(null)
        updateNote(null)
    })
}

async function init(){
    if (searchClassId != null) selectClass(searchClassId)
    if (classSelect.value == '') return
    await loadPlaces(classSelect.value)
    if (searchPlaceId != null) selectPlace(searchPlaceId)
    if (placeSelect.value == '') return
    await loadServs(placeSelect.value)
}

async function loadPlaces(classId){
    if (classId == '') {
        placeSelect.innerHTML = ''
    } else {
        const resp = await fetch('/place/opts/by-class?classId='+classId)
        if (resp.ok){
            const text = await resp.text()
            placeSelect.innerHTML = text
        } else {
            alert('Ошибка загрузки помещений')
        }
    }
}

async function loadServs(placeId){
    if (placeId == ''){
        servTBody.innerHTML = ''
    } else {
        const resp = await fetch('/serv/by-place-id?placeId='+placeSelect.value)
        if (resp.ok){
            servTBody.innerHTML = await resp.text()
            for (let row of servTBody.children){
                row.onclick = () => {
                    if (row == selectedServRow) {
                        selectServRow(null)
                        updateNote(null)
                    }
                    else {
                        selectServRow(row)
                        updateNote(row)
                    }
                }
            }
        } else {
            alert('Ошибка загрузки журнала')
        }
    }
}

function selectClass(classId) {
    for (let classOpt of classSelect.children){
        if (classOpt.value == classId) {
            classOpt.selected = true
            return
        }
    }
}

function selectPlace(placeId){
    for (let placeOpt of placeSelect.children){
        if (placeOpt.value == placeId){
            placeOpt.selected = true
            return
        }
    }
}

async function selectServRow(row){
    if (selectedServRow != null) selectedServRow.classList.remove('selected');
    if (row != null) row.classList.add('selected');
    selectedServRow = row
}

async function updateNote(row){
    if (row == null) {
        noteP.textContent = ''
    } else {
        noteP.textContent = row.lastElementChild.textContent
    }
}