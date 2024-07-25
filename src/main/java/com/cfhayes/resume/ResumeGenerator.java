package com.cfhayes.resume;

import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.OutputStream;

/**
 * This class uses XSL and FOP to generate a PDF from an XML file.
 */
public class ResumeGenerator {

    public static void main(String[] args) {

        String xmlPath = "src/main/resources/resume.xml";
        String xslPath = "src/main/resources/resume.xsl";
        String pdfOutputPath = "target/resume.pdf";

        try {
            File xmlfile = new File(xmlPath);
            File xsltfile = new File(xslPath);
            File pdffile = new File(pdfOutputPath);

            // Setup output
            OutputStream pdfOutputStream = new java.io.FileOutputStream(pdffile);
            pdfOutputStream = new java.io.BufferedOutputStream(pdfOutputStream);

            try {
                // Construct fop with desired output format
                FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
                Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, pdfOutputStream);

                // Setup XSLT
                TransformerFactory factory = TransformerFactory.newInstance();
                Transformer transformer = factory.newTransformer(new StreamSource(xsltfile));

                // Set the value of a <param> in the stylesheet
                transformer.setParameter("versionParam", "2.0");

                // Setup input for XSLT transformation
                Source src = new StreamSource(xmlfile);

                // Resulting SAX events (the generated FO) must be piped through to FOP
                Result res = new SAXResult(fop.getDefaultHandler());

                // Start XSLT transformation and FOP processing
                transformer.transform(src, res);
            } finally {
                pdfOutputStream.close();
            }

            System.out.println("Success!");
        } catch (Exception e) {
            e.printStackTrace(System.err);
            System.exit(-1);
        }
    }

}
