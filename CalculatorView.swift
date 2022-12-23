//
//  ContentView.swift
//  Calculator
//
//  Created by Ruan da Hora on 22/12/22.
//

import SwiftUI

struct CalculatorView: View {
    @State var previous = 0.0
    @State var result = 0.0
    
    @State var operation = 0
    @State var previousOperation = 0
    func removeZerosFromEnd(value: Double) -> String{
        let f = NumberFormatter()
        let number = NSNumber(value: value)
        f.minimumFractionDigits = 0
        f.maximumFractionDigits=16
        return f.string(from: number) ?? ""
    }
    func process(digit: Int){
        if operation > 0 {
            result = 0
            previousOperation = operation
            operation = -1
        }
    
        result = (result * 10) + Double(digit)
    }
    func reset (){
     operation=0
       previousOperation=0
        result=0
        previous=0
    }
    func calculate() {
       if previousOperation == 1{//soma
          result = previous + result
           previousOperation = 0
       } else if previousOperation == 2 { //Subtração
           result = previous - result
           previousOperation=0
       }
        else if previousOperation == 3 { //Multiplicação
            result = previous * result
            previousOperation=0
        }
        else if previousOperation == 4 {//Divisão
            result = previous / result
            previousOperation=0
        }
        previous = result
    }
    var body: some View {
        VStack (alignment: .trailing, spacing: 1){
            Text("\(String(result).count)")
            Spacer()
            HStack{
                Text(String(removeZerosFromEnd(value: result)))
                .padding(.vertical, 20)
                .lineLimit(1)
                .font(.system(size: CGFloat(80/Int((Double(String(result).count + 10) / 8.0)))))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .fixedSize(horizontal:true, vertical: false )
            }
            HStack (spacing: 1){
                
                Button("AC") {
                    reset()
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                
                Button("+/-") {
                    calculate()
                    operation=6
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                Button("%") {
                    calculate()
                    operation=5
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                Button("÷") {
                    calculate()
                    operation=4
                }
                .font(.largeTitle)
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            HStack (spacing: 1){
                
                Button("7") {
                    process(digit: 7)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("8") {
                    process(digit: 8)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("9") {
                    process(digit: 9)
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                
                
                Button("X") {
                    calculate()
                    operation=3
                }
                .font(.title2)
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
                    calculate()
                    operation=2
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
                .font(.largeTitle)
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            GeometryReader { geometry in
                HStack (spacing: 1){
                    
                    Button("0") {
                        process(digit: 0)
                    }
                    .padding(.vertical, 40)
                    .frame(minWidth: geometry.size.width/2)
                    
                    
                    Button(",") {
                    }
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity)
                    
                    
                    Button("=") {
                        calculate()
                        previousOperation=999
                        operation=999
                    }
                    .font(.largeTitle)
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    
                }.foregroundColor(Color.white)
            }.frame(maxHeight: 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        
        struct CalculatorView_Previews: PreviewProvider {
            static var previews: some View {
                CalculatorView()
            }
        }
    }
