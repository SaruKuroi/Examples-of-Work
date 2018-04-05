// Assignment 1 | COMP1073 Client-Side JavaScript

/* Variables
-------------------------------------------------- */
var synth = window.speechSynthesis;
var btnNoun1 = document.querySelector('#noun1');
var btnVerb = document.querySelector('#verb');
var btnAdjective = document.querySelector('#adjective');
var btnNoun2 = document.querySelector('#noun2');
var btnPlace = document.querySelector('#place');
var btnPass = document.querySelector('#pass');

/* Arrays
-------------------------------------------------- */
var noun1 = ["The Turkey ", "Mom ", "Dad ", "The dog ", "My Teacher ", "The Elephant ", "The Cat "];
var verb = ["sat on ", "ate ", "danced with ", "saw ", "doesn't like ", "kissed "];
var adjective = ["a funny ", "a scary ", "a goofy ", "a slimy ", "a barking ", "a fat "];
var noun2 = ["goat ", "monkey ", "fish ", "cow ", "frog ", "bug ", "worm "];
var place = ["on the moon", "on the chair", "in my spaghetti", "in my soup", "on the grass", "in my shoes"];

/* Functions
-------------------------------------------------- */
//Text to speech function
function speakNow(string) {
	var utterThis = new SpeechSynthesisUtterance(string);
	synth.speak(utterThis);
}

//Random Value from array
function randomValueFromArray(array){
	return array[Math.floor(Math.random()*array.length)];
}

/* Event Listeners Buttons
-------------------------------------------------- */
btnNoun1.onclick = function() {
	var speakNoun1 = randomValueFromArray(noun1);
	speakNow(speakNoun1);
}
btnVerb.onclick = function() {
	var speakVerb = randomValueFromArray(verb);
	speakNow(speakVerb);
}
btnAdjective.onclick = function() {
	var speakAdjective = randomValueFromArray(adjective);
	speakNow(speakAdjective);
}
btnNoun2.onclick = function() {
	var speakNoun2 = randomValueFromArray(noun2);
	speakNow(speakNoun2);
}
btnPlace.onclick = function() {
	var speakPlace = randomValueFromArray(place);
	speakNow(speakPlace);
}
btnPass.onclick = function() {
	var speakNoun1 = randomValueFromArray(noun1);
	var speakVerb = randomValueFromArray(verb);
	var speakAdjective = randomValueFromArray(adjective);
	var speakNoun2 = randomValueFromArray(noun2);
	var speakPlace = randomValueFromArray(place);
	var generate = speakNoun1 + speakVerb + speakAdjective +speakNoun2 + speakPlace;
	speakNow(generate);
}