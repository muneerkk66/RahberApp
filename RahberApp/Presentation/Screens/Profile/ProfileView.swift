//
//  ProfileView.swift
//  RahberApp
//
//  Created by Muneer K K on 26/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    var body: some View {
        VStack {
            Image(systemName: "person").resizable().foregroundColor(.primaryGreen).frame(width: Dimensions.space80, height: Dimensions.space80)
            Text((viewModel.user?.fullName()).orEmpty)
            List {
                Section(header: Text("user.enrolled.courses")) {
                    ForEach(viewModel.courseList.filter {$0.isEnrolled(courseIds: viewModel.enrolledIds)}, id: \.id) { course in
                        HStack {
                            Image(systemName: "doc.on.doc").resizable() .foregroundColor(.primaryGreen).frame(width: Dimensions.space30, height: Dimensions.space30)

                            Text(course.name)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }

                    }
                }

            }		}

    }
}

#Preview {
    ProfileView()
}
