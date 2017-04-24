package org.jsoft.comm.util;

import java.io.OutputStream;  
import java.lang.reflect.InvocationTargetException;  
import java.text.SimpleDateFormat;  
import java.util.Collection;  
import java.util.Date;  
import java.util.Iterator;  
  
import org.apache.commons.beanutils.PropertyUtils;  
import org.apache.commons.lang.StringUtils;  
import org.apache.commons.lang.math.NumberUtils;  
import org.apache.poi.hssf.usermodel.HSSFCell;  
import org.apache.poi.hssf.usermodel.HSSFCellStyle;  
import org.apache.poi.hssf.usermodel.HSSFFont;  
import org.apache.poi.hssf.usermodel.HSSFRow;  
import org.apache.poi.hssf.usermodel.HSSFSheet;  
import org.apache.poi.hssf.usermodel.HSSFWorkbook;  
import org.apache.poi.hssf.util.HSSFColor;  
  
public class ExportExcel {  
      
    private static SimpleDateFormat SDF = null;  
      
    /** 
     *  
     * 方法描述:生成调用的方法 
     * @param strMeaning    表头的数组 
     * @param strName       表字段数组 
     * @param collection    表数据集合 
     * @param os            输出流 
     * @throws Exception  void 
     * @author Andy  2014-4-29  下午05:40:57 
     */  
    public static void exportExcel(String[] strMeaning,String[] strName,Collection<?> collection,OutputStream os) throws Exception{  
        HSSFWorkbook wb = ExportExcel.generateExcelforObject(strMeaning,strName,"",collection);  
        wb.write(os);  
    }  
      
    private static HSSFWorkbook generateExcelforObject(String[] strMeaning,String[] strName,String str,Collection<?> collection) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {  
        HSSFWorkbook wb = new HSSFWorkbook();  
        if(collection==null || collection.size()<1)return wb; //无数据侧返回  
        if(strMeaning==null || strMeaning.length<1)return wb; //表头为空侧返回  
        if(strName==null || strName.length<1)return wb;    //字段为空侧返回  
        if(strMeaning.length!=strName.length)return wb;    //两个数组长度不同侧返回  
        HSSFRow row=null;  
        short rowNum = 0;  
        //设置工作簿的名称  
        String sheetTitle=StringUtils.isEmpty(str)?"Sheet1":str;  
        HSSFSheet sheet = wb.createSheet();  
        wb.setSheetName(0,sheetTitle);
        //设置标题  
        row = sheet.createRow(rowNum);
        setTitle(row, strMeaning,wb);
        for (Iterator<?> iter = collection.iterator(); iter.hasNext();) {
            Object exportEle = iter.next();
            // 行对象  
            row = sheet.createRow(++rowNum);
            //设置对应值  
            setRow(row, strName, exportEle);
        }  
        return wb;  
    }  
      
    /** 
     * 方法描述: 为Excel页中的每个横行设置标题 
     * @param row 
     * @param strMeaning 
     * @param wb 
     * @throws IllegalAccessException 
     * @throws InvocationTargetException 
     * @throws NoSuchMethodException  void 
     * @author Andy  2014-4-29  下午05:45:45 
     */  
    @SuppressWarnings("deprecation")  
    private static void setTitle(HSSFRow row,String[] strMeaning,HSSFWorkbook wb) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException{  
        HSSFCellStyle style = wb.createCellStyle();  
        // 设置这些样式  
        style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);  
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); //设置单元格北京颜色  
//      style.setBorderBottom(HSSFCellStyle.BORDER_THIN);  //设置单元格下部线加粗  
//      style.setBorderLeft(HSSFCellStyle.BORDER_THIN);  //设置单元格左部线加粗  
//      style.setBorderRight(HSSFCellStyle.BORDER_THIN);  //设置单元格右部线加粗  
//      style.setBorderTop(HSSFCellStyle.BORDER_THIN);   //设置单元格上部线加粗  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);  //设置单元格字符居中  
          
        //生成一个字体  
        HSSFFont font = wb.createFont();  
//      font.setColor(HSSFColor.WHITE.index);  //设置字体颜色  
        font.setFontHeightInPoints((short)10);  
