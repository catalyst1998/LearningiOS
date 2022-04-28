 //
//  ContentView.swift
//  Memorize
//
//  Created by 玛卡巴卡 on 2022/4/28.
//

import SwiftUI

//struct可以拥有函数
struct ContentView: View {
    var emojis = ["😏","😏", "😭", "🥳", "🥸","😄","😆","😤","😡","🧐","😭","☹️","🤯","🥵","🥶"]
    @State var emojiCount = 5
    var body: some View {
        VStack{
            HStack{
    //            CardView(content: emojis[0]);

                ForEach(emojis[0..<emojiCount ],id:\.self){ emoji in
                    CardView(content: emoji)
                }
            }
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
    
    var remove :some View{
        Button(action:{
            emojiCount-=1
            
        }, label: {
            VStack{
                Text("Remove")
                Text("Emoji")
            }
        })
    }
    
    var add :some View{
        Button(action:{
            emojiCount+=1
        }, label: {
            VStack{
                Text("Add")
                Text("Emoji")
            }
            .padding()
            .foregroundColor(.blue)
        })
    }
     
}

struct CardView: View {
    @State var isFaceUp : Bool = true
    var content: String
    var body: some View {
        ZStack{
            //use 'let' define constants,use 'var' define variables
            let shape = Circle()
//            RoundedRectangle(cornerRadius: 30 )
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
