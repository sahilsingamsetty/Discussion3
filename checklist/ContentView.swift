//
//  ContentView.swift
//  checklist
//
//  Created by Andy Huang on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    @State var description = ""
    @State var in_progress = ["1", "2", "3"]
    @State var complete = ["3", "4", "5"]
    var body: some View {
        VStack{
            HeaderView(description: $description, in_progress: $in_progress)
            
            ChecklistView(in_progress: $in_progress, complete: $complete)
            
        }
    }
    
    
    
struct HeaderView: View {
    @Binding var description: String
    @Binding var in_progress: [String]

    var body: some View {
        VStack {
            HStack {
                Image("Image")
                    .resizable()
                    .frame(width: 100, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle() .stroke(.gray, lineWidth: 2))
                    
                Text("Oski The Bear")
                    .bold()
                    .font(.title)
                    .padding(.leading, 5)
                Spacer()
            }
            .padding(.horizontal, 15)
            HStack {
                TextField("Enter Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {in_progress.append(description) ; description = ""}) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 20)
               
            }
        
        }
    }
}

struct ChecklistView: View {
    @Binding var in_progress: [String]
    @Binding var complete: [String]
    var body: some View {
        List {
            Section(header: Text("In Progress").textCase(nil)) {
                ForEach(in_progress, id:\.self) {
                    item in Button(action: {complete.append(item);
                        if let index = in_progress.firstIndex(of: item){
                            in_progress.remove(at: index )}}) {
                            Text(item).foregroundColor(.primary)
                        }
                    }
                }
            Section(header: Text("Complete").textCase(nil)) {
                ForEach(complete, id:\.self) {
                    item in Button(action: {in_progress.append(item);
                        if let index = complete.firstIndex(of: item){
                            complete.remove(at: index )}}) {
                        HStack {
                            Image(systemName: "checkmark").foregroundStyle(.gray)
                                Text(item).foregroundColor(.primary)
                            }
                        }
                    }
                }
            }
        }
    }
        
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
           ContentView()
        }
    }
