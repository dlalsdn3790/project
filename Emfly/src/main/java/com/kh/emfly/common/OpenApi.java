package com.kh.emfly.common;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kh.emfly.company.model.service.CompanyService;
import com.kh.emfly.company.model.vo.Company;
import com.kh.emfly.company.model.vo.THire;

@Controller
public class OpenApi
{
   @Autowired
   private CompanyService cService;

   private static String getTagValue(String tag, Element e)
   {      
      NodeList nl = null;
      Node n = null;

      if(e.getElementsByTagName(tag).getLength() != 0)
      {
         nl = e.getElementsByTagName(tag).item(0).getChildNodes();
         n = (Node) nl.item(0);

         if(n == null)
            return null;
         else
            return n.getNodeValue();
      }
      else
         return null;
   }

   @RequestMapping("insertCompany.do")
   private ModelAndView into() throws SAXException, IOException, ParserConfigurationException
   {
      String url = "http://openapi.work.go.kr/opi/opi/opia/wantedApi.do?authKey=WNIYE5CV5RE68X8KXMIPL2VR1HK&callTp=D&returnType=XML&wantedAuthNo=";
      String hNo = null;
      String behind = "&infoSvc=VALIDATION";

      List<THire> list = cService.listTHire();

      int cId = 1;

      for(int i=0; i<list.size(); i++)
      {
         hNo = list.get(i).gettHNo();

         int hMin = Integer.parseInt(cService.selecthMin(hNo));
         int hMax = Integer.parseInt(cService.selecthMax(hNo));

         Document d = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url + hNo + behind);
         d.getDocumentElement().normalize();

         NodeList nl = d.getElementsByTagName("corpInfo");

         if(nl.getLength() != 0)
         {
            Node n = nl.item(0);

            if(n.getNodeType() == Node.ELEMENT_NODE)
            {
               Element e = (Element) n;

               String cName = getTagValue("corpNm", e);
               String cDiv = null;
               if(getTagValue("busiSize", e) == null)
                  cDiv = "기타";
               else
                  cDiv = getTagValue("busiSize", e);
               String cLocation = getTagValue("corpAddr", e);
               String cSector = getTagValue("indTpCdNm", e);
               int cSalary = 0;
               if(hMax == 0)
                  cSalary = hMin;
               else
                  cSalary = (hMin + hMax) / 2;
               String cInfo = getTagValue("busiCont", e);
               String cp = getTagValue("totPsncnt", e);
               int cPerson = Integer.parseInt(cp.substring(0, cp.length()-2));
               String cs = getTagValue("yrSalesAmt", e);
               int cSales = 0;
               if(cs == null)
                  cSales = 0;
               else
                  cSales = Integer.parseInt(cs.substring(0, cs.length()-4));
               String cc = getTagValue("capitalAmt", e);
               int cCapital = 0;
               if(cc == null)
                  cCapital = 0;
               else
                  cCapital = Integer.parseInt(cc.substring(0, cc.length()-4));
               String cLeader = getTagValue("reperNm", e);
               String cUrl = null;
               if(getTagValue("homePg", e) == null)
                  cUrl = "#";
               else
                  cUrl = getTagValue("homePg", e);

               System.out.println("---");
               System.out.println(cId);
               System.out.println(cName);
               System.out.println(cDiv);
               System.out.println(cLocation);
               System.out.println(cSector);
               System.out.println(cSalary);
               System.out.println(cInfo);
               System.out.println(cPerson);
               System.out.println(cSales);
               System.out.println(cCapital);
               System.out.println(cLeader);
               System.out.println(cUrl);
               System.out.println("---");

               Company c = new Company(cId, cName, cDiv, cLocation, cSector, cSalary, cInfo, cPerson, cSales, cCapital, cLeader, cUrl);

               int result = cService.insertCompany(c);

               cId++;
            }
         }
      }

      return new ModelAndView("redirect:mainPage.jsp");
   }
}