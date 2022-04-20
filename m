Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40045.outbound.protection.outlook.com [40.107.4.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3E1841
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR+br7Va0Mznsdbwk0Hp2OTG2Mdk3eM8+n89iLKSIpy5c3gEhfWREW+78zvzhCJxFQnZ9fYUF/8rvcM/d1TjXAAslCR0iSJaKunswMMq3WTYHcU0KDYWfCi+2qiDfUlf6ZBzga6nUVNP+dIoyZY8xK+3oCMNt562g0N5hcXkJpGt5w7Kw/DAokj4gXjGpvgSd8iM2KQK0RXQvDzT0d1X2s8oP5GYqi+A6Kgy+2nhHTVnyklqAYRerGCOc57+Wc5C2jlogA2d029uYPr8VoMm0Los+f15BfSrZbB8/9LDeBftDWBDDXYFj4+mkPW0SxVDGMvTbWWJO5y97mXyKzelnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjcKg1RA/D+pcrqnYv1aDtOECUEftCcwiXg+rx3tEs0=;
 b=gro9qWXH/40ZmtELLF74W8GhXdAWXSzswfHZ7WcF2xicglfsXmtQmF98Pnu6OswSHN6DJZ1t2m3uno/qj3rSEMANJNrXP+3FXFZRmKjgsj4/WVAL7Fsa4sg7jjUyjx5T3hiPCALE2VgIgltXmc/mt7iSDMU5yz9WNXszrFDEa3C0BiwXhvMglqDBw+KYCme9RV58wDNQvAgfyNe3h+BHXeIlIBqiOYAmnYPQa+U9sTy7EU0OGJZjN8UZ7XjOTWY3K8X4Y/AzK8+oC5m650NX8ArarSkpST5lkRKSS+v37Eyt7y3WI5JpDcfkSotz2fOcDRgUKGM91o7MOssgREUJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjcKg1RA/D+pcrqnYv1aDtOECUEftCcwiXg+rx3tEs0=;
 b=OYygbf2OgmHvfMxBwRq6Gw/83umqqtOQ4PrQ7Tmz7dftWcxXjob+oMgtYOLP8dBX2CDVD7oem/IcGwOfGtL0vkrxjJ1OKCdKQ00inbrPNqhVDcx2QuVHzkkL8xFhLgbqcvy4hWJSqqf9HTwg9dylWIOIUf7dGps/7+Nl7II1RDsLg6pe459x6vjIZAso8ZI5ZG05O77XqfVGi02dQ97wv5UY2QkLDWiXPvY4AWUzBVHycbSgFhxHWvNMH1UppbbjFOkqbNb39teFe2HCVrCzihUBGWwYeleQ3Ofz7MVh/gcSRo/S3NPrlt6z3mpujGyGyeCBWnRalslDVrSLZ6D+WA==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by VI1PR0202MB2589.eurprd02.prod.outlook.com (2603:10a6:801:6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 11:38:57 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5164.028; Wed, 20 Apr 2022
 11:38:57 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index:
 AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBqgAAIDoCAAAPEY4AAAsaAgAABLx2ANZRbzYAAAi+AgAAAb/Q=
Date: Wed, 20 Apr 2022 11:38:57 +0000
Message-ID:
 <PAXPR02MB73103C308D5942977331A28881F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yl/tU5BDIPl9VuJw@kroah.com>
In-Reply-To: <Yl/tU5BDIPl9VuJw@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 5f201dec-0ced-0789-6c40-691c42c45440
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5871ff86-2311-4947-277f-08da22c25b4e
x-ms-traffictypediagnostic: VI1PR0202MB2589:EE_
x-microsoft-antispam-prvs:
 <VI1PR0202MB2589957AA884B8C1BF2C642081F59@VI1PR0202MB2589.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YKhzlcMAdYIV+PPN9a04UGWDoSxPd9Ju6I6wkIm8bGuo9CjAYCHD/19stbY6IouG4t5w5nZ1JeH2DNXgQZDEl1jFSIPU+TV1rc6fxIMnjo9XohgeG+03MtzP3oHAqPkLo79ExHutMy1lATNCWkgqQHvfzIMjNM0kwXSBfkbMRn2OYJiVNzV3+SZC04U296YXqH5KH8NAMkSQGDScWA+V0OSCA6ieRk4rzEW0QSLhBXLvHTms4e6g1O2D5R2dr9ImWAxUTabdTmtWuAQ+FMsamMsjlebHdHnhcV1tjhSMX96RKWY0BniYtwdlQtxvzHjidRIChfF/3UTHkIu/ZL1z/MgUbXXbIXWvOhJC8CEeg+AcjQcbw/YmHcZc026ZNKb5MO62AYrbIw9WWQQhVkwxOKpNi9dg5mPzlAtXd9tyeDm7nuUMIeeJU3IyILHyxmQX0Nkuku7eRdLoKZe7fqQ1+QkI5oo4pDvuFSDmUJcof24ATFlk/j/K9+qXZZZUz4VZktAwMl3P4vQZ3MFFC+rMSbBnhP7xELVaJi4JJeLNf7mdBjSl0EWEld8b04qq4OUe84NcSnHEuuH7Wml1IqGRZlhH8F3VZV4yA6CcDrl3Fe+eitEP6PivMZsz81ipwX1ZthbpNtDP31DSMiGM9HmsTY/iSOjxTZEsWT2uUH28fC+c+v2XAbgN8VoxdqUIZ6tdEpfH1t2DMwEDN9hslOfjpQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(86362001)(2906002)(33656002)(83380400001)(5660300002)(26005)(38070700005)(82960400001)(7696005)(6506007)(54906003)(38100700002)(122000001)(76116006)(71200400001)(91956017)(186003)(55016003)(66946007)(4326008)(8676002)(6916009)(64756008)(316002)(66556008)(8936002)(508600001)(52536014)(66446008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CsevOQE6m45Y8qODrSnVL/V2zRgRxIwu/MulO4v3aGP7iYCSens9APmCaC?=
 =?iso-8859-1?Q?huJHXM5HNGayxgtjz0N3rCdDnBA2QG+mWF0vitzOvtFGDxoN3cfXZ3rvDt?=
 =?iso-8859-1?Q?95E+ZSEz5dr4feHD/jdH1umo50HuNJN0ruTLLQazOfbUlx2WkV5nUa/yO7?=
 =?iso-8859-1?Q?m1Ho7uGBicFNkCIW6UD6WZEdNz41jkyEYw3YQLSA8AklingZyLPegFvFXG?=
 =?iso-8859-1?Q?f9Nq7gRXODEjmtW5xJjFuhv3TIMcuKdRAYW4SVRRe+J2rkRoKWbikq7GRI?=
 =?iso-8859-1?Q?5+BDMiuL8sJUITOzSRNfHRGeeOfR7yijq8LWJ2At0q1g4yTXiHtvR5z/bj?=
 =?iso-8859-1?Q?ERukuIgCSWSycQctFP9QdzcsrNlVT4TWIEgKWZvjAz6/o2ymH4bNAIxmvs?=
 =?iso-8859-1?Q?Mtw78WgpzeoqaR53UPlEnqZeqzl2uMLwtBGCMSKztj77Fz2P0ikg1R1zvw?=
 =?iso-8859-1?Q?72IVt2ACvqAuXQsighxakQdo/DrC6O45//lmTSqieNkQma6sUvMDBub6bp?=
 =?iso-8859-1?Q?5FOx2PUnRQyd3qYZNcJRSDyVsb21zY2rFCLlNyKMJxvRxzkwS/mh/C0gCj?=
 =?iso-8859-1?Q?Ukjcrx4emW0a9h4CZaWn+y3eKjAn9jkhrmEBb91SXq0knJZv4ziWuoCCnO?=
 =?iso-8859-1?Q?rYuxcfnHj6Bwkk3doA6IOixEBGvb2FAdkUS3F55ZkoD8ybpynOIO8ttmQ/?=
 =?iso-8859-1?Q?GPKhxflkb8iOrX/Ffvj8lmeCGGd5lN9eRFpRYDbhoCzdVZHfOwy151vOXo?=
 =?iso-8859-1?Q?/6kXQUH/p7+EAIkbq2ePVjQcgLEh4x4py8puj7CW+3JiWkd3nCRvPafluW?=
 =?iso-8859-1?Q?KYeK22MWszPNGnpq6MRcWtECAkG9zICsWzFXifagGrBd8Qr1EmILYftv+J?=
 =?iso-8859-1?Q?sVMc8yEoivKWRKcN3iCuVdBz7GLyVfVNGepQXEc3cyMNmpxBah1hrQem4k?=
 =?iso-8859-1?Q?JG0EBjQfAERoDLiOtM3gxknvFdWjAMrlARBSFOmV5cZZGDum0TCPUPZfp3?=
 =?iso-8859-1?Q?+xQ7N9V9urBxDoSOgVsZKgxsdpC0eToexyySckJTes9+FfLFtySR7JpnkP?=
 =?iso-8859-1?Q?hE/QS7/g4KRF7RMCwpgNGpMTOmfPzrRYmhe/z6LDCLM5ImD8f5Y9Woh3K8?=
 =?iso-8859-1?Q?fG1Xx+ocBEHawp36HvM4yIQCnW1EWu1v8W0k6uODtnpNggessNC6GT15cX?=
 =?iso-8859-1?Q?qjHheaDb7Lugik8QDKCdLl/XHCwp8TCQvLiygwlmUzXDaUZEIWGBUgg8OY?=
 =?iso-8859-1?Q?qW7mq/BBnZjN4qfwdPzSRYo6jyZjDZMWu+GZE9buMBcpnOmQLGjnufvxa6?=
 =?iso-8859-1?Q?hDXJViG8EoXwly6gzVdE13b0Y8JFd1i2rX5Jbl4ezxI+G1UCvGPjjOc3Eg?=
 =?iso-8859-1?Q?kNK2cC698HO7Ad9/wl6fI3LI5jhnusGFoAbR7j0awIfcMXzlQB9+6RI0x8?=
 =?iso-8859-1?Q?C0lmGVu2DDqF970XuyeYRhvS8DQ7nUx3HiheR42tejVhL/FvUaYxdgMAiy?=
 =?iso-8859-1?Q?1+88ajUcxlf/j9NAr3uxKedeu9iq0+iQhldtUuM3vZN/yQHDY11TxQC5Pa?=
 =?iso-8859-1?Q?wX5eZZd3TJ54eNE5IqpLp3/yNUlIw0GjLjMRGjvrVzPeAAuIHSixGFcU4H?=
 =?iso-8859-1?Q?Je0sbHlNelHv1sXuR4dEzYKzumiXkeNJAU9Vnk2VxXjokFzXzqYFzokgDY?=
 =?iso-8859-1?Q?+6KkMj5RcG4HxE0vrXlULHcXBEIGEaDlTvpPHhmyQ4hy1qturJksZlpezB?=
 =?iso-8859-1?Q?sTDYLCAms9HVzsFM+RfxzCSqDIfIkDSJkoQm0VY5hrNgje0hk2jfkgHPSL?=
 =?iso-8859-1?Q?I4VDvqmZBg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5871ff86-2311-4947-277f-08da22c25b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 11:38:57.6413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3oBgUWwNrfKwinh+QVAe9egUmn7Loe+vJBqUVEAPKokH1Lp/FtMDsZBHLnBeBnmdFmMvbZo2MHgyxxCH3T0UKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2589

>From: Greg KH <gregkh@linuxfoundation.org>=0A=
>Sent: Wednesday, April 20, 2022 14:24=0A=
>To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSM=
P Linux Maintainer <linux.vsmp@sap.com>=0A=
>Subject: Re: [RFC] staging/vSMP: new driver =0A=
>=A0=0A=
>On Wed, Apr 20, 2022 at 11:18:15AM +0000, Czerwacki, Eial wrote:=0A=
>> Greetings Greg,=0A=
>> =0A=
>> >From: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >Sent: Thursday, March 17, 2022 11:04=0A=
>> >To: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP =
vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >Subject: Re: [RFC] staging/vSMP: new driver =0A=
>> >=0A=
>> >>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:=0A=
>> >>> >> >What tasks?=0A=
>> >>> >> support of other information bits like stats=0A=
>> >>> >=0A=
>> >>> >I have no idea what that means :)=0A=
>> >>> in short, the hypervisor can provide stats it collects, future imple=
mentation will export that too=0A=
>> >>=0A=
>> >>The trick will be _how_ you export this information.=A0 Let's wait on =
that=0A=
>> >>one for now, your current api has lots of other questions to work out=
=0A=
>> >>first :)=0A=
>> >=0A=
>> >sure, thanks for all the help.=0A=
>> >=0A=
>> >Eial=0A=
>> =0A=
>> I was wondering, after I've switched the driver flow to the pci driver o=
ne, I lost the ability to prevent vsmp.ko from loading in case no device wa=
s found.=0A=
>> is there a way do to so?=0A=
>=0A=
>No, that is not how drivers have worked since the 2.4 kernel days (i.e.=0A=
>20 years ago?)=A0 It is fine for your driver to be loaded even if there is=
=0A=
>no device present.=0A=
>=0A=
>But, your driver will NOT be loaded automatically unless a device is=0A=
>found, so why would it be present in that situation?=0A=
>=0A=
>thanks,=0A=
>=0A=
>greg k-h=0A=
=0A=
because there are other modules which depends on it.=0A=
I guess I can detect it as part of the other module's init=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
