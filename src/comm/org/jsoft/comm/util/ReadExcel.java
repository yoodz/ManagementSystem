package org.jsoft.comm.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jsoft.comm.vo.Personnelinfo;
import org.jsoft.comm.vo.Personneltrain;
import org.jsoft.person.dao.impl.PersonInfoDAO;
import org.jsoft.person.service.impl.PersonTrainService;

public class ReadExcel {
    private static PersonTrainService pts = new PersonTrainService();
    public static List<Personneltrain> readExcel(String path) {
        List<Personneltrain> list = new ArrayList<Personneltrain>();
        //HSSFWorkbook workbook = null;

        try {
            Workbook rwb=Workbook.getWorkbook(new File(path));
            Sheet rs=rwb.getSheet(0);//或者rwb.getSheet(0)
            int clos=rs.getColumns();//得到所有的列
            int rows=rs.getRows();//得到所有的行
            
            System.out.println(clos+" rows:"+rows);
            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < clos; j++) {
                    //第一个是列数，第二个是行数
                    String PersonnelId = rs.getCell(j++, i).getContents();//默认最左边编号也算一列 所以这里得j++
                    String personnelTrainDate = rs.getCell(j++, i).getContents();
                    String PersonnelTrainConten = rs.getCell(j++, i).getContents();
                    String PersonnelTrainRemark = rs.getCell(j++, i).getContents();
                    
                    System.out.println("PersonnelId:" + PersonnelId + " personnelTrainDate:" + personnelTrainDate + " PersonnelTrainConten:" + PersonnelTrainConten + " PersonnelTrainRemark:" + PersonnelTrainRemark);
                    pts.add(PersonnelId, PersonnelTrainConten, personnelTrainDate.toString(), PersonnelTrainRemark);
                    
                    Timestamp personnelTrainDate1 = null;
                    try {
                        personnelTrainDate1 = new Timestamp(new SimpleDateFormat(
                                "yyyy-MM-dd HH:mm:ss").parse(personnelTrainDate).getTime());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    PersonInfoDAO piDAO = new PersonInfoDAO();
                    Personnelinfo pi = piDAO.queryId(PersonnelId);
                    MailUtil.sendEmail(pi.getEMail(), "企业内部员工培训通知", "您好，"+ pi.getPersonnelNo() +"您已被管理员添加了新的培训，内容是："+ PersonnelTrainConten +"。时间为 "+ personnelTrainDate1 + "。请记得准时参加。");
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return list;
        
//        // 循环工作表
//        for (int numSheet = 0; numSheet < workbook.getNumberOfSheets(); numSheet++) {
//            System.err.println("一共有多少表"+workbook.getNumberOfSheets());
//            HSSFSheet hssfSheet = workbook.getSheetAt(numSheet);
//            if (hssfSheet == null) {
//                System.err.println("hssfSheet是空的");
//                continue;
//            }
//            // 循环行
//            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
//                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
//                if (hssfRow == null) {
//                    continue;
//                }
//
//                // 将单元格中的内容存入集合
//                Personneltrain personneltrain = new Personneltrain();
//
//                HSSFCell cell = hssfRow.getCell(0);
//                if (cell == null) {
//                    continue;
//                }
//                Personnelinfo p = new Personnelinfo();
//                // 为了用这个类里的setPersonnelId方法,这里id是主键，非空，必须set
//                System.err.println("表格里的第一个值"+cell.getStringCellValue());
//                p.setPersonnelId(cell.getStringCellValue());
//                personneltrain.setPersonnelinfo(p);
//
//                cell = hssfRow.getCell(1);
//                if (cell == null) {
//                    continue;
//                }
//                
//                Timestamp personnelTrainDate = null;
//                try {
//                    personnelTrainDate = new Timestamp(new SimpleDateFormat(
//                            "yyyy-MM-dd HH:mm:ss").parse(cell.getStringCellValue()).getTime());
//                } catch (ParseException e) {
//                    e.printStackTrace();
//                }
//                System.err.println("表格里的第二个值"+personnelTrainDate);
//                personneltrain.setPersonnelTrainDate(personnelTrainDate);
//
//                cell = hssfRow.getCell(2);
//                if (cell == null) {
//                    continue;
//                }
//                System.err.println("表格里的第三个值" + cell.getStringCellValue());
//                personneltrain.setPersonnelTrainConten(cell.getStringCellValue());
//                
//                cell = hssfRow.getCell(3);
//                if (cell == null) {
//                    continue;
//                }
//                System.err.println("表格里的第四个值" + cell.getStringCellValue());
//                personneltrain.setPersonnelTrainRemark(cell.getStringCellValue());
//                personneltrain.setIsDelete(0);;
//                pts.add(p.getPersonnelId(), personneltrain.getPersonnelTrainConten(), personneltrain.getPersonnelTrainDate().toString(),
//                        personneltrain.getPersonnelTrainRemark());
//                list.add(personneltrain);
//            }
//        }
    }
}
