How to use the line markers
===========================

Set up
------

* You need to have the code for the `LineDrawer` class (included in LinePath.swift)
* You need to set up some markers. Works best if you use a `UIButton` of 21x21px and then use `crosshairs.png` as the background image

How to use
----------

* Drop a button of the type described above onto the view. You can copy and paste this button to make other markers
* Ctrl-drag this marker to your view controller and create an 'Outlet Collection'. This will create an array of `UIButton`s which you will pass to the animation method. Give it a name like `lineMarkers`
* You need to do the following with each marker:
  1. Give it an accessibility label (best to start with your first one at 'A' and go from there. If you need to add more in a non-sequential way, you can use numbers to add markers that will be rendered before 'A' and you can append letters with a number to intersperse them ('A1' etc))
  2. Ctrl-drag the button to your view controller to add it to the outlet collection of line markers
  3. Add constraints etc so that when AutoLayout is applied to the view the markers end up in the right places
* In your view controlller, create a new instance of `LineDrawer` and pass in the view controller with `self` in your `viewDidLoad` method:
  ```swift
  var lineDrawer: LineDrawer!
  // other declarations

  override func viewDidLoad() {
    super.viewDidLoad()
    // other setup on viewDidLoad
    lineDrawer = LineDrawer(passedCtrl: self)
  }
  ```
* To render the lines on the page, the function call needs to be added to your view controller's `viewDidLayoutSubviews` method. This is because `viewDidLoad` is executed as soon as the view is loaded into memory (i.e. before AutoLayout has been applied to the view - meaning that the constraints you added to your markers will not yet have been applied, so your lines will be in the wrong places):
  ```swift 
  override func viewDidLayoutSubviews() {
    lineDrawer.drawLines(markerButtons, durationInSeconds: 3.0)
  }
  ```
* Things to note:
  * `durationInSeconds` specifies the amount of time (in seconds, surprise surprise) that the animation will take from start to finish. This means that longer lines will be drawn more quickly than shorter ones given the same duration. The parameter is optional and will default to 7 seconds if not specified.
  * Animations are executed asynchronously, meaning that if you call `drawLines` more than once within the same function (for example within `viewDidLayoutSubviews`) then all of your lines will start being drawn at the same time. If you need it badly, let me know and I'll try to add some callback functionality which will allow you to execute once the line has been drawn (probably quite difficult due to how Apple's `CoreAnimation` layer works)
  * If you do want more than one line to be animated on a page (for example, perhaps you want one set of animation when the view is loaded and then another lot when the user clicks a button) you can assign the relevant buttons to a separate Outlet Collection and then call `drawLines` on this collection at the appropriate time.





