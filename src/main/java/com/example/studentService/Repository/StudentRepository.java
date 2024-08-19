package com.example.studentService.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.studentService.Entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {
}