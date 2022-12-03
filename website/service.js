const CONNECTION_ID = "service_connection_id";

$(() => {
    console.log(getEndpoint(8080, "service"));
});

async function buttonClick() {
    console.log("Button clicked!");
    let response = await fetch(getEndpoint("9020", "schemas/created"));
    let data = await response.json(); // this is the JS object
    let dataStr = JSON.stringify(data); // this is the JSON repr for easier printing
    console.log("Response", dataStr);
    console.log("Request finished!");
}

function onUpdateConnectButton(isConnecting) {
    let button = $("#sendStatements");

    if (!isConnecting && getConnectionId()) {
        button.removeAttr("disabled");
    } else {
        button.attr("disabled", true);
    }
}

async function sendBankStatements() {
    // fetch address
    const { processId } = await fetch(getEndpoint("8081", "verify/process"), {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            connectionId: getConnectionId(),
            credentialDefinitionId: CREDENTIAL_DEFINITION_ID,
            attributes: [CLAIM_KEY],
        }),
    }).then((response) => response.json());

    // wait for fetch to progress
    let status;
    do {
        status = await $.get(getEndpoint("8081", `verify/process/${processId}/state`));

        console.log("connection status update", status);
        await sleep(1000);
    } while (status === "IN_PROGRESS");

    console.log("connection status final update", status);

    // get claim
    if (status === "VERIFIED") {
        const response = await $.get(getEndpoint("8081", `verify/process/${processId}/claims`));
        const address = response[CLAIM_KEY];

        console.log(address);
    } else {
        // TODO: error handling
    }
}