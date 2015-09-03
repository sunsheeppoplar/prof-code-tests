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
	
// 2. onClickList
// Given the following HTML and Javascript:
// <ul id="list">
//   <li>One</li>
//   <li>Two</li>
// </ul>
// var list = document.getElementById('list');
// list.addEventListener('click', onClickList);
// Implement the function onClickList, that handles the click event, which returns the inner text of the <li>. The method signature is: onClickList(event).
// 3. adder
// Write a function adder(n) that returns a function fn(i) that returns the sum n + i. Note: n and i are integers, only. Example:
// var addTwo = adder(2);
// console.log(addTwo(3));
// // 5