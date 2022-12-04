const CONNECTION_ID = "service_connection_id";

const dates = ["02/12/22 23:36", "02/12/22 20:52", "27/11/22 09:23", "25/11/22 15:09", "25/11/22 11:27","24/11/22 20:46", "23/11/22 17:23", "22/11/22 18:42", "22/11/22 11:25", "20/11/22 17:46"];
const deltas = [-10.56, -36.77, -4.67, -56.73, "+4730.66", "-5.90", -2.04, -1.05, -3.97, -9.09];
const descs = ["Burger King", "McDonalds", "KFC", "Aldi", "Adnovum Salary :)", "Wendy's", "Taco Bell", "Domino's Pizza", "Popeyes", "Dairy Queen"];

$(() => {
    console.log(getEndpoint(8080, "service"));
    for (var i = 0; i < dates.length; i++) {
        add_to_table(i);
    }
    tbody.innerHTML+=`<div class="container" style="animation: fadeIn 10s;"><p class="mb-5" style="color: #0d6efd;">See more</p></div>`;
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
    let div = $("#requestPrintedStatements");

    if (!isConnecting && getConnectionId()) {
        div.html(`<button type="button" class="btn btn-primary mb-3" onclick="sendBankStatements()">Send bank statements by post</button>`);
    } else {
        div.html("To request a copy of your bank statements by post, please connect to your digital wallet.");
    }
}

async function sendBankStatements() {
    $("#modal2body").html(`
    <div class="spinner-border" role="status">
        <span class="visually-hidden">Waiting for authorization...</span>
    </div>
    Waiting for authorization...
    `);
    $("#modal2close").attr("disabled", true);
    $("#modal2").modal('show');

    try {
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

            $("#modal2body").html(`
                <div class="alert alert-success" role="alert">
                    Bank statement will be sent to the following address:<br>
                    ${address}
                </div>
            `);
        } else if (status === "REVOKED") {
            $("#modal2body").html(`
            <div class="alert alert-danger" role="alert">
                Address was revoked! Please upload a new address.
            </div>
            `);
        }
    } finally {
        $("#modal2close").removeAttr("disabled");
    }
}

function add_to_table(i) {
    var tbody = document.getElementById("tbody");
    var color=`class="text-danger"`;
    if (deltas[i] > 0) {
        var color = `class="text-success"`;
    }
    tbody.innerHTML+=`<tr style="animation: fadeIn ${i}s;"> <td>${dates[i]}</td> <td>${descs[i]}</td> <td ${color}> ${deltas[i]}</td> </tr>`;
}
