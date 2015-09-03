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


// 3. adder
// Write a function adder(n) that returns a function fn(i) that returns the sum n + i. Note: n and i are integers, only. Example:
// var addTwo = adder(2);
// console.log(addTwo(3));
// // 5