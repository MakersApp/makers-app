#import "eyeTest.matchers.js"

//beginTest("When loaded the app says 'Hi!'");
//    checkViewContainsText("Hi!");
//    checkViewContainsText("What's your name?");
//endTest();
//
//beginTest("You can enter your name and tap the button");
//    logInToApp();
//    checkViewContainsText("Hi James!");
//    checkViewContainsText("What brings you to Makers Academy?");
//endTest();
//
//beginTest("You can select the reason for your visit to MA");
//    logInToApp();
//    tapButton("Interview");
//    checkViewContainsText("interview")
//endTest();

function logInToApp() {
  fillInTextField("nameInput", "James");
  tapButton("Submit");
}

describe("Makers Academy app", function() {
         
    it("says 'Hi' when the app is loaded", function() {
         checkViewContainsText("Hi!");
         checkViewContainsText("What's your name?");
    })
         
    it("lets you enter your name and tap the button", function() {
         logInToApp();
         checkViewContainsText("Hi James!");
    })

})

