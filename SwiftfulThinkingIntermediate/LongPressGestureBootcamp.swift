//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Takasur Azeem on 21/06/2024.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool  = false
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            HStack{
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        // start of press to min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }

                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isComplete = false
                            isSuccess = false
                        }
                    }
            }
        }
        
//        Text( isComplete ? "Completed" : "Not complete")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
