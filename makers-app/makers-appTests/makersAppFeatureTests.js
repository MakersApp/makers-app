beginTest("When loaded the app says 'Hi!'");
    checkViewContainsText("Hi!");
endTest();

beginTest("You can enter your name and tap the button")
    fillInTextField("nameInput", "James");
    tapButton("Submit");
    checkViewContainsText("Hi James!");
endTest();