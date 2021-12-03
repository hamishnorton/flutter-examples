const sleep = (delay) => new Promise((resolve) => setTimeout(resolve, delay));

function calledFromDart(message){
	alert('message from dart: ' + message);
}

function calledFromDartWithReturn(){
    return 'The message from JavaScript';
}

async function calledFromDartReturnAfterDelay(delay){
    await sleep(delay);
    alert('...waited: ' + delay + 'ms');
    return 'waited ' + delay + 'ms';
}

