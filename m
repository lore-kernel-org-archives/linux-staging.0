Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26330184A
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 12:36:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHa33uURvKJiQPDIN86UOLBJ7BfMSR5keHnqu5wbD1lUmBPkzNfpTHrm3fceamL0Y5EL7wv6JW/CbLvXaJsJPx77YUitrxOyqZuE/ftpZULL5Gpw5XyFFCPvkY5jzixK3wH5TZWCkN3Eo6McPsBt5IUwkGIAm7bE9HxIu8oeh75LgW310xiD1LpXuYLskwqEKQY6IEuCwqNLz0xa1vU1T/PAZi448JjXzhrMnQ0FvAajQ4j551ytnYqPwBi0lveqRGnMXwcXo5rwYH2YpthOWzmRkLRS1HFKYQQ3VQl0zOo3X2DQCyJHAMGU5zB9ICIsDZjrKWbNQPZYDOcgtFjDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeV5daPWURP7kfbvmMgRzFV5VJufoAug89e/l7MCAAk=;
 b=TPuHLyaSLLQjPC1yzJF5no91u6gH9fdmdTSOTAVgcZRCWy6pV2are7QJgS/wdtf1Ffbl5nGVJujdKa+FKfIzsiwwgpVwyfkaddnqSkFyjEbyWzy5bUVIG0dBE3FKLL9AVirrd/lyWmJ9/O5h1EOKAzk7KG2qPz90v0XM8l2PDZVhz+zYQ650UjQRkQ4iXeDDUNWqRzjMLdqcG6PGgA5c7eoKKBxo5ZnLppyGSDTxWRsrbp0N56FudqaxXrBlzRywMhS3EEing7XyobHUC2Q4LgwywI4qMe20z/TrKQv0FpB6zpEhDLblQblFi8Iv0Q7yIybAtRaTU5CbaH/ww4lHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeV5daPWURP7kfbvmMgRzFV5VJufoAug89e/l7MCAAk=;
 b=uJeEwS6A8LUct/2KzXel0n1my5gtnL7AG2Ovkf4KesGydmUGhJchw9Ztt+OS0E/jMPgwDOFLmXyujFZj3jFTDNS7AQCq8BK+3+kqfG4zsPcJHxSSebuC2Sdt1FN/EC5YZkwizqC+RkmLY4TMipzHJUJQNa2AwW36fGEUYxLrpWvDUe0d5CdvXo7BI9AJQx6q2POvCjB6g+RblDr7lfHAs4FL9OaGM+bbzrVIipBmo1cTcVj2rtAfp0oMlXyLpBl0XFT+FDLEBmgMjh60Lq2siOYI2tP2IBL4YGlwxTTrnS5tWBCJvXGZ87a0BLPWW7wMTRs1t48bD91j0wMJeK7q1Q==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by VI1PR02MB3709.eurprd02.prod.outlook.com (2603:10a6:803:2f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 12:36:05 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5164.028; Wed, 20 Apr 2022
 12:36:05 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index:
 AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBqgAAIDoCAAAPEY4AAAsaAgAABLx2ANZRbzYAAAi+AgAAAb/SAAASzgIAAAjNcgAAHoQCAAAMaYw==
Date: Wed, 20 Apr 2022 12:36:04 +0000
Message-ID:
 <PAXPR02MB73104582322690E1D95D1A8D81F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/tU5BDIPl9VuJw@kroah.com>
 <PAXPR02MB73103C308D5942977331A28881F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/xoWttIba3UdIM@kroah.com>
 <PAXPR02MB7310F3F8129ECA908C3A0B4E81F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/54NGq70g1QuQq@kroah.com>
In-Reply-To: <Yl/54NGq70g1QuQq@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 858f9bb8-69be-9069-0b5f-0268c7626823
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63ce8ad2-f3d5-4b08-6426-08da22ca562f
x-ms-traffictypediagnostic: VI1PR02MB3709:EE_
x-microsoft-antispam-prvs:
 <VI1PR02MB3709692B6D59E508EDFAFF3C81F59@VI1PR02MB3709.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8lZLS8GSf1bC4aYFZIErZTH3mCHkCJ2OXAmzQTDGa1e4QlqzKaialX1DmqrJLzrpUyYEu2xZwr174smtj/U/nkMCAJkT+9oxTySZ5+qZoKWWTsfyGWqy3IAWaCBNKxJ3q8XT7HMpf4XKMBzhykTFIuuxVQh+hyI8bBH2lOynJ0i4CPdeom4MbLasBwEJP+CDakTEp9dfSycg6MOFIGPcQd+fzXJ6vNXJ4fuul/cS9MeZ9sWG8Vyn8FEWTzl0cNaX2mTFcfYMa8Iq1VC21wsPrTXP6WhFrzUXXchXb9qI405GtSBBk4CTgiBIznRIB9/n5pdmHe2AnWlqbbHL5I+BqofROMdUPd/oji+REXNXhO6Qejc8G0LGImzozMj5Mc5Eaq71efRAUl2i9E+Lr8QLV/e7qm8CJpPBHZll5NSKzN/d7TMLCDYHfOYgN91UHTNrN5X7yrqXdQvi3TZDlUXoY9HzW0PCyaeqLC4XfROJAA19+iLjpkG5Nr9nEKfoaBrZznab/M+bGZSODe2U7XErswlDEvHKHJi60seNSc1Dgn0ivd/k5b3z42XGCs8hU0Rkdlt/Fb43mkOd+UTAhKTkJp1v0Sdi6pVXE3lnefnfjwpq/7LSKyPu1RWlD1uNabfJrsDQXZ4Ky4lL0vbq9NBNPC0P8b8tgdAeGhfrPIFz/8aPD+kJyNztN5GON2WO93cjtYZg+GS2HIDqV7b0s8LfGg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(54906003)(508600001)(9686003)(2906002)(66556008)(71200400001)(8676002)(64756008)(4326008)(26005)(76116006)(66446008)(66476007)(52536014)(8936002)(5660300002)(91956017)(186003)(66946007)(316002)(82960400001)(122000001)(7696005)(83380400001)(6506007)(33656002)(55016003)(86362001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z1/j9EGbCJMf/hDDmT0MIvd39aKdkvGG7R4tBNoGQN/76VNgvcP770Q/xJ?=
 =?iso-8859-1?Q?mV4fiub+RxXmol4kNDz/+5EpUSGyFFl2LwLcnO37GAQGIPYT2pjI0JcdSG?=
 =?iso-8859-1?Q?aPJolUjNTlBcNdueKTDMEjQJgLse0g47v6oiiW2SOeAjLeihVoqEIe/ERr?=
 =?iso-8859-1?Q?sk2EQqGtgAvTt8828yTDRYCuW3f03lE/2pwYGJakgEdq5XCA2GOWlzMOJW?=
 =?iso-8859-1?Q?kiw5e+MQxTzC2Wo0SYTb6juTJCFkPew0mjBiM9togAWLMz6y1xg8wIgctB?=
 =?iso-8859-1?Q?IockYVE2Brj9C8Icvvpsz+wBAXl49oKMMCoQtgkr/wdiWeh8j3OpBuKjGQ?=
 =?iso-8859-1?Q?aC8c/AKR5OeSgwOb408l5vO0JjjcSmY3GuaT/mjEC09+Uhs8ATnGeLEyNu?=
 =?iso-8859-1?Q?uGXYn78f27+PgUzahiKwaTtsH6KrsHZLk00t+yrcVYTbP4t3mMBMBrPt/x?=
 =?iso-8859-1?Q?CxVT8K3U/hhvmhDK9CxAyv9cNcT3zGPwKnTyIAII/hpM0I4NlReBY4Azo1?=
 =?iso-8859-1?Q?4Mi9OQfzrHUr4jZ3fY4w4ERf6kH0ErGdPtd8B3Tx7BLBNX20DeJ7PVABTJ?=
 =?iso-8859-1?Q?LK4OUjzhSa7hPF6mXPQDPFi1ruJGIQVhD+XFUOZzxAGtj2VIMgbTwJIutX?=
 =?iso-8859-1?Q?N+qmDagJE2IyDxPhaWTm+WigdZkZUoGu86/wYk0d+VQ7eRSsJUU9EvTncv?=
 =?iso-8859-1?Q?lkd66XhhOSxaubBjfN2wzXUR9KZJJRUd8HJe64ifqjKiuRGEQWQFCzZQzq?=
 =?iso-8859-1?Q?57M2Y1hq3ux+tMbpTV3+Lz36Dtc0m4/sy7p6gNkAqWUPxyQOSlXSL7XC9L?=
 =?iso-8859-1?Q?E8kt+ZWk3ZPPXHcNWDbo6WChlvzMW3FN5KxxK6Pn3uUwHkBlOnDdUtyc+V?=
 =?iso-8859-1?Q?rV43Xx97rGVMvTOkq+uA+ciJLFgHZANn9RwqKeu7lFERctxfeLST//KdbF?=
 =?iso-8859-1?Q?6ZDpqjW6h9LPBcgYrl4jERp4r8PDtcPO0wntymYRDNf2eYnCCt32mYUS/f?=
 =?iso-8859-1?Q?tUO9batHZvFO2IIGorK8MGIm1FYCFvdGpqBHNRCh+Qe0gF2fqTKteesBGU?=
 =?iso-8859-1?Q?I3KLtM8uydJcuHkS9tbF9c97GfjCpT9vgZNTArRyibzo7iW/d46LeUS6vV?=
 =?iso-8859-1?Q?nidsdYql47hiIOaZ0sNiC3Xpv0+bsthnMtRRgSGCUTWOr38gUWknZ7O/a4?=
 =?iso-8859-1?Q?fBDTn8XD4O0vQdwCHwMMmqFUQA5cgn7EHx1/StG2bVc0g/oDXiva0VCl+J?=
 =?iso-8859-1?Q?5M1gURL/645m2+uhwd6F1kktbHQRY6pwgLG2gEqgI3NKPdYFfXv0/XWNuS?=
 =?iso-8859-1?Q?r8Mrxrdza311WML3fdKWYPGjfjde+pB9fZ2zFrJjBGrcJ90WCnPh1s1LN+?=
 =?iso-8859-1?Q?kEZyUSMVkjMVPEei4bIqUP56BAPNjLgx8MIHjsNH+7KMWjSNUE97sq/f/+?=
 =?iso-8859-1?Q?Xhu71SOmgsKbbtnPgVV5vG/CKottAljgQTIQ1coZ78C9fQOTyY0LpM8g6G?=
 =?iso-8859-1?Q?58fjuL565AHJQXSLVvrhPjG7JIfYttbcXEDpjR20iXnRR/HDyxGMOi2fWz?=
 =?iso-8859-1?Q?wwSC30DZTMpg2O6WaeqcZEw+STx+xGHdt2vT9srBeFr3O4VYMDWwEswj/k?=
 =?iso-8859-1?Q?oEDlkRCceyzePK8RcFJAVaKwOmKWcf+VR0HXkSrcGnZ/7L1iSUjvNuto0l?=
 =?iso-8859-1?Q?c8qPCOFCANa+PsXpPwDTdhNAW7VWHtOYK8wjIImLW3mJILXo0DmaYutbhw?=
 =?iso-8859-1?Q?OfVpeqR66m/oP15nvGOCx6u93QbL4leMRsos8JmI5lN7Ta/MOpz9nXyeOM?=
 =?iso-8859-1?Q?cCZHaiUVcA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7310.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ce8ad2-f3d5-4b08-6426-08da22ca562f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 12:36:05.0093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GBZCl0KU/bst6DDph4gDpbtXEEQWiRD5TgixR8uUPY89o/PzY69Q6jLDNIrgC0ESSTACwtNuiDZM6YK8G8ypQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB3709

>From: Greg KH <gregkh@linuxfoundation.org>=0A=
>Sent: Wednesday, April 20, 2022 15:17=0A=
>To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSM=
P Linux Maintainer <linux.vsmp@sap.com>=0A=
>Subject: Re: [RFC] staging/vSMP: new driver =0A=
> =0A=
>On Wed, Apr 20, 2022 at 11:57:51AM +0000, Czerwacki, Eial wrote:=0A=
>> >From: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >Sent: Wednesday, April 20, 2022 14:42=0A=
>> >To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP =
vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >Subject: Re: [RFC] staging/vSMP: new driver =0A=
>> > =0A=
>> >On Wed, Apr 20, 2022 at 11:38:57AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >From: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >> >Sent: Wednesday, April 20, 2022 14:24=0A=
>> >> >To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; S=
AP vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >> >Subject: Re: [RFC] staging/vSMP: new driver =0A=
>> >> > =0A=
>> >> >On Wed, Apr 20, 2022 at 11:18:15AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >> Greetings Greg,=0A=
>> >> >> =0A=
>> >> >> >From: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >> >> >Sent: Thursday, March 17, 2022 11:04=0A=
>> >> >> >To: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>=
; SAP vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >> >> >Subject: Re: [RFC] staging/vSMP: new driver =0A=
>> >> >> >=0A=
>> >> >> >>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:=
=0A=
>> >> >> >>> >> >What tasks?=0A=
>> >> >> >>> >> support of other information bits like stats=0A=
>> >> >> >>> >=0A=
>> >> >> >>> >I have no idea what that means :)=0A=
>> >> >> >>> in short, the hypervisor can provide stats it collects, future=
 implementation will export that too=0A=
>> >> >> >>=0A=
>> >> >> >>The trick will be _how_ you export this information.  Let's wait=
 on that=0A=
>> >> >> >>one for now, your current api has lots of other questions to wor=
k out=0A=
>> >> >> >>first :)=0A=
>> >> >> >=0A=
>> >> >> >sure, thanks for all the help.=0A=
>> >> >> >=0A=
>> >> >> >Eial=0A=
>> >> >> =0A=
>> >> >> I was wondering, after I've switched the driver flow to the pci dr=
iver one, I lost the ability to prevent vsmp.ko from loading in case no dev=
ice was found.=0A=
>> >> >> is there a way do to so?=0A=
>> >> >=0A=
>> >> >No, that is not how drivers have worked since the 2.4 kernel days (i=
.e.=0A=
>> >> >20 years ago?)  It is fine for your driver to be loaded even if ther=
e is=0A=
>> >> >no device present.=0A=
>> >> >=0A=
>> >> >But, your driver will NOT be loaded automatically unless a device is=
=0A=
>> >> >found, so why would it be present in that situation?=0A=
>> >> >=0A=
>> >> >thanks,=0A=
>> >> >=0A=
>> >> >greg k-h=0A=
>> >> =0A=
>> >> because there are other modules which depends on it.=0A=
>> >=0A=
>> >I do not understand the question.=0A=
>> >=0A=
>> >> I guess I can detect it as part of the other module's init=0A=
>> >=0A=
>> >Huh?=0A=
>> >=0A=
>> >Try it and see, the linker will properly pull in the needed modules if=
=0A=
>> >you have symbols in one module that are needed by another one.=0A=
>> nothing prevents a user from loading the modules even if the device is m=
issing.=0A=
>> the driver's hierarchy is one api modules and two unrelated modules whic=
h depend on it.=0A=
>> running modprobe vsmp_logs on a system where the device doesn't exists r=
esults with a kernel trace.=0A=
>=0A=
>What exact "kernel trace" is emitted?=0A=
accessing the bar of an non existent device.=0A=
thinking of it now, the api should return error in case the mapped region i=
s not inited.=0A=
=0A=
>=0A=
>> obliviously, this is not something accepted by the community.=0A=
>=0A=
>I do not understand what is not acceptable?=0A=
a module crashing because a missing invariant testing=0A=
=0A=
>=0A=
>> >=0A=
>> >But if that is the case, why split them up into different modules?=0A=
>> splitting the driver into three modules is purely for flexibility reason=
s.=0A=
>=0A=
>Flexible for whom?=0A=
the end user=0A=
=0A=
>=0A=
>> e.g. on runtime a user can decide which parts of the driver to run=0A=
>=0A=
>How?  And why?  A kernel driver should "just work" no need to configure=0A=
>anything or only load, or not load, a specific set of drivers.  That's=0A=
>not how kernel modules work at all.=0A=
that is why I think I should merge all the modules into one=0A=
=0A=
>=0A=
>> >=0A=
>> >I do not understand the question really.  Try it and see first and if=
=0A=
>> >you have specific problems, please post the code and we will be glad to=
=0A=
>> >review it.=0A=
>> maybe I just need to forgo the flexibility and add all features as a bui=
lt-in which isn't configurable=0A=
>=0A=
>What exact "flexibility" are you trying to do here?=0A=
per feature flexibility, for example, the ability to read logs via the devi=
ce and display generic information=0A=
each one is encapsulated inside a different module=0A=
=0A=
>=0A=
>And again, nothing should be configured, it should always "just work" if=
=0A=
>the needed hardware is present.  If not, nothing should happen.=0A=
>=0A=
>Again, post your code for better answers, this is all just=0A=
>hand-waving...=0A=
I understand, I'd prefer to understand all the aspects of the issues I'm fa=
cing before I load more code for you to go through as I assume that your ti=
me is precious=0A=
=0A=
Eial=
