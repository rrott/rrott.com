class ImagePreview {
  constructor(images=[], image_id=0) {
    this.state = {images: images, current: images[image_id]}
    this.previewBlock = document.getElementById('preview');
    this.previewImg = preview.querySelector("#preview-image");
    this.previewTitle = document.getElementById('preview-image-title');
    this.initPreview();
  }

  initPreview() {
    this.previewBlock.onclick = e => {
      const action = window.Helpers.getTarget(e).id;
      switch (action) {
        case "next":
          this.state.current = this.state.images[this.nextImageId(+1)];
          this.showImage();
          break;
        case "prev":
          this.state.current = this.state.images[this.nextImageId(-1)];
          this.showImage();
          break;
        default:
          this.previewBlock.style.display = 'none';
        }
    };
  }

  showImage() {
    this.previewTitle.innerHTML = this.state.current.title;
    this.previewImg.src = '';
    this.previewImg.src = this.state.current.src;
    this.previewBlock.style.display = 'block';
    this.showSpinner();
  }

  showSpinner() {
    let spinner = document.getElementById('spinner');
    spinner.style.display = 'block';
    this.previewImg.classList.add("dark");
    window.clearInterval(window.intervalId);
    window.intervalId = window.setInterval(
      () => this.updateSpinner(spinner),
      200
    );
    this.previewImg.onload = () => {
      spinner.style.display = 'none';
      this.previewImg.classList.remove("dark");
      window.clearInterval(window.intervalId);
    };
  }

  updateSpinner(spinner) {
    const message = spinner.textContent;
    spinner.textContent = (message === 'Loading...') ? 'Loading' : message + '.';
  }

  nextImageId(increment) {
    const max     = this.state.images.length - 1; const min = 0;
    const next    = this.state.current.id + increment;

    if (next > max) { return min; }
    if (next < min) { return max; }
    return next;
  }
}

// window.ImagePreview = new ImagePreview([]);
