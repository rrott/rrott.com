class Helpers {
  disableLinks() {
    let links = [...document.getElementsByClassName('internal-link')];
    links.map(link =>
      (link.onmouseup = e => {
        window.location.href = this.getTarget(e).getAttribute('data-href');
      })
    );
  }

  getTarget(e) {
    let target = e.target || e.srcElement;
    return target.nodeType === Node.TEXT_NODE ? target.parentNode : target;
  }
}

window.Helpers = new Helpers();
