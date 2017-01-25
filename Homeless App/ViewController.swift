//
//  ViewController.swift
//  Homeless App
//
//  Created by Sarah Ward on 18/01/2017.
//  Copyright © 2017 Sarah Ward. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
      let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
        print("location:", locationManager.location)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: span)
        
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D (latitude: 51.5714855, longitude: -0.1446121)
        annotation.title = "St Mungos"
        annotation.subtitle = "55 Cholmeley Park - N6 5EH"
        map.addAnnotation(annotation)
        map.delegate = self
        //        map.setCenter(map.userLocation.location!.coordinate, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locValue:CLLocationCoordinate2D = manager.location?.coordinate {
           print("locations = \(locValue.latitude) \(locValue.longitude)")
//        map.setCenter(locValue, animated: true)
            
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            //println("Pinview was nil")
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
        }
        let button = UIButton(type: .detailDisclosure) as UIButton // button with info sign in it
        button.addTarget(self, action: #selector(doSomething(sender:)), for: .touchDown)
        
        pinView?.rightCalloutAccessoryView = button
        
        
        return pinView
        
    }
    @IBAction func doSomething(sender: UIButton) {
        performSegue(withIdentifier: "shelterDetailSegue", sender: self)

    }
}

