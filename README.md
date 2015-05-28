# Makers Visitor App
- When visitors arrive at Makers Academy, the app detects the Estimote beacon in the lobby and fires a message to the team's Slack visitor channel, tagging the appropriate person and telling the name of the guest who has just arrived. 
- When the beacon picks up the phone's bluetooth a second time, the visitor is offered a feedback form which is output into a Google form.

# Special features
- Trying to build this app in a TDD way inspired @james-miller to build an open source feature test framework for Swift using JavaScript: https://github.com/james-miller/eyeTest.
- The design uses a custom built framework to programmtically draw lines in XCode, providing a subtle and engaging user interface. The lines  represent the journey that visitors will take - especially if their visit leads to them coming on the course.
- Powered by a Rails API back end.

<img align="middle" src="https://github.com/MakersApp/assets/blob/master/wireframes/App_page1_SubmitName.jpg">
<img align="middle" src="https://github.com/MakersApp/assets/blob/master/wireframes/App_page2_ChooseHost.jpg">

# User stories
As a visitor to Makers Academy
So that I don’t feel stupid
I want to know where to go when I arrive at the building

As a Nikesh
So that I can control the first impression of visitors
I want to know when a visitor arrives

As a hard-working Makers Academy employee
So that I can get feedback on my events
I want to offer visitors a survey to fill out at the end of the event

As a prospective Makers student
So that I can reassure myself that Makers is the right course to take
I want to use an impressive student-built Makers app
```
