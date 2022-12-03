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

async function sendBankStatements() {
    // fetch address
    const { processId } = await $.post(getEndpoint("8081", "verify/process"), {
        connectionId: connection_id,
        credentialDefinitionId: CREDENTIAL_DEFINITION_ID,
        attributes: [CLAIM_KEY],
    });

    // wait for fetch to progress
    let status;
    do {
        status = await $.get(getEndpoint("8081", `verify/process/${processId}/state`));
    } while (status !== "IN_PROGRESS");

    // get claim
    if (status === "VERIFIED") {
        const response = await $.get(getEndpoint("8081", `verify/process/${processId}/claims`));
        const address = response[CLAIM_KEY];

        console.log(address);
    } else {
        // TODO: error handling
    }
}