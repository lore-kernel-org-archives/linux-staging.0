Received: from sonic309-19.consmr.mail.sg3.yahoo.com (sonic309-19.consmr.mail.sg3.yahoo.com [106.10.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC220FF
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673438443; bh=j8y0oztXYbuT2b537zz6d+cno4UJgeIFK10WVHw6snw=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=lrpAsh+n7CbseaIqangeWH+S770e5mfBCVd0dKJZcs1SQ/kYmI9ivoNe1iLenUTaxfJcNgq3/NRxpZrFx2zykLrpBCvF3T5ct5enq1Qm3wlXUj/BA9vGmhQTai3EvEM9cKMhooMY3UP57VW8vLj+SIWm+PfZICjarRnD38opeG7bFD0qQdJHNg/2KH8sDS0i39GVEY1MbIi04ZlGOH6TgcnhisDOXG74Gu2amf5Olq8FyGZVJqhWGbt/KqnYCSxq+0tJ8AJVfIYUN3jtfDm6JkBr4FiFkxgKmlSczCes++yt3glmDrZ6USkG4MNk6ggmSNsKj9ipXCPAV9EFH8tlJQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673438443; bh=tDcypIKr8yvJbCjeXiYzNAMCYaJ3S8LavXs9jLJxjF/=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=N/BhoOxTq1I4hpo24UA4IZMohNf5yO7UhLnnDUkyAcaPoQr2uApXgDg0vCysJ/NdK1kHoyydXumzHwa3lHjrqT5rLdx54uiZ29Or2dfg4GePSpOWRZV6zekNxgRjH1zkVERl9+qhD2ls39uW2ckRaj6sJvE+sf3yNpiSOUStLsNXxPekkAvXGV/heZ1Um/K1HY5HJwvsOGIBi3Vo/S28xabs9jOHEYOIKE5R6tCKQrTxoaClcFyny1i2sHUwIeWmlyj2+ErKlS14hc42mze3ONNejuwXh1xCC3L/GV70dNF01FjNYTcUHaeM7c0mSVDilWQUW8+fflkIwtPcm2XxkQ==
X-YMail-OSG: R0hWs34VM1nHwCeA.0gCwavR_u3cBGBmSB6qiWR7Ag.FzNPcpK6X6Acmt0bOeEs
 DnlTyjCSK6O8XB6DUSRdpihtQbDTAmsJvfeVcEhpsTgEvBCKyYasXAbqS4g7IH0T4fgtKDiSIbnD
 GMHsoUmqhHmOHUhkxdAFshL_ahxhGn1H71xEwE5qYV3fcmM4KkBVoxvdIW2_X7CTyUAAEd2a8Ho5
 Po_.ncmi.V8wlx3SU_kPWYTubeAVE4BoinSUuDGaC4RBQwqUDZ9aYNGYfFBmtbP98lpRT44NmIux
 aYSSBhsVZGesmmXJ_fWaLD3p.ftj662lIg7rzDe6ikxOP_1sIOvNOlJXaxDiF.dB8F9aT_P26.rl
 mVDdJJ47MuG21YRf.vmBOPPfrEak6Qx0WtWubHiRldatuLZWx0OnHhJUYbocAIcD3T_Uh5EQ7nuj
 61WNJtUevw1y4H5c8QsUYaWfiJ0E.dxF7BGr5P4mOLkvmJcUKT4XmS6M1t.iuy3SuyRYTa9vHz.B
 CNi9dy.IHX.4wLQ8T6EzI5XkvjpgVzPZxgnnLSGR9p4OSvGmQB6yTisyaqY_D0QdcKaIOWSho_iW
 C2xTmtlyIBOPjAfVqx3.uvchIGmOsOYoSpAB.imtSmb_CbTNmgxo2JcevWay1kpbCXyrDQBThD2y
 CuSm5kZsH.TILi4PJWDyuO9ZgqDe_PXhDae_ZJVI22LPuvVsDEph73tqA9owcDRDoUp.8G5FFKBj
 QhiaeWAjZZxT5ngUk2lTL4wn8f_AXc.4e9_U_3XP45A8dmOVRne0PW14HRkN98valCgHRBkKeLgx
 GP5D4aabBVRCtF5b0ZDJTzH4O_22gz3Z32yReIKbiGhTXFbO6wVTE6_DG11oADmfIg3pVGxWNTJy
 8wIrWrfjSa.oS7Ig6PRr.ncIGehk9DVXw0pwa3KTnr74NRdo5scZnJguPvE6uOQwWYTyhrLodQ2b
 SeRwslD7_ZD8GyAYgrJFBOfAyKY4coCCArN1l4YKhQ_ePZRoT0vbCbEtkC3mwx_YeIa3WX1eMjeX
 SHWkwgoL20Ypfyc1C1xDHnsFPfU_HV.SzglDKV4jQ3HChpzGwVOGAaJC2QP5FjRnVKjiTGiFQmuy
 7KdFmFhFJxQ6xhLeBVkRXQlZu0KBnxcneik8O7ORePMVDI_1WSkz_cnkzB79HyojPudTCXwTvfZI
 JqMn_AdKAZCkrbzoCqinkFiV6S9CeoPpTj0Hc4c6VjyAkViMAX039MeJmcm.QHwtBtq3AkBHZY7Q
 GFU8ueTca_.RN3tCSDVVBnbDsuJaOs2IiEKcgStvahtJYhL9iD_32ZOwiDs61Ovfwr5of4a6s_3o
 w7b3RotxBCLkpvKURwedv3yZ3eOgHEOpxspHgRPGGEDYsbuQQO9Wo7DF2p3hDDNvwi_4viMjM.o7
 P8KskCadWLXxAhV3sR6W0HMm9coGRsg.CumyyzuYM0NaG.XVAgiO8PMIJxkoGERSwswNDL18I2NO
 Z.Z8qCevdkMQYtXjXsD8G5ZdFp4ZI9_rzBRXEPMFS8wyAg6AcBqJJt2r2WT8jC7ulTKfKME5fVkb
 AAIabig4ZaqJpT0jC2An9tT5SE_fv5KN.1zUF_pKV7.O9AXoAPwtVwKEM2ocZMwxZQACGUSobeT0
 Nam7_pBIKgYaPib2zV.L5A6q_drGdmifbXnK3oL2wCboTbXfXSeFhyZ6lASwYkAjimLhcj35Ks4c
 uTBwQSZiWfKVI1y6EF0AZrHo1czzIsj52ly2nj9q7Wu6wC5CCxQxhWWLTjmlEHMcIwFjBusBZxzn
 FSbf2Rl_o2vH2AZzw1P0FkGKAL6dD2fecNi4JUk7HJjNKK5oxWhKOQRh7g1E.gON7NWSgtqECfih
 xvEKrKHT1scfZ_I6at_gIe.O._8GF0eC.J.KecHpnM.WCF8nSgqFXRkp56ud0CGyM_O.kMwo0wXw
 1EPIOzEvRJthui1IrorRWU30b89Mp3Whgq2vT7GYiPl8AQ3a6YDoOsvK1yz1IawCSUygoysfCs9e
 NgpePvwgUGkE_QWfc6IOX7VexfB6JesOLRMaRy8vDCUfFrYNUOl1IMPv4us0L4VpSgPJOk8LXD0o
 I5v5_S2GEdPH7pFR123_ylez4Q1U4ZOTVDOXhtR8kjkJIj.wipnm1ld9HoEDZ5I7T.mvoQQVeMGW
 4k4B0GoHaP1P.pLCxSFXcDIzwQpakyFhL.czpuajbWEJZzt1vele349wF_eF9P9O9MCByDJK5AAF
 gZP..KNRebFSb3Nb5meLa1KGbGBqF2USqpNmLDEMrDQNMrztJb9NsjzQJNa.5R585CH1t.0osOuj
 6DTwEMtZhn_NcmWsv_kE9V1ZYf660Q.g8AU02X6hab0pcTkvfF01BG94NAAmGPXSh.iarTO3nODq
 n3Rw7oJOPS.nI.5e7_XeByI3Z7IueB_7twWuaE9laiLvFDkDAYuHmTzqba7d2HQ9n7JWxcPHPoHk
 ooBSpzYyyEby778n.y2wwenaMytPxqhfuUw4tcY_JkWGJl8yXjKtuokRzH..CJgLtZuWhwWgG9B1
 fb9jlmr5MrJYgdNXD6.MkPe5D1DwdUbwNTQlQnCPp56sNNnA-
X-Sonic-MF: <althanipeoplerights345@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.sg3.yahoo.com with HTTP; Wed, 11 Jan 2023 12:00:43 +0000
Date: Wed, 11 Jan 2023 12:00:41 +0000 (UTC)
From: althani humanrights <althanipeoplerights345@yahoo.com>
To: 
	"20210920163940.946890292@linuxfoundation.org" <20210920163940.946890292@linuxfoundation.org>, 
	"20210920163940.986021614@linuxfoundation.org" <20210920163940.986021614@linuxfoundation.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Message-ID: <1628824211.705779.1673438441496@mail.yahoo.com>
In-Reply-To: <365706515.7734138.1673438437626@mail.yahoo.com>
References: <CAMz6RsQAN-Uhc_v8xUgqfPVNLeqwV6X0L_Z5UNrGaFu3uNduEw@mail.gmail.com> <CAMz6RsScn7nRjFnK6iDBKhqLHQX=Q-3_K5Oc2hgF51Mmi_oUnw@mail.gmail.com> <27224641.4468614.1672394920385@mail.yahoo.com> <941871073.4470453.1672394966032@mail.yahoo.com> <675150177.4013397.1672470172353@mail.yahoo.com> <907014785.2499605.1672470672655@mail.yahoo.com> <1596939819.3199233.1672470692671@mail.yahoo.com> <897473122.4755137.1672487873394@mail.yahoo.com> <1984586528.1954477.1672488056556@mail.yahoo.com> <1356839944.4531503.1672488341179@mail.yahoo.com> <652034697.4831519.1672633425940@mail.yahoo.com> <1618478794.315840.1672634215836@mail.yahoo.com> <803639125.5092834.1672660425744@mail.yahoo.com> <100727902.5096339.1672661234881@mail.yahoo.com> <130225747.5333225.1672720041409@mail.yahoo.com> <1746789838.5180684.1672746424569@mail.yahoo.com> <1658474756.4610089.1672805780804@mail.yahoo.com> <1187604549.5752565.1672806028589@mail.yahoo.com> <1408554601.5541665.1672806093875@mail.yahoo.com> <1127919855.5768282.1672906382491@mail.yahoo.com> <259514162.7777580.1672906602903@mail.yahoo.com> <861387660.7498074.1672906680282@mail.yahoo.com> <794288019.7727204.1673438409392@mail.yahoo.com> <1463414906.704624.1673438414088@mail.yahoo.com> <1350696626.57708.1673438418123@mail.yahoo.com> <205061992.7736374.1673438422697@mail.yahoo.com> <1491338262.7730183.1673438429230@mail.yahoo.com> <992362492.707665.1673438432625@mail.yahoo.com> <365706515.7734138.1673438437626@mail.yahoo.com>
Subject: Fw: Using Afghan crisis to erase QatarGate
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_705778_580248565.1673438441494"
X-Mailer: WebService/1.1.20982 YMailNorrin

------=_Part_705778_580248565.1673438441494
Content-Type: multipart/alternative; 
	boundary="----=_Part_705774_151214407.1673438441397"

------=_Part_705774_151214407.1673438441397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=20
 =20

=20




=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=20
=C2=A0 =C2=A0=C2=A0=20




=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=20


Date 29/12/2022=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ATCRF/221229/00=
2=C2=A0To:The Honorable Prime Minister of=C2=A0POLAND
|=20
| The Honorable Prime Minister
=C2=A0
Mateusz Morawiecki |
| Al. Ujazdowskie 1/3 |
| 00-583 Warsaw |
| NIP 5261645000 |
| Regon 012261725 |
| POLAND |

 |


|=20
 |
|=20
 |
|=20
 |




Subject: Using Afghancrisis to erase QatarGate=C2=A0In reference to the rec=
ent act by the Taliban=E2=80=99sagainst women=E2=80=99s rights in Afghanist=
an, it necessitates that leaders around theworld be aware of why such impos=
ed act of injustice has been imposed upon thesewomen=E2=80=99s and who stan=
ds to gain from all this =C2=A0It is of no mere coincidence that when Qatar=
=E2=80=99scorrupted authorities were cornered due to their recent corruptio=
n scandal, theinfamous =E2=80=9CQatargate=E2=80=9D, such scandal that neede=
d a crisis of much bigger scale toattract the world=E2=80=99s attention awa=
y from Qatargate, that is where Taliban=E2=80=99sacknowledge the request fr=
om their sole financier, Qatar=E2=80=99s corruptedauthorities leaded by She=
ikha Mozah Bint Nasser Al Missned, to create a crisisin Afghanistan to a le=
vel that will distort the world=E2=80=99s attention away fromtheir scandal.=
=C2=A0That is where Sheikha Mozah improvised a way to regaintheir image bac=
k as the savior and mediators of crisis, appearing to the worldas the indiv=
iduals who stepped in to convince the Taliban authorities to changetheir co=
urse of action and back the access for education to the Afghan women=C2=A0B=
y exploiting such crisis, Sheikha Mozah and of courserepresented by her son=
 the Emir, will portray themselves as the world=E2=80=99sadvocate of women=
=E2=80=99s rights and that their involvement was the main reason theAfghan =
women regained their inherent right to learn=C2=A0In the next few days, Qat=
ar=E2=80=99s imposed Emir and hismother will appear to the world, after the=
 world=E2=80=99s leaders have not been ableto find a solution to this crisi=
s and failed to uphold the rights of the Afghanwomen and depicting that the=
 world=E2=80=99s greatest nations leaders were not able tochange the course=
 of injustice that was imposed by the Taliban, only throughthe involvement =
of Qatar=E2=80=99s corrupted authorities in the process, thatoverturned the=
 decisions made by the Taliban=E2=80=99s and enforced them to allowAfghan w=
omen the freedom they all await=C2=A0Yet again deceiving the world into bel=
ieving that theyare the savior of the moment as they have been publicizing =
for months after theTaliban=E2=80=99s take over of Afghanistan and how Qata=
r=E2=80=99s authorities were the mainreason that saved many countries from =
disastrous situations by providing allfacilities to vacate everyone in such=
 short period of time. But what most may not know, Qatar=E2=80=99s corrupte=
dauthorities have been the sole financiers of the Taliban=E2=80=99s terror =
group fordecades, they have provided them with a haven in Qatar for the Tal=
iban=E2=80=99sauthorities families and till date they have a presence in Qa=
tar. For decades, Qatar=E2=80=99s corrupted authorities havesupported the T=
aliban=E2=80=99s against the world, provided them with weapons, fundingand =
even facilitated their presence on the world=E2=80=99s media platform, wher=
eby AlJazeera has dedicated its time to implode the situation and portray t=
heTaliban=E2=80=99s as a power that cannot be defeated, until the Taliban=
=E2=80=99s took overAfghanistan by force.But the world is witnessing that t=
his cycle ofdeception is never ending, as the attacks, killings and bombing=
 of civilians inAfghanistan is still ongoing, but now carried out by other =
insurgents, whoconveniently enough are also funded and supported by Qatar=
=E2=80=99s corruptedauthorities =C2=A0The hypocrisy in this process of cont=
inuous deceptivecycle, is that the world leaders are falling for it every t=
ime, or to the leastare forced to turn a blind eye, for some it is for assu=
ring their economicalsituation that may be impacted by Qatar=E2=80=99s nume=
rous investments in theircountries, for others it is for the sake of assuri=
ng a prospect in future gassupply and whilst for others it is for their per=
sonal benefits.=C2=A0Which was recently proven through the Qatargate, thats=
everal European Parliament Members, and some at higher positions, have been=
compromised and enticed financially to advocate for Qatar=E2=80=99s corrupt=
edauthorities interests at the EU Parliaments =C2=A0For over a year now, we=
 have alerted the EU Leadersand many Leaders around the world on the scenar=
ios that will be played beforethem, how these scenic events will be unveile=
d before them and what they standto gain from itSimilarly, as we are alerti=
ng you all today, that theAfghanistan crisis depriving Afghan women access =
to education is nothing shortthan a tawdry subterfuge to regain their image=
 in front of the world and todivert everyone=E2=80=99s attention away from =
QatarGate, at any cost and means possible=C2=A0Such desperate act by these =
corrupted authorities toprevent the European authorities from digging any d=
eeper into these corruptionscandals, as they will uncover a much larger num=
ber of individuals implicatedin all these corruptions and the greater the e=
xposure the greater thehumiliation=C2=A0Qatar=E2=80=99s corrupted authoriti=
es have also resorted tothreatening the European leaders in cutting their g=
as supply to Europe, but wewould advice the European Leaders not to take su=
ch threat to much concern, asthe decision to withhold energy supply to Euro=
pe stands with the United States,considering that they are in total control=
 of Qatar Energy through their longstanding relations with ExxonMobil, whic=
h till date are partners in all theirprojects together, even in their colla=
boration in energy ports in Europe. The ugly truth in this reality is that =
Qatar=E2=80=99scorrupted authorities have little saying or control over the=
 gas supply, thedecisions are made by the US and some of the terms are set =
by Iran=E2=80=99sauthorities, that is why Qatar=E2=80=99s corrupted authori=
ties till date financiallysupports the Iranian regime and openly welcomes t=
heir political members toQatar almost every month, even though the US has s=
anctioned Iran, Qatar=E2=80=99s stillhas over 50 daily flights in an out of=
 Iran=E2=80=99s multiple airports, all flights packedwith resources sent to=
 the Iranian authorities.=C2=A0=C2=A0Hence, the European Leaderships should=
 have a strongerstanding against Qatar=E2=80=99s corrupted authorities and =
should not refrain fromfurther investigating these corrupted authorities, s=
pecifically investmentsmade by Sheikha Mozah and her closest relatives, suc=
h investments that have anegative impact on the long run on the national se=
curity of every Europeancountry. Such information is readily available to u=
s and we can share itdirectly with European Leadership to facilitate their =
investigations uponrequest=C2=A0As for the Afghan crisis against women, alt=
hough mostcountries have stepped in to condemn these acts, whereby the Fore=
ign Ministersof Canada, France, Germany, Italy, Japan, Norway, the United K=
ingdom, theUnited States of America, and the High Representative of the Eur=
opean Union,have united in their condemnation of the Taliban=E2=80=99s deci=
sion not to re-opensecondary schools to Afghan girls.The condemnation shoul=
d have been made against Qatar=E2=80=99scorrupted authorities who have supp=
orted the Taliban=E2=80=99s and imposed them onAfghanistan, they have posed=
 themselves as the mediator of the situationbetween Taliban and the world, =
they have defended them at the UN assembly andthey have strengthened the Ta=
liban=E2=80=99s presence, why is the world leaderscondemning the janitor wh=
o has been placed in such position when they shouldhold the Director accoun=
table and responsible for all this crisisWho financially supported the Tali=
ban, who amplifiedtheir presence, who made them the monster they are, who a=
ired their take overof Afghanistan, the same party is responsible for all t=
hese acts and everyother act of injustice that follows, Qatar=E2=80=99s cor=
rupted authorities leaded bySheikha Mozah are the culprit of all these atro=
cities =C2=A0We, Al Thani Council of the Ruling Family, representedby Qatar=
i Citizens, are striving to expose the corrupted authorities that haveimpos=
ed their unjust ruling on the State of Qatar.These corrupted authorities ha=
ve exploited the wealthand resources of our country to advance their person=
al agendas and haveexpensed billions towards inflicting chaos around the wo=
rld.=C2=A0Conclusively, if you would wish to obtain furtherinformation that=
 will facilitate your investigations, we are ready to submitthese documents=
 only to reliable authorities that shall be appointed byyourselves. To obta=
in these documents, you may send a request to althani@althanicrf.org, and p=
rovide the mailing address and name of person to whom we shouldsend these d=
ocuments to, accordingly we shall forward the documents viaregistered posta=
l to be delivered only to the designated person mentioned inyour request (d=
ocuments will only be provided to official authorities ofEuropean Countries=
 and not to representatives, media, institutions,organizations or other non=
-related parties)=C2=A0=C2=A0Sincerely,=C2=A0=C2=A0AL THANI COUNCIL OF THE =
RULING FAMILY                   =20
------=_Part_705774_151214407.1673438441397
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp97dc07b7yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div><br></div></div><div id=3D"ydp6e6dc89byahoo_quoted_4143081795"=
 class=3D"ydp6e6dc89byahoo_quoted"><div style=3D"font-family:'Helvetica Neu=
e', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;">
                <div><div id=3D"ydp6e6dc89byiv4719550701"><div><div style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;" class=3D"ydp6e6dc89byiv4719550701ydp1c01eee6yahoo-style-wrap"><div></div=
>
        <div><br></div></div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03c=
yahoo_quoted_3781968123" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyahoo_=
quoted"><div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-=
serif;font-size:13px;color:#26282a;"><div><div id=3D"ydp6e6dc89byiv47195507=
01ydp55cdc03cyiv8316596066"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cd=
c03cyiv8316596066ydp7405ae0yahoo_quoted_3577730854" class=3D"ydp6e6dc89byiv=
4719550701ydp55cdc03cyiv8316596066ydp7405ae0yahoo_quoted"><div style=3D"fon=
t-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:13px;colo=
r:#26282a;"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv831659606=
6ydp7405ae0yiv6913696889"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc0=
3cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyahoo_quoted_3705667305" c=
lass=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691369=
6889ydp999b581dyahoo_quoted"><div style=3D"font-family:'Helvetica Neue', He=
lvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div id=3D"y=
dp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp99=
9b581dyiv0763382963"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv=
8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yahoo_q=
uoted_3443218434" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066=
ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yahoo_quoted"><di=
v style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-=
size:13px;color:#26282a;"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc0=
3cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yi=
v7828635075"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yahoo_quoted_4421535077" class=3D"ydp6e6dc89byiv4719550701ydp55cdc=
03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751y=
iv7828635075ydp273c8331yahoo_quoted"><div style=3D"font-family:'Helvetica N=
eue', Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div=
 id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696=
889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867=
"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae=
0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yi=
v3262043867ydpcfd71da0yahoo_quoted_3729370825" class=3D"ydp6e6dc89byiv47195=
50701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv076338296=
3ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yahoo_quoted"><=
div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;fon=
t-size:13px;color:#26282a;"><div><div id=3D"ydp6e6dc89byiv4719550701ydp55cd=
c03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751=
yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572"><div><div id=
=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889=
ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydp=
cfd71da0yiv3411939572ydpd69f3e71yahoo_quoted_4223056572" class=3D"ydp6e6dc8=
9byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyi=
v0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv34=
11939572ydpd69f3e71yahoo_quoted"><div style=3D"font-family:'Helvetica Neue'=
, Helvetica, Arial, sans-serif;font-size:13px;color:#26282a;"><div><div id=
=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889=
ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydp=
cfd71da0yiv3411939572ydpd69f3e71yiv0493789563"><div style=3D"font-style:nor=
mal;font-weight:normal;font-stretch:normal;font-size:10pt;line-height:norma=
l;font-family:Helvetica Neue;"><div style=3D"font-family:arial, helvetica;f=
ont-size:10pt;color:black;"><font size=3D"2"><div id=3D"ydp6e6dc89byiv47195=
50701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv076338296=
3ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572yd=
pd69f3e71yiv0493789563"><div><div style=3D"font-style:normal;font-weight:no=
rmal;font-stretch:normal;font-size:10pt;line-height:normal;font-family:Helv=
etica Neue;"><div style=3D"font-family:arial, helvetica;font-size:10pt;colo=
r:black;"><div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp740=
5ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c833=
1yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563">



<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyahoo_quoted=
_3584943226" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
ahoo_quoted">

<div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;fo=
nt-size:13px;color:#26282a;">

<div><br clear=3D"none">
</div>


               =20

<div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;"><fo=
nt size=3D"2">

</font>
<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;"><br clear=3D"non=
e">




<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd56248" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt8287358291">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd00313" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt5481713599">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd10368" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt3559872170">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd04204" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt5105180568">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd39934" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt6710090340">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd31740" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt8798939957">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd33743" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0653989343">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd74489" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt9730099278">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd27747" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4918458316">


<div>


<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">


<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;">


<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">














<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;"><br clear=3D"non=
e">

<br clear=3D"none">
















<div style=3D"font-family:arial, helvetica;font-size:10pt;color:black;"><fo=
nt size=3D"2">

</font>












<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">














<div>














<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;font=
-size:10pt;line-height:normal;font-family:Helvetica Neue;">














<div style=3D"font-family:arial, helvetica;color:black;">














<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3">














<div style=3D"font-family:Helvetica, Arial, sans-serif;" class=3D"ydp6e6dc8=
9byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyi=
v0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv34=
11939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp818c04efyahoo-st=
yle-wrap">














<div style=3D"font-family:Helvetica, Arial, sans-serif;color:rgb(38, 40, 42=
);">














<div>














<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468">














<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;line=
-height:normal;">














<div style=3D"font-size:10pt;"><br clear=3D"none">
</div>







<div style=3D"font-size:10pt;"><br clear=3D"none">
</div>

















<div style=3D"font-family:arial, helvetica;color:black;">








<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468">








<div>








<div style=3D"font-style:normal;font-weight:normal;font-stretch:normal;line=
-height:normal;">








<div style=3D"font-family:arial, helvetica;color:black;">








<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468">








<div>








<div dir=3D"ltr">








<div class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv=
6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326=
2043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945=
9933ydp145c5097yiv3524374468gmail_quote">

















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqt24579" class=3D"ydp6e6dc89byiv4719550701ydp55cd=
c03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751=
yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv=
0493789563ydp72805b1fyiv4659459933ydp145c5097yiv3524374468yqt2385289174">

















<div dir=3D"ltr">

















<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;">&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br clear=3D"none">
</span></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;">&=
nbsp; &nbsp;&nbsp; <br clear=3D"none">
</span></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;"><=
br clear=3D"none">
</span></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;"><=
br clear=3D"none">
</span></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;"><=
br clear=3D"none">
</span></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;"><=
br clear=3D"none">
</span></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-GB" style=3D"font-family:New;">&=
nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br clear=3D=
"none">
</span></div>

















<span style=3D"font-size:10pt;"><img src=3D"cid:DEQXlblB1Q7pLZsa1Dib" alt=
=3D"image.png" style=3D"width:342px;max-width:342px;" data-inlineimagemanip=
ulating=3D"true" data-id=3D"1673438439690"></span><br clear=3D"none"><br cl=
ear=3D"none">



















<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt;line=
-height:107%;font-family:New;">Date 29/12/2022&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;ATCRF/221229/002</span><span lang=3D"EN-US" style=3D"font-s=
ize:10pt;line-height:107%;font-family:New;"></span></div>





































<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt;line=
-height:107%;font-family:New;color:rgb(64,64,64);">&nbsp;</span></div>





































<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:16pt;l=
ine-height:107%;font-family:New;">To:</span></b></div>







<div style=3D"font-size:11pt;margin:0cm 0cm 8pt;line-height:107%;" class=3D=
"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp=
999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd=
71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c50=
97yiv3524374468MsoNormal">



<div style=3D"color:rgb(0, 0, 0);font-family:arial, helvetica;font-size:13.=
3333px;font-style:normal;font-weight:400;letter-spacing:normal;orphans:2;te=
xt-align:left;text-indent:0px;text-transform:none;white-space:normal;widows=
:2;word-spacing:0px;background-color:rgb(255, 255, 255);text-decoration-sty=
le:initial;text-decoration-color:initial;margin-right:0cm;margin-bottom:11.=
25pt;margin-left:0cm;">

<div style=3D"color:rgb(38, 40, 42);font-family:Helvetica, Arial, sans-seri=
f;font-size:13px;margin-right:0cm;margin-bottom:11.25pt;margin-left:0cm;"><=
b><span style=3D"color:rgb(64, 64, 66);font-family:Arial, sans-serif;font-s=
ize:14pt;">The Honorable Prime Minister of&nbsp;</span><font face=3D"Calibr=
i, sans-serif"><span style=3D"font-size:24px;">POLAND</span></font></b></di=
v>

<table width=3D"340" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" style=
=3D"color:rgb(38, 40, 42);font-family:Helvetica, Arial, sans-serif;font-siz=
e:16px;border-collapse:collapse;width:255pt;"><colgroup span=3D"1"><col spa=
n=3D"1" width=3D"340" style=3D"width:255pt;"></colgroup><tbody><tr height=
=3D"217" style=3D"min-height:162.75pt;"><td colspan=3D"1" rowspan=3D"1" wid=
th=3D"340" height=3D"217" style=3D"min-height:162.75pt;width:255pt;font-siz=
e:18pt;padding-top:1px;padding-right:1px;padding-left:1px;color:black;font-=
family:Calibri, sans-serif;vertical-align:bottom;border-color:currentcolor;=
border-style:none;border-width:medium;" class=3D"ydp6e6dc89byiv4719550701yd=
p55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b6=
57751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e=
71yiv0493789563ydp85eecb15yiv1910400471ydp44fde358yiv4645081892ydpae56623by=
iv1352765735ydpa7cf244eyiv8940196893ydped7cce27yiv9378961535ydp29a7181ayiv7=
426111224ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpf8f6c35dyiv1988=
236700ydpda9030f7yiv9322358174gmail-xl65">

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp85eecb15yiv191040047=
1ydp44fde358yiv4645081892ydpae56623byiv1352765735ydpa7cf244eyiv8940196893yd=
ped7cce27yiv9378961535ydp29a7181ayiv7426111224ydp2a6fbccayiv9463146603ydp4c=
9f5a14yiv8443379381ydpf8f6c35dyahoo_quoted_1506981337" class=3D"ydp6e6dc89b=
yiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0=
763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411=
939572ydpd69f3e71yiv0493789563ydp85eecb15yiv1910400471ydp44fde358yiv4645081=
892ydpae56623byiv1352765735ydpa7cf244eyiv8940196893ydped7cce27yiv9378961535=
ydp29a7181ayiv7426111224ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydp=
f8f6c35dyahoo_quoted">

<div style=3D"font-family:Helvetica, Arial, sans-serif;color:rgb(38, 40, 42=
);">

