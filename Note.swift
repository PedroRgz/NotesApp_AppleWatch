//
//  Note.swift
//  NotesApp WatchKit Extension
//
//  Created by Pedro Rodríguez on 10/07/21.
//

import SwiftUI

struct Note:Identifiable, Codable{
    var id: UUID //creará un identificador hexadecimal único para cada nota
    var title:String
    var creationDate:String
    
    //Constructor de la estructura
    init(titleForNote: String) {
        self.id = UUID()
        self.title = titleForNote
        
        //guardamos la fecha en la que está siendo creada la nota
        let currentDate = Date()
        //ahora modificamos el estilo en el que se presentará la fecha
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        //asignamos la fecha a la nota
        self.creationDate = dateFormatter.string(from: currentDate)
    }
}
