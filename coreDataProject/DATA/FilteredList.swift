//
//  FilteredList.swift
//  coreDataProject
////  Day 57 Project 12 - 100DaysOfSwiftUI by Paul Hudson
//  Created by yannemal on 15/10/2023.

import CoreData
import SwiftUI

//other structs:

struct FilteredList<T: NSManagedObject, Content: View>: View {
// DATA:
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
    // someVIEW
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    } // end some View
// METHODS:
    init(filterKey: String, filterValue:String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
    
}

//#Preview {
//    FilteredList()
//}

// https://www.youtube.com/watch?v=9CoUUCL03tA
// Stewart Lynch on Predicate
