
var target = UIATarget.localTarget();
var view = target.frontMostApp().mainWindow();
var currentTest;
var failuresFound = false;

function beginTest(testDescription, target) {
    currentTest = testDescription;
    UIALogger.logDebug("BEGIN TEST ***** " + testDescription + " *****")
}

function endTest() {
    if (failuresFound) {
        UIALogger.logFail("TEST FAILED ***** " + currentTest + " *****")
    } else {
        UIALogger.logPass("TEST PASSED ***** " + currentTest + " *****")
    }
}

function testPass(passString) {
    UIALogger.logPass("______PASS: " + passString);
}

function testFailure(failString) {
    failuresFound = true
    UIALogger.logFail("______FAIL: " + failString);
}

function checkViewContainsText(text) {
    if (view.staticTexts()[text].isValid()) {
        testPass("Found text '" + text + "'");
    } else {
        testFailure("Could not find text '" + text + "'");
    }
}

function fillInTextField(field, text) {
    var textField = view.textFields()[field]
    if (textField.isValid()) {
        textField.setValue(text);
        testPass("Filled in '" + field + "' with '" + text + "'");
    } else {
        testFailure("Could not find field '" + field + "'");
    }
}

function tapButton(button) {
    var buttonToTap = view.buttons()[button]
    if (buttonToTap.isValid()) {
        buttonToTap.tap();
        testPass("Tapped button '" + button + "'");
    } else {
        testFailure("Could not find button '" + button + "'");
    }
}

function swipe(direction, on) {
    swipeTarget = on || view;
    switch(direction) {
        case "left":
            swipeTarget.dragInsideWithOptions({startOffset:{x:1, y:0.5}, endOffset:{x:0, y:0.5}, duration:0.2});
            break;
        case "right":
            swipeTarget.dragInsideWithOptions({startOffset:{x:0, y:0.5}, endOffset:{x:1, y:0.5}, duration:0.2});
            break;
        case "up":
            swipeTarget.dragInsideWithOptions({startOffset:{x:0.5, y:0.8}, endOffset:{x:0.5, y:0}, duration:0.2});
            break;
        case "down":
            swipeTarget.dragInsideWithOptions({startOffset:{x:0.5, y:0.2}, endOffset:{x:0.5, y:1}, duration:0.2});
            break;
    }
}

