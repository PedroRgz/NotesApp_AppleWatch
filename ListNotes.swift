//
//  ListNotes.swift
//  NotesApp WatchKit Extension
//
//  Created by Pedro Rodríguez on 10/07/21.
//

import SwiftUI

struct ListNotes: View {
    @State var tempNotes = [Note]()
    
    var body: some View {
        VStack{
            Text("Notas: \(tempNotes.count)")
            List{
                ForEach(0..<tempNotes.count, id:\.self){i in
                    NavigationLink(
                        destination: DetailNote(note: tempNotes[i]),
                        label: {
                            Text(tempNotes[i].title)
                                .lineLimit(1)
                        })
                }.onDelete(perform: delete)
            }
        }.onAppear(perform: {
            tempNotes = Tools.shared.load()
        })
    }
    
    func delete(offsets: IndexSet){
        withAnimation{
            tempNotes.remove(atOffsets: offsets)
        }
        
        //guardamos las notas, si no, no apareceran como eliminadas
        Tools.shared.save(notesArray: tempNotes)
    }
}

struct ListNotes_Previews: PreviewProvider {
    static var previews: some View {
        ListNotes()
    }
}
