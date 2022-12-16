import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    //  this.#addMarkersToMap();


    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });
    this.#addMarkersToMap();
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl }))
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      console.log(marker)
      new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(this.map)
      console.log("mapa", this.map)

    })
  }

}
