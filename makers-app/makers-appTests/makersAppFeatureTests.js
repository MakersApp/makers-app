#import "eyeTest.matchers.js"

beginTest("When loaded the app says 'Hi!'");
    checkViewContainsText("Hi!");
    checkViewContainsText("What's your name?");
endTest();

beginTest("You can enter your name and tap the button")
    fillInTextField("nameInput", "James");
    tapButton("Submit");
    checkViewContainsText("Hi James!");
endTest();
