//package com.chegus.geni.common;
//
//import java.awt.Graphics2D;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.lang.reflect.InvocationTargetException;
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.ResourceBundle;
//
//import javax.imageio.ImageIO;
//import javax.print.attribute.HashPrintRequestAttributeSet;
//import javax.print.attribute.PrintRequestAttributeSet;
//import javax.print.attribute.ResolutionSyntax;
//import javax.print.attribute.standard.PrinterResolution;
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.support.RequestContextUtils;
//
////import com.chegus.geni.domain.SetupFileDO;
//import com.chegus.geni.domain.SetUpDO;
//import com.chegus.geni.service.SetupFileService;
//import com.chegus.geni.util.CheckConditionUtil;
//
//import net.sf.jasperreports.engine.JRException;
//import net.sf.jasperreports.engine.JRExporterParameter;
//import net.sf.jasperreports.engine.JasperCompileManager;
//import net.sf.jasperreports.engine.JasperExportManager;
//import net.sf.jasperreports.engine.JasperFillManager;
//import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperReport;
//import net.sf.jasperreports.engine.export.JExcelApiExporter;
//import net.sf.jasperreports.engine.export.JRCsvExporter;
//import net.sf.jasperreports.engine.export.JRGraphics2DExporter;
//import net.sf.jasperreports.engine.export.JRGraphics2DExporterParameter;
//import net.sf.jasperreports.engine.export.JRHtmlExporter;
//import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
//import net.sf.jasperreports.engine.export.JRPdfExporter;
//import net.sf.jasperreports.engine.export.JRPrintServiceExporterParameter;
//import net.sf.jasperreports.engine.export.JRRtfExporter;
//import net.sf.jasperreports.engine.export.JRXlsAbstractExporterParameter;
//import net.sf.jasperreports.engine.export.JRXmlExporter;
//import net.sf.jasperreports.engine.fill.JRGzipVirtualizer;
//
//@Component
//public class ReportUtil {
//
//	@Autowired
//	DataSource dataSource;
//
//	@Autowired
//	ServletContext servletContext;
//
//	@SuppressWarnings("rawtypes")
//	@Autowired 
//	private SetupFileService setupFileService;
//
//	public Connection getConnection() throws SQLException
//	{
//		Connection connection = dataSource.getConnection();
//		return connection;
//	}
//	
//	public String getReportLocation()
//	{
//		String jasperLocation=servletContext.getRealPath("/WEB-INF/Reports");
//		String jasper = jasperLocation+"/";
//		return jasper;
//	}
//
//	public String getImageLocation() 
//	{
//		String imageLocation=servletContext.getRealPath("/");
//		if(imageLocation != null && (!(imageLocation.endsWith("\\"))))
//		{
//			imageLocation += "\\";
//		}				
//		imageLocation += "resources\\DMS\\LOGO\\";
//		return imageLocation;
//	}
//	
//	public Map<String, Object> getLocale(HttpServletRequest request,Map<String, Object> parameter)
//	{			
//		ResourceBundle bundle=ResourceBundle.getBundle("MessagesBundle",RequestContextUtils.getLocaleResolver(request).resolveLocale(request));
//		parameter.put("REPORT_RESOURCE_BUNDLE", bundle);
//		return parameter;
//	}
//
//	@SuppressWarnings({ "unchecked" })
//	public Integer jasperReport(HttpServletRequest request,String reportName ,HttpServletResponse response,Map<String, Object> parameter) throws JRException, IOException, InvocationTargetException, IllegalAccessException, NoSuchMethodException, SQLException
//	{
//		JasperPrint jasperPrint = new JasperPrint();
//		Connection connection = null;
//		
//		String jasperLocation = getReportLocation();
//
//		List<SetUpDO> setupFileDOs=setupFileService.list(SetUpDO.class);
//		SetUpDO setupFileDO = setupFileDOs.get(setupFileDOs.size()-1);
//		String logo = getImageLocation()+setupFileDO.getUpldLogo();
//
//		parameter.put("LOGOPATH", logo);
//		parameter=getLocale(request,parameter);
//
//		JRGzipVirtualizer jrgzipvir = new JRGzipVirtualizer(5);
//		InputStream jasperFilePath = new FileInputStream(jasperLocation+reportName+".jasper");
//		try {
//			connection = getConnection();
//			jasperPrint = JasperFillManager.fillReport(jasperFilePath, parameter, connection);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		finally {
//			connection.close();
//		}
//		jrgzipvir.setReadOnly(true);
//
//		String exportParam = request.getParameter("exportTo");
//
//		if(!CheckConditionUtil.checkNotNull(exportParam))
//			exportParam = "PDF";
//
//		switch(exportParam)
//		{
//
//		case "PDF":
//			exportToPdf(response, jasperPrint, reportName);
//			break;
//
//		case "EXCEL":
//			exportToExcel(response, jasperPrint, reportName);
//			break;
//		case "HTML":
//			exportToHtml(response, jasperPrint, reportName);
//			break;
//		case "RTF":
//			exportToRtf(response, jasperPrint, reportName);
//			break;
//		case "IMG":
//			exportToImg(response, jasperPrint, reportName);
//			break;
//
//		default:
//			exportToPdf(response, jasperPrint, reportName);
//			break;
//
//		}
//		return jasperPrint.getPages().size();
//	}
//
//
//	public void exportToPdf(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//		response.setContentType("application/pdf");	
//		JRPdfExporter pdfExporter = new JRPdfExporter();
//
//		pdfExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);	
//		pdfExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());	  
//		pdfExporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportName);
//		pdfExporter.exportReport();
//		pdfExporter=null;
//	}
//
//	public void exportToHtml(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//
//		response.setContentType("text/html");	
//		response.setHeader("Content-Disposition", "attachment; filename="+reportName+".html");
//		JRHtmlExporter htmlExporter= new JRHtmlExporter();
//		htmlExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);	
//		htmlExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream()); 
//		htmlExporter.setParameter(JRHtmlExporterParameter.IS_WRAP_BREAK_WORD, Boolean.TRUE);
//		htmlExporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
//		htmlExporter.setParameter(JRHtmlExporterParameter.SIZE_UNIT, JRHtmlExporterParameter.SIZE_UNIT_PIXEL);
//
//		htmlExporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportName);
//		htmlExporter.exportReport();
//
//		htmlExporter=null;
//	}
//
//	public void exportToExcel(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//
//		response.setContentType("application/vnd.ms-excel");	
//		response.setHeader("Content-Disposition", "attachment; filename="+reportName+".xls");
//		JExcelApiExporter exporter = new JExcelApiExporter();
//		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream()); 
//		exporter.setParameter(JRXlsAbstractExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
//		exporter.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
//		exporter.setParameter(JRXlsAbstractExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
//		exporter.setParameter(JRXlsAbstractExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
//
//		exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportName);
//		exporter.exportReport();
//		exporter=null;
//	}
//
//	public void exportToRtf(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//		response.setContentType("application/rtf");	
//		response.setHeader("Content-Disposition", "attachment; filename="+reportName+".rtf");
//		JRRtfExporter rtfExporter = new JRRtfExporter();
//		rtfExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//		rtfExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream()); 
//
//		rtfExporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportName);
//		rtfExporter.exportReport();
//		rtfExporter=null;
//	}
//	
//	public void exportToXml(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//		response.setContentType("application/xml");	
//		response.setHeader("Content-Disposition", "attachment; filename="+reportName+".xml");
//		JRXmlExporter exporter=new JRXmlExporter();
//		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream()); 
//		exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportName);
//		exporter.exportReport();
//		exporter=null;
//	}
//	
//	public void exportToCsv(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//		response.setContentType("application/csv");	
//		response.setHeader("Content-Disposition", "attachment; filename="+reportName+".csv");
//		JRCsvExporter csvExporter=new JRCsvExporter();
//		csvExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//		csvExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream()); 
//		csvExporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, reportName);
//		csvExporter.setParameter(JRXlsAbstractExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
//		csvExporter.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
//		csvExporter.setParameter(JRXlsAbstractExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
//		csvExporter.setParameter(JRXlsAbstractExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
//		csvExporter.exportReport();
//		csvExporter=null;
//	}
//	
//	public Map<String,String> returnSingleMap(String query) throws SQLException
//	{
//		Statement stmt = null;
//		Connection conn=null;
//		ResultSet rs=null;
//		Map<String,String> listofvaues=new HashMap<String,String>();;
//		try
//		{
//			conn=getConnection();
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(query);
//			ResultSetMetaData rsmd = rs.getMetaData();
//			while (rs.next()) 
//			{
//				for(int i=1;i<=rsmd.getColumnCount();i++)
//				{
//					if(rsmd.getColumnTypeName(i).equalsIgnoreCase("int")) 
//					{
//						listofvaues.put(rsmd.getColumnName(i),rs.getInt(rsmd.getColumnName(i))+"");
//					}
//					if(rsmd.getColumnTypeName(i).equalsIgnoreCase("nvarchar"))
//					{
//						if(CheckConditionUtil.checkNotNull(rs.getString(rsmd.getColumnName(i))))
//						{
//							listofvaues.put(rsmd.getColumnName(i),rs.getString(rsmd.getColumnName(i)));
//						}
//						else
//						{
//							listofvaues.put(rsmd.getColumnName(i),"");
//						}
//					}
//					if(rsmd.getColumnTypeName(i).equalsIgnoreCase("varchar"))
//					{
//						if(CheckConditionUtil.checkNotNull(rs.getString(rsmd.getColumnName(i))))
//						{
//							listofvaues.put(rsmd.getColumnName(i),rs.getString(rsmd.getColumnName(i)));
//						}
//						else
//						{
//							listofvaues.put(rsmd.getColumnName(i),"");	
//						}
//					}
//					if(rsmd.getColumnTypeName(i).contains("decimal"))
//					{
//						listofvaues.put(rsmd.getColumnName(i),rs.getBigDecimal(rsmd.getColumnName(i))+"");	
//					}
//					if(rsmd.getColumnTypeName(i).equalsIgnoreCase("bigint"))
//					{
//						listofvaues.put(rsmd.getColumnName(i),rs.getBigDecimal(rsmd.getColumnName(i))+"");	
//					}
//				}
//				break;
//			}
//			System.out.println(listofvaues);
//
//		}
//		catch(Exception e)
//		{
//			System.out.println("exception in mail merge report metho...");
//		}
//		finally 
//		{
//			if(rs!=null)
//				rs.close();
//			if(stmt!=null)
//				stmt.close();
//			if(conn!=null)
//				conn.close();
//		}
//		return listofvaues;
//	}
//
//	public void exportToImg(HttpServletResponse response,JasperPrint jasperPrint,String reportName) throws IOException, JRException
//	{
//		//jasperPrint.setPageHeight(400);
//		JRGraphics2DExporter exporter = new JRGraphics2DExporter();
//		BufferedImage bufferedImage = new BufferedImage(jasperPrint.getPageWidth()+1, jasperPrint.getPageHeight()+1, BufferedImage.TYPE_INT_RGB);
//		Graphics2D g = (Graphics2D)bufferedImage.getGraphics();
//		exporter.setParameter(JRGraphics2DExporterParameter.GRAPHICS_2D, g);
//		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//		PrintRequestAttributeSet attrs = new HashPrintRequestAttributeSet();
//		attrs.add(new PrinterResolution(500, 540, ResolutionSyntax.DPI));
//		exporter.setParameter(JRPrintServiceExporterParameter.PRINT_REQUEST_ATTRIBUTE_SET, attrs);
//		exporter.setParameter(JRGraphics2DExporterParameter.ZOOM_RATIO, Float.valueOf(1));
//		exporter.exportReport();
//		g.dispose();
//
//		ImageIO.write(bufferedImage, "PNG",  response.getOutputStream());
//	}
//	
//	@SuppressWarnings("unchecked")
//	public Integer savePdf(HttpServletRequest request,String reportName ,HttpServletResponse response,Map<String, Object> parameter) throws JRException, IOException, InvocationTargetException, IllegalAccessException, NoSuchMethodException, SQLException
//	{
//		List<SetUpDO> setupFileDOs=setupFileService.list(SetUpDO.class);
//		SetUpDO setupFileDO = setupFileDOs.get(setupFileDOs.size()-1);
//		String jasperLocation = getReportLocation();
//		String logo = getImageLocation()+setupFileDO.getUpldLogo();		
//		parameter.put("LOGOPATH", logo);
//		
//		ResourceBundle bundle=ResourceBundle.getBundle("MessagesBundle",RequestContextUtils.getLocaleResolver(request).resolveLocale(request));
//		parameter.put("REPORT_RESOURCE_BUNDLE", bundle);	
//		
//		JRGzipVirtualizer jrgzipvir = new JRGzipVirtualizer(5);
//		InputStream jasperFilePath = new FileInputStream(jasperLocation+reportName+".jasper");
//		Connection conn = getConnection();
//		JasperPrint jasperPrint = null;
//		try{
//		jasperPrint = JasperFillManager.fillReport(jasperFilePath, parameter, conn);
//		jrgzipvir.setReadOnly(true);
//		JasperExportManager.exportReportToPdfFile(jasperPrint, CommonMessageSource.getMessage("FILE_PATH")+reportName+".pdf");
//		}
//		finally{
//			conn.close();
//		}	
//		return jasperPrint.getPages().size();
//	}
//	
//	public byte[] generateJasperReportPDF(String reportName, Map<String, Object> parameter, HttpServletRequest request)
//			throws Exception {
//		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//		JRPdfExporter exporter = new JRPdfExporter();
//		Connection conn = getConnection();
//		try {
//			parameter = getLocale(request, parameter);
//			String reportLocation = getReportLocation() + "//" + reportName + ".jrxml";
//			JasperReport jasperReport = JasperCompileManager.compileReport(reportLocation);
//			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, conn);
//			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
//			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, outputStream);
//			exporter.exportReport();
//		} catch (Exception e) {
//			e.printStackTrace();
//			conn.close();
//		} finally {
//			conn.close();
//		}
//		return outputStream.toByteArray();
//	}
//}