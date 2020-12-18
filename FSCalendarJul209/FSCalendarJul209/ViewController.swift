//
//  ViewController.swift
//  FSCalendarJul209
//
//  Created by Zin Lin Htet Naing on 7/2/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var selectedDateLabel: UILabel!

    @IBOutlet weak var calendarHeightConstraints: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Background Color
        self.view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)

//        calendar.layer.cornerRadius = 7
//      calendar.appearance.borderRadius = 0

        //MultiSelection Calendar Cell
        multiSelection()

        //Monday is First Column
        calendar.firstWeekday = 2

        //Calender First Look UI
        calenderAppearance()
//        calendar.customizeCalenderAppearance()

        //Device Handle
        if UIDevice.current.model.hasPrefix("iPad") {
            self.calendarHeightConstraints.constant = 400
        }
    }

    func calenderAppearance() {
        //Header Year
        calendar.appearance.headerDateFormat = "MMMM, yyyy"
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 17)
        calendar.appearance.headerTitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.calendarHeaderView.backgroundColor = #colorLiteral(red: 0.2352941176, green: 1, blue: 0.3333333333, alpha: 1)
        calendar.appearance.headerMinimumDissolvedAlpha = 1


        //WeekDay
        calendar.weekdayHeight = 45
        calendar.calendarWeekdayView.backgroundColor = #colorLiteral(red: 0.2352941176, green: 1, blue: 0.3333333333, alpha: 1)
        calendar.appearance.weekdayTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)


        calendar.appearance.titleWeekendColor = #colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1)
        calendar.appearance.subtitleWeekendColor = UIColor.orange
        //Event
        calendar.appearance.eventDefaultColor = UIColor.orange
        calendar.appearance.eventSelectionColor = UIColor.orange


        //Today
        calendar.appearance.todayColor = #colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1)
        calendar.appearance.todaySelectionColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        //Selection Color
        calendar.appearance.selectionColor = UIColor.black

        //CalendarBackground
        calendar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)


//        calendar.appearance.eventSelectionColor = UIColor.green
//        calendar.appearance.eventDefaultColor = UIColor.green
    }

    func multiSelection() {
        calendar.allowsMultipleSelection = true
    }

    @IBAction func weakModeButton(_ sender: Any) {
        calendar.scope = .week
    }

    @IBAction func monthModeButton(_ sender: Any) {
        calendar.scope = .month
        
    }

    @IBAction func horizonalMode(_ sender: Any) {
        calendar.scrollDirection = .horizontal
    }

    @IBAction func verticalMode(_ sender: Any) {
        calendar.scrollDirection = .vertical
    }

    @IBAction func previousButton(_ sender: Any) {
        calendar.setCurrentPage(getPreviousMonth(date: calendar.currentPage), animated: true)
    }

    @IBAction func nextButton(_ sender: Any) {
        calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
    }

    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to:date)!
    }

    func getPreviousMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to:date)!
    }


    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd, MM, yyyy"
        return formatter
    }()

//    var datesWithEvent = ["2019-10-03", "2019-10-06", "2019-10-12", "2019-10-25"]
//
//    var datesWithMultipleEvents = ["2015-10-08", "2015-10-16", "2015-10-20", "2015-10-28"]
//
//    fileprivate lazy var dateFormatter2: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }()

}

extension ViewController: UIGestureRecognizerDelegate {

}

extension ViewController: FSCalendarDataSource, FSCalendarDelegate {

    //Select Calender cell
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("date is selected \(self.dateFormatter.string(from: date))")
        selectedDateLabel.text = self.dateFormatter.string(from: date)
        selectedDateLabel.textColor = #colorLiteral(red: 0.07843137255, green: 0.5568627451, blue: 1, alpha: 1)
    }

    //AutoLayoutCalendar
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
//        self.calendarHeightConstraints.constant = bounds.height
        self.view.layoutIfNeeded()
    }

    //Current Page Date Show
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("\(self.dateFormatter.string(from: calendar.currentPage))")
    }

//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//
//        let dateString = self.dateFormatter2.string(from: date)
//
//        if self.datesWithEvent.contains(dateString) {
//            return 1
//        }
//
//        if self.datesWithMultipleEvents.contains(dateString) {
//            return 3
//        }
//
//        return 0
//    }
//
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
//        let key = self.dateFormatter2.string(from: date)
//        if self.datesWithEvent.contains(key) {
//            return [UIColor.red]
//        }
//        return nil
//    }

//    //This is the delegate method
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
//
//        let dateString = self.dateFormatter.string(from: date)
//        if self.datesWithHolidays.contains(dateString) {
//            return UIColor.green
//        }
//        return nil
//
//    }


//    //Add Subtitle
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return "ZLHN"
//    }

//   //Add Image
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        return UIImage
//    }

    //    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    //        print("did select date \(self.dateFormatter.string(from: date))")
    //        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
    //        print("selected dates is \(selectedDates)")
    //        if monthPosition == .next || monthPosition == .previous {
    //            calendar.setCurrentPage(date, animated: true)
    //        }
    //    }


}

extension FSCalendar {
    func customizeCalenderAppearance() {
        self.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesSingleUpperCase]
//
//        self.appearance.headerTitleFont      = UIFont.init(name: Fonts.BalloRegular, size: 18)
//        self.appearance.weekdayFont          = UIFont.init(name: Fonts.RalewayRegular, size: 16)
//        self.appearance.titleFont            = UIFont.init(name: Fonts.RalewayRegular, size: 16)

        self.appearance.headerTitleColor     = UIColor.red

        self.appearance.weekdayTextColor     = UIColor.blue
        self.appearance.eventDefaultColor    = UIColor.orange
        self.appearance.selectionColor       = UIColor.yellow
        self.appearance.titleSelectionColor  = UIColor.purple
        self.appearance.todayColor           = UIColor.cyan
        self.appearance.todaySelectionColor  = UIColor.darkGray

        self.appearance.headerMinimumDissolvedAlpha = 1.0 // Hide Left Right Month Name
    }
}
