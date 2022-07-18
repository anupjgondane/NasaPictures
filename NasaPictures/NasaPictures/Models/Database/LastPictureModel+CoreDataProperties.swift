//
//  LastPictureModel+CoreDataProperties.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//
//

import Foundation
import CoreData


extension LastPictureModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LastPictureModel> {
        return NSFetchRequest<LastPictureModel>(entityName: "LastPictureModel")
    }

    @NSManaged public var response: String?

}

extension LastPictureModel : Identifiable {

}
