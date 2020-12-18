//
//  ViewController.swift
//  TestingTimeZoneJul92019
//
//  Created by Zin Lin Htet Naing on 7/9/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import TimeZoneLocate
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var utcLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!

    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.updateTimer()
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }

    @IBAction func myanmarTimeAction(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @IBAction func japanTimeAction(_ sender: UIButton) {
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
//            self.getTimeZone(lat: 35.652832, long: 139.839478)
//        }
    }

    @objc func updateTimer() {
        getTimeZone(lat: 16.871311, long: 96.199379)
    }

    func getTimeZone(lat: CLLocationDegrees, long: CLLocationDegrees) {
        let location = CLLocation(latitude: lat, longitude: long)
        print("TimeZone ---> \(location.timeZone)")
        let date = "\(location.timestamp)"
        print(date)
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ssZ"  //currentFormat
        if let convertedDate = dateFormat.date(from: date) {
            dateFormat.timeZone = location.timeZone
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss a"
            dateFormat.timeStyle = .medium
            let dateString = dateFormat.string(from: convertedDate)
            print(dateString)
            TimeLabel.text = dateString
        }else {
            print("Error")
        }
    }


}
//
//    let format = DateFormatter()
//    format.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
//    let convertedDate = format.date(from: "\(location.timestamp)")
//    format.timeZone = location.timeZone
//    format.dateFormat = "yyyy-MM-dd HH:mm:ss a"
//    let localDateString = format.string(from: convertedDate!)
//
//    localLabel.text = localDateString
//
//
//    let dateFormatterGet = DateFormatter()
//    let defaults = UserDefaults.standard
//    dateFormatterGet.dateFormat = currentFomat
//    guard let date  = dateFormatterGet.date(from: stringDate) else {
//    return getFormattedDate(stringDate: stringDate, currentFomat: dateFormatStyle.currentDateFormatStyle2, expectedFromat: expectedFromat)
//    }
//    let segmentIndex = defaults.integer(forKey: userDefaultsKey.selectedSegmentIndexKey)
//    if segmentIndex == 0 {
//    dateFormatterGet.locale = Locale(identifier: "en_US")
//    }
//    else {
//    dateFormatterGet.locale = Locale(identifier: "en_US")
//    }
//    dateFormatterGet.dateFormat = expectedFromat
//    return dateFormatterGet.string(from: date)
//}
//
//
//    func convertUIDateToLocalDate(dateToConverter: String) -> String {
//        let format = DateFormatter()
//        format.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
//        let convertedDate = format.date(from: dateToConverter)
//        format.timeZone = TimeZone.current
//        format.dateFormat = "yyyy-MM-dd HH:mm:ss a"
//        let localDateString = format.string(from: convertedDate!)
//        return localDateString
//    }
//
//            timeZone = TimeZoneLocate.timeZone(location: location)!
//            print("TimeZone ---> \(timeZone)")
//
//            timeZone = TimeZoneLocate.timeZone(location: location, countryCode: countryCode)!
//            print("TimeZone ---> \(timeZone)")
//            location.timeZone { timeZone in
//                guard let timeZone = timeZone else { return }
//                print("NetWorkTimeZone --> \(timeZone)")
//
//            }
//
//            TimeZoneLocate.geocodeTimeZone(location: location) { (tz) -> (Void) in
//                guard let tz = tz else { return }
//                print("Network TimeZone: \(tz.identifier) (class method)")
//            }
//
//
//
//
//
//
//
//
//
//
//
//}
//
//
//
//    func convertUIDateToLocalDate(dateToConverter: String) -> String {
//        let format = DateFormatter()
//        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let convertedDate = format.date(from: dateToConverter)
//        format.timeZone = TimeZone.current
//        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let localDateString = format.string(from: convertedDate!)
//        return localDateString
//    }
//
//        let location = CLLocation(latitude: 16.871311, longitude: 96.199379)
//        let geoCoder = CLGeocoder()
//        geoCoder.reverseGeocodeLocation(location) { (placemarks, err) in
//            if let placemark = placemarks?[0] {
//                print(placemark.timeZone)
//                print(placemark.country)
//                print(placemark.region)
//            }
//        }
//
// localLabel.text = convertUIDateToLocalDate(dateToConverter: "2019-7-9T11:10:49Z")
