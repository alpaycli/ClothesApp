//
//  RatingView.swift
//  Bookworm
//
//  Created by Alpay Calalli on 21.08.22.
//

import SwiftUI

struct RatingView: View {
    let clothe: Clothe
    
    @Binding var rating: Int
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var label = ""
    
    var maximumRating = 5
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self){ number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        withAnimation{
                            rating = number
                        }
                    }
            }
            
            Text("(Overall: \(clothe.rating.rate, specifier: "%.1f"))")
                .fontWeight(.semibold)
        }
        .accessibilityElement()
        .accessibilityLabel("Rating")
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction{ direction in
            switch direction{
            case .increment:
                if rating < maximumRating { rating += 1}
            case .decrement:
                if rating > 1 { rating -= 1}
            default:
                break
            }
        }
    }
    
    func image(for number: Int) -> Image{
        if number > rating{
            return offImage ?? onImage
        }else{
            return onImage
        }
    }
    
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(clothe: Clothe.example, rating: .constant(4))
    }
}
