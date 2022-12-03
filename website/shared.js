function getEndpoint(port, path) {
  return `http://128.179.184.61:${port}/${path}`;
}

async function createConnection() {
  let result = await $.post(getEndpoint("8080", "connection/invitation"));
  // Returns result object with:
  // * invitationUrl: For Phone to connect to
  // * connectionId: Connection Id to issue credentials with and get status
  return result;
}

async function getConnectionStatus(connection_id) {
  let status = await $.get(getEndpoint("8080", `connection/${connection_id}`));
  // Returns the status
  // Possible options are:
  // * 'created': User asked for connection
  // * 'responded': User confirmed connection
  return status;
}

function placeQRCode(url) {
  let qrcode = new QRCode(document.getElementById("qrcode"), {
    text: url,
    width: 256,
    height: 256,
    colorDark : "#000000",
    colorLight : "#ffffff",
    correctLevel : QRCode.CorrectLevel.H
  });
  $("#exampleModal").modal('show');
}

function cleanupQRCode() {
  document.getElementById("qrcode").innerHTML = "";
  $("#exampleModal").modal("hide");
}