var greet;
var time = new Date().getHours();

if (time < 12) {
	greet = "おはよう！";
} else if (time < 16) {
	greet = "こんにちは！";
} else if (time < 21) {
	greet = "こんばんは！";
} else {
	greet = "おやすみ！";
}

document.write('<h1>' + greet + '</h1>');