<div dir=3D"ltr"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" wi=
dth=3D"280" style=3D"border-collapse:collapse;width:210pt;"><colgroup span=
=3D"1"><col span=3D"1" width=3D"280" style=3D"width:210pt;"></colgroup><tbo=
dy><tr height=3D"40" style=3D"min-height:30pt;"><td colspan=3D"1" rowspan=
=3D"1" height=3D"40" width=3D"280" style=3D"width:210pt;min-height:30pt;" c=
lass=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691369=
6889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204386=
7ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp85eecb15yiv1910400471yd=
p44fde358yiv4645081892ydpae56623byiv1352765735ydpa7cf244eyiv8940196893ydped=
7cce27yiv9378961535ydp29a7181ayiv7426111224ydp2a6fbccayiv9463146603ydp4c9f5=
a14yiv8443379381ydpe4cb0adcxl64">The Honorable Prime Minister<span style=3D=
"font-family:Arial, Helvetica, sans-serif;"><br clear=3D"none">
</span>&nbsp;<br clear=3D"none">Mateusz Morawiecki</td></tr><tr height=3D"2=
0" style=3D"min-height:15pt;"><td colspan=3D"1" rowspan=3D"1" height=3D"20"=
 style=3D"min-height:15pt;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv=
8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828=
635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789=
563ydp85eecb15yiv1910400471ydp44fde358yiv4645081892ydpae56623byiv1352765735=
ydpa7cf244eyiv8940196893ydped7cce27yiv9378961535ydp29a7181ayiv7426111224ydp=
2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpe4cb0adcxl65">Al. Ujazdowsk=
ie 1/3</td></tr><tr height=3D"20" style=3D"min-height:15pt;"><td colspan=3D=
"1" rowspan=3D"1" height=3D"20" style=3D"min-height:15pt;" class=3D"ydp6e6d=
c89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581d=
yiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv=
3411939572ydpd69f3e71yiv0493789563ydp85eecb15yiv1910400471ydp44fde358yiv464=
5081892ydpae56623byiv1352765735ydpa7cf244eyiv8940196893ydped7cce27yiv937896=
1535ydp29a7181ayiv7426111224ydp2a6fbccayiv9463146603ydp4c9f5a14yiv844337938=
1ydpe4cb0adcxl65">00-583 Warsaw</td></tr><tr height=3D"20" style=3D"min-hei=
ght:15pt;"><td colspan=3D"1" rowspan=3D"1" height=3D"20" style=3D"min-heigh=
t:15pt;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae=
0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yi=
v3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp85eecb15yiv19=
10400471ydp44fde358yiv4645081892ydpae56623byiv1352765735ydpa7cf244eyiv89401=
96893ydped7cce27yiv9378961535ydp29a7181ayiv7426111224ydp2a6fbccayiv94631466=
03ydp4c9f5a14yiv8443379381ydpe4cb0adcxl65">NIP 5261645000</td></tr><tr heig=
ht=3D"21" style=3D"min-height:15.75pt;"><td colspan=3D"1" rowspan=3D"1" hei=
ght=3D"21" style=3D"min-height:15.75pt;" class=3D"ydp6e6dc89byiv4719550701y=
dp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b=
657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3=
e71yiv0493789563ydp85eecb15yiv1910400471ydp44fde358yiv4645081892ydpae56623b=
yiv1352765735ydpa7cf244eyiv8940196893ydped7cce27yiv9378961535ydp29a7181ayiv=
7426111224ydp2a6fbccayiv9463146603ydp4c9f5a14yiv8443379381ydpe4cb0adcxl65">=
Regon 012261725</td></tr><tr height=3D"21" style=3D"min-height:15.75pt;"><t=
d colspan=3D"1" rowspan=3D"1" height=3D"21" style=3D"min-height:15.75pt;" c=
lass=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691369=
6889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204386=
7ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp85eecb15yiv1910400471yd=
p44fde358yiv4645081892ydpae56623byiv1352765735ydpa7cf244eyiv8940196893ydped=
7cce27yiv9378961535ydp29a7181ayiv7426111224ydp2a6fbccayiv9463146603ydp4c9f5=
a14yiv8443379381ydpe4cb0adcxl66">POLAND</td></tr></tbody></table></div>

