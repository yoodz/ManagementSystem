package org.jsoft.comm.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jsoft.comm.vo.Personnelinfo;
import org.jsoft.comm.vo.Personneltrain;
import org.jsoft.person.service.impl.PersonTrainService;

public class ReadExcel {
    private static PersonTrainService pts = new PersonTrainService();
    public static List<Personneltrain> readExcel(String path) {
        List<Personneltrain> list = new ArrayList<Personneltrain>();
        HSSFWorkbook workbook = null;

        try {
            // 读取Excel文件
            InputStream inputStream = new FileInputStream(path);
            workbook = new HSSFWorkbook(inputStream);
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 循环工作表
        for (int numSheet = 0; numSheet < workbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = workbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow == null) {
                    continue;
                }

                // 将单元格中的内容存入集合
                Personneltrain personneltrain = new Personneltrain();

                HSSFCell cell = hssfRow.getCell(0);
                if (cell == null) {
                    continue;
                }
                Personnelinfo p = new Personnelinfo();
                // 为了用这个类里的setPersonnelId方法,这里id是主键，非空，必须set
                System.err.println("表格里的第一个值"+cell.getStringCellValue());
                p.setPersonnelId(cell.getStringCellValue());
                personneltrain.setPersonnelinfo(p);

                cell = hssfRow.getCell(1);
                if (cell == null) {
                    continue;
                }
                
                Timestamp personnelTrainDate = null;
                try {
                    personnelTrainDate = new Timestamp(new SimpleDateFormat(
                            "yyyy-MM-dd HH:mm:ss").parse(cell.getStringCellValue()).getTime());
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                System.err.println("表格里的第二个值"+personnelTrainDate);
                personneltrain.setPersonnelTrainDate(personnelTrainDate);

                cell = hssfRow.getCell(2);
                if (cell == null) {
                    continue;
                }
                System.err.println("表格里的第三个值" + cell.getStringCellValue());
                personneltrain.setPersonnelTrainConten(cell.getStringCellValue());
                
                cell = hssfRow.getCell(3);
                if (cell == null) {
                    continue;
                }
                System.err.println("表格里的第四个值" + cell.getStringCellValue());
                personneltrain.setPersonnelTrainRemark(cell.getStringCellValue());
                personneltrain.setIsDelete(0);;
                pts.add(p.getPersonnelId(), personneltrain.getPersonnelTrainConten(), personneltrain.getPersonnelTrainDate().toString(),
                        personneltrain.getPersonnelTrainRemark());
                list.add(personneltrain);
            }
        }
        return list;
    }
}
