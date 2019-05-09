# 1.0. Learning Outcomes
LOC 1: 	Assess the distributed technology of Java Enterprise Edition in the context of distributed enterprise applications.<br>
LOC 2: 	Create, code, and test the components and provide clients access to these components.<br>
LOC 3: 	Organise, install and test a distributed java technology application.<br>
LOC 4: 	Critically evaluate a variety of distributed enterprise object-based systems by examining characteristics such as architectures, methods of communication, naming, synchronisation, and replication.<br>

# 2.0. Assignment Requirements
### Part I
Prepare a report about Microservices architecture role in the Distributed Web Application. Compare and Contrast the Spring Boot Microservices framework with any other Microservices framework of your choice by providing suitable diagrams and code snippets. (Approximately 3000 words)
### Part II
The assignment is to design and implement a web-based APU Attendance Recording System (ARS). There are 4 types of end users interacting to the ARS:<br>
i.	Administrative Officers<br>
ii.	Head of Schools<br>
iii.	Lecturers<br>
iv.	Students<br>
All the end users are required to login for authentication and authorisation purposes.

<b>a)	The following functionalities should be provided for the administrative officers’  interface:</b></br>
- To register new end users.<br>
- To delete, search, and update all users’ information.<br>
-	To assign lecturers to their respective head of schools. <br>
-	To register students to classes created by head of schools.<br>
-	To view the details of students’ attendance records.<br>

<b>b)	The following functionalities should be provided for the head of schools’ interface:</b><br>
-	To edit individual profile.<br>
-	To create classes and assign lecturers to handle those classes. <br>
-	To view the details of attendance records of those created classes.<br>

<b>c)	The following functionalities should be provided for the lecturers’ interface:</b><br>
-	To edit individual profile.<br>
-	To mark attendance of individual classes.<br>
-	To modify attendance records of individual classes. <br>
-	To view the details of attendance records of individual classes.<br>

<b>d)	The following functionalities should be provided for the students’ interface:</b><br>
-	To edit individual profile.<br>
-	To access individual attendance records and attendance summary.<br>

The application is to be developed in a multi-tier architecture with each tier to be implemented using the technologies defined as follows:<br>
-	The presentation tier is a web application based on JSP/JSF technologies.<br>
	- The JSPs may contain Standard Tag Library functions and Servlet may be used for validating input fields with predefined string and/or number format.<br>
	- The JSFs may utilize PrimeFaces UI components for an intuitive design.<br>
-	The business tier is an application that contains the business logic and processes with connections to the backend database via JDBC using Enterprise Java Beans (EJB).<br>
-	The database tier is a database application used to store all relevant data of the application.<br>

# 3.0	Assignment Deliverables

###	Part One
The deliverable should consist of an evaluation report comprising below contents. <br>
-	Brief history on distributed computing
-	Discussion on architectural evolution of distributed computing
-	Discussion on Microservices
-	Discussion on the role of Microservices in the distributed web application
-	Discussion on Spring Boot Microservices framework (with architectural diagrams, coding snippets, benefits & shortcomings)
-	Discussion on alternative framework (with architectural diagrams, coding snippets, benefits & shortcomings)
-	Justifications for adopted (Spring Boot Microservices framework / alternative framework) framework

###	Part Two
The deliverable consists of a design document, source code, and deployable modules/application. The design document should describe the system architecture, components, and customized component frameworks. The deliverable as a single JEE project is to be sent to the Admin (burned on a CD) on or before the project due date (27th August 2018, 5 pm). Your design documents should include the following content:<br>
-	A cover page and Table of contents (with page numbering).
-	Design of web components with a brief description of how the web component technologies are used (JSPs / JSFs, Servlets).
-	Web page design, including a general navigation chart of all pages.
-	Design of business tier with a brief description of how the technologies are used (EJBs).
-	Overview of your application and a brief description of the system architecture (and UML diagrams) and interconnection among the tiers.
-	Database design, with description of each table and an E-R diagram, or a domain diagram to describe the relationships. Design of database access APIs.
-	References 

#### Knowledge/Presentation
-	Able to provide all information and / or answer all questions with regards to the component of the project. 
-	Answers questions accurately and confidently.

####	Suggested Development Steps:
-	It is recommended that you follow the standard software development process, from analysis to design, then to implementation and testing. A good start would be trying to understand the application requirement and to layout the web pages and their relationship to JSFs/JSPs, and data entities. A good design would make your implementation much easier.
-	You need to divide the application into components according to their tiers. Once you have a thorough design completed and the interface among these components defined, you may proceed to implement and test each component one at a time, without having them interact with each other. Once you have each component fully implemented and tested, you can proceed with the integration.
-	It is recommended to complete your design, and then start implementing your system based on your design (not vice versa). If you found out during the implementation stage that something is wrong with your design, go back to your documentation and correct it before continuing with the implementation. Update your design document as you redesign and code.
-	Before delivering the final package, please test the ear files and database files on another machine or your own, or simply delete your existing application and database files, then drop the ear file into the auto-deploy directory, and the database files into the database directory of the application server, and see if everything would deploy and work the same as before.

#### Software Required
-	Java Development Kit (JDK) 8 update 45
-	Java Enterprise Edition (JEE) 7 / Netbeans 8.1
-	Database, MySQL / Java DB


# 4.0	Instructions:
This is an individual assignment. Upon submission of your assignment, you would be required to present your assignment at a date and time specified by your module lecturer.

# 5.0	MARKING CRITERIA
-	Evaluation Report (20 %)
-	Implementation (50 %)
	-	Implementation of Presentation Tier – 20 %
	-	Implementation of Business Tier – 20 %
	-	Implementation of Database Tier – 10 %  
-	Design & Program Documentation (20 %)
-	Knowledge/Presentation (10 %)                                                          
# 6.0 Video
https://youtu.be/HOe12IkfMic