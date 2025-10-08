import Cocoa

/// Make a class hierachy for animals.
/// Start with Animal. Add a legs property for the number of legs an animal has.
/// Make Dog a subclas of Animal, giving it a speak() method that prints a dog barking string, but each subclass should print something different.
/// Make Corgi and Poodle subclassed of Dog.
/// Make Cat an Animal subclass. Add a speak() method, with each subclass printing something different, and an isTame Boolean, set with an initializer.
/// Make Persian and Lion as subclasses of Car.

class Animal {
    let legs: Int

    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {

    init() {
        super.init(legs: 4)
    }

    func speak() {
        print("Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Yip!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Ruff!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        if isTame {
            print("Meow!")
        }
    }
}

class Persian: Cat {
    override func speak() {
        print("Meow-meow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}

let dog = Dog()
dog.speak()

let corgi = Corgi()
corgi.speak()

let poodle = Poodle()
poodle.speak()

let cat = Cat(isTame: true)
cat.speak()

let persian = Persian(isTame: true)
persian.speak()

let lion = Lion(isTame: false)
lion.speak()

