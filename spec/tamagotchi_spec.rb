require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(100))
      expect(my_pet.sleep_level()).to(eq(100))
      expect(my_pet.activity_level()).to(eq(100))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive()).to(eq(true))
    end
  end

  describe("#is_alive") do
    it("is dead if the food level is 0 or less") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.change_food_level(-100)
      expect(my_pet.is_alive()).to(eq(false))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()  #decide what trigger you will use to make time pass
      expect(my_pet.food_level()).to(eq(99))
    end
  end
end
