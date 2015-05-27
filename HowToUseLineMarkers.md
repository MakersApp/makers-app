How to use the line markers
===========================

Set up
------

* You need to have the code for the `LineDrawer` class (included in LinePath.swift)
* You need to set up some markers. Works best if you use a `UIButton` of 21x21px and then use `crosshairs.png` as the background image

How to use
----------

* Drop a button of the type described above onto the view. You can copy and paste this button to make other markers
* Ctrl-drag this marker to your view controller and create an 'Outlet Collection'. This will create an array of `UIButton`s which you will pass to the animation method. Give it a name like 'lineMarkers'
* You need to do the following with each marker:
  1. Give it an accessibility label (best to start with your first one at 'A' and go from there. If you need to add more in a non-sequential way, you can use numbers to add markers that will be rendered before 'A' and you can append letters with a number to intersperse them ('A1' etc))
  2. Ctrl-drag the button to your view controller to add it to the outlet collection of line markers
  3. Add constraints etc so that when AutoLayout is applied to the view the markers end up in the right places
* In your view controlller, create a new instance of `LineDrawer` and pass in the view controller with `self`:
  ```swift
  var lineDrawer: LineDrawer!
  // other declarations

  override func viewDidLoad() {
    super.viewDidLoad()
    // other setup on viewDidLoad
    lineDrawer = LineDrawer(passedCtrl: self)
  }
  ```