</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd72100" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd27504" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</td></tr></tbody></table></div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd56927" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd71149" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd63481" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">












<table style=3D"border-collapse:collapse;width:255pt;" width=3D"340" cellsp=
acing=3D"0" cellpadding=3D"0" border=3D"0"><colgroup span=3D"1"><col span=
=3D"1" style=3D"width:255pt;" width=3D"340"></colgroup><tbody><tr style=3D"=
min-height:15.0pt;" height=3D"20"><td colspan=3D"1" rowspan=3D"1" style=3D"=
min-height:15.0pt;width:255pt;" width=3D"340" height=3D"20"><br clear=3D"no=
ne">
</td></tr><tr style=3D"min-height:15.0pt;" height=3D"20"><td colspan=3D"1" =
rowspan=3D"1" style=3D"min-height:15.0pt;" height=3D"20"><br clear=3D"none"=
>
</td></tr><tr style=3D"min-height:15.0pt;" height=3D"20"><td colspan=3D"1" =
rowspan=3D"1" style=3D"min-height:15.0pt;" height=3D"20" class=3D"ydp6e6dc8=
9byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyi=
v0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv34=
11939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933xl65"><br clear=3D"=
none">
</td></tr></tbody></table>

<table style=3D"font-size:10pt;" width=3D"404" cellspacing=3D"0" cellpaddin=
g=3D"0" border=3D"0" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596=
066ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075y=
dp273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp7=
2805b1fyiv4659459933ydp145c5097yiv3524374468yahoo-compose-table-card"><tbod=
y></tbody></table>














