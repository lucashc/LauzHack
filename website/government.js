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
    let result = await $.post(getEndpoint("8100", "issue/process"), data = {
        "connectionId": connection_id,
        "credentialDefinitionId": CREDENTIAL_DEFINITION_ID,
        "atributes": {
            "address": address
        }
    });
    return result;
}

async function checkIssueState(process_id) {
    let result = await $.get(getEndpoint("8100", `issue/${process_id}/state`));
    return result;
}

async function doCreateCredential() {
    let address = $("#address").val();
    let result = await issueCredential(address, CONNECTION_ID);
    let wait = (seconds) => 
        new Promise(resolve => 
            setTimeout(() => resolve(true), seconds * 1000)
        );
    while (checkIssueState(result.processId) == '"VC_ISSUED"') {
        await wait(1);
    }
    alert("Done!")
}