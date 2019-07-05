//
//  ArticleClass2.swift
//  D09
//
//  Created by Anastasiia ALOKHINA on 7/5/19.
//  Copyright © 2019 Anastasiia ALOKHINA. All rights reserved.
//


import Foundation
import CoreData
///https://www.makeschool.com/academy/track/standalone/learn-how-to-build-make-school-notes-in-swift-4/intro-coredata
@objc(Article)

public class Article: NSManagedObject {
    var title : String?
    var content : String?
    var language : String?
    var image : NSData?
    var creationDate : NSDate?
    var modificationDate : NSDate?
    override func description(){
        return ("Title: ", \(title), "Content: ", \(content), "Language: ", \(language), "Image: ", \(image),
                "CreationDate: ", \(creationDate), "ModificationDate: ", \(modificationDate))
    }
}
