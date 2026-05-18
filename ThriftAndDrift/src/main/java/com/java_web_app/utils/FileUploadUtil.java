package com.java_web_app.utils;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class FileUploadUtil {

    // Get file extension e.g. "photo.jpg" -> ".jpg"
    public static String getFileExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) return "";
        return fileName.substring(fileName.lastIndexOf("."));
    }

    // Check MIME type starts with "image/"
    public static boolean isImage(Part part) {
        String contentType = part.getContentType();
        return contentType != null && contentType.startsWith("image/");
    }

    // Save file to disk, overwriting if same name exists
    public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        Path filePath = uploadPath.resolve(fileName);
        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }
}