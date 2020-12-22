Window.addEventListener("trix-file-accept", function (event) {
  const maxFileSize = 1024 * 1024;
  if (event.file.size > maxFileSize) {
    event.preventDefault();
    alert("ファイルのサイズが1MBを超えています");
  }
});
