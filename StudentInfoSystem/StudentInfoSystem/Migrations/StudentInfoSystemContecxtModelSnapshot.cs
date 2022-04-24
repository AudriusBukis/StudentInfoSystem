﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using StudentInfoSystem.Contexts;

namespace StudentInfoSystem.Migrations
{
    [DbContext(typeof(StudentInfoSystemContecxt))]
    partial class StudentInfoSystemContecxtModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.10")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("DepartmentLecture", b =>
                {
                    b.Property<Guid>("ListDepartmentsId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("ListLecturesId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("ListDepartmentsId", "ListLecturesId");

                    b.HasIndex("ListLecturesId");

                    b.ToTable("DepartmentLecture");
                });

            modelBuilder.Entity("LectureStudent", b =>
                {
                    b.Property<Guid>("ListLectureId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("StudentId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("ListLectureId", "StudentId");

                    b.HasIndex("StudentId");

                    b.ToTable("LectureStudent");
                });

            modelBuilder.Entity("StudentInfoSystem.Models.Department", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("DepartmentName")
                        .HasMaxLength(60)
                        .HasColumnType("nvarchar(60)");

                    b.HasKey("Id");

                    b.ToTable("Departments");
                });

            modelBuilder.Entity("StudentInfoSystem.Models.Lecture", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("LectureName")
                        .HasMaxLength(60)
                        .HasColumnType("nvarchar(60)");

                    b.HasKey("Id");

                    b.ToTable("Lectures");
                });

            modelBuilder.Entity("StudentInfoSystem.Models.Student", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid?>("DepartmentId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("LastName")
                        .HasMaxLength(60)
                        .HasColumnType("nvarchar(60)");

                    b.Property<string>("Name")
                        .HasMaxLength(60)
                        .HasColumnType("nvarchar(60)");

                    b.HasKey("Id");

                    b.HasIndex("DepartmentId");

                    b.ToTable("Student");
                });

            modelBuilder.Entity("DepartmentLecture", b =>
                {
                    b.HasOne("StudentInfoSystem.Models.Department", null)
                        .WithMany()
                        .HasForeignKey("ListDepartmentsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("StudentInfoSystem.Models.Lecture", null)
                        .WithMany()
                        .HasForeignKey("ListLecturesId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("LectureStudent", b =>
                {
                    b.HasOne("StudentInfoSystem.Models.Lecture", null)
                        .WithMany()
                        .HasForeignKey("ListLectureId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("StudentInfoSystem.Models.Student", null)
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("StudentInfoSystem.Models.Student", b =>
                {
                    b.HasOne("StudentInfoSystem.Models.Department", "Department")
                        .WithMany("ListStudents")
                        .HasForeignKey("DepartmentId");

                    b.Navigation("Department");
                });

            modelBuilder.Entity("StudentInfoSystem.Models.Department", b =>
                {
                    b.Navigation("ListStudents");
                });
#pragma warning restore 612, 618
        }
    }
}
