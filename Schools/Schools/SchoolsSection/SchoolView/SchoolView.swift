//
//  ContentView.swift
//  Schools
//
//  Created by Taha Metwally on 16/2/2024.
//

import SwiftUI
import Foundation
import SwiftUI

struct SchoolView: View {
    @StateObject var schoolModle = SchoolViewModel()
    var body: some View {
        NavigationView {
            List(schoolModle.list,id: \.id){
                item in
                NavigationLink(destination: Text(item.overview_paragraph ?? "Failed to get the data"), label: {Text(item.school_name ?? "failed to get the data")})
            }
        }.onAppear(perform: {
            schoolModle.fetch()
        })
    }
}
