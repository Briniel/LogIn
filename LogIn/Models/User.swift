//
//  User.swift
//  LogIn
//
//  Created by Михаил Иванов on 27.08.2021.
//

struct User {
    let username: String
    let password: String
    let person: Person

    static func getUser() -> User {
        User(
            username: "Brin",
            password: "Test",
            person: Person(
                firstName: "Михаил",
                secondName: "Иванов",
                middleName: "Алексеевич",
                age: 26,
                placeOfWork: "ПАО 'Промсвязьбанк'",
                position: "Инженер по автоматизации тестирования"
            )
        )
    }
}
