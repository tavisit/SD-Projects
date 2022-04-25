package com.backend.Services.Services;


import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.OrderWithDetailsDto;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.ByteArrayOutputStream;
import java.util.List;

/**
 * A pdf maker helper class that creates a byte stream containing order information
 */
public class PdfMaker {
    private static Font boldTitle = new Font(Font.FontFamily.TIMES_ROMAN, 28, Font.BOLDITALIC);
    private static Font boldSmall = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLDITALIC);
    /**
     * Create a byte stream that contains the information regarding a certain order
     * @param order the order that needs to be interpreted as document
     * @return a byte array that represents the pdf
     * @throws Exception if the order is invalid or the creation fails
     */
    public static byte[] createPdf(OrderWithDetailsDto order)throws Exception {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        Document document = new Document();

        PdfWriter.getInstance(document, byteArrayOutputStream);
        document.open();

        OrderDto orderDto = order.getOrder();

        document.add(new Header("Report",""));

        document.add(new Paragraph("Order",boldTitle));
        document.add(new Paragraph(orderDto.getRestaurant().toString()));
        document.add(new Paragraph("Id of the order: " + orderDto.getId(),boldSmall));
        document.add(new Paragraph("Current Status of the order: " + orderDto.getStatus().getName(),boldSmall));
        document.add(new Paragraph("Total Price: " + order.getPrice(),boldSmall));

        document.add(new Paragraph("Food in order",boldTitle));
        PdfPTable table = new PdfPTable(4);

        table.addCell(new PdfPCell(new Phrase("Food Name")));
        table.addCell(new PdfPCell(new Phrase("Food Category")));
        table.addCell(new PdfPCell(new Phrase("Food Quantity")));
        table.addCell(new PdfPCell(new Phrase("Food Price/Unit")));

        order.getFoodDtoList().forEach(food->{
            table.addCell(new PdfPCell(new Phrase(food.getFoodName())));
            table.addCell(new PdfPCell(new Phrase(food.getFoodCategory().getName())));
            table.addCell(new PdfPCell(new Phrase(food.getQuantity().toString())));
            table.addCell(new PdfPCell(new Phrase(food.getPrice().toString())));
        });
        document.add(table);

        document.add(new Paragraph("Additional information: " + orderDto.getAdditionalInformation(),boldSmall));
        document.add(new Paragraph("Client Information",boldTitle));
        document.add(new Paragraph(orderDto.getUser().toString()));
        document.add(new Paragraph("Latitude: " + orderDto.getLatitude(),boldSmall));
        document.add(new Paragraph("Longitude: " + orderDto.getLongitude(),boldSmall));

        document.close();
        return byteArrayOutputStream.toByteArray();
    }
}
