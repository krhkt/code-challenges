# https://leetcode.com/contest/weekly-contest-271/problems/watering-plants-ii/

# Alice -> left to right
# Bob -> right to left
# both on same plant -> the one with more water does it
#                       if they have the same amount of watet, Alice has priority
#
# plants array: each number is the water necessary
# capacity_a: size of Alice's watering can
# capacity_b: size of Bob's watering can

def water_plant(person, plants)
  plant_thirst = plants[person[:pos]]
  
  has_to_refill = person[:water] < plant_thirst
  person[:water] = person[:capacity] if has_to_refill

  person[:water] -= plant_thirst
  person[:pos] += person[:dir]

  has_to_refill ? 1 : 0
end

def minimum_refill(plants, capacity_a, capacity_b)
    alice = { water: capacity_a, pos: 0, capacity: capacity_a, dir: 1 }
    bob = { water: capacity_b, pos: plants.size - 1, capacity: capacity_b, dir: -1 }
    refills = 0
    while alice[:pos] <= bob[:pos]
      if alice[:pos] == bob[:pos]
        person = bob[:water] > alice[:water] ? bob : alice
        refills += water_plant(person, plants)
        next
      end

      refills += water_plant(alice, plants)
      refills += water_plant(bob, plants)
    end

    refills
end

p minimum_refill([2,2,5,2,2], 5, 5)