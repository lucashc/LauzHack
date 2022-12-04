function getEndpoint(port, path) {
    return `http://128.179.191.235:${port}/${path}`;
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

const CREDENTIAL_DEFINITION_ID = "GxgDCXeCGmqqz259Mva9h6:3:CL:63836:RevokableAddress128_179_191_235";
const CLAIM_KEY = "address";

/**
 * Get connection id from local storage
 */
function getConnectionId() {
    return localStorage[CONNECTION_ID];
}

async function getOrCreateConnection() {
    if (!getConnectionId()) {
        await createConnection();
    }

    return getConnectionId();
}

/**
 * Create connection and put it in local storage
 */
async function createConnection() {
    console.log("createConnection() start");
    updateConnectButton(true);
    try {
        let result = await $.post(getEndpoint("8080", "connection/invitation"));
        console.log("createConnection() result", result);

        let { connectionId, invitationUrl } = result;
        console.log(invitationUrl);
        placeQRCode(invitationUrl);

        let status;
        do {
            status = await $.get(getEndpoint("8080", `connection/${connectionId}`));

            console.log("connection status update", status);
            await sleep(1000);
        } while (status === "init" || status === "created" || status === "requested");

        console.log("connection status", status);
        cleanupQRCode();

        if (status === "responded") {
            localStorage[CONNECTION_ID] = connectionId;
        } else {
            // TODO: handle error
        }
    } finally {
        updateConnectButton(false);
    }
}

async function getConnectionStatus(connection_id) {
    let status = await $.get(getEndpoint("8080", `connection/${connection_id}`));
    // Returns the status
    // Possible options are:
    // * 'created': User asked for connection
    // * 'responded': User confirmed connection
    return status;
}

async function disconnect() {
    // TODO: properly delete connection from the server
    const connectId = getConnectionId();
    if (!connectId) return;

    delete localStorage[CONNECTION_ID];
    $.ajax({
        url: getEndpoint("9020", `connections/${connectId}`),
        type: 'DELETE',
        success: result => {
            console.log("Delete connection result", result);
        }
    })

    updateConnectButton(false);
}

function placeQRCode(url) {
    let qrcode = new QRCode(document.getElementById("qrcode"), {
        text: url,
        width: 256,
        height: 256,
        colorDark: "#000000",
        colorLight: "#ffffff",
        correctLevel: QRCode.CorrectLevel.H
    });
    $("#exampleModal").modal('show');
}

function cleanupQRCode() {
    document.getElementById("qrcode").innerHTML = "";
    $("#exampleModal").modal("hide");
}

function updateConnectButton(isConnecting) {
    var connectArea = $("#connectArea")[0];
    console.log("updateConnectButton connectArea =", connectArea);
    if (!connectArea) {
        return;
    }
    if (isConnecting) {
        console.log("connecting");
        connectArea.innerHTML = `
        <button type="button" class="btn btn-secondary" disabled>
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            Connecting...
        </button>`;
    } else if (getConnectionId()) {
        console.log("connection");
        connectArea.innerHTML = `
        <button type="button" class="btn btn-secondary" disabled>Connected!</button>
        <button type="button" class="btn btn-danger" onclick="disconnect()">Disconnect</button>
        `;
    } else {
        console.log("no connection");
        connectArea.innerHTML = `
        <button type="button" class="btn btn-primary" onclick="createConnection()">Connect</button>
        <button type="button" class="btn btn-danger" disabled>Disconnect</button>
        `;
    }

    if (typeof onUpdateConnectButton === "function") {
        onUpdateConnectButton(isConnecting);
    }
}

// WEBPAGE MANAGEMENT
// Setup connect button
$(() => {
    updateConnectButton(false);
})