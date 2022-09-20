1. Describe the Problem
As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


    ┌─────────────────────────────────┐       ┌──────────────────────────────┐
    │    Diary class                  │       │   DiaryEntry class           │
    │                                 │       │                              │
    │    Stores diary entries         │       │  Creates diary entries with  │
    │    Allows user to see all entries       │  title and contents          │
    │    Selects an entry you can read│       │                              │
    │    in the given time and speed  ◄───────┤  Allows user to see one entry│
    │    Allows to read all todos     │       │                              │
    │    Finds phone numbers in entries       │  Count the words an entry has│
    │    and returns them as a list   │       │                              │
    │                                 │       │                              │
    │                                 │       │                              │
    │                                 │       │                              │
    └─────────────────────────────────┘       └──────────────────────────────┘
     Do two classes or one?
    ┌─────────────────────────────────┐       ┌──────────────────────────────┐
    │  Todo class                     │       │  TodoList class              │
    │                                 │       │                              │
    │  Creates todos                  │       │  Stores todos                │
    │                                 │       │                              │
    │                                 │       │                              │
    │                                 ├───────►                              │
    │                                 │       │                              │
    │                                 │       │                              │
    │                                 │       │                              │
    │                                 │       │                              │
    │                                 │       │                              │
    │                                 │       │                              │
    └─────────────────────────────────┘       └──────────────────────────────┘



2. Design the Class System
DiaryEntry class
  initialize(title, contents)
    Constructs the variable @task and takes title and contents as arguments, both are strings

  read_entry
    Returns the entry

  count_words
    Returns the number of words in the contents of a given entry

Todo class
  initialize(todo)
    Constructs the variable @todo that contains a string

Diary class
  initialize
    Constructs @all_entries which starts as an empty array.
    Constructs @all_tasks which starts as an empty array

  add_entry(entry)
    Adds an entry (instance of the DiaryEntry class) to the @all_entries array.

  add_task(task)
    Adds a task (instance of the TodoList class) to the @all_tasks array

  display_all_entries
    Returns a list of entries stored in @all_entries

  display_all_tasks

  best_entry_for_given_time(wpm, min)
    Returns a task the user can read in the given time (min) and given speed (wpm). Both min and wpm are integers.

  phone_list
    Returns a list of all the phone numbers found in the entries stored in the @all_entries list.



Design the interfaces of each of your classes and how they will work together to achieve the job of the program. You can use diagrams to visualise the relationships between classes.

Consider pulling out the key verbs and nouns in the problem description to help you figure out which classes and methods to have.

Steps 3, 4, and 5 then operate as a cycle.

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

Encode one of these as a test and move to step 4.

entry1 = DiaryEntry.new("Tuesday", "I went for a walk with my friend, their number was 07575569329")
entry2 = DiaryEntry.new("Wednesday", "I met a lot of new people at the board games night, their numbers were: 07575789329, 03434567893 and 02124998844")
task1 = Todo.new("Bath the dog")
task2 = Todo.new("Bake cake")
my_diary = Diary.new
my_diary.add_entry(entry1)
my_diary.add_entry(entry2)
my_diary.add_task(task1)
my_diary.add_task(task2)
entry1.read_entry #=> returns @title and @contents
my_diary.display_all_entries #=> [entry1, entry2]
my_diary.tasks #=> [task1, task2]
my_diary.best_entry_for_given_time(3, 4) #=> entry1
my_diary.phone_list #=> [07575569329, 07575789329, 03434567893, 02124998844]

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

Encode one of these as a test and move to step 5.

DiaryEntry
it "creates an instance of the DiaryEntry class with a title and contents and displays it to the user" do
  entry1 = DiaryEntry.new("Monday", "two words")
  entry1.read_entry #=> "Monday: two words"


5. Implement the Behaviour
For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.