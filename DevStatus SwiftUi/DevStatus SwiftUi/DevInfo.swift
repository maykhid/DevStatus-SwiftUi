//
//  DevInfo.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/4/23.
//

import SwiftUI

struct DevInfo: View {
    let backgroundColor = UIColor(hex: "#395266")

    
    var body: some View {
        ZStack{
            Color(uiColor: backgroundColor).ignoresSafeArea()
            
            

            VStack(alignment: .leading){
                
                Spacer()
                    .frame(height: 80.0)
                
                Text("Ifebunandu Henry").font(.system(size: 35)).fontWeight(.semibold).foregroundColor(Color.white)
                
                Spacer()
                    .frame(height: 15.0)
                
                Text("Software Developer (Flutter)").fontWeight(.thin).foregroundColor(Color.white)
                
                Spacer()
                    .frame(height: 35.0)
                
                HStack{
                    Text("11 Following").foregroundColor(Color.white)
                    
                    Text("1 Followers").foregroundColor(Color.white)
                }
                
                Spacer()
                    .frame(height: 55.0)
                
                HStack{
                    VStack {
                        Text("About Maykhid").font(.system(size: 21)).fontWeight(.semibold).foregroundColor(Color.white)
                        
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
                        DevStat(stat: "Repositories:", statInfo: "25")
                        
                        DevStat(stat: "Location:", statInfo: "Lagos, Nigeria")
                        
                        DevStat(stat: "Website:", statInfo: "Not Provided")
                        
                        DevStat(stat: "Status:", statInfo: "Junior Open Source Engineer")
                        
                        DevStat(stat: "Joined:", statInfo: "September 3, 2019")
                        
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

struct DevInfo_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            DevInfo()
            
            DevInfo().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        }
       
    }
}


