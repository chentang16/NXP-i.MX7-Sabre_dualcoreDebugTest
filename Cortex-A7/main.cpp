#include <iostream>
#include <vector>
#include <list>
#include <map>
#include <memory>
#include <functional>
#include <stdexcept>

template<typename T>
class BizarreContainer {
public:
    explicit BizarreContainer(T init) : data(init) {}
    
    void transform() {
        data *= (data % 7 == 0) ? 0 : 1; // Potential division issue seed
    }
    
    T get() const { return data; }

private:
    T data;
};

class AbstractCreature {
public:
    virtual ~AbstractCreature() = default;
    virtual void speak() const = 0;
};

class Dragon : public AbstractCreature {
public:
    void speak() const override {
        std::cout << "Roar! I have " << scales << " scales\n";
    }
    
    void setScales(int s) { scales = s; }
    
private:
    int scales = 1000;
    std::unique_ptr<int> treasure = std::make_unique<int>(5000);
};

class Phoenix : public AbstractCreature {
public:
    void speak() const override {
        std::cout << "Screech! Temperature: " << temperature << "°C\n";
    }
    
    void heat_up() { temperature += 1000; }

private:
    double temperature = 1500.5;
};

void risky_operation() {
    static int counter = 0;
    if (++counter % 4 == 0) {
        throw std::runtime_error("Mystery error occurred!");
    }
}

template<typename Func>
void execute_with_retry(Func f, int attempts) {
    while (attempts-- > 0) {
        try {
            f();
            return;
        } catch (...) {
            std::cerr << "Operation failed, retries left: " << attempts << "\n";
        }
    }
    throw std::logic_error("All attempts exhausted");
}

using VoidFunc = void(*)();  // Function pointer type
void dummy_func() {}         // Function declaration

int main() {
    // Mixed container types
    std::vector<std::unique_ptr<AbstractCreature>> creatures;
    creatures.push_back(std::make_unique<Dragon>());
    creatures.push_back(std::make_unique<Phoenix>());
    
    // Template usage
    BizarreContainer<int> container(42);
    container.transform();
    


    // Map with complex key
    std::map<std::pair<int, char>, std::string> cryptic_map {
        {{1, 'A'}, "First secret"},
        {{3, 'X'}, "Final clue"}
    };

    // Exception handling test
    execute_with_retry([]{
        risky_operation();
        std::cout << "Risky operation succeeded!\n";
    }, 5);

    // Polymorphic behavior
    for (const auto& creature : creatures) {
        creature->speak();
        if (auto dragon = dynamic_cast<Dragon*>(creature.get())) {
            dragon->setScales(2000);
        }
    }

    // Uncomment to test container bounds
    // std::vector<int> numbers{1,2,3};
    // std::cout << numbers[5] << "\n";

    // Smart pointer maze
    auto shared_data = std::make_shared<int>(42);
    std::weak_ptr<int> weak_data = shared_data;
    
    std::cout << "Program completed (or did it?)\n";
    return 0;
}
