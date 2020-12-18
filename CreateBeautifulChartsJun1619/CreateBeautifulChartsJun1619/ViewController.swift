//
//  ViewController.swift
//  CreateBeautifulChartsJun1619
//
//  Created by Zin Lin Htet Naing on 6/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var androidStepper: UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var androidDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.chartDescription?.text = ""
        
        iosStepper.value = 100
        androidStepper.value = 100
        
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "iOS"
        
        androidDataEntry.value = androidStepper.value
        androidDataEntry.label = "Android"
        
        numberOfDownloadDataEntries = [iosDataEntry, androidDataEntry]
        
        updateChartData()
    }

    @IBAction func changeiosStepperAction(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeAndroidStepperAction(_ sender: UIStepper) {
        androidDataEntry.value = sender.value
        updateChartData()
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "iosColor"), UIColor(named: "androidColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        pieChart.data = chartData
    }
}