<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd60774" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275"><br clear=3D"none">
















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd54753" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">





















<div align=3D"center" style=3D"text-align:center;margin:0cm 0cm 8pt;line-he=
ight:107%;font-size:11pt;font-family:Calibri,;" class=3D"ydp6e6dc89byiv4719=
550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b581dyiv07633829=
63ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da0yiv3411939572y=
dpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yiv3524374468MsoN=
ormal"><b><u><span lang=3D"EN-US" style=3D"font-size:14pt;line-height:107%;=
font-family:New;color:rgb(32,33,36);background-image:initial;background-pos=
ition:initial;background-size:initial;background-repeat:initial;">Subject: =
Using Afghan
crisis to erase QatarGate</span></u></b></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:12pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">In reference to the recent act by=
 the Taliban=E2=80=99s
against women=E2=80=99s rights in Afghanistan, it necessitates that leaders=
 around the
world be aware of why such imposed act of injustice has been imposed upon t=
hese
women=E2=80=99s and who stands to gain from all this </span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">It is of no mere coincidence that=
 when Qatar=E2=80=99s
corrupted authorities were cornered due to their recent corruption scandal,=
 the
infamous =E2=80=9CQatargate=E2=80=9D, such scandal that needed a crisis of =
much bigger scale to
attract the world=E2=80=99s attention away from Qatargate, that is where Ta=
liban=E2=80=99s
acknowledge the request from their sole financier, Qatar=E2=80=99s corrupte=
d
authorities leaded by Sheikha Mozah Bint Nasser Al Missned, to create a cri=
sis
in Afghanistan to a level that will distort the world=E2=80=99s attention a=
way from
their scandal.</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">That is where Sheikha Mozah impro=
vised a way to regain
their image back as the savior and mediators of crisis, appearing to the wo=
rld
as the individuals who stepped in to convince the Taliban authorities to ch=
ange
their course of action and back the access for education to the Afghan wome=
n</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">By exploiting such crisis, Sheikh=
a Mozah and of course
represented by her son the Emir, will portray themselves as the world=E2=80=
=99s
advocate of women=E2=80=99s rights and that their involvement was the main =
reason the
Afghan women regained their inherent right to learn</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">In the next few days, Qatar=E2=80=
=99s imposed Emir and his
mother will appear to the world, after the world=E2=80=99s leaders have not=
 been able
