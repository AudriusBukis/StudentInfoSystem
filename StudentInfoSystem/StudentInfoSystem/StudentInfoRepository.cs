using System;
using System.Linq;
using StudentInfoSystem.Contexts;
using StudentInfoSystem.Models;

namespace StudentInfoSystem
{
    public class StudentInfoRepository
    {
        public readonly static MsSqlService _msSqlService = new();
        public bool MainWindow()
        {
            ConsoleMsg.DiplayMainWindow();
            var userInput = Console.ReadLine();
            switch (userInput)
            {
                case "1":
                    CreateDepartment();
                    return false;
                case "2":
                    AddLectureAndStudentToDepartment();
                    return false;
                case "3":
                    AddDepartmentToLecture();
                    return false;
                case "4":
                    CreateSudentAndAddToDepartment();
                    return false;
                case "5":
                    TransferStudentToOtherDepartment();
                    return false;
                case "6":
                    DisplayDepartmentStudents();
                    return false;
                case "7":
                    DisplayDepartmentLectures();
                    return false;
                case "8":
                    DisplayStudentLectures();
                    return false;
                case "9":
                    return true;
                default:
                    ConsoleMsg.WrongInputMsg();
                    return false;
            }
        }
        public void CreateDepartment()
        {
            var exit = false;
            while (!exit)
            {
                Console.Clear();
                Console.WriteLine("-----------------------------------");
                Console.WriteLine("    Enter new department name");
                Console.WriteLine("-----------------------------------");
                var departmentName = Console.ReadLine();
                if (_msSqlService.CheackIfDepartmentExist(departmentName))
                {
                    Console.WriteLine($"The department whith this name {departmentName} exist");
                    ConsoleMsg.ContinueMsg();
                    continue;
                }
                var department = _msSqlService.GetOrCreatDepartment(departmentName);
                AddLecturesToDepartment(department);
                AddStudentToDepartment(department);

                Console.WriteLine("Department whith lectures and students are created");
                ConsoleMsg.ContinueMsg();
                exit = true;
            }
        }
        public void AddLectureAndStudentToDepartment()
        {
            var exit = false;
            while (!exit)
            {
                var listDepatments = _msSqlService.GetDepartmentsList();
                ConsoleMsg.DepartmentSelectionWindow(listDepatments);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= listDepatments.Count))
                    {
                        var department = listDepatments.ElementAt(command - 1);
                        AddLecturesToDepartment(department);
                        AddStudentToDepartment(department);
                        continue;
                    }
                    else if (command == listDepatments.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void CreateSudentAndAddToDepartment()
        {
            var exit = false;
            while (!exit)
            {
                var listDepatments = _msSqlService.GetDepartmentsList();
                ConsoleMsg.DepartmentSelectionWindow(listDepatments);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= listDepatments.Count))
                    {
                        var department = listDepatments.ElementAt(command - 1);
                        CreateStudent(department);
                        exit = true;
                    }
                    else if (command == listDepatments.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void TransferStudentToOtherDepartment()
        {
            var exit = false;
            var tresferStudent = new Student();
            while (!exit)
            {
                var listDepatments = _msSqlService.GetDepartmentsList();
                ConsoleMsg.DepartmentSelectionWindow(listDepatments);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= listDepatments.Count))
                    {
                        while (!exit)
                        {
                            var department = listDepatments.ElementAt(command - 1);
                            var listStudents = _msSqlService.GetAllStudentsOfDepartment(department.DepartmentName);
                            ConsoleMsg.StudentTransferSelectionWindow(listStudents);
                            if (Int32.TryParse(Console.ReadLine(), out int secondCommand))
                            {
                                if ((secondCommand > 0) && (secondCommand <= listStudents.Count))
                                {
                                    var student = listStudents.ElementAt(secondCommand - 1);
                                    tresferStudent.Name = student.Name;
                                    tresferStudent.LastName = student.LastName;
                                    tresferStudent.Id = student.Id;
                                    _msSqlService.RemuveStudent(student);
                                    while (!exit)
                                    {
                                        var listDepatment = _msSqlService.GetDepartmentsList();
                                        ConsoleMsg.DepartmentSelectionWindow(listDepatment);
                                        if (Int32.TryParse(Console.ReadLine(), out int ThirdCommand))
                                        {
                                            if ((ThirdCommand > 0) && (ThirdCommand <= listDepatment.Count))
                                            {
                                                var newdepartment = listDepatment.ElementAt(ThirdCommand - 1);
                                                TransferStudent(newdepartment, tresferStudent);
                                                exit = true;
                                            }
                                            else if (ThirdCommand == listDepatment.Count + 1) exit = true;
                                            else ConsoleMsg.WrongInputMsg();
                                        }
                                        else ConsoleMsg.WrongInputMsg();
                                    }
                                }
                                else if (secondCommand == listStudents.Count + 1) exit = true;
                                else ConsoleMsg.WrongInputMsg();
                            }
                            else ConsoleMsg.WrongInputMsg();
                        }
                    }
                    else if (command == listDepatments.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void AddLecturesToDepartment(Department department)
        {
            var exit = false;
            while (!exit)
            {
                var listLectures = _msSqlService.GetAllLecturesByDepartment(department);
                var dbListLecture = _msSqlService.GetAllLectures();
                ConsoleMsg.LectureSelectionWindow(dbListLecture, listLectures);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= dbListLecture.Count))
                    {
                        var lecture = dbListLecture.ElementAt(command - 1);
                        _msSqlService.AssingLectureToDepartment(department, lecture);
                        continue;
                    }
                    else if (command == dbListLecture.Count + 1)
                    {
                        Console.WriteLine("Enter new lecture name");
                        
                        var lecture = _msSqlService.GetOrCreateLecture(Console.ReadLine());
                        _msSqlService.AssingLectureToDepartment(department, lecture);
                    }
                    else if (command == dbListLecture.Count + 2) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void AddDepartmentToLecture()
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------");
            Console.WriteLine("    Enter new lecture name");
            Console.WriteLine("-----------------------------------");
            var LectureName = Console.ReadLine();
            if (_msSqlService.CheackIfLectureExist(LectureName))
            {
                Console.WriteLine($"The Lecture whith this name {LectureName} exist");
                ConsoleMsg.ContinueMsg();
                AddDepartmentToLecture();
            }
            var exit = false;
            while (!exit)
            {
                var dbListDepartment = _msSqlService.GetDepartmentsList();
                var lecture =  _msSqlService.GetOrCreateLecture(LectureName);
                var listDepartments = _msSqlService.GetDepartmentListByLecture(lecture);
                ConsoleMsg.DepartmentForLectureSelectionWindow(dbListDepartment, listDepartments);// reikia pakeisti 
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= dbListDepartment.Count))
                    {
                        var department = dbListDepartment.ElementAt(command - 1);
                        _msSqlService.AssingDepartmentToLecture(lecture, department);
                        continue;
                    }
                    else if (command == dbListDepartment.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void AddStudentToDepartment(Department department)
        {
            var exit = false;
            while (!exit)
            {
                var departmentSudentsList = _msSqlService.GetAllStudentsOfDepartment(department.DepartmentName);
                ConsoleMsg.StudentSelectionWindow(departmentSudentsList);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= departmentSudentsList.Count))
                    {
                        var student = departmentSudentsList.ElementAt(command - 1);
                        AddLectureToStudent(department, student);
                        continue;
                    }
                    else if (command == departmentSudentsList.Count + 1)
                    {
                        CreateStudent(department);
                    }
                    else if (command == departmentSudentsList.Count + 2) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void CreateStudent(Department department)
        {
            var skip = false;
            Console.WriteLine("Enter new Student Name");
            var studentName = Console.ReadLine();
            Console.WriteLine("Enter new Student Last Name");
            var studentLastName = Console.ReadLine();
            if (_msSqlService.CheackIfStudentExist(studentName, studentLastName))
            {
                Console.WriteLine($"The student {studentName} {studentLastName} exist in the system");
                ConsoleMsg.ContinueMsg();
                CreateStudent(department);
                skip = true;
            }
            if (!skip)
            {
                var newStudent = _msSqlService.GetOrCreateSudent(studentName, studentLastName, department);
                AddLectureToStudent(department, newStudent);
            }
        }
        public void TransferStudent(Department department, Student student)
        {
            var newStudent = _msSqlService.GetOrCreateSudent(student, department);
            AddLectureToStudent(department, newStudent);
        }
        public void AddLectureToStudent(Department department, Student student)
        {
            var exit = false;
            while (!exit)
            {
                var departmentListLecture = _msSqlService.GetAllLecturesByDepartment(department);
                var studentListLecture = _msSqlService.GetAllLecturesBySudent(student);
                ConsoleMsg.SutudentLectureSelectionWindow(departmentListLecture, studentListLecture);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= departmentListLecture.Count))
                    {
                        var lecture = departmentListLecture.ElementAt(command - 1);
                        _msSqlService.AssingLectureToStudent(student, lecture);
                        continue;
                    }
                    else if (command == departmentListLecture.Count + 1) break;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void DisplayDepartmentStudents()
        {
            var exit = false;
            while (!exit)
            {
                Console.Clear();
                Console.WriteLine("Select department to view students");
                Console.WriteLine("----------------------------------");
                var listDepatments = _msSqlService.GetDepartmentsList();
                foreach (var department in listDepatments)
                {
                    Console.WriteLine($"{listDepatments.IndexOf(department)+ 1} - {department}");
                }
                ConsoleMsg.BackToPreviouslyWindowMsg(listDepatments.Count + 1);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= listDepatments.Count))
                    {
                        var department = listDepatments.ElementAt(command - 1);
                        Console.Clear();
                        Console.WriteLine($"List of the students in {department} department");
                        var listStudents = _msSqlService.GetStudentListByDepartment(department);
                        foreach (var student in listStudents)
                        {
                            Console.WriteLine($"{listStudents.IndexOf(student) + 1} - {student}");
                        }
                        ConsoleMsg.ContinueMsg();
                    }
                    else if (command == listDepatments.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void DisplayDepartmentLectures()
        {
            var exit = false;
            while (!exit)
            {
                Console.Clear();
                Console.WriteLine("Select department to view lectures");
                Console.WriteLine("----------------------------------");
                var listDepatments = _msSqlService.GetDepartmentsListWhithLecture();
                foreach (var department in listDepatments)
                {
                    Console.WriteLine($"{listDepatments.IndexOf(department) + 1} - {department}");
                }
                ConsoleMsg.BackToPreviouslyWindowMsg(listDepatments.Count + 1);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= listDepatments.Count))
                    {
                        var department = listDepatments.ElementAt(command - 1);
                        Console.Clear();
                        Console.WriteLine($"List of the students in {department} department");
                        foreach (var lecture in department.ListLectures)
                        {
                            Console.WriteLine($"{department.ListLectures.IndexOf(lecture) + 1} - {lecture}");
                        }
                        ConsoleMsg.ContinueMsg();
                    }
                    else if (command == listDepatments.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
        public void DisplayStudentLectures()
        {
            var exit = false;
            while (!exit)
            {
                Console.Clear();
                Console.WriteLine("Select Student to view lectures");
                Console.WriteLine("----------------------------------");
                var listStudents = _msSqlService.GetStudentListWhithLecture();
                foreach (var student in listStudents)
                {
                    Console.WriteLine($"{listStudents.IndexOf(student) + 1} - {student}");
                }
                ConsoleMsg.BackToPreviouslyWindowMsg(listStudents.Count + 1);
                if (Int32.TryParse(Console.ReadLine(), out int command))
                {
                    if ((command > 0) && (command <= listStudents.Count))
                    {
                        var student = listStudents.ElementAt(command - 1);
                        Console.Clear();
                        Console.WriteLine($"List of the lectures of student {student} of department {student.Department.DepartmentName}");
                        foreach (var lecture in student.ListLecture)
                        {
                            Console.WriteLine($"{student.ListLecture.IndexOf(lecture) + 1} - {lecture}");
                        }
                        ConsoleMsg.ContinueMsg();
                    }
                    else if (command == listStudents.Count + 1) exit = true;
                    else ConsoleMsg.WrongInputMsg();
                }
                else ConsoleMsg.WrongInputMsg();
            }
        }
       
    }
}
