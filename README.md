# Resume Generator

The resume generator is a Java application that uses XML, XSL and XSL-FO to 
generate a resume in PDF format. The data for the resume is in XML format, 
making it easy to add or modify resume content without having to deal with
formatting.

## Generating a Resume

```
mvn clean package
java -jar target/resume-generator-0.0.1-SNAPSHOT-jar-with-dependencies.jar
```
The resume will be located in the target directory.
