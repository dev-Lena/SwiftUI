//
//  ContentView.swift
//  ChartPractice
//
//  Created by Keunna Lee on 2021/01/26.
//

import SwiftUI

typealias ChartValue = CGFloat
typealias Title = String

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[ChartValue]] = [
        [50, 100, 150, 30, 40],
        [150, 100, 50, 200, 10],
        [10, 20, 30, 50, 100]
    ]
    @State var titles: [[Title]] = [
        ["Mon", "Tue", "Wed", "Thu", "Fri"],
        ["12", "13", "14", "15", "16"],
        ["17", "18", "19", "20", "21"]
    ]
    
    var body: some View {
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Colory Intake")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack {
                    BarChart(value: dataPoints[pickerSelectedItem][0], name: titles[pickerSelectedItem][0])
                    BarChart(value: dataPoints[pickerSelectedItem][1], name: titles[pickerSelectedItem][1])
                    BarChart(value: dataPoints[pickerSelectedItem][2], name: titles[pickerSelectedItem][2])
                    BarChart(value: dataPoints[pickerSelectedItem][3], name: titles[pickerSelectedItem][3])
                    BarChart(value: dataPoints[pickerSelectedItem][4], name: titles[pickerSelectedItem][4])
                    
                }.padding(.top, 24)
                .animation(.default)
            }

        }

    }
}

struct BarChart: View {
    
    var value: ChartValue
    var name: Title
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2793460488, green: 0.8890713453, blue: 0.6270262599, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(name).padding(.top, 8)
        }
    }
}
