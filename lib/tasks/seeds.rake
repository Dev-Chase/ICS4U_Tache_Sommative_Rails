require "faker"
namespace :db do 
	task seed_custom: :environment do 
		puts "Seeding database"

		I18n.locale = :en
		Faker::Config.locale = :en

    # Deletion Order:
    # TeacherCert StudentCourse CourseSessions PrerequCourses Courses Teachers Room Subjects Students Buildings

		# Wiping all tables
		TeacherCertification.destroy_all
		StudentCourse.destroy_all
		CourseSession.destroy_all
		CoursePrerequisite.destroy_all
		Course.destroy_all
		Teacher.destroy_all
		Room.destroy_all
		Subject.destroy_all
		Student.destroy_all
		Building.destroy_all

    # Base Models
     # Building
		buildings = Array.new(35) {"#{[Faker::Name.last_name, Faker::Educator.subject].sample} Building"}
		buildings = buildings.uniq
		buildings.each do |building|
		  Building.create(
		    name: building,
		    address: Faker::Address.full_address
		  )
		end
	  building_ids = Building.pluck(:id)

     # Students
		students = Array.new(30) {[Faker::Name.first_name, Faker::Name.last_name]}
		students = students.uniq
		students.each do |student|
		  Student.create(
		    first_name: student[0],
		    last_name: student[1],
        age: rand(14..19),
        grade_level: rand(9..12),
        grade_average: rand(45..98),
        emergency_contact: "#{Faker::PhoneNumber.cell_phone}, #{Faker::Name.first_name}.#{Faker::Name.last_name}@gmail.com",
		  )
		end
	  student_ids = Student.pluck(:id)

     # Subjects
    alphabet = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
		subjects = Array.new(10) {Faker::Educator.subject}
		subjects = subjects.uniq
		subjects.each do |subject|
		  code = Array.new(3) {alphabet.sample}
		  code[0] = subject[0].capitalize
		  code[1] = subject[1].capitalize
		  code[2] = subject[2].capitalize
		  if subject.split.size == 2
		    code[2] = subject.split[1][0].capitalize
		  end
		  code = code.join("")

		  (subject.split.size).times
		  Subject.create(
		    name: subject,
		    code: code,
		    description: Faker::ChuckNorris.fact,
		  )
		end
	  subject_ids = Subject.pluck(:id)

	  # Secondary Models
     # Rooms
		 20.times do
		   code_arr = Array.new(6) {alphabet.sample}
		   Room.create(
         code: code_arr.join(""),
         floor_level: rand(-1..4),
         building_id: building_ids.sample,
         directions: Faker::ChuckNorris.fact
       )
		 end
		 room_ids = Room.pluck(:id)

     # Teachers
		 25.times do
		   main_subject = Subject.find(subject_ids.sample)
		   Teacher.create(
		     first_name: Faker::Name.first_name,
 		     last_name: Faker::Name.last_name,
 		     age: rand(18..70),
 		     main_subject_id: subject_ids.sample,
       )
		 end
		 teacher_ids = Teacher.pluck(:id)

     # Courses
		 40.times do
		   code_arr = Array.new(6) {alphabet.sample}
		   subject = Subject.find(subject_ids.sample)
		   year = rand(23..25)
		   Course.create!(
         code: "#{subject.code}#{rand(1..4)}#{["C", "U"].sample}",
         school_year: "20#{year}-#{year+1}",
         description: Faker::ChuckNorris.fact,
         required_equipment: Faker::ChuckNorris.fact,
         teacher_id: teacher_ids.sample,
         subject_id: subject.id,
         name: Faker::Educator.course_name
       )
		 end
		 course_ids = Course.pluck(:id)

    # Referential Models
     # Prerequisite Courses
      (Course.count * 3).times do 
		    course = Course.order("RANDOM()").first
        prerequisite = Course.where.not(id: course.id).where(subject_id: course.subject_id).order("RANDOM()").first
        if prerequisite
          CoursePrerequisite.create(course_id: course.id, prerequisite_course_id: prerequisite.id)
        end
      end

     # Course Sessions
      50.times do
        course = Course.find(course_ids.sample)
        time_options = (8..15).flat_map { |hour| [0, 30].map {|min| Time.zone.now.change(hour: hour, min: min) } }
        CourseSession.create(
          course_id: course.id,
          room_id: room_ids.sample,
          start_time: time_options.sample,
        duration: rand(1..6) * (3600 / 2),
          day_of_week: rand(0..6)
        )
      end

     # Student Courses
      (Student.count * 3).times do
        StudentCourse.create(course_id: course_ids.sample, student_id: student_ids.sample, average_grade: rand(50..98), credit_obtained: [false, true].sample)
      end

     # Teacher Certifications
      teacher_ids.each do |teacher_id|
        TeacherCertification.create(certifier: Faker::Educator.university, date_obtained: Faker::Date.backward, subject_id: subject_ids.sample, teacher_id: teacher_id)
        TeacherCertification.create(certifier: Faker::Educator.university, date_obtained: Faker::Date.backward, subject_id: subject_ids.sample, teacher_id: teacher_id)
      end
      5.times do
        TeacherCertification.create(certifier: Faker::Educator.university, date_obtained: Faker::Date.backward, subject_id: subject_ids.sample, teacher_id: teacher_ids.sample)
      end
	end
end
