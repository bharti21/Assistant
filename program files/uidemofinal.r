library(shiny)
library(shinydashboard)
library(shinythemes)
library(graphics)

ui<-dashboardPage(
  skin = "blue",

  dashboardHeader(
    
    title = "Review Bot",
                   dropdownMenu(
                     type="message",
                     messageItem(from = "Update",message = "Welcome back!"),
                     messageItem(from = "Update2", message  ="Hi there! Look what is new",icon = icon("bar-chart"))
                   ),
                   dropdownMenu(type="notifications", badgeStatus = "primary", icon= icon("bell"),
                      notificationItem(
                   text = "2 new offers for Redmi Note 4 available on Amazon",
                   icon = icon("envelope"),
                   status="primary"
                 )
                   )
                  ),
  
  dashboardSidebar(sidebarMenu(
    menuItem("Home",tabName = "Home",icon = icon("dashboard")),
    menuItem("Electronics", tabName = "Electronics", icon = icon("edge")),
    #menuItem("Shoes", tabName = "Shoes", icon = icon("strikethrough")),
    #menuItem("Bags", tabName = "Bags", icon = icon("bold")),
    #menuItem("Books", tabName = "Books" , icon = icon("pagelines")),
    menuItem("Mobile",tabName = "Mobiles",icon = icon("dashboard")),
    menuItem("Camera",tabName = "Cameras",icon = icon("dashboard")),
    menuItem("Earphone",tabName = "Earphones",icon = icon("dashboard")),
    menuItem("Laptop",tabName = "Laptops",icon = icon("dashboard")),
    menuItem("Tv",tabName = "TV",icon = icon("dashboard")),
    menuItem("Pendrive",tabName = "Pendrives",icon = icon("dashboard")),
    textInput("product","Enter product to search")
    
  )
  ),
  
  dashboardBody(
    tags$head(
      tags$link(rel="stylesheet",type="text/css",href="custom.css")
    ),
    tabItems(
      tabItem(tabName = "Home",
              fluidRow(
                box(title = "Search here",status = "warning",height = 150,
                    textInput(inputId = "searchTerm", label = "Enter keyword", placeholder = "keyword",value="Samsung"))
                )),
            
      tabItem(tabName = "Electronics",
              
              h2("Sub section"),
              selectInput("state", "Choose a category:",
                          list(`Mobiles` = c("Xiomi", "Samsung", "Moto","Vivo","Apple"),
                               `Camera` = c("Nikon", "Canon"),
                               `Earphones` = c("JBL", "Sennheiser", "SkullCandy"),
                               `Laptop`=c("Dell","HP","Lenovo"),
                               `TV`=c("Samsung","LG","Panasonic"),
                               `Pendrive`=c("HP","SanDisk"))
              ),
              textOutput("result"),
              
              h2("Categories available"),
              fluidRow(
                box( title="Mobiles", status = "primary",  collapsible = TRUE,
                     selectInput("state","Choose product",
                                 list(`Mobiles`=c("Xiomi", "Samsung", "Moto","Vivo","Apple")))),
                box( title="Camera", status = "warning",  collapsible = TRUE,
                     selectInput("state","Choose product",
                                 list(`Camera`=c("Nikon", "Canon")))),
                box(title="Earphones",status = "success", collapsible = TRUE,
                    selectInput("state","Choose product",
                                list(`Earphones`=c("JBL", "Sennheiser","SkullCandy")))
                ),
                box(title="Laptop",status = "info", collapsible = TRUE,
                    selectInput("state","Choose product",
                                list(`Laptop`=c("Dell", "HP","Lenovo")))),
                box(title="TV",status = "danger", collapsible = TRUE,
                    selectInput("state","Choose product",
                                list(`TV`=c("Samsung", "LG","Panasonic")))),
                box(title="Pendrive",status="info",collapsible=TRUE,
                    selectInput("state","Choose product",
                                list(`Pendrive`=c("HP", "SanDisk"))
                                #actionLink("link", "Help"),
                               # tags$link(rel = "stylesheet", type = "text/css", href = "sample.css"),
                               # tabsetPanel(
                  # type="tab",
                  # tabPanel("HP",textOutput("myhp"))
                  # tabPanel("SanDisk",textOutput("mysandisk"))
                # )
                    ),
                    verbatimTextOutput("txt"),
                    htmlOutput("text2")
                    
                )
                
              ) ),
      tabItem(tabName = "Mobiles",
              h2("Products Available"),
              fluidRow(
                box(title="Redmi Note 4 (Black 32 GB)  (3 GB RAM)",status = "info",width="100%" ,solidHeader = TRUE, collapsible = TRUE,
                    
                    tags$p("The product inormation is mentioned as follows:",align="left")
                    ,align = "left",
                    tags$img(src="redmin4.jpg",height=180,width=100,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot13", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        align="right",
                        tableOutput("redmiA"),
                        tags$a(href="https://www.amazon.in/dp/B01NAKU5HE/ref=twister_B076WWTBKW?_encoding=UTF8&psc=1","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                       # tags$img(src="redmin4.jpg",height=180,width=120),
                       align="right",
                       tableOutput("redmiF"),
                        tags$a(href="https://www.flipkart.com/redmi-note-4-black-32-gb/p/itmeqe4htst9587b?pid=MOBEQ98THNGR4FD5&srno=s_1_1&otracker=search&lid=LSTMOBEQ98THNGR4FD5V3OUHB&fm=SEARCH&iid=32806731-dd81-409a-93ac-1ef0f4847dd8.MOBEQ98THNGR4FD5.SEARCH&qH=9dc9452489326671","Liked it? Click here!")
                    )
                    ),
                box(title="Samsung Galaxy J7 Prime (Black 32 GB)  (3 GB RAM)",solidHeader = TRUE,status = "info",width="100%" , collapsible = TRUE,
                    
                    tags$p("The product inormation is mentioned as follows:",align="left"),
                    tags$img(src="samsungj7.jpg",height=180,width=100,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot14", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("samA"),
                        tags$a(href="https://www.amazon.in/Samsung-Galaxy-Prime-Black-32GB/dp/B06Y3JH7TN/ref=sr_1_1?s=electronics&ie=UTF8&qid=1509304517&sr=1-1&keywords=Samsung+Galaxy+J7+Prime+%28Black%2C+32+GB%29++%283+GB+RAM%29","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        #tags$img(src="samsungj7.jpg",height=180,width=120),
                        tableOutput("samF"),
                        tags$a(href="https://www.flipkart.com/samsung-galaxy-j7-prime-black-32-gb/p/itmeswzmfun5nmfe?pid=MOBESWZMSJZXCD8T&srno=s_1_1&otracker=search&lid=LSTMOBESWZMSJZXCD8T6BEHZD&fm=SEARCH&iid=3d201b6f-4604-4476-9903-916124722c93.MOBESWZMSJZXCD8T.SEARCH&qH=d9aea82a6e0883a4","Liked it? Click here!")
                    )
                ),
                box(title="Moto G4 Plus (White 16 GB)  (2 GB RAM)",solidHeader = TRUE,status = "info",width="100%" , collapsible = TRUE,
                    
                    tags$p("The product inormation is mentioned as follows:",align="left"),
                    tags$img(src="moto.jpg",height=180,width=100,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot15", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("motoA"),
                        tags$a(href="https://www.amazon.in/Moto-Plus-4th-Gen-White/dp/B01DDP85KU/ref=sr_1_1?s=electronics&ie=UTF8&qid=1509304160&sr=1-1&keywords=Moto+G4+Plus+%28White%2C+16+GB%29++%282+GB+RAM%29","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                       # tags$img(src="moto.jpg",height=180,width=120),
                       tableOutput("motoF"),
                        tags$a(href="https://www.flipkart.com/moto-g4-plus-white-16-gb/p/itmeuqa6rgfxm9vf?pid=MOBEUQA6EPPTQUGJ&srno=s_1_2&otracker=search&lid=LSTMOBEUQA6EPPTQUGJ9P0MZ2&fm=SEARCH&iid=d7c7c69b-96e7-401e-bb7f-a938062c728a.MOBEUQA6EPPTQUGJ.SEARCH&qH=f73e68d4fc9865d5","Liked it? Click here!")
                    )
                ),
                box(title= "VIVO V5s Perfect Selfie (Matte Black 64 GB)  (4 GB RAM)",solidHeader = TRUE,status = "info",width="100%", collapsible = TRUE,
                   
                    tags$p("The product inormation is mentioned as follows:",align="left"),
                    tags$img(src="vivo-v5s.jpg",height=180,width=100,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot16", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("vivoA"),
                        tags$a(href="https://www.amazon.in/Vivo-V5s-Matte-Black-Offers/dp/B071P2FNF2/ref=sr_1_1?s=electronics&ie=UTF8&qid=1509304626&sr=1-1&keywords=vivo+v5","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                       # tags$img(src="vivo-v5s.jpg",height=180,width=120),
                       tableOutput("vivoF"),
                        tags$a(href="https://www.amazon.in/Vivo-V5s-Matte-Black-Offers/dp/B071P2FNF2/ref=sr_1_1?s=electronics&ie=UTF8&qid=1509304626&sr=1-1&keywords=vivo+v5","Liked it? Click here!")
                    )
                ),
                box(title="Apple iPhone 7 (Black 32 GB)",solidHeader = TRUE,status = "info",width="100%", collapsible = TRUE,
                    
                    tags$p("The product inormation is mentioned as follows:",align="left"),
                    tags$img(src="apple7flip.jpg",height=180,width=100,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot17", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("appleA"),
                        tags$a(href="https://www.amazon.in/Apple-iPhone-7-Black-32GB/dp/B01LZKSVRB/ref=sr_1_1?s=electronics&ie=UTF8&qid=1509302972&sr=1-1&keywords=Apple+iPhone+7+%28Black%2C+32+GB%29","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        #tags$img(src="apple7flip.jpg",height=180,width=120),
                        tableOutput("appleF"),
                        tags$a(href="https://www.flipkart.com/apple-iphone-7-black-32-gb/p/itmen6daftcqwzeg?pid=MOBEMK62PN2HU7EE&srno=s_1_1&otracker=search&lid=LSTMOBEMK62PN2HU7EEINTGNU&fm=SEARCH&iid=f0dc4205-2037-4864-af77-ef7d2bc4987a.MOBEMK62PN2HU7EE.SEARCH&qH=1f3870be274f6c49","Liked it? Click here!")
                    )
                )
              )
              ),
      tabItem(tabName = "Cameras",
              
              
              h2("Products Available"),
              fluidRow(
                box( title="Nikon D3400 DSLR Camera Body with Single Lens: AF-P DX NIKKOR 18-55 mm f/3.5-5.6G VR Kit",solidHeader = TRUE,width = "100%", status = "info",  collapsible = TRUE,
                     tags$p("The product inormation is mentioned as follows:",align="left"),
                     tags$img(src="nikon.jpg",height=180,width=200,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot11", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("nikonA"),
                         tags$a(href="https://www.amazon.in/Nikon-Digital-Camera-18-55mm-3-5-5-6G/dp/B01KITZKDE/ref=sr_1_fkmr0_1?s=electronics&ie=UTF8&qid=1509304268&sr=1-1-fkmr0&keywords=Nikon+D3400+DSLR+Camera+Body+with+Single+Lens%3A+AF-P+DX+NIKKOR+18-55+mm+f%2F3.5-5.6G+VR+Kit","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        # tags$img(src="nikon.jpg",height=180,width=120),
                        tableOutput("nikonF"),
                         tags$a(href="https://www.flipkart.com/nikon-d3400-dslr-camera-body-single-lens-af-p-dx-nikkor-18-55-mm-f-3-5-5-6g-vr-kit-16-gb-sd-card-bag/p/itmemgqgdmygjxc8?pid=DLLEMGQGHHF29FH3&srno=s_1_2&otracker=search&lid=LSTDLLEMGQGHHF29FH3CIBZGJ&fm=SEARCH&iid=78c7a0dd-22d8-4f2b-ab1c-2654c62a438f.DLLEMGQGHHF29FH3.SEARCH&qH=0006fd3b52ce1454","Liked it? Click here!")
                     )
                     ),
                box(title="Canon EOS 750D 24.2MP Digital SLR Camera (Black) + 18-55 IS STM Lens + Memory Card 0+ Carry Bag",solidHeader = TRUE,width = "100%", status = "info",  collapsible = TRUE,
                    
                    tags$p("The product inormation is mentioned as follows:",align="left"),
                    tags$img(src="canon.jpg",height=180,width=200,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot12", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("canonA"),
                        tags$a(href="https://www.amazon.in/Canon-EOS-750D-24-2MP-Digital/dp/B00W3AB0P4","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                       # tags$img(src="canon.jpg",height=180,width=120),
                       tableOutput("canonF"),
                        tags$a(href="https://www.flipkart.com/canon-eos-750d-body-single-lens-18-55mm-16-gb-sd-card-camera-bag-dslr/p/itme77r3abdnxyyz?pid=CAME77R3EZDGHMGY&srno=s_1_8&otracker=search&lid=LSTCAME77R3EZDGHMGYX2FAD8&fm=SEARCH&iid=e7e7f080-acbb-4e82-8616-ecdfc305e063.CAME77R3EZDGHMGY.SEARCH&qH=a13f9454144535e3","Liked it? Click here!")
                    )
                    )
                
              )
              
      ),
      tabItem(tabName = "Earphones",
              
              h2("Products Available"),
              fluidRow(
                box( title="Sennheiser CX 180 Wired Headphone ",solidHeader =TRUE , width="100%", color= "olive" ,collapsible = TRUE,
                     
                     tags$p("The product inormation is mentioned as follows:",align="left"),
                     tags$img(src="sen.jpg",height=180,width=100,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot9", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("senhA"),
                         tags$a(href="https://www.amazon.in/Sennheiser-CX-180-Street-II/dp/B00D75AB6I","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                         #tags$img(src="sen.jpg",height=180,width=120),
                         tableOutput("senhF"),
                         tags$a(href="https://www.flipkart.com/sennheiser-cx-180-wired-headphone/p/itmex9sgwc9cgkcy?pid=ACCDAW7PJXCC9QF3&srno=s_1_1&otracker=search&lid=LSTACCDAW7PJXCC9QF34KZRQV&fm=SEARCH&iid=55692104-dfde-482d-b221-fd6c1e6ad77d.ACCDAW7PJXCC9QF3.SEARCH&qH=ef280b8fdc3ed748","Liked it? Click here!")
                     )
                ),
                box( title="JBL C300SI On-Ear Dynamic Wired Headphones ",solidHeader =TRUE ,width="100%",color ="lime" ,collapsible = TRUE,
                     
                     tags$p("The product inormation is mentioned as follows:",align="left"),
                     tags$img(src="jbl.jpg",height=180,width=200,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot8", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("jblA"),
                         
                         tags$a(href="https://www.amazon.in/JBL-C300SI-Dynamic-Wired-Headphones/dp/B01FXJI1OY/ref=cm_cr_arp_d_product_top?ie=UTF8","Liked it? Click here!")
                     ),
                     
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        # tags$img(src="jbl.jpg",height=180,width=120),
                        tableOutput("jblF"),
                         tags$a(href="https://www.flipkart.com/jbl-c300si-wired-headphone/p/itmehdhzk76gmzjg?pid=ACCEHDHZHXMD8GUH&srno=s_1_1&otracker=search&lid=LSTACCEHDHZHXMD8GUHA3N6ZA&fm=SEARCH&iid=cd58e9f8-3547-4736-b186-e54eebbba7f9.ACCEHDHZHXMD8GUH.SEARCH&qH=335b5ebd19c6f098","Liked it? Click here!")
                     )
                ),
                box( title="SkullCandy",solidHeader =TRUE ,width="100%",color ="orange" ,collapsible = TRUE,
                      tags$img(src="skull.jpg",height=150,width=90,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot10", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("skullA"),
                         tags$a(href="https://www.amazon.in/Skullcandy-S2DUHZ-335-Ear-Headphones-Black/dp/B00U57WIYO/ref=sr_1_fkmr0_1?s=electronics&ie=UTF8&qid=1509277292&sr=1-1-fkmr0&keywords=Skullcandy+Jib+S2DUHZ-335+Wired+Headphone","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        # tags$img(src="skull.jpg",height=180,width=120),
                        tableOutput("skullF"),
                         tags$a(href="https://www.flipkart.com/skullcandy-jib-s2duhz-335-wired-headphone/p/itmeddw8tsayvrqg?pid=ACCEDDW8DTDXHZVZ&srno=s_1_1&otracker=search&lid=LSTACCEDDW8DTDXHZVZZKBCVL&fm=SEARCH&iid=84d8347f-0e58-4db6-9ffc-9660d695c71e.ACCEDDW8DTDXHZVZ.SEARCH&qH=38bfb9a3f340a250","Liked it? Click here!")
                     )
                )
              ) ),
      tabItem(tabName = "Laptops",
              
              h2("Products Available"),
              fluidRow(
                box( title="Dell Inspiron 5000 Core i5 7th Gen - (8 GB/2 TB HDD/Windows 10 Home/4 GB Graphics) 5567 Laptop  (15.6 inch, Black)",solidHeader =TRUE , width="100%", color= "olive" ,collapsible = TRUE,
                     tags$img(src="dell.jpg",height=180,width=200,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot5", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("dellA"),
                         tags$a(href="https://www.amazon.in/Dell-Inspiron-5567-15-6-inch-i5-7200U/dp/B0749GG1VP/ref=sr_1_fkmr0_2?ie=UTF8&qid=1509277885&sr=8-2-fkmr0&keywords=Dell+Inspiron+5000+Core+i5+6th+Gen+-+%288+GB%2F1+TB+HDD%2FWindows+10+Home%2F4+GB+Graphics%29+5559+Laptop++%2815.6+inch%2C+SIlver%2C+2.4+kg%29+3.8+%E2%98%85","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        # tags$img(src="dell.jpg",height=180,width=120),
                        tableOutput("dellF"),
                         tags$a(href="https://www.flipkart.com/dell-inspiron-5000-core-i5-7th-gen-8-gb-2-tb-hdd-windows-10-home-4-gb-graphics-5567-laptop/p/itmesy4kfgct7e5g?pid=COMESY4KYASDKYWZ&srno=s_1_1&otracker=search&lid=LSTCOMESY4KYASDKYWZAE7REC&fm=SEARCH&iid=3c14f5fd-689c-4fa9-8a11-592d97cf667a.COMESY4KYASDKYWZ.SEARCH&qH=c79093d35e879447","Liked it? Click here!")
                     )
                ),
                box( title="HP OMEN Core i5 7th Gen - (8 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) 15-ax248TX Gaming Laptop  (15.6 inch, Black)",solidHeader =TRUE ,width="100%",color ="lime" ,collapsible = TRUE,
                     tags$img(src="hp.jpg",height=180,width=200,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot6", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("hpA"),
                         tags$a(href="https://www.amazon.in/HP-AX248TX-15-6-inch-i5-7300-Graphics/dp/B06XBYKPKL/ref=sr_1_fkmr0_1?ie=UTF8&qid=1509278261&sr=8-1-fkmr0&keywords=HP+OMEN+Core+i5+7th+Gen+-+%288+GB%2F1+TB+HDD%2FWindows+10+Home%2F2+GB+Graphics%29+15-ax248TX+Gaming+Laptop++%2815.6+inch%2C+Black%29","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                         #tags$img(src="hp.jpg",height=180,width=120),
                         tableOutput("hpF"),
                         tags$a(href="https://www.flipkart.com/hp-omen-core-i5-7th-gen-8-gb-1-tb-hdd-windows-10-home-2-gb-graphics-15-ax248tx-gaming-laptop/p/itmergrnenkyf3kk?pid=COMERGRN2QGF4UZC&srno=s_1_3&otracker=search&lid=LSTCOMERGRN2QGF4UZC1D4AFV&fm=SEARCH&iid=a497cec2-d96a-49e0-a3f1-68848d1782ce.COMERGRN2QGF4UZC.SEARCH&qH=daedeb48fd3b67f9","Liked it? Click here!")
                     )
                ),
                box( title="Lenovo Ideapad Core i5 7th Gen - (4 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) IP 320 Laptop(15.6 inch Grey 2.2 kg)",solidHeader =TRUE ,width="100%",color ="orange" ,collapsible = TRUE,
                     tags$img(src="lenovoam.jpg",height=180,width=200,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot7", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("lenovoA"),
                         tags$a(href="https://www.amazon.in/s/ref=nb_sb_noss_1?url=node%3D1375424031&field-keywords=lenovo+laptop&rh=n%3A976392031%2Cn%3A1375424031%2Ck%3Alenovo+laptop","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                         #tags$img(src="lenovoflip.jpg",height=180,width=120),
                         tableOutput("lenovoF"),
                         tags$a(href="https://www.flipkart.com/search?q=lenovo%20laptop&otracker=start&as-show=on&as=off","Liked it? Click here!")
                     )
                )
              ) ),
      
      tabItem(tabName = "TV",
              
              h2("Products Available"),
              fluidRow(
                box( title="Samsung 123 cm (49 inches) Series 5 49K5300-SF Full HD LED Smart TV (Indigo Black)",solidHeader =TRUE , width="100%", color= "olive" ,collapsible = TRUE,
                     tags$img(src="samsungtvam.jpg",height=177,width=120,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot2", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("samtvA"),
                         tags$a(href="https://www.amazon.in/s/gp/search/ref=sr_nr_p_n_size_browse-bin_4?fst=p90x%3A1%2Cas%3Aoff&rh=n%3A976419031%2Cn%3A1389375031%2Cn%3A1389396031%2Ck%3Asamsung+tv&keywords=samsung+tv&ie=UTF8&qid=1509276561","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                         #tags$img(src="samsungtvflip.jpg",height=180,width=120),
                         tableOutput("samtvF"),
                         tags$a(href="https://www.flipkart.com/search?as=off&as-show=on&count=40&otracker=start&q=samsung+tv&sid=ckf%2Fczl","Liked it? Click here!")
                     )
                     ),
                box( title="LG 123 cm (49 inches) 49LJ523T Full HD LED TV",solidHeader =TRUE ,width="100%",color ="lime" ,collapsible = TRUE,
                      tags$img(src="lgtvam.jpg",height=177,width=120,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot4", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                        tableOutput("lgA"),
                         tags$a(href="https://www.amazon.in/s/gp/search/ref=sr_nr_p_n_size_browse-bin_4?fst=p90x%3A1%2Cas%3Aoff&rh=n%3A976419031%2Cn%3A1389375031%2Cn%3A1389396031%2Ck%3Alg+tv&keywords=lg+tv&ie=UTF8&qid=1509276266","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                         #tags$img(src="lg-tvflip.jpg",height=180,width=120),
                         tableOutput("lgF"),
                         tags$a(href="https://www.flipkart.com/search?q=Lg%20tv&otracker=start&as-show=on&as=off","Liked it? Click here!")
                     )
                     ),
                box( title="Panasonic 147 cm (58 inches) TH-58D300DX Full HD LED TV ",solidHeader =TRUE ,width="100%",color ="orange" ,collapsible = TRUE,
                     tags$img(src="pantvam.jpg",height=177,width=120,align="left"),
                     box(
                       width = 4,
                       title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                       collapsible = TRUE,
                       plotOutput("plot3", height = 300)
                       #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                     ),
                     box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                         tableOutput("panA"),
                         tags$a(href="https://www.amazon.in/s/gp/search/ref=sr_nr_p_n_size_browse-bin_5?fst=as%3Aoff%2Cp90x%3A1&rh=n%3A976419031%2Cn%3A1389375031%2Cn%3A1389396031%2Ck%3Apanasonic+tv&keywords=panasonic+tv&ie=UTF8&qid=1509275959","Liked it? Click here!")
                     ),
                     box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                         #tags$img(src="panasonic-tvflip.jpg",height=180,width=120),
                         tableOutput("panF"),
                         tags$a(href="https://www.flipkart.com/search?as=off&as-show=on&count=40&otracker=start&q=panasonic+tv&sid=ckf%2Fczl","Liked it? Click here!")
                     )
                     )
              )),
      tabItem(tabName="Pendrives",
              h2("PenDrives"),
              fluidRow(
                box(width = "100%",title = "HP Product Information", solidHeader = TRUE, color="navy", collapsible=TRUE,
                    tags$img(src="hp-x715w_amazon.jpg",height=177,width=120,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot", height = 300)
                      #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "success", collapsible = TRUE,
                       tableOutput("hppA"),
                        tags$a(href="https://www.amazon.in/HP-Flash-Drive-32GB-715W/dp/B00XNA9PMS/ref=sr_1_1?s=computers&ie=UTF8&qid=1509272603&sr=1-1&keywords=HP+x715W+32GB+USB+3.0","Liked it? Click here!")
                        ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "success", collapsible = TRUE,
                        #tags$img(src="hp-x715w.jpg",height=180,width=120),
                        tableOutput("hppF"),
                        tags$a(href="https://www.flipkart.com/sandisk-cruzer-blade-32-gb/p/itmd9xwzgpfmyjw3","Liked it? Click here!")
                        )
                    ),
                box(width = "100%",title = "SanDisk Ultra Dual USB Drive 3.0 SDDD2 32GB USB3.0 Black USB3.0/micro-USB connector OTG-enabled Android devices", solidHeader = TRUE, color="purple",collapsible = TRUE,
                    tags$img(src="sandisk-ultra-am.jpg",height=177,width=120,align="left"),
                    box(
                      width = 4,
                      title = "Analysis of reviews", status = "primary", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotOutput("plot1", height = 300)
                    #  pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=0.8,col=rainbow(length(x)),main="Analysis of reviews")
                    ),
                    box(width = 5, title = "Amazon", solidHeader = TRUE, status = "warning", collapsible = TRUE,
                        tableOutput("sandiskA"),
                        tags$a(href="https://www.amazon.in/SanDisk-micro-USB-connector-OTG-enabled-Android/dp/B00RBGYGMO/ref=sr_1_4?s=computers&ie=UTF8&qid=1509275513&sr=1-4&keywords=sandisk+pendrive","Liked it? Click here!")
                    ),
                    box(width=5,title="Flipkart",solidHeader = TRUE, status = "warning", collapsible = TRUE,
                       # tags$img(src="sandisk-ultra-flip.jpg",height=180,width=120),
                       tableOutput("sandiskF"),
                        tags$a(href="https://www.flipkart.com/sandisk-ultra-dual-usb-drive-3-0-32-gb-pen/p/itmeusyzsk9szhsv?pid=ACCEUSYZGR2ED4HJ&srno=s_1_17&otracker=search&lid=LSTACCEUSYZGR2ED4HJFNTA6C&fm=SEARCH&iid=3c1732f9-0c36-4e08-bb0c-fd4aedd79255.ACCEUSYZGR2ED4HJ.SEARCH&qH=76c7d5a119353a27","Liked it? Click here!")
                    )
                    )
              )
              )
    )
  )
    
)  
    
  



server = function(input, output) {
  
  output$myhp<-renderText({
      library(rvest)
      hprating_data_html <- html_nodes(webpage,"._2beYZw")
      rating_data <- html_text(hprating_data_html) %>% 
        head(rating_data)
        rating_data<-as.numeric(rating_data)
        head(rating_data)
      })
  output$result<-{(
    renderText(input$dept)
    
  )}
  output$senhA=renderTable(read.csv("SennheiserInfo_amazon.csv"))
  output$senhF=renderTable(read.csv("SennheiserInfo_flipkart.csv"))
   output$jblA=renderTable(read.csv("jblInfo_amazon.csv"))
   output$jblF=renderTable(read.csv("jblInfo_flipkart.csv"))
   output$skullA=renderTable(read.csv("skullcandyInfo_amazon.csv"))
   output$skullF=renderTable(read.csv("skullcandyInfo_flipkart.csv"))
   output$canonA=renderTable(read.csv("canonInfo_amazon.csv"))
   output$canonF=renderTable(read.csv("canonInfo_flipkart.csv"))
   output$dellA=renderTable(read.csv("dellInfo_amazon.csv"))
   output$dellF=renderTable(read.csv("dellInfo_flipkart.csv"))
   output$hpA=renderTable(read.csv("HPInfo_amazon.csv"))
   output$hpF=renderTable(read.csv("HPInfo_flipkart.csv"))
   output$redmiA=renderTable(read.csv("Redminote4_amazon.csv"))
   output$redmiF=renderTable(read.csv("Redminote4_flipkart.csv"))
   output$samA=renderTable(read.csv("SamsunggalaxyJ7prime_amazon.csv"))
   output$samF=renderTable(read.csv("SamsunggalaxyJ7prime_flipk.csv"))
   output$motoA=renderTable(read.csv("MotoG4Plus _amazon.csv"))
    output$motoF=renderTable(read.csv("MotoG4Plus _flipkart.csv"))
   
   output$appleA=renderTable(read.csv("apple_amazon.csv"))
   output$appleF=renderTable(read.csv("apple_flipkart.csv"))
   output$vivoA=renderTable(read.csv("VIVOV5sPerfectSelfieflipkartAMAZON.csv"))
   output$vivoF=renderTable(read.csv("VIVOV5sPerfectSelfie_flipkart.csv"))
   output$nikonA=renderTable(read.csv("nikon _amazon.csv"))
   output$nikonF=renderTable(read.csv("nikon_flipkart.csv"))
   output$hppA=renderTable(read.csv("hp_amazon.csv"))
   output$hppF=renderTable(read.csv("hp_flip.csv"))
   output$sandiskA=renderTable(read.csv("sandisk_amazon.csv"))
   output$sandiskF=renderTable(read.csv("sandisk_flip.csv"))
   output$lenovoA=renderTable(read.csv("lenovoInfo_amazon.csv"))
   output$lenovoF=renderTable(read.csv("lenovoInfo_flipkart.csv"))
   output$samtvA=renderTable(read.csv("samsungtvInfo_amazon.csv"))
   output$samtvF=renderTable(read.csv("samsungtvInfo_flipkart.csv"))
   output$lgA=renderTable(read.csv("lgInfo_amazon.csv"))
   output$lgF=renderTable(read.csv("lgInfo_flipkart.csv"))
   output$panA=renderTable(read.csv("panasonicInfo_amazon.csv"))
   output$panF=renderTable(read.csv("panasonicInfo_flipkart.csv"))
   # output$msgOutput <-renderMenu({
   #   msgs <- apply(read.csv("messages1.csv"), 1, function(row){
   #     messageItem(from=row[["from"]], message = row[["message"]])
   #   })
   #   
   #   dropdownMenu(type = "messages", .list = msgs)
   #   
   # })
   
   #HP pendrive
   output$plot<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
  
   #Sandisk Pendrive
   output$plot1<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Samsung tv
   output$plot2<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Panasonic tv
   output$plot3<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #LG tv
   output$plot4<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #dell laptop
   output$plot5<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #HP laptop
   output$plot6<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Lenovo laptop
   output$plot7<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #JBL Earphones
   output$plot8<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Sennheiser Earphones
   output$plot9<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #SkullCandy earphones
   output$plot10<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Nikon camera
   output$plot11<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Canon Camera
   output$plot12<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Xiomi mobile
   output$plot13<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=c("brown2","aquamarine2")))
   })
   
   #Samsung Mobile
   output$plot14<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=c("azure4","yellow")))
   })
   
   #moto mobile
   output$plot15<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=c("blue","orange")))
   })
   
   #Vivo mobile
   output$plot16<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1,col=rainbow(length(x))))
   })
   
   #Apple mobile
   output$plot17<-renderPlot({
     paste(pie(x <- c(67,33),labels<-c("amazon","flipkart"), radius=1, col=rainbow(12)))
   })
   
}


shinyApp(ui,server)
