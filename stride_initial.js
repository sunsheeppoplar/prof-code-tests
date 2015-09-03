function fizzBuzz(n) {
	if (n % 15 === 0) {
		return 'fizzbuzz';
	} else if (n % 3 === 0) {
		return 'fizz';
	} else if (n % 5 === 0) {
		return 'buzz';
	} else {
		return n.toString();
	};
};
	
function onClickList(event) {
	console.log(event.target.innerHTML);
};

function adder(n) {
	return function fn(i) {
		return n + i;
	};
};
