# CREATE A DATABASE AND CREATE THE FOLLOWING TABLES

# 1.Branch 2.Employee 3.Custoner 4.IssueStatus 5.ReturnStatus 6.Books


CREATE DATABASE library;
USE library;

# BRANCH TABLE

CREATE TABLE Branch ( Branch_no INT PRIMARY KEY  ,
 Manager_id INT,
 Branch_address VARCHAR(30),
 Contact_no INT);
INSERT INTO Branch VALUES( 1, 101 , "Kolkata" , 2365698);
INSERT INTO Branch VALUES( 2, 102 , "Hyderabad" , 2365548);
INSERT INTO Branch VALUES( 3, 103 , "Kochi" , 2365008);
INSERT INTO Branch VALUES( 4, 104 , "Bangalore" , 2368848);
INSERT INTO Branch VALUES( 5, 105 , "Mumbai" , 2369098);
INSERT INTO Branch VALUES( 6, 106 , "Pune" , 2327698);
INSERT INTO Branch VALUES( 7, 107 , "Ahmedabad" , 2368698);
INSERT INTO Branch VALUES( 8, 108 , "Goa" , 2317698);
INSERT INTO Branch VALUES( 9, 109 , "Chennai" , 2360098);
INSERT INTO Branch VALUES( 10, 110 , "Delhi" , 2361998);
Select * from Branch;

#EMPLOYEE TABLE

CREATE TABLE Employee ( Emp_id INT PRIMARY KEY ,
 Emp_name VARCHAR(30),
 Position VARCHAR(30),
 Salary INT);
INSERT INTO Employee VALUES ( 101,"ADARSH","MANAGER",45000);
INSERT INTO Employee VALUES ( 102,"MIDHUN","LIBRARIAN",25000);
INSERT INTO Employee VALUES ( 103,"NITHIN","SWEEPER",25000);
INSERT INTO Employee VALUES ( 104,"AMALA","MANAGER",45000);
INSERT INTO Employee VALUES ( 105,"SHAANA","CLERK",30000);
INSERT INTO Employee VALUES ( 106,"ATHUL","OFFICER",45000);
INSERT INTO Employee VALUES ( 107,"ANAGHA","LIBRARIAN",25000);
INSERT INTO Employee VALUES ( 108,"ASHIQ","ACCOUNTANT",45000);
INSERT INTO Employee VALUES ( 109,"RAMEEZ","SWEEPER",25000);
INSERT INTO Employee VALUES ( 110,"AMAL","WATCHMAN",45000);
SELECT * FROM Employee;

#CUSTOMER TABLE

CREATE TABLE Customer ( Customer_id INT PRIMARY KEY , 
Customer_name VARCHAR(30) ,
 Customer_address VARCHAR(30) ,
 Reg_date DATE);
INSERT INTO Customer VALUES(1,"Akhil K", "KOLLAM",'2022-04-07');
INSERT INTO Customer VALUES(2,"ASWIN P", "KANNUR",'2021-06-10');
INSERT INTO Customer VALUES(3,"SHAANA K", "ERNAKULAM",'2022-12-12');
INSERT INTO Customer VALUES(4,"ATHUL M", "KOZHIKODE",'2020-04-07');
INSERT INTO Customer VALUES(5,"AMALA K", "KANNUR",'2022-09-11');
SELECT * FROM Customer;

#ISSUESTATUS TABLE

