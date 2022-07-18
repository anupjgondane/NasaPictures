//
//  PictureModel+CoreDataProperties.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//
//

import Foundation
import CoreData


extension PictureModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PictureModel> {
        return NSFetchRequest<PictureModel>(entityName: "PictureModel")
    }

    @NSManaged public var date: String?
    @NSManaged public var explaination: String?
    @NSManaged public var mediaType: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension PictureModel : Identifiable {

}
