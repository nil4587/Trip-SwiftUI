//
//  ContentView.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import SwiftUI

//MARK: - Enum

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .dragging, .pressing:
            return true
        case .inactive:
            return false
        }
    }
}

struct ContentView: View {
    
    //MARK: - Properties
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private let dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom

    @State var cards: [CardView] = {
        var views = [CardView]()
        for (index, trip) in tripData.enumerated() where index < 2 {
            views.append(CardView(destination: trip))
        }
        return views
    }()
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cards.firstIndex(where: {$0.id == cardView.id}) else { return false }
        return index == 0
    }
    
    private func moveCards() {
        cards.removeFirst()
        
        self.lastCardIndex += 1
        
        let destination = tripData[lastCardIndex % tripData.count]
        let newCard = CardView(destination: destination)
        
        cards.append(newCard)
    }
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            //1. Header
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .frame(maxHeight: 80)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)

            Spacer()
            
            //2. Cards
            ZStack {
                ForEach(cards) { card in
                    card
                        .zIndex(self.isTopCard(cardView: card) ? 1 : 0)
                        .overlay(
                            ZStack{
                                //X-MARK Symbol
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: card) ? 1.0 : 0.0)
                                
                                //HEART Symbol
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: card) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView: card) ? self.dragState.translation.width : 0, y:  self.isTopCard(cardView: card) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: card) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: card) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: self.dragState.isDragging)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState) { value, state, transaction in
                               switch value {
                               case .first(true):
                                   state = .pressing
                               case .second(true, let drag):
                                   state = .dragging(translation: drag?.translation ?? .zero)
                               default:
                                   break
                               }
                            }
                            .onChanged({ value in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                
                                if drag.translation.width < -self.dragAreaThreshold {
                                    self.cardRemovalTransition = .leadningBottom
                                }
                                
                                if drag.translation.width > self.dragAreaThreshold {
                                    self.cardRemovalTransition = .trailingBottom
                                }
                            })
                            .onEnded { value in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                
                                if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                    self.moveCards()
                                    play(sound: "sound-rise", type: "mp3")
                                }
                            }
                        )
                        .transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            //3. Footer
            FooterView(showBookAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"), message: Text("Your most welcome and have a precious time during your stay."), dismissButton: .default(Text("Have happy stay!")))
        }
    }
}

//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
    }
}
