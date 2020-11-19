//
//  ContentView.swift
//  TipCalculator
//
//  Created by Dexter Krijgsman on 12/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var total = ""
    @State var savingPercent: Double = 15.0
    
    var body: some View {
        
            VStack {
                Text("Monthly saving calculator")
                    .font(.title)
                    .bold()
                
                HStack {
                    Text("€")
                    TextField("Monthly income", text: $total)
                        .border(Color.black, width: 0.5)
                }
                .padding()
                
                HStack{
                    Slider(value: $savingPercent, in: 1...100, step: 1.0)
                    Text("\(Int(savingPercent))%")
                }
                .padding()
                
                if let totalNum = Double(total){
                    Text("Amount to set aside this month: €\(totalNum * savingPercent / 100, specifier: "%0.2f")")
                    Text("YearlySavings: €\(totalNum * savingPercent / 100 * 12, specifier: "%0.2f")")
                    Text("Ten years of saving: €\(totalNum * savingPercent / 100 * 120, specifier: "%0.2f")")
                } else{
                    Text("Please enter a number")
                    Text("")
                }
            }
        }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