to find a solution to this crisis and failed to uphold the rights of the Af=
ghan
women and depicting that the world=E2=80=99s greatest nations leaders were =
not able to
change the course of injustice that was imposed by the Taliban, only throug=
h
the involvement of Qatar=E2=80=99s corrupted authorities in the process, th=
at
overturned the decisions made by the Taliban=E2=80=99s and enforced them to=
 allow
Afghan women the freedom they all await</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Yet again deceiving the world int=
o believing that they
are the savior of the moment as they have been publicizing for months after=
 the
Taliban=E2=80=99s take over of Afghanistan and how Qatar=E2=80=99s authorit=
ies were the main
reason that saved many countries from disastrous situations by providing al=
l
facilities to vacate everyone in such short period of time. </span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">But what most may not know, Qatar=
=E2=80=99s corrupted
authorities have been the sole financiers of the Taliban=E2=80=99s terror g=
roup for
decades, they have provided them with a haven in Qatar for the Taliban=E2=
=80=99s
authorities families and till date they have a presence in Qatar. </span></=
div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">For decades, Qatar=E2=80=99s corr=
upted authorities have
supported the Taliban=E2=80=99s against the world, provided them with weapo=
ns, funding
and even facilitated their presence on the world=E2=80=99s media platform, =
whereby Al
Jazeera has dedicated its time to implode the situation and portray the
Taliban=E2=80=99s as a power that cannot be defeated, until the Taliban=E2=
=80=99s took over
Afghanistan by force.</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">But the world is witnessing that =
this cycle of
deception is never ending, as the attacks, killings and bombing of civilian=
s in
Afghanistan is still ongoing, but now carried out by other insurgents, who
conveniently enough are also funded and supported by Qatar=E2=80=99s corrup=
ted
authorities </span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">The hypocrisy in this process of =
continuous deceptive
cycle, is that the world leaders are falling for it every time, or to the l=
east
are forced to turn a blind eye, for some it is for assuring their economica=
l
situation that may be impacted by Qatar=E2=80=99s numerous investments in t=
heir
countries, for others it is for the sake of assuring a prospect in future g=
as
supply and whilst for others it is for their personal benefits.</span></div=
>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Which was recently proven through=
 the Qatargate, that
