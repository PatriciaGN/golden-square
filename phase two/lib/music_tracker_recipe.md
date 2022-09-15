
Single-Class Programs Design Recipe

1. Describe the Problem
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
name: MusicTracker
Initializer: @tracks_list = []
Methods: 
* add_track(string) - It would add the string to the tracks_list array. It doesn't return anything
* show_list() - It would return the strings stored in tracks_list. No side effects.

Side effects:

<!-- The interface of a class includes:

The name of the class.
The design of its initializer and the parameters it takes.
The design of its public methods, including:
Their names and purposes
What parameters they take and the data types.
What they return and that data type
Any other side effects they might have.
Steps 3 and 4 then operate as a cycle. -->

3. Create Examples as Tests

Method add_track
Test 1
Raises an error if given an empty string as argument.
add_track("") => fail

Method show_list
test 1
Raises an error if list is empty

Test 2
Returns one element if tracks_list only contains one element

Test 3
Returns a string with the two elements formatted with a new line"

<!-- These are examples of the class being used with different initializer arguments, method calls, and how it should behave.

For complex challenges you might want to come up with a list of examples first and then test-drive them one by one. For simpler ones you might just dive straight into writing a test for the first example you want to address. -->

4. Implement the Behaviour