//      font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  //设置字体加粗  
        // 把字体应用到当前的样式  
        style.setFont(font);  
        for (int k = 0; k < strMeaning.length; k++) {  
            HSSFCell cell = row.createCell((short)k);  
            cell.setCellStyle(style);  
            cell.setCellValue(strMeaning[k]);  
        }  
    }  
      
    /** 
     *  
     * 方法描述: 为Excel页中的每个横行设置值 
     * @param row 
     * @param strName 
     * @param exportModel 
     * @throws IllegalAccessException 
     * @throws InvocationTargetException 
     * @throws NoSuchMethodException  void 
     * @author Andy  2014-4-29  下午05:44:02 
     */  
    @SuppressWarnings("deprecation")  
    private static void setRow(HSSFRow row,String[] strName,Object exportModel) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException{  
        Object temp=null;  
        for (int k = 0; k < strName.length; k++) {  
            // Cell对象  
            HSSFCell cell = row.createCell((short) k);  
            //设置对应值  
            try {  
                //检查该实体是否有这个属性  
                temp = PropertyUtils.getProperty(exportModel, strName[k]);  
            } catch (Exception e) {
                e.getStackTrace();
                continue;
            }  
            if(temp==null){
                cell.setCellValue(StringUtils.EMPTY);
            }else{
                if(temp instanceof Date){
                    cell.setCellValue(getDateTimeFormat().format(Date.class.cast(temp)));  
                }else if(NumberUtils.isNumber(temp.toString())){  
                    cell.setCellValue(Double.parseDouble(temp.toString()));  
                }else{  
                    cell.setCellValue(temp.toString());  
                }  
            }  
        }  
    }  
      
    /** 
     * 方法描述: 获取系统时间格式 
     * @return  SimpleDateFormat 
     * @author Andy  2014-4-29  下午05:44:39 
     */  
    public static SimpleDateFormat getDateFormat(){  
        if(SDF==null){SDF=new SimpleDateFormat("yyyy-MM-dd");}  
        return SDF;  
    }  
  
    /** 
     * 方法描述: 获取系统精确时间格式 
     * @return  SimpleDateFormat 
     * @author Andy  2014-4-29  下午05:44:27 
     */  
    public static SimpleDateFormat getDateTimeFormat(){  
        if(SDF==null){SDF=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");}  
        return SDF;  
    }  
      
}  


