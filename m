Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD91841
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmX0jIHoQQlDgcV/hggcu/jdN4Rw4J+iiHUCW3CXAXz3OO3cmfp6B+uhpExgbDvC1W6kx8kos8mVM/WY49TFAvxZuc31T5rPvQ5u/JR21irZ+lVIO1I/nSMbbdr8NEHnzd1XcdmigWUv0b+ROIaPgGF+vHB8eJz9CVlB9SawKr5a8PaU2ckXfBRAdsWH8O/K5Olx7Q+UgyLiYAO2Sy8fcWDnROVyjDQww6wPR5IXTc1C2+FYYG/EtzXbfLu44LVJ2q6wNVqYSP6wwF95H+4EEgfp7cf6v+c0+j2//j6dO3hkSH7rE043NEXi9jMqTPt74jC0hRvGDtxgwETIHQPscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj/HMb8D8pcF8tw1jKKYTPda5ftX22UPIWQQCXKNbfM=;
 b=ferGReFXJEQCw8KERLH09sCaG07HP6961uRnKsQwosbs2l8Sa/uhuZgWJ4c4SvkiWdxDKjA1PWTgrE/SDSyE5RGvZvbvu6oLwTsLt6G/sihX+QXreNAHxJtMFLo33OjVhSbXJ58eMfB9TYk/gIonYLTvDyBCsKG/Qrojf+Molljz9lhXGQqc2bR9EOLCltD3DH73r7k3uXZpJRB9UQW9YqyaznguUvM7MRBpDAP621jkarhiCvfAlbilILDmCESW9j99Od15Q+Alxw3blUe6YwncqDWnK5liQapDqo0TCEsU7TTMXDf6wYKJu3OmKeKVs8hivCKjZEBKUeCHfmFoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj/HMb8D8pcF8tw1jKKYTPda5ftX22UPIWQQCXKNbfM=;
 b=QhDbaKj4esowEdOeXiNYP6G47IYAMhDrd29zSqov+XlG2NG/nSVaRj/wqvR32tDCqaTtHyLk9NKB2DokgTJT+6t/XO78ChgSZuLZ1W6BNr7Ztz1c2H4IMqiWWXDBnwxWw4sHldkoQp++3/GjIEOjmEtyoV++ExinJs+Lk0Yky3OmTFKtwv8tlVzp0bWGAj9HAKPzSTyTqTufsAv3CaFA2d9X9kqd1d9dNAB9smIkGKE7WbXy3W5mp/jFeyphM/Z+kdPDfHunqJNo8TRU1ugqpgnCrDCEcNRmxF+gmTcK9uWVpCRGvB/1yZNJKWjh28Gqt8XEI4+XwbM6d+crbUWCew==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM0PR02MB4500.eurprd02.prod.outlook.com (2603:10a6:208:f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 11:57:51 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5164.028; Wed, 20 Apr 2022
 11:57:51 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index:
 AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBqgAAIDoCAAAPEY4AAAsaAgAABLx2ANZRbzYAAAi+AgAAAb/SAAASzgIAAAjNc
Date: Wed, 20 Apr 2022 11:57:51 +0000
Message-ID:
 <PAXPR02MB7310F3F8129ECA908C3A0B4E81F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/tU5BDIPl9VuJw@kroah.com>
 <PAXPR02MB73103C308D5942977331A28881F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/xoWttIba3UdIM@kroah.com>
In-Reply-To: <Yl/xoWttIba3UdIM@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 8251e3cc-fea1-0184-03ca-6c327c11bd73
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2a97de3-ffdb-4cd6-6d00-08da22c4feea
x-ms-traffictypediagnostic: AM0PR02MB4500:EE_
x-microsoft-antispam-prvs:
 <AM0PR02MB4500CADA5F841355CF80C8A081F59@AM0PR02MB4500.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +j9oAX34uFIoKn1YMjmrz/pd7nTVlgIJssc+Jv/WAJFBDPQwZ6AVFTCfnQ7a8j5qn+6tT9M92li7aUHc9uJXIG2P/NeGOu/TRNaV1mFj+pwn02wiDVkk6FBaWX5aDF+3/1evM1iCXfLYwb1esH8nxFmnsIcXGS4gt22RGtgp7XYKx+n+9K/XGVynBE7dmhQoNohNLXWER4HaLrhKoHkN8hgyRfeGNYGAt2A/RTc98CMfADEdAWs/Tho/iTlxQc1PJCxJDBzM9oaHEwPdU4gFT0+CbG2pmZEwdwhGGnVsWWNFVRVG1lHLYMe7VIr+kDoHlmt+KrIKgWsdZxW8P2DZUGWgBQXciBeAgx5QMZXWDPj95t+jqPYzmXyOGQ/DnTD4U4tHOwcOOpSjxl0JGgGHhUHkqOceUOOLSUqCsGGLu80kPpvfqmhsBWY6zoihKN6r47jczAPGDoV3XJkfqjRr3rplP6vn4o8BEdTulPDK73WotGzt7iV6TdhM3UXkAHY1c4Dm59zNJAshfcyKEePsVIFHRuiASqdd/a0tycbMBb82g3UD3McCmRrUvZBUjK0ijsMNHa8naIB1WRPkxKXzdKaWBtarslRfKbIIBrsnHnw7npugqtdGsn5Vys57DwrjUiZ4r+N6krxhJ0ALDCNhaW4IUmHEOOx14EJ1zDle+W2bM0wmvm6ZYe6HIq4M5oA8ONdx8zVUnUPtZTnL9JkVfA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(186003)(82960400001)(8676002)(76116006)(64756008)(38100700002)(38070700005)(83380400001)(52536014)(122000001)(8936002)(66946007)(5660300002)(33656002)(91956017)(55016003)(2906002)(4326008)(71200400001)(508600001)(66446008)(9686003)(7696005)(6506007)(54906003)(6916009)(316002)(26005)(66476007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?njQ1JbarFDn5diSqoS0e3bBsupIZIqUEag22aEltJIjeIwBtngX+PZJ3JG?=
 =?iso-8859-1?Q?fXgq++6B9nUqooM6ue4y/aZ5k2hkCZdSxCFcNtnwhUVh3KLwzrwGLtyVEp?=
 =?iso-8859-1?Q?p0QJs0W4oc4yH0QX0i7cpuSpOmpxTuqNDIhOCRNs++ET7AvFv7qa6oter6?=
 =?iso-8859-1?Q?tD/ivfytNy/LQvylw/MyUrYXb5KjWaC4ViarGoM1DQf7wjpLIMKKUMGV7l?=
 =?iso-8859-1?Q?IS3f+GbTnv4lkZu5L3jg5qNkM0cfY8evJlfEwBwv7tuNU39fztH64h/zSq?=
 =?iso-8859-1?Q?Au+lRYhfn5C9wH4F2ngHRTePJ/5unPn5rQklHhzdZYP1g40cho7bKxyb9k?=
 =?iso-8859-1?Q?NZ0FWWu1XXxDC1kPsHM+nvuyIWPNjJowNPkCxrQJKsbpHxBkgA1YOoLJsv?=
 =?iso-8859-1?Q?OxzSy7qzaSX4JcyLkl3oxziVi8+6+zQInZ3Wu8bVYYXOeBCA5z4FHtEIB9?=
 =?iso-8859-1?Q?DXcBVwrsBLC0EVWV9W9fM9WXIWSJsDQq6ZUSYBcQc3qwmtHPfZWvxgSSeI?=
 =?iso-8859-1?Q?eb0zZxDHRrm4TgVPhypr8yT/Si/oET+5sgFyg6Pb74G0uSH6Ybve5DG4og?=
 =?iso-8859-1?Q?H6J/r6xb2J9QGRh7b54p5dxzwdljiNPdpNtWFIrInUrs3MjJwJPW7lBlEF?=
 =?iso-8859-1?Q?caOPSimt3J9BLJ6vafU3Kqzzf9tzLy9ZX8riTy+Z4nejBXzy7pHsDkJO44?=
 =?iso-8859-1?Q?UBXxQu1wCbADAMi19IpgzJytDkdr6qLWRi9LFevZ0UeaP8wjeXFt5J9sQg?=
 =?iso-8859-1?Q?jmDT9oX9S/ssI6ZBpHtv5mAWCjNihAvruy1QJZehLI9RZPJEbMiNmhVRIH?=
 =?iso-8859-1?Q?5ipQNRusx2RzYP/CNMAao+VjnSNIEbhPZsjTHZkxQbpteo10Ij5YcXUE0j?=
 =?iso-8859-1?Q?UME1uAlSSvkzVC8QC0Tz/nGqKQ317+Aebmk37XfQqbSdZU9aE7sKtwYEhl?=
 =?iso-8859-1?Q?txCTyKRnZzUKC2DnfTh/lSuhvIdOdzPOmDkBCtkpI6adeKCOhtgGVg7AXH?=
 =?iso-8859-1?Q?ZNun+As3hNZvBNVS3qa+PrU/i1wqLVVUyXpXcmRRF2yA9h0qwtDJQDC64t?=
 =?iso-8859-1?Q?4g/nmsy5OZQubog2rQPMMiBnr56lHzf30NPYqu6MmmsXfWsauvRkCFima3?=
 =?iso-8859-1?Q?/J93WONS8bLdLxggTO6CTuE6p5TZ7R5u5b9MLwIA4sCpEzsyDbuconSNCr?=
 =?iso-8859-1?Q?Zvkr+heZd4ZNa9Tybp5Xj52ViPE0oPqXJAYBX1tk3of1Tni+rbnaVZrnP1?=
 =?iso-8859-1?Q?Un5dIc2agnoPDlwpMZ3MbOEYue/zZjtaH5GGCb9PmfMDmFSFuRMLKQvzUY?=
 =?iso-8859-1?Q?3i2kv/sBeX4QQxLciKp+DFfXSWujYt/wLI+D86C5yF9xYrafUQvfPjQtcV?=
 =?iso-8859-1?Q?6/PYRVVOuWs4u/qbFoWNhIw6B8W2FURlibfIVMhbzVp030WlPPZIng9bv8?=
 =?iso-8859-1?Q?ZiiTMNYI3hRiv/qQKVYoF4eZNj4O8oqCO7fuhYu6pDRQichvEka9zcOjT8?=
 =?iso-8859-1?Q?9Mk2w6VtyWXLkAuoBBUXeJ52plmqC0FDRiVPZKTJ8tfe5afWjCXjwWBsky?=
 =?iso-8859-1?Q?TK0Ui3Ji4iarH7PAd0OmO2QLgSteEQM2ln9fktdPVEqf+Twrm4E7hSuU7I?=
 =?iso-8859-1?Q?1APtO35BrYDTk2pBLnC5Hq2JknVb3uktYWFMqwtYMafoOHolMK/4yYP+TL?=
 =?iso-8859-1?Q?SpT1mAm+JBjCMrpHuUXJL4eE2WWq3zYI0LgaBdZ5DkSlJZp14vPoWjgD8f?=
 =?iso-8859-1?Q?Vscmz8B8HNC+r4+kNwoPf2EVWhGu3UvtrFSwZWmbcQ82avkkCiAJMfsyJy?=
 =?iso-8859-1?Q?JGN9s6Acaw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a97de3-ffdb-4cd6-6d00-08da22c4feea
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 11:57:51.1119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CgvowgE0DZyyBwiFPYerg188ESk4IwWdhcjxfQ6QSrAuz8RsO5rEf55O8An8wumHjInEJoct24rwrWS0aP4+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4500

>From: Greg KH <gregkh@linuxfoundation.org>=0A=
>Sent: Wednesday, April 20, 2022 14:42=0A=
>To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSM=
P Linux Maintainer <linux.vsmp@sap.com>=0A=
>Subject: Re: [RFC] staging/vSMP: new driver =0A=
> =0A=
>On Wed, Apr 20, 2022 at 11:38:57AM +0000, Czerwacki, Eial wrote:=0A=
>> >From: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >Sent: Wednesday, April 20, 2022 14:24=0A=
>> >To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP =
vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >Subject: Re: [RFC] staging/vSMP: new driver =0A=
>> > =0A=
>> >On Wed, Apr 20, 2022 at 11:18:15AM +0000, Czerwacki, Eial wrote:=0A=
>> >> Greetings Greg,=0A=
>> >> =0A=
>> >> >From: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >> >Sent: Thursday, March 17, 2022 11:04=0A=
>> >> >To: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; S=
AP vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >> >Subject: Re: [RFC] staging/vSMP: new driver =0A=
>> >> >=0A=
>> >> >>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >>> >> >What tasks?=0A=
>> >> >>> >> support of other information bits like stats=0A=
>> >> >>> >=0A=
>> >> >>> >I have no idea what that means :)=0A=
>> >> >>> in short, the hypervisor can provide stats it collects, future im=
plementation will export that too=0A=
>> >> >>=0A=
>> >> >>The trick will be _how_ you export this information.  Let's wait on=
 that=0A=
>> >> >>one for now, your current api has lots of other questions to work o=
ut=0A=
>> >> >>first :)=0A=
>> >> >=0A=
>> >> >sure, thanks for all the help.=0A=
>> >> >=0A=
>> >> >Eial=0A=
>> >> =0A=
>> >> I was wondering, after I've switched the driver flow to the pci drive=
r one, I lost the ability to prevent vsmp.ko from loading in case no device=
 was found.=0A=
