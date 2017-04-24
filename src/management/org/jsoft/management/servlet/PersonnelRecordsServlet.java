package org.jsoft.management.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoft.comm.servlet.BaseServlet;
import org.jsoft.comm.util.ExportExcel;
import org.jsoft.comm.vo.Operater;
import org.jsoft.comm.vo.PageDivid;
import org.jsoft.comm.vo.Personnelinfo;
import org.jsoft.management.dao.impl.PersonnelRecordsDAO;
import org.jsoft.management.service.impl.MntAllService;
import org.jsoft.management.service.impl.PersonnelManagementService;
import org.jsoft.management.service.impl.PersonnelRecordsService;
import org.jsoft.management.util.PersonnelCommMethod;
import org.jsoft.system.service.IOperateLogService;
import org.jsoft.system.service.IOperaterService;
import org.jsoft.system.service.impl.OperateLogService;
import org.jsoft.system.service.impl.OperaterService;

public class PersonnelRecordsServlet extends BaseServlet {
    private static final String xlsFile="C:\\"; 
    private static final long serialVersionUID = 1L;
    private IOperaterService operaterService = new OperaterService();
    private IOperateLogService operateLogService = new OperateLogService();    
  public String findRecords(HttpServletRequest req,HttpServletResponse resp)
  {
      
       PersonnelCommMethod pcm=new PersonnelCommMethod();
       PersonnelRecordsService prs=new PersonnelRecordsService();        
      String department=(String) req.getParameter("department");
      System.out.println("department"+department);
      
      String startDate=(String)req.getParameter("startDate");
      String endDate=(String)req.getParameter("endDate");
      System.out.println("startDate"+startDate);
      System.out.println("endDate"+endDate);
      String searchTableName=(String) req.getParameter("searchTableName");
      List result=prs.findRecords(department,startDate,endDate,searchTableName,req);
      List  person=new ArrayList();
     if("Personneladjustsalary".equals(searchTableName))
     {
         person=prs.findAdjustSalaryPerson(result);         
         System.out.println(person.size());
     }
      System.out.println(result.size());
      req.setAttribute("time", "second");
      req.setAttribute("result", result);
      req.setAttribute("person", person);
     
      /*日志*/
        String info="根据查询条件查看符合条件的人事记录";
        operateLogService.add(operaterService.getById(((Operater)req.getSession().getAttribute("operater")).getOpId()), info);
        /*日志*/
      return "jsps/management/PersonnelRecords/Result.jsp";
  }
  public String findAllPersonnelRecords(HttpServletRequest req,HttpServletResponse resp)
  {
      PersonnelRecordsService prs=new PersonnelRecordsService();
      String c=(String)req.getParameter("cP");
      int cp=1;
      if(c!=null)
      {
           cp=Integer.parseInt(c); 
      }    
        PageDivid pg=new PageDivid();
        pg.setCurrentPage(cp);
        if(req.getParameter("pgPages")!=null)
        pg.setAllPage(Integer.parseInt((String) req.getParameter("pgPages")));
        if(req.getParameter("pgNum")!=null)
        pg.setNum(Integer.parseInt((String) req.getParameter("pgNum")));
        List result=prs.findAllPersonnelRecords(req,pg);
        List personList=prs.findAllPerson(pg);
      System.out.println(result.size()+"allPersonnelRecords");
    
      req.setAttribute("result", result);
      req.setAttribute("time", "first");
      req.setAttribute("personList", personList);
     req.setAttribute("pg", pg);
    /*日志*/
    String info="查看所有人的相关记录信息，比如调动次数，调薪次数。。。";
    operateLogService.add(operaterService.getById(((Operater)req.getSession().getAttribute("operater")).getOpId()), info);
    /*日志*/
      return "jsps/management/PersonnelRecords/Result.jsp";
  }
  public String findPerPages(HttpServletRequest req,HttpServletResponse resp)
    {
        PersonnelCommMethod pcm=new PersonnelCommMethod();
        PersonnelRecordsService prs=new PersonnelRecordsService();
        String c=(String) pcm.getParams(req, "cP");
        int cp=Integer.parseInt(c); 
        PageDivid pg=new PageDivid();
        pg.setCurrentPage(cp);
        pg.setAllPage(Integer.parseInt((String) req.getParameter("pgPages")));
        pg.setNum(Integer.parseInt((String) req.getParameter("pgNum")));
        List result=prs.findPerPage(req.getParameter("allHql"), pg);
        String flag=req.getParameter("flag");
        List person =new ArrayList();
        if("Personneladjustsalary".equals(flag))
        {
             person=prs.findAdjustSalaryPerson(result);
        }
        req.setAttribute("pg", pg);
        req.setAttribute("result", result);
        req.setAttribute("flag", flag);
        req.setAttribute("person", person);
         req.setAttribute("time", "second");
        req.setAttribute("allHql", req.getParameter("allHql"));
        /*日志*/
        String info="分页查询符合条件的人事记录";
        operateLogService.add(operaterService.getById(((Operater)req.getSession().getAttribute("operater")).getOpId()), info);
        /*日志*/
        return "jsps/management/PersonnelRecords/Result.jsp";
    }
  public String findPersonRecord(HttpServletRequest req,HttpServletResponse resp)
  {
      System.out.println("test");
      PersonnelRecordsService prs=new PersonnelRecordsService();
      PersonnelManagementService pms=new PersonnelManagementService();
      String personId=(String)req.getParameter("personId");
      List train=new ArrayList();
      List remove=new ArrayList();
      List peoc=new ArrayList();
      List adjustSalary=new ArrayList();
      List apprise=new ArrayList();
      Personnelinfo person=new Personnelinfo();
      
        if(!"".equals(personId))
        {            
            train=prs.findPersonAllRecords(personId,"Personneltrain");
            remove=prs.findPersonAllRecords(personId,"Personnelremove");
            peoc=prs.findPersonAllRecords(personId,"Peoc");
            adjustSalary=prs.findPersonAllRecords(personId,"Personneladjustsalary");
            apprise=prs.findPersonAllRecords(personId,"Personnelappraise");            
            person=pms.findPersonAllInfo(personId);
        }    
        req.setAttribute("train", train);
        req.setAttribute("remove", remove);
        req.setAttribute("peoc", peoc);
        req.setAttribute("adjustSalary", adjustSalary);
        req.setAttribute("apprise", apprise);    
        req.setAttribute("person", person);
        /*日志*/
        String info="查看个人的人事记录";
        operateLogService.add(operaterService.getById(((Operater)req.getSession().getAttribute("operater")).getOpId()), info);
        /*日志*/
      return "jsps/management/PersonnelRecords/PersonRecords.jsp";        
     
  }


