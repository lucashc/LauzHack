const CONNECTION_ID = "government_connection_id";

$(() => {
    console.log(getEndpoint(8080, "government"));
    addPrevious();
});

function addPrevious() {
    if ("currentAddress" in localStorage) {
        $("#currentAddress").text(localStorage["currentAddress"]);
    } else {
        $("#currentAddress").text("");
    }
    $("#addresslist li").remove();
    if ("historyAddresses" in localStorage) {
        let i = 0;
        JSON.parse(localStorage["historyAddresses"]).forEach(element => {
            if (i !=0 ) {
                $(`<li>${element}</li>`).appendTo("#addresslist");
            } 
            i++;
        });
    }
}

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
        $("#modal2body").html(`
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Waiting for authorization...</span>
        </div>
        Waiting for authorization...
        `);
        $("#modal2close").attr("disabled", true);
        $("#modal2").modal('show');

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
        $("#currentAddress").text(address);
        localStorage["currentAddress"] = address;
        if (!("historyAddresses" in localStorage)) {
            localStorage["historyAddresses"] = JSON.stringify([])
        }
        let tmp = JSON.parse(localStorage["historyAddresses"]);
        tmp.unshift(address);
        localStorage["historyAddresses"] = JSON.stringify(tmp);
        addPrevious();

        $("#modal2body").html(`
        <div class="alert alert-success" role="alert">
            Successfully updated address.
        </div>
        `);

    } finally {
        $("#modal2close").removeAttr("disabled");
    }
}

async function manualRevoke() {
    let btn = $("#submission2");
    btn.attr("disabled", true);
    try {
        await doRevoke();
        delete localStorage["currentAddress"];
        delete localStorage["historyAddresses"];
        addPrevious();
    } finally {
        btn.removeAttr("disabled");
    }

}

async function doRevoke() {
    let active_thingy = await $.get(getEndpoint("9020", `revocation/active-registry/${CREDENTIAL_DEFINITION_ID}`));
    console.log(active_thingy);
    let revoc_id = active_thingy.result.revoc_reg_id;

    let details = await $.get(getEndpoint("9020", `revocation/registry/${revoc_id}/issued/details`));
    console.log(details)
    let revokes = [];
    for (let i = 0; i < details.length; ++i) {
        let cred_ex_id = details[i].cred_ex_id;

        revokes[i] = new Promise(resolve => {
            return fetch(getEndpoint("9020", "revocation/revoke"), {
                    method: "POST",
                    headers: {
                        "Accept": 'application/json',
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        connection_id: getConnectionId(),
                        cred_ex_id: cred_ex_id,
                        comment: "Address changed",
                        notify: true,
                        publish: true,
                })}).then(result => console.log(result)).then(result => resolve(result));
        });
    }

    await Promise.all(revokes);
}

function onUpdateConnectButton(isConnecting) {
    let div = $("#requestCredentialUpdate");

    if (!isConnecting && getConnectionId()) {
        div.html(`
            <button class="btn btn-primary" onclick="doCreateCredential()" id="submission" type="button">Create new credential</button>
            <button class="btn btn-danger" onclick="manualRevoke()" id="submission2" type="button">Debug: Revoke all</button>
        `);
    } else {
        div.html("To update your address, please connect to your digital wallet.");
    }
}