//
//  DevInfo.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/4/23.
//

import SwiftUI

struct DevInfo: View {
    let backgroundColor = UIColor(hex: "#395266")
    
    @ObservedObject var viewModel: DevStatusViewModel
    
    func formatDate(dateString: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = inputDateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "MMMM d, yyyy"
            outputDateFormatter.locale = Locale(identifier: "en_US") // Set the locale for English
            
            return outputDateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
    
    func level(repoCount: Int) -> String {
        if(repoCount < 20) {
            return "Upcoming Open Source Engineer"
        }
        if(repoCount >= 21 && repoCount < 50 ) {
            return "Junior Open Source Engineer"
        }
        return "Senior Open Source Engineer"
    }


    
    var body: some View {
        ZStack{
            Color(uiColor: backgroundColor).ignoresSafeArea()
            
            

            VStack(alignment: .leading){
                
                Spacer()
                    .frame(height: 80.0)
                
                Text(viewModel.user!.name).font(.system(size: 35)).fontWeight(.semibold).foregroundColor(Color.white)
                
                Spacer()
                    .frame(height: 15.0)
                
                Text(viewModel.user!.bio).fontWeight(.thin).foregroundColor(Color.white)
                
                Spacer()
                    .frame(height: 35.0)
                
                HStack{
                    Text("\(String(viewModel.user!.following)) Following").foregroundColor(Color.white)
                    
                    Text("\(String(viewModel.user!.followers)) Followers").foregroundColor(Color.white)
                }
                
                Spacer()
                    .frame(height: 55.0)
                
                HStack{
                    VStack {
                        Text("About \(String(viewModel.user!.login))").font(.system(size: 21)).fontWeight(.semibold).foregroundColor(Color.white)
                        
                        Rectangle()
                            .frame(width: 150.0, height: 2.0).foregroundColor(Color.white)
                    }
                    
                    VStack {
                        Text("Check").font(.system(size: 21)).fontWeight(.bold).foregroundColor(Color.white)
                        Rectangle()
                            .frame(width: 80.0, height: 2.0).foregroundColor(Color.white)
                    }
                }
                
                Spacer()
                    .frame(height: 35.0)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 35.0){
                        DevStat(stat: "Repositories:", statInfo: "\(String(viewModel.user!.public_repos))")
                        
                        DevStat(stat: "Location:", statInfo: "\(String(viewModel.user!.location))")
                        
                        DevStat(stat: "Website:", statInfo: "\(viewModel.user!.blog.isEmpty ? "Not Provided" : String(viewModel.user!.blog))")
                        
                        DevStat(stat: "Status:", statInfo: level(repoCount: viewModel.user!.public_repos))
                        
                        DevStat(stat: "Joined:", statInfo: formatDate(dateString: viewModel.user!.created_at))
                        
                        Spacer()
                    }
                    
                    VStack {
                        Rectangle()
                            .frame(width: 50.0, height: 50.0).foregroundColor(Color.white)
                        
                        Spacer()
                    }
                }
             
            }
            .padding(.horizontal, 22.0)
           
        }.onDisappear{
            viewModel.clearState()
        }
    }
}

struct DevStat: View {
    var stat: String
    var statInfo: String
    
    var body: some View {
        HStack{
            Text(stat).fontWeight(.thin).foregroundColor(Color.white)
            
            Text(statInfo).foregroundColor(Color.white).fontWeight(.semibold).lineLimit(2).truncationMode(.tail)
        }
    }
}

//struct DevInfo_Previews: PreviewProvider {
//    static var previews: some View {
//
//        Group{
//            DevInfo()
//
//            DevInfo().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//        }
//
//    }
//}


