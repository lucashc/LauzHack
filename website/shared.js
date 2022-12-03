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