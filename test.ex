defmodule M do
    def printHelloName do
        name = IO.gets("What is your name? ") |> String.trim
        "Hello #{name}" |> IO.puts
    end
    def data do
        data_stuff()
    end

    def data_stuff do
        my_int = 123
        "my_int variable is a Integer? #{is_integer(my_int)}"|> IO.puts

        my_float = 2.3124
        "1. my_float variable is a Float? #{is_float(my_float)}" |> IO.puts

        my_str = "Well this is a string, but im not really sure how much the character is" |> String.trim

        longer_str = my_str <> " <-- but i guess this string should be #{my_str |> String.length} characters"

        "2. "<>longer_str |> IO.puts

        "3. they are not really sure? #{my_str |> String.contains?("not really sure")}" |> IO.puts

        "4. First character : #{my_str |> String.first}" |> IO.puts

        "5. Character Index 5 : #{longer_str |> String.at(5)}" |> IO.puts

        "6. '#{my_str |> String.slice(0,9)}' is some characters from index 0 to 9 " |> IO.puts

        "7. "<>longer_str |> String.split |> IO.inspect

        reverse_str = longer_str |> String.reverse
        "8. "<>reverse_str|> IO.puts

        "9. "<> longer_str |> String.upcase |> IO.puts

        "10. "<> longer_str |> String.downcase |> IO.puts

        "11. "<> longer_str |> String.capitalize |> IO.puts

        ask_operators()

    end

    def ask_operators do
        "" |> IO.puts
        "[1] + | summation" |> IO.puts
        "[2] - | subtraction" |> IO.puts
        "[3] * | multiplication" |> IO.puts
        "[4] / | division" |> IO.puts
        "[5] div() | division(no float)" |> IO.puts
        "[6] rem() | remainder" |> IO.puts
        {operator,_} = "Choose an operator : " |> IO.gets |> Integer.parse
        {fnum,_}="choose a number : "|> IO.gets |> Integer.parse
        {snum,_}= "choose another number : "|> IO.gets |> Integer.parse
        operator |> mathematics(fnum,snum)
    end

    def mathematics(operators,first_number,second_number) do
        case operators do
            1 -> first_number + second_number |> IO.puts
            2 -> first_number - second_number |> IO.puts
            3 -> first_number * second_number |> IO.puts
            4 -> first_number / second_number |> IO.puts
            5 -> div(first_number, second_number) |> IO.puts
            6 -> rem(first_number, second_number)|> IO.puts
                
        end

        cond do
            first_number == second_number -> "same number" |> IO.puts
            first_number != second_number -> "different number" |> IO.puts
            first_number > second_number -> "first number greater than second number" |> IO.puts
            first_number < second_number -> "first number less than second number" |> IO.puts

                
        end
    end

end

defmodule X do
    def main do
        {value,_} = IO.gets("1 + 1 = ") |> Integer.parse
        if 1+1 === value do
            "your answer is correct!" |> IO.puts
        else
            "answer incorrect, your number is #{if rem(value,2)==0, do: "even", else: "odd"}" |> IO.puts
        end

        unless 1+1 === value do
            "no additional point" |> IO.puts
        else

            "+1 point" |> IO.puts
        end
    end


    def tuples do
        my_stats = {true,176,:Fathan}

        IO.puts "Tuple : #{is_tuple(my_stats)}"

        updated_stats = Tuple.append(my_stats, 18)

        {_, _, name, _} = updated_stats

        IO.puts "Age : #{elem(updated_stats,3)}"

        IO.puts "Tuple Size : #{tuple_size(updated_stats)}"

        IO.puts "Name : #{name}"
         
    end

    def list do
        list1 = [1,2,3]
        list2 = [4,5,6]

        list3 = list1 ++ list2
        list4 = list3 -- list2

        IO.puts 6 in list4

        [head | tail] = list3
        IO.puts "Head : #{head}"
        IO.inspect tail, charlists: :as_lists 

        Enum.each tail, fn item ->
            IO.puts item
        end

        words = ["Random", "Words", "in a","list"]

        Enum.each words, fn item->
            IO.puts item
        end
        IO.puts display_list(words)

    end
    def display_list([word|words]) do
        IO.puts word
        display_list(words)
    end
    def display_list([]), do: nil

    def map do
        capitals = %{"Indonesia"=>"Jakarta", "Japan"=>"Tokyo", "America"=>"New York"}
        IO.puts "Capital of Indonesia : #{ capitals["Indonesia"] }"
        capitals2 = %{indonesia: "Jakarta", japan: "Tokyo", america: "New York"}
        IO.puts "Capital of Japan : #{capitals2.japan}"


    end

    def patter_matching do
        [height, width] = [20,30]
        IO.puts width
        [_,[_,a]] = [30,[45,54]]
        IO.puts a
    
    end

    def anonymous_function do
        get_sum = fn (x,y) -> x+y end
        IO.puts "5 + 5 = #{get_sum.(5,5)}"

        get_less = &(&1 - &2)
        IO.puts "7 - 6 = #{get_less.(7,6)}"

        add_sum = fn
            {x,y} -> IO.puts "#{x} + #{y} = #{x-y}"
            {x,y,z} -> IO.puts "#{x} + #{y} + #{z} = #{x-y-z}"
        end

        add_sum.({4,3})
        add_sum.({4,3,5})

        IO.puts do_it()
    end

    def do_it(x \\ 1, y \\ 1) do
        x+y
        
    end

    def recursion do
        IO.puts "Factorial of 4 : #{factorial(4)}"
    end
    def factorial(num) do
        if num <= 1 do
            1
        else
            result = num * factorial(num - 1)
            result
        end

    end

    def loop do
        IO.puts "Sum : #{sum([1,2,3])}"
        loop(6 ,1)
    end

    def sum([]), do: 0

    def sum([h|t]), do: h+sum(t)

    def loop(0,_), do: nil

    def loop(max,min) do
        if max<min do
            loop(0,min)
        else
            IO.puts "Num : #{max}"
            loop(max-1,min)
        end
    end

    def numerables do
        IO.puts "Even List : #{Enum.all?([1,2,3], fn(n) -> rem(n,2) == 0 end)}"

        IO.puts "Even List : #{Enum.any?([1,2,3], fn(n) -> rem(n,2) == 0 end)}"

        Enum.each([1,2,3], fn(n) -> IO.puts "Even : #{rem(n,2) == 0}" end)

        dbl_list = Enum.map([1,2,3], fn(n) -> n*2 end)
        IO.inspect dbl_list

        sum_vals = Enum.reduce([1,2,3], fn(n,sum) -> n + sum end)

        IO.puts "Sum : #{sum_vals}"

        IO.inspect Enum.uniq([1,2,2])
    end

    def list_comprehension do
        dbl_list = for n <- [1,2,3], do: n*2
        IO.inspect dbl_list

        even_list = for n <- [1,2,3,4,5,6,7,8,9], rem(n,2) == 0, do: n
        IO.inspect even_list
    end

    def exception_handling do
        err = try do
            5 / 0
        rescue
            ArithmeticError -> "Can't divide by zero"
        end
    end

    def concurrency do
        spawn(fn() -> loop(50,1) end)
        spawn(fn() -> loop(100,50) end)

        send(self(), {:french, "Bob"})

        receive do
            {:german, name} -> IO.puts "Guten tag #{name}"
            {:french, name} -> IO.puts "Bonjour #{name}"
            {:english, name} -> IO.puts "Hello #{name}"
            
        after
            500 -> IO.puts "Time up"
        end
    end
end

