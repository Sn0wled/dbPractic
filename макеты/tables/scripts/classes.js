const classSelect = document.getElementById('class-select')
const placeSelect = document.getElementById('place-select')
const wsNameValue = document.getElementById('ws-name-value')
const ipValue = document.getElementById('ip-value')

let places = []

onLoad()

function loadPlaces() {
    fetch('/by-class/json')
    .then(r => r.json())
    .then(json => {
        for (let place of json){
            places[place.id] = place
        }
    })
}

function onPlacesLoad(){
    
    placeSelect.innerHTML = ""
    if (places.length != 0){    
        for (let place of places){
            let newOpt = document.createElement('option')
            newOpt.value = place.name
        }
    }
}

function onPlaceChoose(place){

}

function onPageLoad(){
    loadPlaces()
}

function onPlacesLoad(){
    places = places.map(place => {
        let opt = document.createElement('option')
        opt.value = place
    })
}