several European Parliament Members, and some at higher positions, have bee=
n
compromised and enticed financially to advocate for Qatar=E2=80=99s corrupt=
ed
authorities interests at the EU Parliaments </span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">For over a year now, we have aler=
ted the EU Leaders
and many Leaders around the world on the scenarios that will be played befo=
re
them, how these scenic events will be unveiled before them and what they st=
and
to gain from it</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Similarly, as we are alerting you=
 all today, that the
Afghanistan crisis depriving Afghan women access to education is nothing sh=
ort
than a tawdry subterfuge to regain their image in front of the world and to
divert everyone=E2=80=99s attention away from QatarGate, at any cost and me=
ans possible</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Such desperate act by these corru=
pted authorities to
prevent the European authorities from digging any deeper into these corrupt=
ion
scandals, as they will uncover a much larger number of individuals implicat=
ed
in all these corruptions and the greater the exposure the greater the
humiliation</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Qatar=E2=80=99s corrupted authori=
ties have also resorted to
threatening the European leaders in cutting their gas supply to Europe, but=
 we
would advice the European Leaders not to take such threat to much concern, =
as
the decision to withhold energy supply to Europe stands with the United Sta=
tes,
considering that they are in total control of Qatar Energy through their lo=
ng
standing relations with ExxonMobil, which till date are partners in all the=
ir
projects together, even in their collaboration in energy ports in Europe. <=
/span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">The ugly truth in this reality is=
 that Qatar=E2=80=99s
