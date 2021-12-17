//
//  ContentView.swift
//  Timer WatchKit Extension
//
//  Created by Henrique Marques on 14/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false
    @State var timerVal = 1
    
    var body: some View {
        VStack{
        Text("Começar o timer com \(timerVal) segundos")
                .font(.system(size: 14))
        Picker(selection: $timerVal, label: Text("")) {
            Text("10").tag(10)
            Text("20").tag(20)
            Text("30").tag(30)
            Text("40").tag(40)
            Text("50").tag(50)
            Text("60").tag(60)
            Text("70").tag(70)
            Text("80").tag(80)
            Text("90").tag(90)
    
            
        }
        NavigationLink(destination: SecondView(secondScreenShown: $secondScreenShown, timerVal: timerVal),
                       isActive: $secondScreenShown,
                       label: {Text("Vai")})
        }
    }
}

struct SecondView: View{
    @Binding var secondScreenShown: Bool
    @State var timerVal = 1
    var body: some View {
        
        if timerVal > 0 {
            VStack{
                Text("Tempo restante")
                    .font(.system(size: 14))
                Text("\(timerVal)")
                    .font(.system(size: 40))
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if self.timerVal > 0 {
                                self.timerVal -= 1
                            }
                        }
                    }
                Text("segundos")
                    .font(.system(size: 14))
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Cancelar")
                        .foregroundColor(.red)

                }
            }
        } else {
            Button(action: {
                self.secondScreenShown = false
            }) {
                Text("Pronto")
                    .foregroundColor(.cyan)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