//
//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//
//import org.apache.poi.hssf.usermodel.HSSFCell;
//import org.apache.poi.hssf.usermodel.HSSFCellStyle;
//import org.apache.poi.hssf.usermodel.HSSFFont;
//import org.apache.poi.hssf.usermodel.HSSFRichTextString;
//import org.apache.poi.hssf.usermodel.HSSFRow;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.hssf.util.HSSFColor;
//import org.apache.poi.hssf.util.Region;
//
//public class ExportExcel {
//
//    private HSSFWorkbook wb = null;
//    private HSSFSheet sheet = null;
//
//    /**
//     * @param wb
//     * @param sheet 
//     */
//    public ExportExcel(HSSFWorkbook wb, HSSFSheet sheet) {
//        // super();
//        this.wb = wb;
//        this.sheet = sheet;
//    }
//
//    /**
//     * 创建通用EXCEL头部
//     * 
//     * @param headString
//     *            头部显示的字符
//     * @param colSum
//     *            该报表的列数
//     */
//    @SuppressWarnings({ "deprecation", "unused" })
//    public void createNormalHead(String headString, int colSum) {
//        //创建Excel中一行
//        HSSFRow row = sheet.createRow(0);
//        // 设置第一行
//        HSSFCell cell = row.createCell(0);
//        // row.setHeight((short) 1000);
//
//        // 定义单元格为字符串类型
//        cell.setCellType(HSSFCell.ENCODING_UTF_16);// 中文处理
//        cell.setCellValue(new HSSFRichTextString(headString));
//
//        // 指定合并区域
//        /**
//         * public Region(int rowFrom, short colFrom, int rowTo, short colTo)
//         */
//        sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));
//
//        // 定义单元格格式，添加单元格表样式，并添加到工作簿
//        HSSFCellStyle cellStyle = wb.createCellStyle();
//        // 设置单元格水平对齐类型
//        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
//        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
//        cellStyle.setWrapText(true);// 指定单元格自动换行
//
//        // 设置单元格字体
//        HSSFFont font = wb.createFont();
//        // font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//        // font.setFontName("宋体");
//        // font.setFontHeight((short) 600);
//        // cellStyle.setFont(font);
//        cell.setCellStyle(cellStyle);
//    }
//
//    /**
//     * 创建通用报表第二行
//     * 
//     * @param params
//     *            统计条件数组
//     * @param colSum
//     *            需要合并到的列索引
//     */
//    @SuppressWarnings("deprecation")
//    public void createNormalTwoRow(String[] params, int colSum) {
//        // 创建第二行
//        HSSFRow row1 = sheet.createRow(1);
//
//        row1.setHeight((short) 400);
//
//        HSSFCell cell2 = row1.createCell(0);
//
//        cell2.setCellType(HSSFCell.ENCODING_UTF_16);
//        cell2.setCellValue(new HSSFRichTextString("时间：" + params[0] + "至"
//                + params[1]));
//
//        // 指定合并区域
//        /**
//         * public Region(int rowFrom, short colFrom, int rowTo, short colTo)
//         */
//        sheet.addMergedRegion(new Region(1, (short) 0, 1, (short) colSum));
//
//        HSSFCellStyle cellStyle = wb.createCellStyle();
//        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
//        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
//        cellStyle.setWrapText(true);// 指定单元格自动换行
//
//        // 设置单元格字体
//        HSSFFont font = wb.createFont();
//        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//        font.setFontName("宋体");
//        font.setFontHeight((short) 250);
//        cellStyle.setFont(font);
//
//        cell2.setCellStyle(cellStyle);
//    }
//
//    /**
//     * 设置报表标题
//     * 
//     * @param columHeader
//     *            标题字符串数组
//     */
//    public void createColumHeader(String[] columHeader) {
//
//        // 设置列头 在第三行
//        HSSFRow row2 = sheet.createRow(2);
//
//        // 指定行高
//        row2.setHeight((short) 600);
//
//        HSSFCellStyle cellStyle = wb.createCellStyle();
//        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
//        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
//        cellStyle.setWrapText(true);// 指定单元格自动换行
//
//        // 单元格字体
//        HSSFFont font = wb.createFont();
//        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//        font.setFontName("宋体");
//        font.setFontHeight((short) 250);
//        cellStyle.setFont(font);
//
//        // 设置单元格背景色
//        cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
//        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
//
//        HSSFCell cell3 = null;
//
//        for (int i = 0; i < columHeader.length; i++) {
//            cell3 = row2.createCell(i);
//            cell3.setCellType(HSSFCell.ENCODING_UTF_16);
//            cell3.setCellStyle(cellStyle);
//            cell3.setCellValue(new HSSFRichTextString(columHeader[i]));
//        }
//    }
//
//    /**
//     * 创建内容单元格
//     * 
//     * @param wb
//     *            HSSFWorkbook
//     * @param row
//     *            HSSFRow
//     * @param col
//     *            short型的列索引
//     * @param align
//     *            对齐方式
//     * @param val
//     *            列值
//     */
//    public void cteateCell(HSSFWorkbook wb, HSSFRow row, int col, short align,
//            String val) {
//        HSSFCell cell = row.createCell(col);
//        cell.setCellType(HSSFCell.ENCODING_UTF_16);
//        cell.setCellValue(new HSSFRichTextString(val));
//        HSSFCellStyle cellstyle = wb.createCellStyle();
//        cellstyle.setAlignment(align);
//        cell.setCellStyle(cellstyle);
//    }
//
//    /**
//     * 创建合计行
//     * 
//     * @param colSum
//     *            需要合并到的列索引
//     * @param cellValue
//     */
//    @SuppressWarnings("deprecation")
//    public void createLastSumRow(int colSum, String[] cellValue) {
//
//        HSSFCellStyle cellStyle = wb.createCellStyle();
//        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
//        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
//        cellStyle.setWrapText(true);// 指定单元格自动换行
//
//        // 单元格字体
//        HSSFFont font = wb.createFont();
//        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
//        font.setFontName("宋体");
//        font.setFontHeight((short) 250);
//        cellStyle.setFont(font);
//        // 获取工作表最后一行
//        HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() + 1));
//        HSSFCell sumCell = lastRow.createCell(0);
//
//        sumCell.setCellValue(new HSSFRichTextString("合计"));
//        sumCell.setCellStyle(cellStyle);
//        // 合并 最后一行的第零列-最后一行的第一列
//        sheet.addMergedRegion(new Region(sheet.getLastRowNum(), (short) 0,
//                sheet.getLastRowNum(), (short) colSum));// 指定合并区域
//
//        for (int i = 2; i < (cellValue.length + 2); i++) {
//            // 定义最后一行的第三列
//            sumCell = lastRow.createCell(i);
//            sumCell.setCellStyle(cellStyle);
//            // 定义数组 从0开始。
//            sumCell.setCellValue(new HSSFRichTextString(cellValue[i - 2]));
//        }
//    }
//
//    /**
//     * 输入EXCEL文件
//     * 
//     * @param fileName
//     *            文件名
//     */
//    public void outputExcel(String fileName) {
//        FileOutputStream fos = null;
//        try {
//            fos = new FileOutputStream(new File(fileName));
//            wb.write(fos);
//            fos.close();
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    /**
//     * @return the sheet
//     */
//    public HSSFSheet getSheet() {
//        return sheet;
//    }
//
//    /**
//     * @param sheet
//     *            the sheet to set
//     */
//    public void setSheet(HSSFSheet sheet) {
//        this.sheet = sheet;
//    }
//
//    /**
//     * @return the wb
//     */
//    public HSSFWorkbook getWb() {
//        return wb;
//    }
//
//    /**
//     * @param wb
//     *            the wb to set
//     */
//    public void setWb(HSSFWorkbook wb) {
//        this.wb = wb;
//    }
//}