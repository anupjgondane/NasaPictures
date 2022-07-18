//
//  PictureModel+CoreDataClass.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//
//

import Foundation
import CoreData

@objc(PictureModel)
public class PictureModel: NSManagedObject {

    @nonobjc public class func fetchRequest(byDate date: String) -> NSFetchRequest<PictureModel> {
        let request = NSFetchRequest<PictureModel>(entityName: "PictureModel")
        request.predicate = NSPredicate(format: "date == %@", date)
        return request
    }

}
