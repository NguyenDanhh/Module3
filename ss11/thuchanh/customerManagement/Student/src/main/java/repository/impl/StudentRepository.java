package repository.impl;

import model.Student;
import repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"Danh" ,9.0));
        studentList.add(new Student(1,"Danh" ,9.0));
        studentList.add(new Student(1,"Danh" ,9.0));
        studentList.add(new Student(1,"Danh" ,9.0));
    }
    @Override
    public List<Student> listSutdent() {
        return studentList;
    }

    @Override
    public void create(Student student) {

    }
}
