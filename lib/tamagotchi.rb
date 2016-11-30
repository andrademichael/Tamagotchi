class Tamagotchi

  @@all_pets = []

  define_method(:initialize) do |name|
    @pet_name = name
    @fullness = 100
    @energy = 100
    @strength = 100
    @last_checked = Time.now()
    @id = @@all_pets.length().+(1)
  end

  define_method(:name) do
    @pet_name
  end

  define_method(:id) do
    @id
  end

  define_method(:food_level) do
    @fullness
  end

  define_method(:change_food_level) do |change|
    @fullness = @fullness + change
  end

  define_method(:sleep_level) do
    @energy
  end

  define_method(:change_sleep_level) do |change|
    @energy = @energy + change
  end

  define_method(:activity_level) do
    @strength
  end

  define_method(:change_activity_level) do |change|
    @strength = @strength + change
  end

  define_method(:is_alive) do
    if @fullness > 0 && @energy > 0 && @strength > 0
      true
    else
      false
    end
  end

  define_method(:save) do
    @@all_pets.push(self)
  end

  define_method(:time_passes) do
    self.change_food_level(-1)
  end

  define_singleton_method(:all) do
    @@all_pets
  end

  define_singleton_method(:clear) do
    @@all_pets = []
  end

  define_singleton_method(:find) do |identification|
    found_pet = nil
    @@all_pets.each() do |pet|
      if pet.id().eql?(identification.to_i())
        found_pet = pet
      end
    end
    found_pet
  end
end
