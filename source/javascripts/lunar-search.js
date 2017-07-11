//= require lunr.min
class LunarSearch {
  constructor() {
    this.searchFiled = document.getElementById('search-field');
    this.resultsPlace = document.getElementById('results');
    this.fetchData();
    this.registerEvents();
  }

  registerEvents() {
    this.searchFiled.onkeyup = event => {
      event.preventDefault();
      let result = this.search();
      this.renderResults(result);
    };
  }

  search() {
    let result = this.lunrIndex.search(this.searchFiled.value);
    return this.parseResults(result);
  }

  parseResults(result) {
    let data = [{title: "Nothing Found =(", url: null}];
    return (result.length) ? result.map(res => this.lunrData.docs[res.ref]) : data;
  }

  renderResults(result) {
    this.resultsPlace.innerHTML = "";

    result.map(res => {
      let link = this.createElement(res);
      this.resultsPlace.appendChild(link);
    });
  }

  createElement(data) {
    let a = document.createElement('a');
    if (data.url) { a.href = data.url; }
    a.innerHTML = data.title;
    return a;
  }

  fetchData() {
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = () => {
      if ((xmlHttp.readyState === 4) && (xmlHttp.status === 200)) {
        this.lunrData = JSON.parse(xmlHttp.responseText);
        this.lunrIndex = lunr.Index.load(this.lunrData.index);
      }
    };
    xmlHttp.open('get', '/search.json');
    xmlHttp.send();
  }
}

window.LunarSearch = new LunarSearch();
