//
//  DatePickerViewController.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

/** Common date picker to allow select date */
protocol DatePickerViewControllerDelegate: AnyObject {
    func didSelectDate(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    weak var delegate: DatePickerViewControllerDelegate?
    var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewProperties()
        self.setupDatePicker()
    }
    
    func setupViewProperties() {
        self.view.setBlackTransparentColor()
        if self.traitCollection.userInterfaceStyle == .dark {
            self.datePicker.backgroundColor = .black
        } else {
            self.datePicker.backgroundColor = .white
        }
    }
    
    func setupDatePicker() {
        guard self.selectedDate != nil else {
            return
        }
        self.datePicker.date = self.selectedDate!
    }

    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectButtonAction(_ sender: Any) {
        self.delegate?.didSelectDate(date: self.datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}

extension DatePickerViewController: ControllerFactory {}
