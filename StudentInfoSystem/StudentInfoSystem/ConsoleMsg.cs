using StudentInfoSystem.Models;
using System;
using System.Collections.Generic;

namespace StudentInfoSystem
{
    public static class ConsoleMsg
    {
        public static void WrongInputMsg()
        {
            Console.WriteLine("Wrong input!!! press anny key to continue");
            Console.ReadKey();
        }
        public static void ContinueMsg()
        {
            Console.WriteLine("-------------------------------------------");
            Console.WriteLine("Press anny key to continue");
            Console.ReadKey();
        }
        public static void BackToPreviouslyWindowMsg(int commandNumber)
        {
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine($"{commandNumber} - Go back to previously window");
            Console.WriteLine("---------------------------------------------------");
        }
        public static void LectureSelectionWindow(List<Lecture> dbListLecture, List<Lecture> listLectures)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------------------------------");
            Console.WriteLine("Create new lecture or select lectures to the department");
            Console.WriteLine("-----------------------------------------------------------------");
            foreach (var lecture in dbListLecture)
            {
                Console.WriteLine($"{dbListLecture.IndexOf(lecture) + 1} - {lecture}");
            }
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine($"{dbListLecture.Count + 1} - Add new lecture to data base and department");
            Console.WriteLine($"{dbListLecture.Count + 2} - Continue to next step 'Add students To department'");
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine("");
            Console.WriteLine("Existing lecture assigned to department");
            Console.WriteLine("==================================================================");
            foreach (var lecture in listLectures)
            {
                Console.WriteLine($"{lecture}");
            }
            Console.WriteLine("==================================================================");
        }
        public static void DepartmentForLectureSelectionWindow(List<Department> dbListDepartment, List<Department> listDepartments)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------------------------------");
            Console.WriteLine("Assigne existing departments to the lecture");
            Console.WriteLine("-----------------------------------------------------------------");
            foreach (var department in dbListDepartment)
            {
                Console.WriteLine($"{dbListDepartment.IndexOf(department) + 1} - {department}");
            }
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine($"{dbListDepartment.Count + 1} - Back to main menu");
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine("");
            Console.WriteLine("To lecture assigned departments");
            Console.WriteLine("==================================================================");
            foreach (var department in listDepartments)
            {
                Console.WriteLine($"{department}");
            }
            Console.WriteLine("==================================================================");
        }
        public static void StudentSelectionWindow(List<Student> departmentSudentsList)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------------------------------");
            Console.WriteLine("Create new student or select student to add lectures");
            Console.WriteLine("-----------------------------------------------------------------");
            foreach (var DepartmentStudent in departmentSudentsList)
            {
                Console.WriteLine($"{departmentSudentsList.IndexOf(DepartmentStudent) + 1} - {DepartmentStudent}");
            }
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine($"{departmentSudentsList.Count + 1} - Add new student to department");
            Console.WriteLine($"{departmentSudentsList.Count + 2} - Back to main menu");
            Console.WriteLine("---------------------------------------------------");
        }
        public static void SutudentLectureSelectionWindow(List<Lecture> departmentListLecture, List<Lecture> studentListLecture)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------------------------------");
            Console.WriteLine("Add department lecture to student");
            Console.WriteLine("-----------------------------------------------------------------");
            foreach (var lecture in departmentListLecture)
            {
                Console.WriteLine($"{departmentListLecture.IndexOf(lecture) + 1} - {lecture}");
            }
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine($"{departmentListLecture.Count + 1} - Back to main menu");
            Console.WriteLine("---------------------------------------------------");
            Console.WriteLine("");
            Console.WriteLine("Lectures assigned to student");
            Console.WriteLine("===================================================");
            foreach (var lecture in studentListLecture)
            {
                Console.WriteLine($"{lecture}");
            }
            Console.WriteLine("===================================================");
        }
        public static void DepartmentSelectionWindow(List<Department> listDepatments)
        {
            Console.Clear();
            Console.WriteLine("-------------------------------------------------------");
            Console.WriteLine("              Select department  ");
            Console.WriteLine("-------------------------------------------------------");
            foreach (var department in listDepatments)
            {
                Console.WriteLine($"{listDepatments.IndexOf(department) + 1} - {department}");
            }
            Console.WriteLine("-------------------------------------------------------");
            Console.WriteLine($"{listDepatments.Count + 1} - Back to main menu");
            Console.WriteLine("-------------------------------------------------------");
        }
        public static void StudentTransferSelectionWindow(List<Student> listStudents)
        {
            Console.Clear();
            Console.WriteLine("-------------------------------------------------------");
            Console.WriteLine("    Select student from department for trasfer  ");
            Console.WriteLine("-------------------------------------------------------");
            foreach (var student in listStudents)
            {
                Console.WriteLine($"{listStudents.IndexOf(student) + 1} - {student}");
            }
            Console.WriteLine("-------------------------------------------------------");
            Console.WriteLine($"{listStudents.Count + 1} - Back to main menu");
            Console.WriteLine("-------------------------------------------------------");
        }
        public static void DiplayMainWindow()
        {
            Console.Clear();
            Console.WriteLine("           Welcome, Student information system");
            Console.WriteLine("                choose what you want to do");
            Console.WriteLine("-----------------------------------------------------------------------");
            Console.WriteLine("  1 - Create department with lectures and students");
            Console.WriteLine("  2 - Create and add students and lectures to existing deparment");
            Console.WriteLine("  3 - Create lecture and add to existing department");
            Console.WriteLine("  4 - Create student in existing departmentand and assign lectures");
            Console.WriteLine("  5 - Transfer the student to another department and assign lectures");
            Console.WriteLine("  6 - Display all students in the department");
            Console.WriteLine("  7 - Display all lectures of the departments");
            Console.WriteLine("  8 - Display all lectures by student");
            Console.WriteLine("----------------------------------------------------------------------");
            Console.WriteLine("  9 - Exit student information system");
            Console.WriteLine("----------------------------------------------------------------------");
        }
    }
}
