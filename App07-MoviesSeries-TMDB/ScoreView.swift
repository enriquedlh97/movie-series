//
//  ScoreView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Double
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 60, height: 60)
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.25)
                .foregroundColor(Color.black)
                .frame(width: 70, height: 70)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(score / 100, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(ScoreColor(score: score))
                .rotationEffect(Angle(degrees: 270.0))
                .frame(width: 70, height: 70)
                .animation(.linear)
            Text(String(format: "%.0f %%", min(score, 100.0)))
                .font(.Akaya(size: 24))
                .foregroundColor(.white)
                .bold()
        }
    }
    
    func ScoreColor(score: Double) -> Color {
        if score < 60 {
            return Color("ChiGong")
        } else {
            if score >= 60 && score < 85 {
                return Color("MandarinSorbet")
            } else {
                return Color("Emerald")
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 50)
    }
}
