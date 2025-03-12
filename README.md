Dual Access Control for Cloud-Based Data Storage and Sharing

Introduction:
--------------

Cloud-based storage services have become increasingly popular due to their flexibility and convenience. However, security concerns regarding outsourced data hinder their widespread adoption. This project introduces a novel dual access control mechanism to ensure secure data sharing and access control in cloud environments.


Features:
----------

Attribute-Based Encryption (ABE): Ensures confidentiality and fine-grained access control.

Ciphertext-Policy ABE (CP-ABE): Defines access policies over encrypted data.

Dual Access Control Mechanism: Enhances security by controlling both data access and download requests.

Protection Against DDoS/EDoS Attacks: Prevents malicious users from consuming cloud resources through repeated download requests.

Secure Data Sharing: Enables sharing without exposing plaintext data.


System Modules:
---------------

Data Owner: Encrypts and uploads files, manages file access permissions.

Cloud Server: Stores encrypted files, manages user requests.

Authority: Generates and manages encryption keys.

End User: Requests and downloads permitted files.


System Requirements:
---------------------

Hardware
---------
Processor: Pentium 1.1 GHz or higher

RAM: 1GB or more

Hard Disk: 20GB minimum

Software
-----------
Operating System: Windows

Technology: Java

Web Technologies: HTML, JavaScript, CSS

IDE: My Eclipse (Mars 2.0)

Web Server: Tomcat 8.0

Database: MySQL

Java Version: JDK 1.8


System Architecture:
--------------------
The system follows a modular architecture with roles for data owners, users, cloud storage, and an authority entity managing encryption keys and permissions. The architecture ensures:

Secure encryption of uploaded files

Controlled access to data based on user attributes

Protection against unauthorized downloads


Installation Guide:
--------------------
Clone the repository:
git clone https://github.com/GOGINENINIKHIL.git

Install dependencies and setup MySQL database.

Configure Tomcat 8.0 and deploy the application.

Run the application in My Eclipse IDE.


Usage Instructions:
--------------------
Data Owner: Registers, encrypts, and uploads files.

Users: Register, request keys, and download permitted files.

Cloud Server: Manages transactions and monitors attacks.

Authority: Issues encryption keys and permissions.


Testing and Validation:
------------------------
The system has undergone rigorous testing including:

Unit Testing: Validates individual components.

Integration Testing: Ensures seamless interaction between modules.

System Testing: Evaluates overall system functionality.

User Acceptance Testing: Confirms usability and compliance with requirements.


Future Enhancements:
--------------------
Implementing secure enclave execution to protect against side-channel attacks.

Enhancing user experience with an intuitive interface.

Expanding support for additional cryptographic techniques.


Contributors:
-------------
Venkata Nikhil Gogineni