corrupted authorities have little saying or control over the gas supply, th=
e
decisions are made by the US and some of the terms are set by Iran=E2=80=99=
s
authorities, that is why Qatar=E2=80=99s corrupted authorities till date fi=
nancially
supports the Iranian regime and openly welcomes their political members to
Qatar almost every month, even though the US has sanctioned Iran, Qatar=E2=
=80=99s still
has over 50 daily flights in an out of Iran=E2=80=99s multiple airports, al=
l flights packed
with resources sent to the Iranian authorities.&nbsp;
</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Hence, the European Leaderships s=
hould have a stronger
standing against Qatar=E2=80=99s corrupted authorities and should not refra=
in from
further investigating these corrupted authorities, specifically investments
made by Sheikha Mozah and her closest relatives, such investments that have=
 a
negative impact on the long run on the national security of every European
country. Such information is readily available to us and we can share it
directly with European Leadership to facilitate their investigations upon
request</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">As for the Afghan crisis against =
women, although most
countries have stepped in to condemn these acts, whereby the Foreign Minist=
ers
of Canada, France, Germany, Italy, Japan, Norway, the United Kingdom, the
United States of America, and the High Representative of the European Union=
,
have united in their condemnation of the Taliban=E2=80=99s decision not to =
re-open
secondary schools to Afghan girls.</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">The condemnation should have been=
 made against Qatar=E2=80=99s
