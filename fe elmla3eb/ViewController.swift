//
//  ViewController.swift
//  fe elmla3eb
//
//  Created by mouhammed ali on 4/14/17.
//  Copyright © 2017 mouhammed ali. All rights reserved.
//

import UIKit
import MapKit
import XMSegmentedControl

class ViewController: UIViewController,XMSegmentedControlDelegate, UITableViewDelegate,UITableViewDataSource {
    /// Tells the delegate that a specific segment is now selected.
    @IBOutlet weak var stadiumTable: UITableView!

    @IBOutlet weak var segmentedControl: XMSegmentedControl!
    
    @IBOutlet weak var map: MKMapView!
    
    var annotations = [CLLocationCoordinate2D]()

    override func viewDidLoad() {
        super.viewDidLoad()
      var ann = MKPointAnnotation()
        for i in 0..<9 {
            annotations.append
        }
        ann.coordinate = CLLocationCoordinate2D(latitude: 11.12, longitude: 12.11)
        map.addAnnotation(ann)
        let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(),  50.5,0.12)
        map.setRegion(region, animated:false)
  //      map.userLocation.coordinate = CLLocationCoordinate2D(latitude: 11.12, longitude: 12.11)

        setupSegment()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if selectedSegment == 0 {
            map.isHidden = false
            stadiumTable.isHidden = true
        }else{
            map.isHidden = true
            stadiumTable.isHidden = false
        }
    }
    
    func setupSegment(){
        segmentedControl.selectedItemHighlightStyle = .bottomEdge
        segmentedControl.segmentTitle = ["map","Table"]
        segmentedControl.backgroundColor = UIColor.clear
        segmentedControl.highlightColor = UIColor(red: 237/255, green: 76/255, blue: 132/255, alpha: 1)
        segmentedControl.tint = UIColor.black
        segmentedControl.highlightTint = UIColor.green
        // segmentedControl.font = UIFont(name: "NeoSansArabic", size: 14)!
        segmentedControl.delegate = self
        
    }
    



}

extension UITableView {
    func reloadData(with animation: UITableViewRowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
