const searchParams = new URLSearchParams(location.search)
const placeId = searchParams.get('placeId')
const classId = searchParams.get('classId')
const classSelect = document.getElementById('class-select')
const placeNumInput = document.getElementById('num-input')
const placeNameInput = document.getElementById('place-name-input')
const placeIP = document.getElementById('ip-address-input')
const placeNote = document.getElementById('note-input')
const form = document.getElementById('place-form')
const cancelButton = document.getElementById('cancel-button')

init()

cancelButton.onclick = () => {
    if (classId != null) {
        location.assign('/place?classId='+classId)
    } else {
        location.assign('/place')
    }
}

async function init(){
    form.onsubmit = async (e) => {
        e.preventDefault()
        const data = new FormData(e.target)
        const resp = await fetch('/place/editor', {method:'POST', body:data})
        if (resp.ok) {
            alert('Изменения сохранены')
            location.assign('/place?classId='+data.get('classId'))
        } else {
            alert('Ошибка сохранения\n'+(await resp.json()).message)
        }
    }
    if (placeId != null){
        const resp = await fetch('/place/by-id/json?id='+placeId)
        if (resp.ok){
            pageTitle.textContent = 'Редактирование учебного места'
            const place = await resp.json()
            selectClass(place.classId)
            setPlaceNum(place.num)
            setPlaceName(place.name)
            setPlaceIP(place.ip)
            setPlaceNote(place.note)
            form.onsubmit = async (e) => {
                e.preventDefault()
                const data = new FormData(e.target)
                data.append('id', placeId)
                const resp = await fetch('/place/editor', {method:'PUT', body:data})
                if (resp.ok) {
                    alert('Изменения сохранены')
                    location.assign('/place?classId='+data.get('classId'))
                } else {
                    alert('Ошибка сохранения\n'+(await resp.json()).message)
                }
            }
        } else {
            alert('Не найдено учебное место')
        }
    } else {
        if (classId != null){
            selectClass(classId)
        }
    }
}

async function selectClass(classId){
    for (let opt of classSelect.children){
        if (opt.value == classId){
            opt.selected = true
            return
        }
    }
}

function setPlaceNum(num){
    placeNumInput.value = num
}

function setPlaceName(name){
    placeNameInput.value = name
}

function setPlaceIP(ip){
    placeIP.value = ip
}

function setPlaceNote(note){
    placeNote.value = note
}