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
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D (latitude: 51.5714855, longitude: -0.1446121)
        annotation1.title = "St Mungos"
        annotation1.subtitle = "55 Cholmeley Park, London N6 5EH"
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D (latitude: 51.5184963, longitude: -0.1336299)
        annotation2.title = "Booth House"
        annotation2.subtitle = "153-175 Whitechapel Rd, London E1 1DN"
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D (latitude: 51.4841707, longitude: -0.1951001)
        annotation3.title = "Thames Reach Bondway"
        annotation3.subtitle = "62 Bondway, London SW8 1SF"
    
        let annotation4 = MKPointAnnotation ()
        annotation4.coordinate = CLLocationCoordinate2D (latitude: 51.5016595, longitude: -0.1781164)
        annotation4.title = "Webber Street"
        annotation4.subtitle = "6-8 Webber Street, Waterloo, London SE1 8QA"
        
        let annotation5 = MKPointAnnotation ()
        annotation5.coordinate = CLLocationCoordinate2D (latitude: 51.5139215, longitude: -0.1416659)
        annotation5.title = "End Youth Homelessness"
        annotation5.subtitle = "25 Camperdown Street, Whitechapel, London E1 8DZ"
       
        let annotation6 = MKPointAnnotation ()
        annotation6.coordinate = CLLocationCoordinate2D (latitude: 51.4927367, longitude: -0.2096815)
        annotation6.title = "Passage House"
        annotation6.subtitle = "1-5 Longmoore Street, Pimlico, London SW1V 1JH"
        
        let annotation7 = MKPointAnnotation ()
        annotation7.coordinate = CLLocationCoordinate2D (latitude: 51.527504, longitude: -0.1859424)
        annotation7.title = "Pavegon Systems"
        annotation7.subtitle = "97-99 King's Cross Road, London WC1X 9LP"
        
        let annotation8 = MKPointAnnotation ()
        annotation8.coordinate = CLLocationCoordinate2D (latitude: 51.5134429, longitude: -0.1473147)
        annotation8.title = "Homeless Link"
        annotation8.subtitle = "Minories House, 2-5 Minories London EC3N 1BJ"
        
        let annotation9 = MKPointAnnotation ()
        annotation9.coordinate = CLLocationCoordinate2D (latitude: 51.497089, longitude: -0.1522497)
        annotation9.title = "Housing Justice"
        annotation9.subtitle = "256 Bermondsey St, London SE1 3UJ"
        
        let annotation10 = MKPointAnnotation ()
        annotation10.coordinate = CLLocationCoordinate2D (latitude: 51.5206304, longitude: -0.1935257)
        annotation10.title = "Single Homeless Project"
        annotation10.subtitle = "109 Southampton Row, Bloomsbury, London WC1B 4HH"
        
        let annotation11 = MKPointAnnotation ()
        annotation11.coordinate = CLLocationCoordinate2D (latitude: 51.5265617, longitude: -0.1478592)
        annotation11.title = "Spitalfields Crypt Trust"
        annotation11.subtitle = "Acorn House, 116-118 Shoreditch High St, London E1 6JN"
        
        let annotation12 = MKPointAnnotation ()
        annotation12.coordinate = CLLocationCoordinate2D (latitude: 51.5101861, longitude: -0.2070305)
        annotation12.title = "Streetsmart Action For The Homeless"
        annotation12.subtitle = "84-86 Regent St, Soho, London W1B 5RR"
        
        let annotation13 = MKPointAnnotation ()
        annotation13.coordinate = CLLocationCoordinate2D (latitude: 51.4740946, longitude: -0.163697)
        annotation13.title = "Southwark Reach"
        annotation13.subtitle = "346 Camberwell New Rd, Camberwell, London SE5 0RW"
        
        let annotation14 = MKPointAnnotation ()
        annotation14.coordinate = CLLocationCoordinate2D (latitude: 51.5196299, longitude: -0.1686154)
        annotation14.title = "City YMCA"
        annotation14.subtitle = "80-83 Long Ln, London EC1A 9ET"
        
        map.addAnnotation(annotation1)
        map.addAnnotation(annotation2)
        map.addAnnotation(annotation3)
        map.addAnnotation(annotation4)
        map.addAnnotation(annotation5)
        map.addAnnotation(annotation6)
        map.addAnnotation(annotation7)
        map.addAnnotation(annotation8)
        map.addAnnotation(annotation9)
        map.addAnnotation(annotation10)
        map.addAnnotation(annotation11)
        map.addAnnotation(annotation12)
        map.addAnnotation(annotation13)
        map.addAnnotation(annotation14)
        
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

