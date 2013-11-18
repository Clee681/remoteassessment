# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chris = Student.create(name: 'Christopher Lee', phone_number: 2132158528)
scott = Student.create(name: 'Scott Luptowski', phone_number: 4042453509)
pat = Student.create(name: 'Patrick Janson', phone_number: 3035794540)

spencer = Teacher.create(name: 'Spencer', email: 'spencer@flatirons.com', password: 'testtest', phone_number: 3036257938)

group_1 = Group.create(name: 'Algebra Section 1')

group_1.teacher = spencer
group_1.save

chris.group = group_1
chris.save

scott.group = group_1
scott.save

pat.group = group_1
pat.save

chapter_1 = Assignment.create(name: 'chapter 1', description: 'Read chapter 1 of the Algebra I textbook.', datetime_to_send: '2013-11-18 12:00:00')

chapter_1.teacher = spencer

chris.student_assignments.create(assignment_id: chapter_1.id)
scott.student_assignments.create(assignment_id: chapter_1.id)
pat.student_assignments.create(assignment_id: chapter_1.id)

question_1 = Question.create(content: '2x + 4 = 12; What is x?')
question_1.assignment = chapter_1
question_1.save

choice_1 = Choice.create(content: '12', option: 'a', correctness: false)
choice_2 = Choice.create(content: '16', option: 'b', correctness: false)
choice_3 = Choice.create(content: '4', option: 'c', correctness: true)
choice_4 = Choice.create(content: '8', option: 'd', correctness: false)

choice_1.question = question_1
choice_1.save
choice_2.question = question_1
choice_2.save
choice_3.question = question_1
choice_3.save
choice_4.question = question_1
choice_4.save