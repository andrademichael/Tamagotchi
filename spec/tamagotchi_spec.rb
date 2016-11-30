require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end

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

    describe('.all') do
      it('returns the array containing all created objects') do
        expect(Tamagotchi.all()).to(eq([]))
      end
    end

    describe('#save') do
      it('adds a tamagotchi to an array of saved tamagotchis') do
        test_pet = Tamagotchi.new('Big Dragon')
        test_pet.save()
        expect(Tamagotchi.all()).to(eq([test_pet]))
      end
    end
    describe('.clear') do
      it('empties the array of the saved tamagotchis') do
        Tamagotchi.new("Big Dragon").save()
        Tamagotchi.clear()
        expect(Tamagotchi.all()).to(eq([]))
      end
    end

    describe("#id") do
      it('returns the id number of the tamagotchi') do
        test_pet = Tamagotchi.new("Big Dragon")
        test_pet.save()
        expect(test_pet.id()).to(eq(1))
      end
    end

    describe('.find') do
      it('returns a tamagotchi by its ID number') do
        test_pet = Tamagotchi.new("Big Dragon")
        test_pet.save()
        test_pet2 = Tamagotchi.new("lil dragon")
        test_pet2.save()
        expect(Tamagotchi.find(test_pet.id())).to(eq(test_pet))
      end
    end
  end
end
