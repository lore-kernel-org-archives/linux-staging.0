Received: from sonic303-20.consmr.mail.sg3.yahoo.com (sonic303-20.consmr.mail.sg3.yahoo.com [106.10.242.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D7803
	for <linux-staging@lists.linux.dev>; Tue, 27 Dec 2022 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672120876; bh=YkCB4JCwzxTQADL/dpvlxUwcpyWIj1FCi0ASxST69Pw=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=E7VaV/ya+gyLywrzjWMNQ/prcL3oYf1G/NpXMtYeApqq+iKObX4qfMJ46LTMIHawcE9XnjKq/sbZK3P6E4tVjvcnwXEK41FG9HTHOmGIy5jEiDlqjG/wS5JHxp8SJV7vqJtsOoqm6jUZDvX2kfHw6l1itaAJ7W8gneLMy5oNFVRoiLz9FFWOMoDIHQVe+oJ7Acvhe5Rqi/JWRIzCyaUOLh3XxFhJdtoDNnzkViEtya1sa5w7A3igDtDYZ1/JzQvEZVb/RXiHcytMTRYKITRf9S7J+0TNXlH/Bi9DS7M6ws/cjlCxQunVd1Y0D2DxltlzZ+P/G++WFSzc+J9amOj40w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672120876; bh=g+xF0y8OanylUBU5Ykdm0WTh5z6OAThahe9cxTmkzP0=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ATgXmiMuoX7YPdh7GytmRs56mYJcJje3VugFNHB9+mhvlhLTs1HNIQ4MQIXblmqW1Sfqm1fQYy356p+sVnZkaMEPX5lssRMyqch8ByyEK5auFaOBQMz/exq3SNAv5qTrg1Cb3hEO49ZS/Az8J33J97dtdLV7OLYoMpciDvH5qiL0mkqgStcZadsZDJ72fso/JQlbpe0EjcCdDeQWEaxDberzmwVP4ZP0vPMotprnYEGxnV9dvF75nS8IjA21H3tZW5l5rl/DfnaVWfpIJo7kMRBIToiMpBZBLWYAbLD7TasEqm82Ffv3IHi3FUb5Wrqhu9pLMjqeFrk/kWuFbTPEWQ==
X-YMail-OSG: .3UAAywVM1lZKt4k0StNj66Gdy9xgncR4VlYTQYxAJB5Hc5lkvEDkqMa1zo7H0W
 leZcyy_9pUX0uJRr2md4hI6YIR4DFkEW4tUCcTaLItIJ0ZDa5gVpyUVKEwDcj.NQ_c7D7L.HU2ad
 vrsgdEpw9eSj9pfaGLznbLyBMl2PrVqJMXEJlmcMmxsIsuhwJUOEMFURqCxgco3yaDEU43zi1fFZ
 o_LyXg8trgh2hfA6p5GOE.VOEIYJT5H6HlAuEvEzYrKDj90iQ1J.PWp5hkuCNf.D_ftrtFERxpHD
 Bq2QikEEiBouSTKM24FxVjYLQdTweLJDeJtYvyz3idDGtrvszjiNPbrlsREHK8JIZQedFrLC1TIV
 zGxOeicayXosldE1tMb838TL4jGzM2i8nLU061HZ.SVVM6vPvpTBamr.6Q.dS8gEbqpAQg1HejPg
 okyporQmfcOsMITyYMfmfs3f6G5nZycOjAa._KpzSZbUxbmXDbpMxP7ZRCQky2X1p8qct4XteY8m
 swT8dEZUifagaz8HpuW43lhfMI9kkZIUXId5Ws21e1j5fKhzTPVTD3Ui4pLxpD1sVbbDKdWxdi06
 evMs5kmxuJbht2XlCJHK4gpPdU4pLe_oah9UotwZkWdXOl03vvSoIHHWLMO6P1HGB6ZKQfseYYug
 o1ZCCqsKGNLn8HfhSdR08N7BBRzRmbL_FFzZ67lO47kr9cvfJtK5zJixzMm9UYizsIAiBq_Y9BoR
 vJn6Ttdrc.hPHmmwgW5mFbK9qwuAOEWOw.WeGlgy4X3jdzVFJZsZ2P8HUrZIaV0aK97S2X9BzZzj
 aWo6ZJRofkSSJA6FuKnqh5CPrtHMi3dxxa.9H2unZhgFLeTutPq_yA8jS1ebFc6W0uhUmKSq3Xr_
 HNNszhle_Wsctczc0JGw06Qhc9Y0Ec11V.wdD.UilbnfIGrkYwY.yyLI.tnmdoU616xVLOT4018X
 KaDMwNFE7oJspjx_tt4yC5FrmNznzJGizK1c5koaK8DOvXy.crsUUJEaJZ5WQ7CHCUQlPDDdMOA2
 8xw35kfCbHUYbpQoHivGV3reErwnyDtzIJPoSVv5GyjovaNS4elAZ52gzd0uLE_R3ZIHTjscq6xf
 H573SxrR6KIXL49YsYHkVfAadJxFyYSy2SGln1WCdPasPatZyZaAJS5ysfb2Ax5hH75ccuQ9Z_Fj
 1qP.3JM9lzNaRmj1sFH1x3IcrT8F_nJD36JA02BsHlLJdR.FXuXTfy.AMJAr5Ei2fOPeikk6Np_C
 4HJ387qPyHQDItfW_.nEjUikydS5_9MAHv_JIfYmmFp1L1ezEiF9Rrpbip5u3U9SMmp.BD0Jy6WL
 6k4_8hYDjdo42ARI0tBRaDAxeDhWGjrqCIDlKtvJW8RWdG3ndoQBQGr50j1Ak98BiIRtEJ902V8L
 RepJFR7st2Q5IPAfy3NMZc0nQvAbXGCJJiQQ_0b9.ZbmtvUlXiVGgA.5dxIWO2Ih1uJAnWqX2aVf
 nfDDkk9g5MIz0412b4ZoKXiYB.bq8cneiItxE.DlSF126bpljDlli82FQAlVJwF3GnNBO3jDQNQt
 3InPJgO735DOj8gcwWi66pCSomFRzBIwZ2UllV7Oh5cRSPgWxwG_GcJkxxubSt17tsWLzY6EB741
 X1.qIl3gEMIyfFiE3T4a5nkljFaey.KlApKVWS.hWMcxmJIOVGjJLH93IxNR.juFd137nL9c9.x0
 VD_6gDyfQq5gdNUd3sesBBUlSmlke6aJHmBvl9E7ovOeQqZni2rx2vlo1bk8TR.CUgHCyKt6r0kK
 a6To3bb4aGFaLU.H3SYHJX2KzWXs6wCEZVkl0vlhC488CkIr3uk2yydpz1yY60igHF0pjEDwIPZl
 hqsraImnWN3zUTaJKGAMADGzC4DFPzJLzLflV02RysTQ.kqwZjWf2oK5W2oZzlSIkUwTpTO7nW9Z
 HhqPHpB.GmShoFoyqGrLB8UPV0aqc0.IuoH2ZyneBbLqcLQSpe3.3GI7_8pz.zf2v2SHsckShkSR
 rQGaWOl_228loOsKHgFCSvCXrq50_mTAN4PtPToqXF9e1FFlTCodSvL_ciS.oXlFDr1FN0Sc.14Z
 KwTUAtAgujs9OHDSD3hr7m7seDglgTeYHwO2VvftA4Y1WLpoKY.fX1zfl_CTpsPZ3Pr2LCYchYIM
 IxBPuLyJrEw4YUO0O71ysr2AtGe5eqHolH_x1jp6D.B7JyJnFSRW2EEjlZlh9Qw--
X-Sonic-MF: <qataralthanisocialright005@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Tue, 27 Dec 2022 06:01:16 +0000
Date: Tue, 27 Dec 2022 06:01:12 +0000 (UTC)
From: althani humanrights <qataralthanisocialright005@yahoo.com>
To: 
	"20210920163940.946890292@linuxfoundation.org" <20210920163940.946890292@linuxfoundation.org>, 
	"20210920163940.986021614@linuxfoundation.org" <20210920163940.986021614@linuxfoundation.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Message-ID: <698456973.3009874.1672120872428@mail.yahoo.com>
In-Reply-To: <852085798.3252162.1672120866931@mail.yahoo.com>
References: <LO4P123MB52398923B87169ABA897B7EC93039@LO4P123MB5239.GBRP123.PROD.OUTLOOK.COM> <LO4P123MB5239AFC5F1F760B97853B53193039@LO4P123MB5239.GBRP123.PROD.OUTLOOK.COM> <LO4P123MB5239B6E8C16B54BA88F1B88293039@LO4P123MB5239.GBRP123.PROD.OUTLOOK.COM> <LO4P123MB52391351A16463AC3F7E540F93039@LO4P123MB5239.GBRP123.PROD.OUTLOOK.COM> <LO4P123MB523900AF19D7FBF49B4EB07493009@LO4P123MB5239.GBRP123.PROD.OUTLOOK.COM> <326502238.225141.1668201752356@privateemail.com> <1014052853.225667.1668202284494@privateemail.com> <342466788.226191.1668202977107@privateemail.com> <225073156.443552.1671226052629@privateemail.com> <2018195416.732816.1671250906632@mail.yahoo.com> <CAMz6RsR3bA8OpWChOi1fRDE92gaaBhQa=fhJdpSB-bM3aDpLFQ@mail.gmail.com> <CAMz6RsQRTFgfbjKqkKqDOBrYYCDdqJ3ab3GpAsZsoaiwznjccg@mail.gmail.com> <261545439.744381.1671253914236@mail.yahoo.com> <720581669.741267.1671254011611@mail.yahoo.com> <681440154.740335.1671254017503@mail.yahoo.com> <537696703.737989.1671254022768@mail.yahoo.com> <317439372.3240652.1672120828715@mail.yahoo.com> <2011711118.3256434.1672120834507@mail.yahoo.com> <845878933.3250157.1672120839125@mail.yahoo.com> <129777636.3234002.1672120845868@mail.yahoo.com> <285971545.3256500.1672120850005@mail.yahoo.com> <122180602.3249601.1672120854357@mail.yahoo.com> <1661169169.3007871.1672120860204@mail.yahoo.com> <852085798.3252162.1672120866931@mail.yahoo.com>
Subject: =?UTF-8?Q?Fw:_Evidence_of_Qatar=E2=80=99s_corrupted?=
 =?UTF-8?Q?_authorities=E2=80=99_intrusion_in_Europe?=
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3009873_245102797.1672120872427"
X-Mailer: WebService/1.1.20982 YMailNorrin

------=_Part_3009873_245102797.1672120872427
Content-Type: multipart/alternative; 
	boundary="----=_Part_3009872_2057734042.1672120872361"

------=_Part_3009872_2057734042.1672120872361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=20

 =20



=20
Date 16/12/2022=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ATCRF/221216/002
=20
The Honorable Prime Minister of POLAND

|=20
| The Honorable Prime Minister=C2=A0=20
 Mateusz Morawiecki |
| Al. Ujazdowskie 1/3 |
| 00-583 Warsaw |
| NIP 5261645000 |
| Regon 012261725 |
| POLAND |




 |

  =C2=A0   Subject: Evidence of Qatar=E2=80=99s corrupted authorities=E2=80=
=99 intrusion in Europe   =C2=A0   In the past few years, every detail we h=
ave outlined in our past correspondences has been gradually realized and un=
til this day it is still progressing at a higher pace and will inflict nega=
tively on European countries very soon   =C2=A0   We, Al Thani Council of t=
he Ruling Family, represented by Qatari Citizens, are striving to expose th=
e corrupted authorities that have imposed their unjust ruling on the State =
of Qatar.   =C2=A0   These corrupted authorities have exploited the wealth =
and resources of our country to advance their personal agendas and have exp=
ensed billions towards inflicting chaos around the world.   =C2=A0   In the=
 wake of bribery allegations that have engulfed Brussels and how Qatar=E2=
=80=99s corrupted authorities have enticed several members of Parliament at=
 all its levels, to advance their affairs, we have noted through our severa=
l correspondences to all European Leadership on how such is being manifeste=
d.   =C2=A0   Accordingly, we are hereby ready and willing to share with al=
l European Leadership the necessary information and evidence on how these c=
orrupted authorities are infusing their interference within the European Pa=
rliament and what tools are being exploited to attain such manifested proce=
ss.   =C2=A0   We are ready to share information about companies and invest=
ments that are based throughout the European countries and how these financ=
ial vehicles are being exploited to facilitate bribes to European officials=
.   =C2=A0   A comprehensive list of all entities, organizations, companies=
, investment firms and their corresponding aliases, with their locations, r=
egistrations and registered owners who at most times are just fronts exploi=
ted to manifest these briberies   =C2=A0   Additional statements will be pr=
ovided on how Qatar=E2=80=99s corrupted authorities are exploiting these pr=
ocesses through engagement of their own ambassadors in Europe, through thei=
r national airline Qatar Airways, through media agency Al Jazeera and many =
other processes that are all designed and initiated to facilitate their pro=
cesses of enticing officials throughout Europe and also to financially supp=
ort several radicalized extremists that are dormant in Europe, awaiting the=
 instructions to inflict chaos within your countries   =C2=A0   This compre=
hensive information can be directly provided to every European country, but=
 we would require an official email to submit these documents to reliable p=
ersonnel entrusted within each of your countries, to assure that this infor=
mation only reach the concerned personnel who will truly take the necessary=
 actions to uncover the malicious plan imposed by Qatar=E2=80=99s corrupted=
 authorities   =C2=A0   As mentioned herein above, for the past few years w=
e have alerted every Leader of what has been realized today, and we have wa=
rned of the consequences of such acts imposed by Qatar=E2=80=99s corrupted =
authorities. Hence, the choice still remains with every Leader, either to a=
ct upon what we are stating or wait and realize the after effect of these i=
ntrusion and its impact on your political structure.   =C2=A0   European Au=
thorities should note that Qatar=E2=80=99s corrupted authorities not only g=
ains from enticing your members of parliaments, ministries or even politica=
l parties, they gain much more by creating doubt in your systems and inflic=
t chaos in your organizations, which inevitably weakness your political sys=
tems from within, rendering you vulnerable to further intrusions   =C2=A0  =
 Therefore, if you are truly determined to stop their intrusion and the inf=
licted chaos, they have been establishing against you for decades, we are w=
illing to assist you in assuring that such manifested acts are bought to an=
 end once and for all.   =C2=A0   Citizens of Qatar have always been peacef=
ul individuals, embraced citizens of every country, we do not seek to leave=
 our children with enemies throughout the world, we wish for them to inheri=
t our good deeds and our good relations with every nation across the globe,=
 that is why we are determined to expel these corrupted authorities from ou=
r country and hold them accountable for every injustice they have imposed a=
nd by extending every possible assistance to all other countries to protect=
 them from these malicious intentions   =C2=A0   Conclusively, if you would=
 wish to obtain further information that will facilitate your investigation=
s, we are ready to submit these documents only to reliable authorities that=
 shall be appointed by yourselves.   =C2=A0   To obtain these documents, yo=
u may send a request to althani@althanicrf.org, and provide the mailing add=
ress and name of person to whom we should send these documents to, accordin=
gly we shall forward the documents via registered postal to be delivered on=
ly to the designated person mentioned in your request (documents will only =
be provided to official authorities of European Countries and not to repres=
entatives, media, institutions, organizations or other non-related parties)=
   =C2=A0   Sincerely,   =C2=A0   =C2=A0   AL THANI COUNCIL OF THE RULING F=
AMILY   =C2=A0      =20
                         =20
------=_Part_3009872_2057734042.1672120872361
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp3bf51776yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div><br></div></div><div id=3D"ydp22c3035eyahoo_quoted_2831875342"=
 class=3D"ydp22c3035eyahoo_quoted"><div style=3D"font-family:'Helvetica Neu=
e', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div i=
d=3D"ydp22c3035eyiv3687947135"><div id=3D"ydp22c3035eyiv3687947135yqtfd3786=
3" class=3D"ydp22c3035eyiv3687947135yqt8133154395"><div><div id=3D"ydp22c30=
35eyiv3687947135ydpb97d9866yahoo_quoted_2430543889" class=3D"ydp22c3035eyiv=
3687947135ydpb97d9866yahoo_quoted"><div style=3D"font-family:'Helvetica Neu=
e', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div i=
d=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603"><div id=3D"ydp22c303=
5eyiv3687947135ydpb97d9866yiv2518747603yqtfd78111" class=3D"ydp22c3035eyiv3=
687947135ydpb97d9866yiv2518747603yqt9641006016"><div><div id=3D"ydp22c3035e=
yiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyahoo_quoted_2562300341" cl=
ass=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyahoo_quo=
ted"><div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-ser=
if;font-size:13px;color:#26282a;"><div><div id=3D"ydp22c3035eyiv3687947135y=
dpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473"><div id=3D"ydp22c3035eyiv3=
687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473yqtfd40131" class=
=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050347=
3yqt6803035770"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25187=
47603ydp7cafbd6cyiv5240503473ydp9201e7fdyahoo_quoted_2137811841" class=3D"y=
dp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9=
201e7fdyahoo_quoted"><div style=3D"font-family:'Helvetica Neue', Helvetica,=
 Arial, sans-serif;font-size:13px;color:#26282a;"><div><div id=3D"ydp22c303=
5eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdy=
iv4307250295"><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603yd=
p7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295yqtfd98124" class=3D"ydp22c30=
35eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fd=
yiv4307250295yqt3370890126"><div><div style=3D"font-family:Helvetica Neue, =
Helvetica, Arial, sans-serif;font-size:16px;" class=3D"ydp22c3035eyiv368794=
7135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725029=
5ydp967eedd1yahoo-style-wrap"><div><br clear=3D"none"></div></div><div id=
=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050347=
3ydp9201e7fdyiv4307250295ydp2659ff2cyahoo_quoted_2269821155" class=3D"ydp22=
c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e=
7fdyiv4307250295ydp2659ff2cyahoo_quoted"><div style=3D"font-family:'Helveti=
ca Neue', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;">
                <div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25187=
47603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv45730510=
48"><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cy=
iv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048yqtfd84587" cla=
ss=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503=
473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048yqt7163264043"><div><div=
 style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-siz=
e:16px;" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd=
6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydpe440af2by=
ahoo-style-wrap"><div></div>
        <div><br clear=3D"none"></div></div><div id=3D"ydp22c3035eyiv368794=
7135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725029=
5ydp2659ff2cyiv4573051048ydp87413806yahoo_quoted_2496818962" class=3D"ydp22=
c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e=
7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yahoo_quoted"><div style=
=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:13=
px;color:#26282a;"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25=
18747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv45730=
51048ydp87413806yiv2922889135"><div id=3D"ydp22c3035eyiv3687947135ydpb97d98=
66yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cy=
iv4573051048ydp87413806yiv2922889135yqtfd32508" class=3D"ydp22c3035eyiv3687=
947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250=
295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135yqt0077718078"><div><div=
 id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050=
3473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv292288913=
5ydp2b365d72yahoo_quoted_2247301316" class=3D"ydp22c3035eyiv3687947135ydpb9=
7d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659f=
f2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yahoo_quoted"><div style=
=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:13=
px;color:#26282a;"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25=
18747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv45730=
51048ydp87413806yiv2922889135ydp2b365d72yiv9742379658"><div id=3D"ydp22c303=
5eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdy=
iv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9=
742379658yqtfd38178" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747=
603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048=
ydp87413806yiv2922889135ydp2b365d72yiv9742379658yqt8878290922"><div><div id=
=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050347=
3ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135yd=
p2b365d72yiv9742379658ydp7339fd7yahoo_quoted_2905164356" class=3D"ydp22c303=
5eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdy=
iv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9=
742379658ydp7339fd7yahoo_quoted"><div style=3D"font-family:'Helvetica Neue'=
, Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div id=
=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050347=
3ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135yd=
p2b365d72yiv9742379658ydp7339fd7yiv3663066625"><div id=3D"ydp22c3035eyiv368=
7947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725=
0295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv974237965=
8ydp7339fd7yiv3663066625yqtfd51345" class=3D"ydp22c3035eyiv3687947135ydpb97=
d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff=
2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yi=
v3663066625yqt5704507189"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d98=
66yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cy=
iv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv36=
63066625ydp3903fba0yahoo_quoted_2187166359" class=3D"ydp22c3035eyiv36879471=
35ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295y=
dp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7=
339fd7yiv3663066625ydp3903fba0yahoo_quoted"><div style=3D"font-family:'Helv=
etica Neue', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><d=
iv><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyi=
v5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv29=
22889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv289655=
4916"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7c=
afbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413=
806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0y=
iv2896554916ydp2a6fbccayahoo_quoted_1451484978" class=3D"ydp22c3035eyiv3687=
947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250=
295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658=
ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayahoo_quoted"><di=
v style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-=
size:13px;color:#26282a;"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d98=
66yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cy=
iv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv36=
63066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603"><div id=3D"ydp22c=
3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7=
fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72y=
iv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv94=
63146603yqtfd24120" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25187476=
03ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048y=
dp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp39=
03fba0yiv2896554916ydp2a6fbccayiv9463146603yqt8891824634"><div><div id=3D"y=
dp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9=
201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b36=
5d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbcca=
yiv9463146603ydp4c9f5a14yahoo_quoted_2229538725" class=3D"ydp22c3035eyiv368=
7947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725=
0295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv974237965=
8ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp=
4c9f5a14yahoo_quoted"><div style=3D"font-family:'Helvetica Neue', Helvetica=
, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div id=3D"ydp22c30=
35eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fd=
yiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv=
9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463=
146603ydp4c9f5a14yiv8443379381"><div><div id=3D"ydp22c3035eyiv3687947135ydp=
b97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp265=
9ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd=
7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yi=
v8443379381ydpf8f6c35dyahoo_quoted_1506981337" class=3D"ydp22c3035eyiv36879=
47135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv43072502=
95ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658y=
dp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c=
9f5a14yiv8443379381ydpf8f6c35dyahoo_quoted"><div><div><div id=3D"ydp22c3035=
eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyi=
v4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv97=
42379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv946314=
6603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700"><div class=3D"ydp22c3=
035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7f=
dyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yi=
v9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv946=
3146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700yahoo-style-wrap"><d=
iv class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5=
240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922=
889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv28965549=
16ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700y=
dpda9030f7yiv9322358174gmail_quote"><div dir=3D"ltr"><div class=3D"ydp22c30=
35eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fd=
yiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv=
9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463=
146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700ydpda9030f7yiv9322358=
174gmail_quote"><br clear=3D"none"><div>
<img id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv52=
40503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv29228=
89135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv289655491=
6ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700yd=
pda9030f7yiv9322358174m_7134423157633244500m_4445583968144167807yiv15881347=
50Picture_x0020_1" src=3D"cid:9x4KFPJTRtIpWV9DD42p" alt=3D"Logo  Descriptio=
n automatically generated" style=3D"color:rgb(113, 95, 250);font-size:15px;=
text-align:center;width:194px;max-width:446px;" class=3D"ydp22c3035eyiv3687=
947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250=
295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658=
ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916" data-inlineimagemanipulati=
ng=3D"true" data-id=3D"1672120866744"><br clear=3D"none"><blockquote><div i=
d=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv52405034=
73ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135y=
dp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a=
6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700ydpda903=
0f7yiv9322358174m_7134423157633244500m_4445583968144167807yiv1588134750"><d=
iv><div><div><div><div><div dir=3D"ltr">=20
       <p style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helvet=
ica, Arial, sans-serif;font-size:16px;"><span style=3D"font-size:12pt;">Dat=
e 16/12/2022&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ATC=
RF/221216/002</span></p>=20
       <p style=3D"margin-right:0cm;margin-bottom:11.25pt;margin-left:0cm;"=
><b><span style=3D"color:rgb(64, 64, 66);font-family:Arial, sans-serif;font=
-size:14pt;">The Honorable Prime Minister of </span><font face=3D"Calibri, =
sans-serif"><span style=3D"font-size:24px;">POLAND</span></font></b></p><ta=
ble style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helvetica, A=
rial, sans-serif;font-size:16px;border-collapse:collapse;width:255pt;" widt=
h=3D"340" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><colgroup span=
=3D"1"><col span=3D"1" style=3D"width:255pt;" width=3D"340"></colgroup><tbo=
dy><tr style=3D"min-height:162.75pt;" height=3D"217"><td colspan=3D"1" rows=
pan=3D"1" style=3D"min-height:162.75pt;width:255pt;font-size:18pt;padding-t=
op:1px;padding-right:1px;padding-left:1px;color:black;font-family:Calibri, =
sans-serif;vertical-align:bottom;border-color:currentcolor;border-style:non=
e;border-width:medium;" width=3D"340" height=3D"217" class=3D"ydp22c3035eyi=
v3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv43=
07250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv97423=
79658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv946314660=
3ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700ydpda9030f7yiv9322358174gm=
ail-xl65"><div><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv251874=
7603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv457305104=
8ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp=
3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpf8f=
6c35dyahoo_quoted_1506981337" class=3D"ydp22c3035eyiv3687947135ydpb97d9866y=
iv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4=
573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv36630=
66625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv84433793=
81ydpf8f6c35dyahoo_quoted"><div style=3D"font-family:Helvetica Neue, Helvet=
ica, Arial, sans-serif;color:rgb(38, 40, 42);"><div dir=3D"ltr"><div><table=
 border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"280" style=3D"bo=
rder-collapse:collapse;width:210pt;"><colgroup span=3D"1"><col span=3D"1" w=
idth=3D"280" style=3D"width:210pt;"></colgroup><tbody><tr height=3D"40" sty=
le=3D"min-height:30pt;"><td colspan=3D"1" rowspan=3D"1" height=3D"40" width=
=3D"280" style=3D"width:210pt;min-height:30pt;" class=3D"ydp22c3035eyiv3687=
947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250=
295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658=
ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4=
c9f5a14yiv8443379381ydpe4cb0adcxl64">The
  Honorable Prime Minister&nbsp; <br clear=3D"none">
    Mateusz Morawiecki</td></tr><tr height=3D"20" style=3D"min-height:15pt;=
"><td colspan=3D"1" rowspan=3D"1" height=3D"20" style=3D"min-height:15pt;" =
class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240=
503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889=
135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916y=
dp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpe4cb0adcxl65">Al. Ujazdow=
skie 1/3</td></tr><tr height=3D"20" style=3D"min-height:15pt;"><td colspan=
=3D"1" rowspan=3D"1" height=3D"20" style=3D"min-height:15pt;" class=3D"ydp2=
2c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201=
e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d7=
2yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv=
9463146603ydp4c9f5a14yiv8443379381ydpe4cb0adcxl65">00-583 Warsaw</td></tr><=
tr height=3D"20" style=3D"min-height:15pt;"><td colspan=3D"1" rowspan=3D"1"=
 height=3D"20" style=3D"min-height:15pt;" class=3D"ydp22c3035eyiv3687947135=
ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp=
2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp733=
9fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a1=
4yiv8443379381ydpe4cb0adcxl65">NIP 5261645000</td></tr><tr height=3D"21" st=
yle=3D"min-height:15.75pt;"><td colspan=3D"1" rowspan=3D"1" height=3D"21" s=
tyle=3D"min-height:15.75pt;" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yi=
v2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv45=
73051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv366306=
6625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv844337938=
1ydpe4cb0adcxl65">Regon 012261725</td></tr><tr height=3D"21" style=3D"min-h=
eight:15.75pt;"><td colspan=3D"1" rowspan=3D"1" height=3D"21" style=3D"min-=
height:15.75pt;" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603y=
dp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp8=
7413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903f=
ba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpe4cb0adc=
xl66">POLAND</td></tr></tbody></table></div><div id=3D"ydp22c3035eyiv368794=
7135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725029=
5ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658yd=
p7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9=
f5a14yiv8443379381yqtfd71817" class=3D"ydp22c3035eyiv3687947135ydpb97d9866y=
iv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4=
573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv36630=
66625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv84433793=
81yqt5864898146"><br clear=3D"none"></div></div><div id=3D"ydp22c3035eyiv36=
87947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv43072=
50295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv97423796=
58ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603yd=
p4c9f5a14yiv8443379381yqtfd45821" class=3D"ydp22c3035eyiv3687947135ydpb97d9=
866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2c=
yiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3=
663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443=
379381yqt5864898146"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv=
2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv457=
3051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066=
625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381=
ydpf8f6c35dyiv1988236700"><div style=3D"font-size:16px;" class=3D"ydp22c303=
5eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdy=
iv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9=
742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv94631=
46603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700yahoo-style-wrap"></di=
v></div></div></div></div></div></div></div><div id=3D"ydp22c3035eyiv368794=
7135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725029=
5ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658yd=
p7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9=
f5a14yiv8443379381yqtfd68665" class=3D"ydp22c3035eyiv3687947135ydpb97d9866y=
iv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4=
573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv36630=
66625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv84433793=
81yqt5864898146"><br clear=3D"none"><br clear=3D"none"></div></td></tr></tb=
ody></table><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7=
cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp8741=
3806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0=
yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd88309" cl=
ass=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050=
3473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv292288913=
5ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp=
2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;"> <b><u>Subject: Evidence of Qatar=
=E2=80=99s corrupted authorities=E2=80=99 intrusion in Europe</u></b>=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         In the past few years, every detail we have outlined in our past c=
orrespondences has been gradually realized and until this day it is still p=
rogressing at a higher pace and will inflict negatively on European countri=
es very soon=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         We, Al Thani Council of the Ruling Family, represented by Qatari C=
itizens, are striving to expose the corrupted authorities that have imposed=
 their unjust ruling on the State of Qatar.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         These corrupted authorities have exploited the wealth and resource=
s of our country to advance their personal agendas and have expensed billio=
ns towards inflicting chaos around the world.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         In the wake of bribery allegations that have engulfed Brussels and=
 how Qatar=E2=80=99s corrupted authorities have enticed several members of =
Parliament at all its levels, to advance their affairs, we have noted throu=
gh our several correspondences to all European Leadership on how such is be=
ing manifested.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         Accordingly, we are hereby ready and willing to share with all Eur=
opean Leadership the necessary information and evidence on how these corrup=
ted authorities are infusing their interference within the European Parliam=
ent and what tools are being exploited to attain such manifested process.=
=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         We are ready to share information about companies and investments =
that are based throughout the European countries and how these financial ve=
hicles are being exploited to facilitate bribes to European officials.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         A comprehensive list of all entities, organizations, companies, in=
vestment firms and their corresponding aliases, with their locations, regis=
trations and registered owners who at most times are just fronts exploited =
to manifest these briberies=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         Additional statements will be provided on how Qatar=E2=80=99s corr=
upted authorities are exploiting these processes through engagement of thei=
r own ambassadors in Europe, through their national airline Qatar Airways, =
through media agency Al Jazeera and many other processes that are all desig=
ned and initiated to facilitate their processes of enticing officials throu=
ghout Europe and also to financially support several radicalized extremists=
 that are dormant in Europe, awaiting the instructions to inflict chaos wit=
hin your countries=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         This comprehensive information can be directly provided to every E=
uropean country, but we would require an official email to submit these doc=
uments to reliable personnel entrusted within each of your countries, to as=
sure that this information only reach the concerned personnel who will trul=
y take the necessary actions to uncover the malicious plan imposed by Qatar=
=E2=80=99s corrupted authorities=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         As mentioned herein above, for the past few years we have alerted =
every Leader of what has been realized today, and we have warned of the con=
sequences of such acts imposed by Qatar=E2=80=99s corrupted authorities. He=
nce, the choice still remains with every Leader, either to act upon what we=
 are stating or wait and realize the after effect of these intrusion and it=
s impact on your political structure.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         European Authorities should note that Qatar=E2=80=99s corrupted au=
thorities not only gains from enticing your members of parliaments, ministr=
ies or even political parties, they gain much more by creating doubt in you=
r systems and inflict chaos in your organizations, which inevitably weaknes=
s your political systems from within, rendering you vulnerable to further i=
ntrusions=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         Therefore, if you are truly determined to stop their intrusion and=
 the inflicted chaos, they have been establishing against you for decades, =
we are willing to assist you in assuring that such manifested acts are boug=
ht to an end once and for all.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         Citizens of Qatar have always been peaceful individuals, embraced =
citizens of every country, we do not seek to leave our children with enemie=
s throughout the world, we wish for them to inherit our good deeds and our =
good relations with every nation across the globe, that is why we are deter=
mined to expel these corrupted authorities from our country and hold them a=
ccountable for every injustice they have imposed and by extending every pos=
sible assistance to all other countries to protect them from these maliciou=
s intentions=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         Conclusively, if you would wish to obtain further information that=
 will facilitate your investigations, we are ready to submit these document=
s only to reliable authorities that shall be appointed by yourselves.=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         To obtain these documents, you may send a request to <a shape=3D"r=
ect" href=3D"mailto:althani@althanicrf.org" rel=3D"nofollow" target=3D"_bla=
nk">althani@althanicrf.org</a>, and provide the mailing address and name of=
 person to whom we should send these documents to, accordingly we shall for=
ward the documents via registered postal to be delivered only to the design=
ated person mentioned in your request (documents will only be provided to o=
fficial authorities of European Countries and not to representatives, media=
, institutions, organizations or other non-related parties)=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         Sincerely,=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;"> <b>AL THANI COUNCIL OF THE RULIN=
G FAMILY</b>=20
       </div>=20
       <div style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:16px;">
         &nbsp;=20
       </div>=20
      </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25187476=
03ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048y=
dp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp39=
03fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd071=
91" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv=
5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv292=
2889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554=
916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">=20
     </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv251874760=
3ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048yd=
p87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp390=
3fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd7823=
3" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5=
240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922=
889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv28965549=
16ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">=20
    </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603=
ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp=
87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903=
fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd53046=
" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv52=
40503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv29228=
89135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv289655491=
6ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">=20
   </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603y=
dp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp8=
7413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903f=
ba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd78521"=
 class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524=
0503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv292288=
9135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916=
ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">=20
  </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603yd=
p7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87=
413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fb=
a0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd29516" =
class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240=
503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889=
135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916y=
dp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">=20
 </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp=
7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp874=
13806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba=
0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd75562" c=
lass=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv52405=
03473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv29228891=
35ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916yd=
p2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">
</div></div></blockquote><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2=
518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573=
051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv36630666=
25ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381y=
qtfd11201" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7caf=
bd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp8741380=
6yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv=
2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">
</div></div></div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25=
18747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv45730=
51048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv366306662=
5ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yq=
tfd39918" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafb=
d6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806=
yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2=
896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">
</div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7=
cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp8741=
3806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0=
yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqtfd98001" cl=
ass=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv524050=
3473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv292288913=
5ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp=
2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146"><div id=3D"ydp2=
2c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201=
e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d7=
2yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv=
9463146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700ydpda9030f7yahoo_=
quoted_1723254634" style=3D"color:rgb(38, 40, 42);font-family:Helvetica Neu=
e, Helvetica, Arial, sans-serif;font-size:16px;" class=3D"ydp22c3035eyiv368=
7947135ydpb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv430725=
0295ydp2659ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv974237965=
8ydp7339fd7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp=
4c9f5a14yiv8443379381ydpf8f6c35dyiv1988236700ydpda9030f7yahoo_quoted"><div =
style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-si=
ze:13px;color:#26282a;"><div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866=
yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv=
4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663=
066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379=
381ydpf8f6c35dyiv1988236700ydpda9030f7yiv9322358174">
</div></div>
            </div>
        </div></div></div></div></div><div id=3D"ydp22c3035eyiv3687947135yd=
pb97d9866yiv2518747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp26=
59ff2cyiv4573051048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339f=
d7yiv3663066625ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14y=
iv8443379381yqtfd22768" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518=
747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051=
048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625y=
dp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5=
864898146">
            </div></div><div id=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv25=
18747603ydp7cafbd6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv45730=
51048ydp87413806yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv366306662=
5ydp3903fba0yiv2896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yq=
tfd50820" class=3D"ydp22c3035eyiv3687947135ydpb97d9866yiv2518747603ydp7cafb=
d6cyiv5240503473ydp9201e7fdyiv4307250295ydp2659ff2cyiv4573051048ydp87413806=
yiv2922889135ydp2b365d72yiv9742379658ydp7339fd7yiv3663066625ydp3903fba0yiv2=
896554916ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381yqt5864898146">
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></body></html>
------=_Part_3009872_2057734042.1672120872361--

------=_Part_3009873_245102797.1672120872427
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename="image001.png"
Content-ID: <9x4KFPJTRtIpWV9DD42p>

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
TkSuQmCC

------=_Part_3009873_245102797.1672120872427--
