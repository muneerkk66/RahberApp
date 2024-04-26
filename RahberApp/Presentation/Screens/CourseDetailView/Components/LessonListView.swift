//
//  LessonListView.swift
//  RahberApp
//
//  Created by Muneer K K on 26/04/2024.
//

import SwiftUI

struct LessonListView: View {
    let course: Course

    var body: some View {
        List {
            Section(header: Text(LocalizedStringKey("course.lessons"))) {
                ForEach(course.lessons, id: \.id) { lesson in
                    HStack {
                        Image(systemName: "play.circle").resizable() .foregroundColor(.primaryGreen).frame(width: Dimensions.space30, height: Dimensions.space30)

                        Text(lesson.title)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }

                }
            }

        }
    }
}

#Preview {
    LessonListView(course: PreviewData.course)
}
