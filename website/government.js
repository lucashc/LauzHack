const CONNECTION_ID = "government_connection_id";

$(() => {
    console.log(getEndpoint(8080, "government"));
    if ("currentAddress" in localStorage) {
        $("#currentAddress").text(localStorage["currentAddress"]);
    }
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
    try {
        doRevoke()
    } catch (e) {
        console.log(e)
    }
    // $("#submission").attr("disabled", true);
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
    $("#currentAddress").text(address);
    localStorage["currentAddress"] = address;
}

async function doRevoke() {
    let active_thingy = await $.get(getEndpoint("9020", `revocation/active-registry/${CREDENTIAL_DEFINITION_ID}`));
    console.log(active_thingy);
    let revoc_id = active_thingy.result.revoc_reg_id;

    let details = await $.get(getEndpoint("9020", `revocation/registry/${revoc_id}/issued/details`));
    console.log(details)
    let cred_ex_id = details[0].cred_ex_id;

    let result = await fetch(getEndpoint("9020", "revocation/revoke"), {
        method: "POST",
        headers: {
            "Accept": 'application/json',
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            connection_id: getConnectionId(),
            cred_ex_id: cred_ex_id
    })});
    console.log(result)
}