#import "eyeTestMatchers.js"

describe("Makers Academy app", function() {
         
    it("says 'Hi' when the app is loaded", function() {
         readText("Hi!");
         readText("What's your name?");
    })
         
    it("lets you enter your name and tap the button", function() {
         fillInTextField("nameInput", "James");
         tapButton("Submit");
         readText("Hi James!");
    })
         
    it("lets you select who you are visiting", function() {
         tapButton("Nikesh");
         readText("We will let Nikesh know when you arrive.");
    });

});

