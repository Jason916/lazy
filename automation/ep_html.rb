require "nokogiri"
require "find"
require "pathname"
require "rubygems"

class Report_html_to_xml
 def post_info(path)
  list=[]
  Find.find(path) do |f|
  list << f
 end
 puts list.sort.max   
 real_path = Pathname.new(File.dirname(__FILE__)).realpath
 doc = Nokogiri::HTML(open(list.sort.max))
  
 j=0
 b=0
 t=0
 case_num = doc.css('dd').count.to_i
 while j< case_num  
  k =doc.css('dd')[j].css('span')[1].text.delete('s').to_f
  b+=(k*100).round / 100.0   
  temp = doc.css('dd')[j].css('span')[1].text
  if temp == "0.00000s"         
    t= t+1
  end       
  j+= 1
 end 
puts b   #testsuite_time
puts t   

  File.open(File.join(real_path,"/results.xml"),"w"){|f| f.puts("<?xml version='1.0' encoding='UTF-8'?>
<testsuite name='#{doc.css('dt').text}' tests='#{doc.css('dd').count-t}' time='#{b.to_i}' failures='0' errors='#{doc.css("dd[class='example failed']").count-t}' skipped='0'>
  <properties/>")}
  
  k= 0
  case_num = doc.css('dd').count.to_i
  case_num_page = doc.css('dt').count.to_i
  puts case_num_page
 while k< case_num_page 
  i= 0
  case_num=doc.css('dl')[k].css('dd').count.to_i
  while i< case_num
   if doc.css('dl')[k].css('dd')[i]['class'] == "example failed"
     if doc.css('dl')[k].css('dd')[i].css('span')[1].text == "0.00000s"
       break
     else
     File.open(File.join(real_path,"/results.xml"),"a"){|f| f.puts("  <testcase classname='#{doc.css('dt')[k].text}.lazyman' name='#{doc.css('dl')[k].css('dd')[i].css('span')[0].text}' time='#{doc.css('dl')[k].css('dd')[i].css('span')[1].text.delete('s')}'>
  <failure type='failed' message='#{doc.css('dl')[k].css('dd')[i].css('span')[0].text}'>
<![CDATA[#{doc.css('dl')[k].css('dd')[i].css("div[class='message']").text} #{doc.css('dl')[k].css('dd')[i].css("div[class='backtrace']").text}]]>
  </failure>
  </testcase>    
")}  
       
     end
    puts doc.css('dd')[i].css('span')[0].text               #testcase name
    puts doc.css('dd')[i].css('span')[1].text               #time 
    puts doc.css("div[class='message']").text               #message
    puts doc.css("div[class='backtrace']").text             #backtrace
   else
     File.open(File.join(real_path,"/results.xml"),"a"){|f| f.puts("  <testcase classname='#{doc.css('dt')[k].text}.lazyman' name='#{doc.css('dl')[k].css('dd')[i].css('span')[0].text}' time='#{doc.css('dl')[k].css('dd')[i].css('span')[1].text.delete('s')}'>
  </testcase>")}
     
    puts doc.css('dd')[i].css('span')[0].text               #testcase name
    puts doc.css('dd')[i].css('span')[1].text               #time
   end
   puts doc.css('dd')[i].text
  i+= 1
 end
 k+= 1
end 

File.open(File.join(real_path,"/results.xml"),"a"){|f| f.puts("</testsuite>")}  
 akk = doc.css('dl')[0].css('dd')[0].css('span')[0].text
 
end#def 
end#class

a = Report_html_to_xml.new.post_info("app/reports")