CREATE TABLE IssueStatus (Issue_id INT PRIMARY KEY,
 Issued_Cust INT ,
 Issued_book_name VARCHAR (30) ,
 Issue_date DATE ,
 Isbn_book VARCHAR(30),
 FOREIGN KEY(Issued_cust)REFERENCES Customer(Customer_Id),
FOREIGN KEY(Isbn_book)REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus VALUES ( 201, 1 , "SAPIENS" , '2002-06-02',"ISBN001");
INSERT INTO IssueStatus VALUES ( 202, 2 , "KHASAKHINTE ITHIHASAM" , '2022-06-11',"ISBN005");
INSERT INTO IssueStatus VALUES ( 203, 3 , "THE SECRET" , '2021-06-02',"ISBN006");
INSERT INTO IssueStatus VALUES ( 204, 4 , "ZAHIR" , '2022-10-02',"ISBN002");
INSERT INTO IssueStatus VALUES ( 205, 5 , "ALCHEMIST" , '2022-06-02',"ISBN004");

#RETURNSTATUS TABLE

CREATE TABLE Returnstatus (Return_Id INT PRIMARY KEY ,
Return_cust VARCHAR(30), 
Return_book_name VARCHAR(30) ,
Return_date DATE ,
Isbn_book2 VARCHAR(12),
FOREIGN KEY (isbn_book2) REFERENCES Books(ISBN));
INSERT INTO Returnstatus VALUES ( 111,1,"ELEVEN MINUTES",'2022-07-05',"ISBN007");
INSERT INTO Returnstatus VALUES ( 112,2,"KHASAKHINTE ITHIHASAM",'2022-10-05',"ISBN005");
INSERT INTO Returnstatus VALUES ( 113,3,"THE SECRET",'2021-07-20',"ISBN006");
INSERT INTO Returnstatus VALUES ( 114,5,"ZAHIR",'2022-11-05',"ISBN002");
INSERT INTO Returnstatus VALUES ( 115,4,"ALCHEMIST",'2022-11-05',"ISBN004");

#BOOKS TABLE

CREATE TABLE Books(ISBN VARCHAR(15) PRIMARY KEY,
 Book_title VARCHAR(30),
 Category VARCHAR(30),
 Rental_Price DECIMAL(10,2),
 STATUS VARCHAR(10),
 Author VARCHAR (30),
 Publisher VARCHAR (30));
 
INSERT INTO Books VALUES ("ISBN001","SAPIENS","NON-FICTION",10.00,"YES","YUVAL NOAH HARARI","DVIR PUBLISHING HOUSE");
INSERT INTO Books VALUES ("ISBN002","ZAHIR","FICTION",50.00,"NO","PAULO COELHO","HARPER COLLINS");
INSERT INTO Books VALUES ("ISBN003","LAL SALAM","NON-FICTION",25.00,"NO","SMRITHI IRANI","WESTLAND");
INSERT INTO Books VALUES ("ISBN004","ALCHEMIST","FICTION",40.00,"YES","PAULO COELHO","HARPER TORCH");
INSERT INTO Books VALUES ("ISBN005","KHASAKHINTE ITHIHASAM","FICTION",10.00,"YES"," O V VIJAYAN"," DC BOOKS");
INSERT INTO Books VALUES ("ISBN006","THE SECRET","FICTION",10.00,"YES","RHONDA BYRNE","SIMON AND SCHUSTER");
INSERT INTO Books VALUES ("ISBN007","ELEVEN MINUTES","FICTION",10.00,"YES","PAULO COELHO","HARPER ONE");
select * from Books;


#Retrieve the book title, category, and rental price of all available books

SELECT Book_title , category , rental_price from Books where status="YES";

# List the employee names and their respective salaries in descending order of salary. 

SELECT Emp_name , Salary from Employee order by Salary desc;

# Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Books.Book_title,IssueStatus.Issued_cust FROM IssueStatus INNER JOIN Books ON  IssueStatus.Issued_book_name = Books.Book_title;

# Display the total count of books in each category.

SELECT Category,COUNT(Category)FROM Books GROUP BY Category;

# Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT Emp_name , Position FROM Employee WHERE SALARY>50000;

#List the customer names who registered before 2022-01-01 and have not issued any books yet. 

SELECT Customer.Customer_name,customer.reg_date FROM customer LEFT JOIN issuestatus ON Customer.customer_id = Issuestatus.issued_cust WHERE issue_id IS NULL;

#  Display the branch numbers and the total count of employees in each Branch.

SELECT Branch_no,COUNT(DISTINCT Manager_id) FROM branch GROUP BY Branch_no;

# Display the names of customers who have issued books in the month of June 2023.

SELECT Customer.Customer_name,Issuestatus.Issue_date FROM customer INNER JOIN  Issuestatus ON Customer.customer_id = Issuestatus.issued_cust WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30' ;

# Retrieve book_title from book table containing history.

SELECT book_title FROM Books WHERE  Category ='history' ;

# Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT branch_no,count(Manager_id) FROM branch GROUP BY branch_no HAVING count(manager_id) >5;


