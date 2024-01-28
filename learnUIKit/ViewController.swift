//
//  ViewController.swift
//  learnUIKit
//
//  Created by Hazel Handrata on 27/01/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Notice many of the UIKit element have CG infront of it, that
        // bcs CG (Core Graphics) is a slightly low level framework
        // that UIKit is built on top of it. So when you see CG infront
        // of it, it means that it is a Core Graphics element that
        // UIKit is using. you can learn about Core Graphics if you
        // want more control over the drawing of the elements.

        view.backgroundColor = #colorLiteral(red: 0.1259956062, green: 0.03216022253, blue: 0.1134087965, alpha: 1)

        let myView = UIView()
        // Coordinate system in UIKit is a bit different y is based on
        // top left and increasing as it goes down, while x is based on
        // top left and increasing as it goes right
        myView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        myView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)

        // we have pass myView to view bcs the only way to see it is to
        // add it to the view as a subview
        view.addSubview(myView)

        // You can add subview to a subview
        let myView2 = UIView()
        // myView2 x and y will be based on 0,0 at top left of myView
        // coordinate system not the view, so from the view the
        // coordinate is x:100 and y:100 bcs myView have x:50 and y:50
        // then + by myView2 x:50 and y:50
        myView2.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        myView2.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        myView.addSubview(myView2)

        // By default the view will not clip the subview so it can
        // extend outside of the parent view, to resolve this you can
        // use ClipsToBounds property to clip extended subview so it
        // will not be visible
        let myView3 = UIView()
        myView3.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        myView3.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        myView2.addSubview(myView3)

        // add clip to myView2
        myView2.clipsToBounds = true

        let myView4 = UIView()
        myView4.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        myView4.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myView3.addSubview(myView4)
        myView3.clipsToBounds = true

        // You can add alpha or transparency to the view using alpha
        // property
        myView4.alpha = 0.5
        // If we addd in on the parent view example: myView2. It will
        // affect all of the sub view in myView2
        myView2.alpha = 0.8

        let hiddenView = UIView()
        hiddenView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        hiddenView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(hiddenView)
        // You can hide the view using isHidden property
        hiddenView.isHidden = true

        // Now we will learn about coordinates. frame, bounds, and
        // center. we will use myView as an example
        print("-------------myView-------------")
        print("myView frame: \(myView.frame)")
        print("myView center: \(myView.center)")
        print("myView bounds: \(myView.bounds)")
        print("-------------myView2-------------")
        print("myView2 frame: \(myView2.frame)")
        print("myView2 center: \(myView2.center)")
        print("myView2 bounds: \(myView2.bounds)")
        // myView frame: (50.0, 50.0, 300.0, 300.0)
        // myView bounds: (0.0, 0.0, 300.0, 300.0)
        // myView center: (200.0, 200.0)
        // ---------------------------------------------------------
        // Above is the return value of the print statement, frame is
        // returning (x: 50, y: 50, width: 300, height: 300). The
        // center is returning center x and y point of the view based
        // on its parent view And the bound returning (x: 0, y:0,
        // width: 300.0, height: 300) a coordinate that based on it
        // self not a parrent view usually its always x:0 and y:0 but
        // its not all the case especially when dealing with scroll
        // view. https://youtu.be/Bw8BblNmMzw?si=0F7W4h73QtpNs32F show
        // example of frame vs bound view.
        
        // we can add rotation angle to the view using transform and
        // there is so much more in transform properties.
        myView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        // rotationAngle is in radian so we need to convert it to
        // radian, or you can add some function to transform degree to
        // radian
        func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
            return degrees * .pi / 180.0
        }
        myView3.transform = CGAffineTransform(rotationAngle: degreesToRadians(10))
        // Parent view transform will be affecting all of its subview

        // Text in UIKit is done using UILabel
        let myLabel = UILabel()
        // You can use myView.frame.minX or myView.frame.maxX and so
        // does with Y to get myView frame property and add the text
        // below the myView.
        myLabel.frame = CGRect(x: myView.frame.minX, y: myView.frame.maxY, width: 200, height: 100)
        myLabel.text = "Hello World :D"
        myLabel.font = UIFont.systemFont(ofSize: 24)
        myLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // Label is aligned vertically center to the frame by default
        // but not horizontally. you can use either .center .justified
        // and many more to get alignment you wanted.
        myLabel.textAlignment = .center
        myLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        // btw you can transform all of the UIKit view including UILabel.
        myLabel.transform = CGAffineTransform(rotationAngle: degreesToRadians(10))
        view.addSubview(myLabel)
        
        let myLabel2 = UILabel()
        myLabel2.frame = CGRect(x: myLabel.frame.minX, y: myLabel.frame.maxY, width: 200, height: 100)
        myLabel2.text = "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet"
        myLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // You can use lineBreakMode property to set behaivior if the
        // text reach the end of the frame. The default value is
        // .byTruncatingTail
        myLabel2.lineBreakMode = .byTruncatingMiddle
        // You can use numberOfLines property to set how many line you
        // want to display 0 means unlimited lines, 2 means 2 lines.
        // The default value is 1 that means only contain 1 line.
        myLabel2.numberOfLines = 2
        view.addSubview(myLabel2)
        
        // Image in UIKit is done using UIImageView
        let myImage = UIImageView()
        myImage.frame = CGRect(x: myLabel2.frame.minX, y: myLabel2.frame.maxY, width: 100, height: 100)
        myImage.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        // You can import the image on assets.xcassets and then use it using UIImage(named: "imageName")
        myImage.image = UIImage(named: "Woman")
        // You can set the contentMode property to set how the image
        // will be displayed. try the difference between
        // .scaleAspectFit and .scaleAspectFill
        myImage.contentMode = .scaleAspectFit
        view.addSubview(myImage)
        
        // There is also System Image that you can use.
        let myImage2 = UIImageView()
        myImage2.frame = CGRect(x: myImage.frame.minX, y: myImage.frame.maxY, width: 100, height: 100)
        // You can use SFSymbol to use system image
        myImage2.image = UIImage(systemName: "person.circle")
        myImage2.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myImage2.contentMode = .scaleAspectFit
        view.addSubview(myImage2)
        
        // Complex View
        
        
    }
}

#Preview {
    let view = ViewController()
    return view
}
