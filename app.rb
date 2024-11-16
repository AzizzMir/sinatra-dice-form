require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

get("/") do
  erb(:index)
end

get("/:process_roll") do
  @dice = params.fetch("dice").to_i
  @sides = params.fetch("sides").to_i

  @results = []

  @dice.times do
    result = rand(1..@sides)
    @results.push(result)
  end

  erb(:roll)
end