corrupted authorities who have supported the Taliban=E2=80=99s and imposed =
them on
Afghanistan, they have posed themselves as the mediator of the situation
between Taliban and the world, they have defended them at the UN assembly a=
nd
they have strengthened the Taliban=E2=80=99s presence, why is the world lea=
ders
condemning the janitor who has been placed in such position when they shoul=
d
hold the Director accountable and responsible for all this crisis</span></d=
iv>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Who financially supported the Tal=
iban, who amplified
their presence, who made them the monster they are, who aired their take ov=
er
of Afghanistan, the same party is responsible for all these acts and every
other act of injustice that follows, Qatar=E2=80=99s corrupted authorities =
leaded by
Sheikha Mozah are the culprit of all these atrocities </span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">We, Al Thani Council of the Rulin=
g Family, represented
by Qatari Citizens, are striving to expose the corrupted authorities that h=
ave
imposed their unjust ruling on the State of Qatar.</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">These corrupted authorities have =
exploited the wealth
and resources of our country to advance their personal agendas and have
expensed billions towards inflicting chaos around the world.</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">Conclusively, if you would wish t=
o obtain further
information that will facilitate your investigations, we are ready to submi=
t
these documents only to reliable authorities that shall be appointed by
yourselves. </span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">To obtain these documents, you ma=
y send a request to </span><span lang=3D"EN-GB"><a shape=3D"rect" href=3D"m=
ailto:althani@althanicrf.org" style=3D"color:blue;" rel=3D"nofollow" target=
=3D"_blank"><span lang=3D"EN-US" style=3D"font-size:14pt;font-family:New;">=
althani@althanicrf.org</span></a></span><span lang=3D"EN-US" style=3D"font-=
size:14pt;font-family:New;">, and provide the mailing address and name of p=
erson to whom we should
send these documents to, accordingly we shall forward the documents via
registered postal to be delivered only to the designated person mentioned i=
n
your request (documents will only be provided to official authorities of
European Countries and not to representatives, media, institutions,
organizations or other non-related parties)</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:14pt;font-family:New;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-GB" =
style=3D"font-size:14pt;font-family:New;color:black;">Sincerely,</span></di=
v>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-GB" =
style=3D"font-size:12pt;font-family:New;color:black;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><span lang=3D"EN-GB" =
style=3D"font-size:12pt;font-family:New;color:black;">&nbsp;</span></div>





































<div style=3D"margin:0cm 0cm 0.0001pt;line-height:normal;font-size:11pt;fon=
t-family:Calibri,;" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv83165960=
66ydp7405ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075yd=
p273c8331yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72=
805b1fyiv4659459933ydp145c5097yiv3524374468MsoNormal"><b><span lang=3D"EN-G=
B" style=3D"font-size:12pt;font-family:New;color:black;">AL THANI COUNCIL O=
F THE RULING FAMILY</span></b><span lang=3D"EN-GB" style=3D"font-size:12pt;=
font-family:New;color:black;"></span></div>

















</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd19236" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd14423" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd22001" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd86606" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">
</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd49935" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd96103" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd08137" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd83124" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">

</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd48449" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd12951" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd16185" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd28489" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">
</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd15000" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd12594" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd29977" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd18993" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">

</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd37343" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd92727" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd17372" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd57635" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">
</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd74849" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd87728" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd44073" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd68829" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">
</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd99321" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd00712" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd48665" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd30753" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">
</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd98394" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd31851" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd18408" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">


















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yiv3524374468yqtfd83441" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097yi=
v3524374468yqt3034319228">
</div>
















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd60801" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd14989" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd07288" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">

</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd86179" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd53698" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd34641" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">

</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd88127" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd11474" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd58873" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">

</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd38740" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd77900" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd49890" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">

</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd51554" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd00702" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd29148" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">
</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd35181" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd13304" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd56689" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">

            </div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd15023" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd45831" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd90991" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">
</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd20322" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd54395" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd28558" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">
















<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3ydp145c5097yahoo_quoted_2887624828" style=3D"font-size:10pt;" class=3D"ydp=
6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999b=
581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71da=
0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv4659459933ydp145c5097ya=
hoo_quoted">
        </div>















</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd05914" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd31143" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd54594" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">
</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd00060" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd68127" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd78187" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">
</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd30116" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd24855" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


























<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd56918" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt0659255275">
</div>














</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd24121" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd26464" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">











</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd53430" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd87493" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">











</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd00758" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd18400" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">











</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd91788" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd71096" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">











</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd60121" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd81534" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">










</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd77839" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd47582" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">










</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd38914" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd29260" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">










</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd18765" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd07236" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">









</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd14429" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd18583" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">









</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd56019" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd12329" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">









</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd62241" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd27078" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">









</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd69156" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd67181" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">









</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd66349" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd36665" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">








</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd31248" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd72236" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">








</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd74280" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd09797" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">








</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd48386" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd02669" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">








</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd66331" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd61550" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">








</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd83169" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd57604" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">







</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd64481" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd95417" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">







</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd23390" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd71865" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">







</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd79689" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd38631" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">







</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd59683" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd48044" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">







</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd07214" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd55119" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">






</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd76636" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd77758" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">






</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd82496" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd44622" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">






</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd12941" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd00654" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">






</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd46701" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd75199" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">






</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd39103" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd10080" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">





</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd57150" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd50989" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">





</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd58171" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd57237" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">





</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd05495" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd32896" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">





</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd17649" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd65850" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">





</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd43298" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd53445" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">




</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd14591" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd30472" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">




</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd29910" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd37705" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">




</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd92077" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd55311" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">




</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd52966" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd13209" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">




</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd13131" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd63636" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">



</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd99846" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd38740" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">



</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd02693" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd06486" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">



</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd51948" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd18274" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">



</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd89281" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd91662" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">



</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd52378" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd32403" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd27876" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd42822" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd85690" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd74995" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd67866" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd04894" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd92183" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd69501" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">


</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd97854" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd23488" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">

</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd55438" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd87728" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">

</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd73915" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd68781" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">

</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd25046" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd29418" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">

</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd73345" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd47090" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">

</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd14390" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd95253" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">
</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd94249" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd80059" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">
</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd20759" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">




<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fyiv465945993=
3yqtfd11842" class=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp74=
05ae0yiv6913696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c83=
31yiv3262043867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563ydp72805b1fy=
iv4659459933yqt4105331509">
</div>


</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd36678" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">

</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd55623" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">

</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd53393" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">

</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd64277" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">

</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd92691" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd60197" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">

            </div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd77098" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">

        </div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd51191" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd01854" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd24310" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</div>

<div id=3D"ydp6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv691=
3696889ydp999b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv326204=
3867ydpcfd71da0yiv3411939572ydpd69f3e71yiv0493789563yqtfd26422" class=3D"yd=
p6e6dc89byiv4719550701ydp55cdc03cyiv8316596066ydp7405ae0yiv6913696889ydp999=
b581dyiv0763382963ydp2b657751yiv7828635075ydp273c8331yiv3262043867ydpcfd71d=
a0yiv3411939572ydpd69f3e71yiv0493789563yqt7278535656">
</div>
</div>
</div>
</font></div>
</div>
</div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></div></div></div>
            </div>
        </div></body></html>
------=_Part_705774_151214407.1673438441397--

------=_Part_705778_580248565.1673438441494
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename="image.png"
Content-ID: <DEQXlblB1Q7pLZsa1Dib>

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

------=_Part_705778_580248565.1673438441494--
