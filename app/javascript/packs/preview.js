if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
    document.addEventListener('DOMContentLoaded', function(){
      const ImageList = document.getElementById('img-list');
        document.getElementById('item-image').addEventListener('change', function(e){
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        const imageElement = document.createElement('div');
        imageElement.classList.add('pre-image')

        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }

        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);

        imageElement.appendChild(blobImage);
        ImageList.appendChild(imageElement);
      });
  });
}