//
//  ContentView.swift
//  Calculator
//
//  Created by Ruan da Hora on 22/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var previous = 0
    @State var result = 0
    
    @State var operation = 0
    @State var previousOperation = 0
    
    func process(digit: Int){
        if operation > 0 {
            result = 0
            previousOperation = operation
            operation = -1
        }
    
        result = (result * 10) + digit
    }
    func calculate() {
       if previousOperation == 1{//soma
          result = previous + result
           previousOperation = 0
        }
        previous = result
    }
    var body: some View {
        VStack (alignment: .trailing, spacing: 1){
            Text("\(String(result).count)")
            Spacer()
            HStack{
                Text(String(result))
                .padding(.vertical, 20)
                .lineLimit(1)
                .font(.system(size: CGFloat(80/Int((Double(String(result).count + 10) / 8.0)))))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .fixedSize(horizontal:true, vertical: false )
            }
            HStack (spacing: 1){
                
                Button("AC") {
                    result=0
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                
                Button("+/-") {
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                Button("%") {
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                Button("÷") {
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            HStack (spacing: 1){
                
                Button("7") {
                    result += (result * 10) + 7
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("8") {
                    result += (result * 10) + 8
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("9") {
                    result += (result * 10) + 9
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("X") {
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            HStack (spacing: 1){
                
                Button("4") {
                    process(digit: 4)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("5") {
                    process(digit: 5)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("6") {
                    process(digit: 6)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("-") {
                }
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .font(.largeTitle)
                
            }.foregroundColor(Color.white)
            HStack (spacing: 1){
                
                Button("1") {
                    process(digit: 1)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("2") {
                    process(digit: 2)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("3") {
                    process(digit: 3)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("+") {
                    calculate()
                    operation = 1
                }
                
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            GeometryReader { geometry in
                HStack (spacing: 1){
                    
                    Button("0") {
                        result += (result * 10) + 0
                    }
                    .padding(.vertical, 40)
                    .frame(minWidth: geometry.size.width/2)
                    
                    
                    Button(",") {
                    }
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity)
                    
                    
                    Button("=") {
                    }
                    
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    
                }.foregroundColor(Color.white)
            }.frame(maxHeight: 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }
