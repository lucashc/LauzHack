const CONNECTION_ID = "government_connection_id";

$(() => {
    console.log(getEndpoint(8080, "government"));
});

async function buttonClick() {
    console.log("Button clicked!");
    let response = await fetch(getEndpoint("9020", "schemas/created"));
    let data = await response.json(); // this is the JS object
    let dataStr = JSON.stringify(data); // this is the JSON repr for easier printing
    console.log("Response", dataStr);
    console.log("Request finished!");
}

async function issueCredential(address, connection_id) {
    let result = await fetch(getEndpoint("8100", "issue/process"), {
            method: "POST",
            headers: {
                "Accept": 'application/json',
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
        connectionId: connection_id,
        credentialDefinitionId: CREDENTIAL_DEFINITION_ID,
        attributes: {
            address: address
        }
    })});
    return await result.json();
}

async function doCreateCredential() {
    $("#submission").attr("disabled", true);
    let address = $("#address").val();
    let result = await issueCredential(address, getConnectionId());
    console.log("Issued it");
    let status;
    do {
        await sleep(1000);
        console.log("Issuing")
        status = await $.get(getEndpoint("8100", `issue/process/${result.processId}/state`));
        console.log(status)
    } while (status != "VC_ISSUED")
    alert("Accepted credential");
}