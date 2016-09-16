class CourseGenerator

  def self.course_code
    Faker::Number.number(10)
  end

  def self.name
    Faker::Educator.course
  end

  def self.course_type
    COURSE_TYPE.sample
  end

  def self.credit
    Faker::Number.between(1, 4)
  end

  def self.limit_num
    LIMIT_NUM.sample
  end

  def self.course_week
    "week #{COURSE_WEEK.sample}"
  end

  def self.course_time
    "#{WEEK_DAY.sample} #{COURSE_TIME.sample}"
  end

  def self.class_room
    "building 1-#{Faker::Number.between(1, 4)}0#{Faker::Number.between(0, 9)}"
  end

  def self.teaching_type
    TEACHING_TYPE.sample
  end

  def self.exam_type
    EXAM_TYPE.sample
  end

  COURSE_TYPE= ['Major Core Course', 'Universal Course', 'Seminar', 'Elective Course']
  LIMIT_NUM=[200, 300, 400]
  COURSE_WEEK=["1-20", "3-15", "2-12"]
  WEEK_DAY=%w(Monday Tuesday Wednesday Thursday Friday)
  COURSE_TIME=%w(1-2 3-4 5-6 7-8 9-10)
  TEACHING_TYPE=%w(lecture discuss practice)
  EXAM_TYPE=['open-book examination', 'close-book examination', 'homework only']

end

#-------------------------------------------------------------------------------------

User.create(
    name: "zhaoqing",
    email: "admin@test.com",
    password: "password",
    password_confirmation: "password",
    admin: true
)

20.times do |index|
  teacher=User.create!(
      name: Faker::Name.name,
      email: "teacher#{index}@test.com",
      department: Faker::Educator.secondary_school,
      password: "password",
      password_confirmation: "password",
      teacher: true
  )

  teacher.teaching_courses.create!(
      course_code: CourseGenerator.course_code,
      name: CourseGenerator.name,
      course_type: CourseGenerator.course_type,
      credit: CourseGenerator.credit,
      limit_num: CourseGenerator.limit_num,
      course_week: CourseGenerator.course_week,
      course_time: CourseGenerator.course_time,
      class_room: CourseGenerator.class_room,
      teaching_type: CourseGenerator.teaching_type,
      exam_type: CourseGenerator.exam_type,
  )

end

(1..100).each do |count|
  student=User.create!(
      name: Faker::Name.name,
      email: "student#{count}@test.com",
      num: Faker::Number.number(10),
      major: Faker::Lorem.word,
      department: Faker::Educator.secondary_school,
      password: "password",
      password_confirmation: "password",
  )

  course_array=(1..20).to_a.sort { rand() - 0.5 }[1..rand(4..8)]
  course_array.each do |index|
    student.courses<<Course.find(index)
  end

end
