>> >> is there a way do to so?=0A=
>> >=0A=
>> >No, that is not how drivers have worked since the 2.4 kernel days (i.e.=
=0A=
>> >20 years ago?)  It is fine for your driver to be loaded even if there i=
s=0A=
>> >no device present.=0A=
>> >=0A=
>> >But, your driver will NOT be loaded automatically unless a device is=0A=
>> >found, so why would it be present in that situation?=0A=
>> >=0A=
>> >thanks,=0A=
>> >=0A=
>> >greg k-h=0A=
>> =0A=
>> because there are other modules which depends on it.=0A=
>=0A=
>I do not understand the question.=0A=
>=0A=
>> I guess I can detect it as part of the other module's init=0A=
>=0A=
>Huh?=0A=
>=0A=
>Try it and see, the linker will properly pull in the needed modules if=0A=
>you have symbols in one module that are needed by another one.=0A=
nothing prevents a user from loading the modules even if the device is miss=
ing.=0A=
the driver's hierarchy is one api modules and two unrelated modules which d=
epend on it.=0A=
running modprobe vsmp_logs on a system where the device doesn't exists resu=
lts with a kernel trace.=0A=
obliviously, this is not something accepted by the community.=0A=
=0A=
>=0A=
>But if that is the case, why split them up into different modules?=0A=
splitting the driver into three modules is purely for flexibility reasons.=
=0A=
e.g. on runtime a user can decide which parts of the driver to run=0A=
=0A=
>=0A=
>I do not understand the question really.  Try it and see first and if=0A=
>you have specific problems, please post the code and we will be glad to=0A=
>review it.=0A=
maybe I just need to forgo the flexibility and add all features as a built-=
in which isn't configurable=0A=
=0A=
Eial=
