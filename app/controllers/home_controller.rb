class HomeController < ApplicationController
  before_action :set_key, only: [:pdfgen, :pdf_2, :pdf_3, :pdf_4]
  require "prawn"
  def index
  end
  def pdfgen
      Prawn::Document.generate("#{Rails.root}/public/pdfs/1/#{@key}.pdf", page_size: "A4", page_layout: :portrait) do
        font_families.update(
          HomeController.font_setting()
        )
        font_size 8
        font "NanumBarunGothic"
        data = [[{content: "결재", rowspan: 2},"시작시","경리확인","완료시"],[" ","",""]]
        table data, position: :right, column_widths: [20,40,40,40]
        font_size(20) { text "수속 체크 리스트", align: :center, style: :bold}
        move_down 15
        procedure = [["ISEP No", "[100100100][수속]", "수속신청일", "2016-01-27 11:11:23"],
                     ["상담원 / 행정원", "최진숙 / 최진숙", "수속시작일", "2016-01-11"],
                     ["FINISH DATE", {content: "", colspan: 3}],
                     ["이름", "서훈교", "이름(영문)", "Seo, Hoon Gyo"],
                     ["주민번호", "123456-1234567", "Email", "test@test.com"],
                     ["전화번호", "00-0000-0000", "휴대폰번호", "010-0000-0000"],
                     ["주소", {content: "서울시 마포구 마포대로 1길", colspan:3}],
                     ["최종학력", "", "출신학교", "재능대학"],
                     ["전공", "호텔조리", "학년", "졸업"],
                     ["영어시험점수", "", "가입동기", ""]
                    ]
        table procedure, position: :left, column_widths: [75, 120, 75, 120]

        move_down 15
        font_size(10) { text "[학교]", style: :bold }
        school = [["No","허가","확정","국가", {content: "희망학교", colspan: 2}, {content: "과정", colspan: 2} , "기간"]]
        table school, position: :left, column_widths: [25,25,25,40,90,90,90,90,48]
        schools = [[{content: "1", rowspan: 3}, "Y", "Y", "호주", {content: "Test School1", colspan: 2}, {content: "Test Course1", colspan: 2}, "30주"],
                   [{content: "과정시작일", colspan: 3}, "과정종료일", "입학신청서류완료일", "입학신청일", "입학허가일", "학비"],
                   [{content: "2016-02-29", colspan: 3}, "2017-06-30", "2015-12-22", "2015-12-22", "2016-07-11", "3000.00"]
                  ]
        table schools, position: :left, column_widths: [25,25,25,40,90,90,90,90,48]
        schools = [[{content: "2", rowspan: 3}, "Y", "Y", "호주", {content: "Test School2", colspan: 2}, {content: "Test Course2", colspan: 2}, "30주"],
                   [{content: "과정시작일", colspan: 3}, "과정종료일", "입학신청서류완료일", "입학신청일", "입학허가일", "학비"],
                   [{content: "2016-02-29", colspan: 3}, "2017-06-30", "2015-12-22", "2015-12-22", "2016-07-11", "3000.00"]
                  ]
        table schools, position: :left, column_widths: [25,25,25,40,90,90,90,90,48]
        schools = [[{content: "3", rowspan: 3}, "Y", "Y", "호주", {content: "Test School3", colspan: 2}, {content: "Test Course3", colspan: 2}, "30주"],
                   [{content: "과정시작일", colspan: 3}, "과정종료일", "입학신청서류완료일", "입학신청일", "입학허가일", "학비"],
                   [{content: "2016-02-29", colspan: 3}, "2017-06-30", "2015-12-22", "2015-12-22", "2016-07-11", "3000.00"]
                  ]
        table schools, position: :left, column_widths: [25,25,25,40,90,90,90,90,48]

        move_down 15
        font_size(10) { text "[보험]", style: :bold }
        insurance = [["보험종류", "증권번호"],
                     [" ", " "]]
        table insurance, position: :left, column_widths: [231, 292]

        move_down 15
        font_size(10) { text "[여권]", style: :bold }
        passport = [["개인 소지", "서류 완비일", "발급일", "만료일", "여권번호"],
                    ["N", "2015-11-11", "2015-11-11", "2025-11-11", "M1515151515"]]
        table passport, position: :left, column_widths: [83, 110, 110, 110, 110]

        move_down 15
        font_size(10) { text "[비자]", style: :bold }
        visa = [["서류완비일", "비자번호", "대사관 접수일", "영수증번호", "신검결과", "발급일", "만료일"],
                [" ","","","","N","",""],
                [{content: "비자용 허가서 완료일", colspan: 2}, "", {content: "비자등기번호", colspan: 2}, {content: " ", colspan: 2}]]
        table visa, position: :left, column_widths: [75, 75, 75, 75, 74, 74, 75]

        move_down 15
        font_size(10) { text "[항공]", style: :bold }
        aviation = [["예약일", "여행사", "발권일", "Orientation"],
                    [" ", "", "", ""]]
        table aviation, position: :left, column_widths: [100, 163, 100, 160]
      end
      redirect_to "/pdfs/1/#{@key}.pdf"
  end
  def pdf_2
    Prawn::Document.generate("#{Rails.root}/public/pdfs/2/#{@key}.pdf", page_size: "A4", page_layout: :portrait) do
      font_families.update(
        HomeController.font_setting()
      )
      font "NanumBarunGothic"
      font_size (12) {text "NO 297060-1", align: :left}
      move_down 15
      font_size (25) {text "청   구   서", align: :center, style: :bold}
      move_down 35
      font_size (12) {text "수 신: 신안산대학교 (경기도 안산시 단원구 초지동 671)"}
      move_down 20
      font_size (12) {text "발 신: 세계교육연구원 (호주 Melbourne Politechnic 한국 대표부)"}
      move_down 20
      font_size (12) {text "일 자: 2016년 10월 11일"}
      move_down 20
      font_size (12) {text "항 목: 국제관광경영과 교육과정 공동운영 학기별 비용 (1학년 2학기)"}
      move_down 20
      detail_text=[["세부 내역:","<u><font size='10'>수업료 기준:</font></u>\t<u><font size='10'>￦2,890,000</font></u>"],
      ["",""]]
      table (detail_text) do
        row(0..1).style( :inline_format => true, :align => :left, :border_width => 0)
        row(1).height =1
        row(0).columns(0).padding_left=-0.4
        row(0).columns(0).width=320
      end
      move_down 10
      detail =[["구분","인원","1인당 비용","금액"],
      ["국제관광경영과 교육과정 공동운영 학기별 비용 총 118명\n(총 118명 중 1~40명)","40","￦578,000\n<font size='10'>수업료의 20%</font>","￦23,120,000"],
      ["국제관광경영과 교육과정 공동운영 학기별 비용 총 118명\n(총 118명 중 1~40명)","40","￦578,000\n<font size='10'>수업료의 20%</font>","￦23,120,000"],
      ["국제관광경영과 교육과정 공동운영 학기별 비용 총 118명\n(총 118명 중 1~40명)","40","￦578,000\n<font size='10'>수업료의 20%</font>","￦23,120,000"],
      [{content: "학기별 비용 총합계", colspan: 3},"￦51,442,000"]]
      table(detail , :position => 50,  column_widths: [190,40,90,130], cell_style:  { :inline_format => true, :align => :center, :valign => :center, padding_top: -1}) do
        cells.border_width =0.5
        row(0..1).border_top_width=2
        [0..4].each do |a|
          row(a).columns(0).border_left_width=2
          row(a).columns(3).border_right_width=2
          row(4).columns(a).border_bottom_width=2
          row(4).columns(a).border_top_width=2
        end
        row(0).height=35
        row(4).height=35
        row(4).background_color='AAFFAA'
      end
      move_down 10
      font_size (12) {text_box "* 교육과정 공동운영 학기별 비용 반환 규정은 『교육과학기술부령 제1호 대학 수업료 및
         입학금에 관한 규칙의 \"수업료 또는 입학금의 반환 기준(제6조 2항 관련)\"에 따릅니다.",
       :at => [50, cursor]}
      move_down 50
      font_size (12) {text "입금 은행: 스탠다드차타드은행 130-20-450129 (예금주: 아이셉코리아)"}
      move_down 100
      font_size (17) {text "아이셉코리아(주)세계교육연구원
        대표이사/원장 김 중 근", align: :center}
      move_down 50
      #stroke_axis
      self.line_width = 18
      stroke do
        horizontal_line 0, 520
      end
    end
    redirect_to "/pdfs/2/#{@key}.pdf"
  end
  def pdf_3
    Prawn::Document.generate("#{Rails.root}/public/pdfs/3/#{@key}.pdf", page_size: "A4", page_layout: :portrait) do
      font_families.update(
        HomeController.font_setting()
      )
      font "NanumBarunGothic"
      font_size (10)
      # stroke_axis
      font_size (20) {text_box "INVOICE", align: :center, at: [0,694]}
      stroke_rectangle [0, 700], 520, 35
      move_down 120
      invoice = [["■ INVOICE NO:","296120"],
      ["■ DATE:","01 Apr 2016"],
      ["■ TO:","Luke Howard
        International Project Officer, International
        Melbourne Polytechnic"],
      ["■ FROM:","ISEP KOREA Co., Ltd.
        A-803 Le Meilleur Jongno Town, Jongno-1ga, Jongno-Gu,
        Seoul 03157 Korea"]]
      table invoice ,  column_widths: [140,350], cell_style:  { :inline_format => true, :align => :left, :border_width => 0}
      move_down 30
      description = [["NO","DESCRIPTION",{content: "AMOUNT CLAIMED",colspan: 2}],
      [{content: "", colspan: 4}],
      ["1","Name in Full: SEO, Hoon Gyo (165910)
        Date of Birth: 17, Oct. 1989
        Course: ELICOS
        Commencement Date: 29, Feb, 2016
        Course Fee: AUD6,0000
        Amount Claimed: AUD600","Sub Total","AUD600"],
      [{content: "", colspan: 4}],
      [{content: "" , colspan: 2},"TOTAL","AUD600"]]
      table(description) do
        cells.padding = 3
        cells.padding_top =1
        columns(0).width= 30
        columns(1).width= 320
        row(0).columns(2).width= 150
        row(1).height=2
        row(2).height=100
        row(3).height=2
        row(0).style(:size =>10)
        row(0).columns(1..2).style(:align => :center)
        row(2).columns(1).style(:padding => [0, 0, 0, 30])
        row(4).columns(0).borders=[:left,:bottom]
        [2,4].each do |a|
          row(a).columns(2).borders=[:bottom]
          row(a).columns(3).borders=[:bottom,:right]
          row(a).columns(3).style(align: :right)
        end
        row(4).style(font_style: :bold)
        row(0).background_color ="AAFFAA"
      end
      move_down 30
      text "■ ISEP KOREA Co., Ltd. Bank Account Details:"
      move_down 15
      account_detail=[["1.Bank Name:","Standard Chartered Bank Korea Limited"],
      ["2.Bank Account No","130-85-018827"],
      ["3.Swift Code:","SCBLKRSE"],
      ["4.Branch Name:","Gwanghwamun Branch"],
      ["5.Bank Telephone No:","+82-2-735-7678"],
      ["6.Bank Address:","1, Jongro1_ga, Jongro-gu, Seoul, Korea(Zip code:03154)"],
      ["7.Beneficiary Name:","ISEP KOREA, Co., Ltd"],
      ["8.Beneficiary Address","Jongno 19, A-803(Jongno-1ga, LeMeilleur Jongno Town)
        Jongno-Gu
        Seoul 03157, Korea"]]
      table account_detail,  column_widths: [140,350], cell_style:  { :inline_format => true, :align => :left, :border_width => 0, min_height: 23, padding_bottom: 0}
    end
    redirect_to "/pdfs/3/#{@key}.pdf"
  end
  def pdf_4
    Prawn::Document.generate("#{Rails.root}/public/pdfs/4/#{@key}.pdf", page_size: "A4", page_layout: :landscape) do
      font_families.update(
        HomeController.font_setting()
      )
      font "NanumBarunGothic"
      font_size (10)
      font_size (15){text "입출금 관리", align: :center}
      move_down 10
      text "날 짜 : 2016-09-02 ~"
      move_down 10
      withdraw_headers = [[{content: "날짜", rowspan: 2},{content: "회사구분", rowspan: 2},{content: "계정과목", rowspan: 2},{content: "수입", colspan: 2},{content: "지출", colspan: 2},"영수증No.","학생이름",
        {content: "학교명", rowspan: 2},"내용"],
        ["수입액","예수금","송금액","경비금액","ISEP No.","상담원","입출금"]]
      withdraw_data = [[{content: "", rowspan: 2},{content: "GEL", rowspan: 2},{content: "학비 프리미엄 \n차익", rowspan: 2},{content: "652,000", rowspan: 2},{content: "0", rowspan: 2},{content: "0", rowspan: 2},
      {content: "0", rowspan: 2},"4209","신안산대학교",{content: "Bradford College", rowspan: 2},"실내디자인과 교육과정 공동운영 학기별비용 2학년 1학기"],
      ["294051-2","",""]]*30

      table(withdraw_headers + withdraw_data, :header => 2) do
          cells.min_height=20
          cells.padding_top=1
          cells.style(align: :center, valign: :center)
          style row(0..1), :background_color => "DDDDDD", :font_style => :bold
          row(0).columns(0).width= 50
          row(0).columns(1).width= 50
          row(0).columns(10).width=220
          row(0..1).min_height=10
          [3..8].each do |d|
            row(0).columns(d).width=50
          end
      end
    end
    redirect_to "/pdfs/4/#{@key}.pdf"
  end
  private
  def set_key
    @key = SecureRandom.hex
  end
  def self.font_setting
      {"sans-serif" => {
      normal: "#{Rails.root}/vendor/assets/fonts/OpenSans-Regular.ttf",
      italic: "#{Rails.root}/vendor/assets/fonts/OpenSans-Italic.ttf",
      bold: "#{Rails.root}/vendor/assets/fonts/OpenSans-Bold.ttf"
      },
      "NanumBarunGothic" => {
        normal: "#{Rails.root}/vendor/assets/fonts/NanumBarunGothic.ttf",
        bold: "#{Rails.root}/vendor/assets/fonts/NanumBarunGothicBold.ttf"
      },
      "Human" => {
        normal: "#{Rails.root}/vendor/assets/fonts/hm_v2.ttf",
        bold: "#{Rails.root}/vendor/assets/fonts/hmkmm-boram2059.ttf"
      }
      }
  end
end