  public String exporeExcel(HttpServletRequest req,HttpServletResponse resp) {
      MntAllService gservice = new MntAllService();
      String pNo = (String)req.getParameter("pNo");
      String pName = (String)req.getParameter("pName");
      String engageForm = (String)req.getParameter("engageForm");
      String beginWorkDate1 = (String)req.getParameter("beginWorkDate1");
      String beginWorkDate2 = (String)req.getParameter("beginWorkDate2");
      String workState = (String)req.getParameter("workState");
      Map<String,String> m1=new HashMap<String,String>();
      Map<String,String> m2=new HashMap<String,String>();
      if(pNo.isEmpty()==false)
          m1.put("personnelNo",pNo);
      if(pName.isEmpty()==false)
          m1.put("personnelName",pName);
      if(engageForm.isEmpty()==false)
          m1.put("engageForm",engageForm);
      if(beginWorkDate1.isEmpty()==false)
          m2.put("beginWorkDate1",beginWorkDate1);
      if(beginWorkDate2.isEmpty()==false)
          m2.put("beginWorkDate2",beginWorkDate2);
      if(workState.isEmpty()==false)
          m1.put("workState",workState);
      List<Personnelinfo> personsList = gservice.packSome(m1,m2);
      String string = String.valueOf(new Date().getTime());
      String pathString = xlsFile + string + ".xls";
      try {  
          FileOutputStream os = new FileOutputStream(pathString);
          System.err.println(os);
          String[] strMeaning={"编号","姓名 ", "性别","年龄","身份证号","联系电话","部门","最高学历","入职日期","工号","积分"};  
          String[] strName={"personnelNo","personnelName","personnelSex", "age", "identityId", "phone", "engageForm", "tipTopDegree", "beginWorkDate", "workId", "score"};  
          List<Personnelinfo> ls=new ArrayList<Personnelinfo>();  
          for(Personnelinfo personnelinfo : personsList){
              if (personnelinfo.getPersonnelNo() != null) {
                  Personnelinfo p=new Personnelinfo();
                  p.setPersonnelNo(personnelinfo.getPersonnelNo());
                  p.setPersonnelName(personnelinfo.getPersonnelName());
                  if (personnelinfo.getPersonnelSex().equals("10010001")) {
                      p.setPersonnelSex("女");
                  }
                  if (personnelinfo.getPersonnelSex().equals("10010002")) {
                      p.setPersonnelSex("男");
                  }
                  p.setAge(personnelinfo.getAge());
                  p.setIdentityId(personnelinfo.getIdentityId());
                  p.setPhone(personnelinfo.getPhone());
                  p.setEngageForm(personnelinfo.getEngageForm());
                  if (personnelinfo.getTipTopDegree().equals("10050001")) {
                      p.setTipTopDegree("小学");
                  }
                  if (personnelinfo.getTipTopDegree().equals("10050002")) {
                      p.setTipTopDegree("初中");
                  }
                  if (personnelinfo.getTipTopDegree().equals("10050003")) {
                      p.setTipTopDegree("高中");
                  }
                  if (personnelinfo.getTipTopDegree().equals("10050004")) {
                      p.setTipTopDegree("大专");
                  }
                  if (personnelinfo.getTipTopDegree().equals("10050005")) {
                      p.setTipTopDegree("大学本科");
                  }
                  if (personnelinfo.getTipTopDegree().equals("10050006")) {
                      p.setTipTopDegree("硕士");
                  }
                  if (personnelinfo.getTipTopDegree().equals("10050007")) {
                      p.setTipTopDegree("博士");
                  }
                  p.setBeginWorkDate(personnelinfo.getBeginWorkDate());
                  p.setWorkId(personnelinfo.getWorkId());
                  p.setScore(personnelinfo.getScore());
                  ls.add(p);
              }
          }
          System.err.println("准备开始导出excel");
          ExportExcel.exportExcel(strMeaning, strName, ls, os);  
      } catch (Exception  e1){  
          e1.getStackTrace();  
      }
      return "jsps/management/PersonnelRecords/outputSuccess.jsp";
  }
}
