if Role.all.blank?
  Role.create name: 'admin'
  Role.create name: 'teacher'
  Role.create name: 'student'
end