Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7117A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 07:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B99W4RLZVVQPmWX9fBhpWdFeu8Vxzk8sjQOKMt3tP5qP8rXK0Nmnk+1aAnf/NST3aNdZHceLfr3kIPzt6dVKajcwLtJiLFvGkIQNdk0LnNaXQcNPkgC89PvCe11vMerm6QcIN3aEXA6bmwITTIzs7CN5F/E5I8N93N9UjAL+R346sRyWboa+4NKgfSusxjG+bX6wSh6aiMOTle19FaTypMYK09xFfOLzMCm4fQT0yILULz6FJxxMWWUqJffNe/aPgf2TlNPkZiEMGfzPZ/UsURSdQkct0QLFGsRzINzc1sBUpsEqHAxozcJfQ8kTm3/EYFrmlNvWKWy2SSvM76U29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIUxFDl+ofmBERU75UI+AIrzaphJ2rxZ+ySwvsy0wWM=;
 b=XAepd2bhWKPM7MfeqYKTJAxrI1egzBlgPtFu8ydhSv+ZkOlf3BdiDD5Sn6/KMKbItWE3hWiMxvYa4NF5WF8ttwTncWFsSh4h0f2CURec+5cx1yoqeg1Ws45DE/7Fso5G5xFILIzxazWbw+vdTyTW0+9h8ur1IGobTnhE6m0QxPGqeQbwizwAXgeSsRCr18G/HEcWzBuUP9OK5PR54XVtz8kNIf9Htb6NPyduOyQYc/7RIZeBJtWYOGcSjclQNTZemDiN0waP2qsOA4sBLfBfvwI1nCrlQCiuskbDfzJRhSy0dRV5lt9RB6cQkZaTieY2Gm353zAlXw+PzzRVuYRiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIUxFDl+ofmBERU75UI+AIrzaphJ2rxZ+ySwvsy0wWM=;
 b=UWe3DMFVuMOKhJL6/kswxslKSsXZyQ7vnzfr7UVnjOF/bkbckPjpee2h9XL/yZmjJ2O4xXpGJvcptiYDc5iyqtXRtfVpbcdyu7urh2cWK2S236C2EPbBsWwbJXk+MqSrqBrosFUqwQwI8962UHWNbdV2M4QeuB9CKn3YS22R45Lo6JNUoiRyXIONMbjgl6CBWbvCbkoAgmJTzEc/tCVTtrHk/Us0d3GGJJ6TW0FaHBtBXa+fKCijpaALDy7S5imWKCIQrS6hWMLlgFVDrUc/bdwGpmuxmTleh/5zedjYWURU2oX0AKpRMWY9tiPAISsj6lK/y6buDfTtiP8rX+89xg==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by VI1PR02MB4445.eurprd02.prod.outlook.com (2603:10a6:803:ab::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 07:34:31 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 07:34:31 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMrw=
Date: Thu, 17 Mar 2022 07:34:30 +0000
Message-ID:
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
In-Reply-To: <YjLiC82wSBO1oUIq@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 9748d920-4e21-5270-7492-687f88dc92f8
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59c17fde-eaa0-4dca-c9a2-08da07e89342
x-ms-traffictypediagnostic: VI1PR02MB4445:EE_
x-microsoft-antispam-prvs:
 <VI1PR02MB44459FF2CBA9B405D2A9AE7681129@VI1PR02MB4445.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gEQG0pYz4AVXTLdrVAHlMQOCHyteJkrJFCmAs2b+hJA2KWWVPlFTYCR7/X50/PV2PUEepDX7HpDFn20m/H0FQE3MoNa5rhGDl/VxBNYokygBNcZNtzIXv4eLTQag6ohlL7AaVGHEZ3/5XI4ZUrKrwmK+yQK4RLRPWaFiF1hJQev0i4+e74NcbWoF6pJsdz+aFqGPBYLQiWnEJMX6bgeHiPP4OBY35SOb3+/+ErzmfKQQywq4LErqiQswCbTk87rKqixue+W7qgM9k57vSLYPsYG1JyUSS9fPiVMELBlm6bP6hRGhZGFiqYHuPD/5//Pgmc7ZBJ6WwEiqBR7HL4orWA7u7xaZAi5hp/kiGh7NTrAXVMiGuMa4QkwrTUBFC515dZK9LE/9BAF5tGGZuS9P4Zc0o1FZOuLx7JpvzpzVyuzjz/RX/jE3ta9alqYij8BE0LoS1nhlIjyPL5JE5DRCtj40Baggu703vf+tJbS7s9Fl1E2fcYmmK3VznbkqqeD0ozc0dAIowSrJuz/LXUTPHHCHorv5XBmy4xEKFCMJnyQ+epfvfGCnMUweVDoM1W6KFlGusAQhJDwVAKiHYpoD0IW+1NjBhsVi0lhzTg9hLPpKqjOiwxuyo/jZjAQgDbKRtBN/avrJp9kPVpQV6yIARCbNqDOFRuqHKyDqZiFmFd3XcyJmNE8HnmB3sTdlR4pp+zsmOuvOWSXyk2vAVEs8JA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(86362001)(64756008)(508600001)(66446008)(38070700005)(8676002)(66946007)(66556008)(66476007)(91956017)(38100700002)(76116006)(5660300002)(52536014)(8936002)(33656002)(83380400001)(71200400001)(2906002)(26005)(316002)(186003)(82960400001)(55016003)(7696005)(122000001)(54906003)(6916009)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vZHCxpQ16O0RSTKyLLuZwgeBYRWA0HdAOavcA+eno7Bnd5GBUgToTIGOUg?=
 =?iso-8859-1?Q?lJoBH2aduJwO1jsQToHJM2IvLQmwfR+nZoTe+4tftCiEi5xpc/ZifWhTWV?=
 =?iso-8859-1?Q?Tv6UkPjyOgIFDjgk8SkJk+ucRdLcNXKBlZ5llYznzAwlsL0m1ChVQhDN4R?=
 =?iso-8859-1?Q?pZXZFnbE1KspT+CqU9+O8BjcJEnlPM3lkUTYDI1kAfnXt8H8ceiXkD0C7P?=
 =?iso-8859-1?Q?IIOELASGGNclY6T/c0w6DreMAGotzmx/qA1ux2CRFfNyIn1QnApx+1VKiY?=
 =?iso-8859-1?Q?02skt+9lnvLMEmlo43wZ2JjjEhFzeO/TA9asNQsFbxYwH4qnKUh305jbkA?=
 =?iso-8859-1?Q?fPyrlwMQzGC5KjtXbArQMwexFEfqquFrR1KWdPr/IHBjWfKGJAqwRXRwOb?=
 =?iso-8859-1?Q?uYbaLTYiFvD99MhQQACCdTQyEox+26BC/Q5e93iBEW9i8ncV/jlUD6kwMm?=
 =?iso-8859-1?Q?27/ZZkhdoJXR4p1RZ4Np3AWSICjqHdXI3VncULuepPzY2edY57bxv9sgfC?=
 =?iso-8859-1?Q?jY4jTGmekU5YsXz3cVz+m/Vyb4KXWCDL0bi2f3Et52hXZTOodb5bUZhX3r?=
 =?iso-8859-1?Q?RQ/vgKFZ6kMoQRR/zoQNCds9MEvkvQkL6Ko0Hb6W0rm1R12eRur4ZiyzxB?=
 =?iso-8859-1?Q?t9MA3SHCO4d00O6fP+4dktsxMcnfYF/zyNqal2YqEhH7mbCAXUSZHXVreQ?=
 =?iso-8859-1?Q?w21wIgIrLPi1qGMrmVqF+xzdE3WGBXl6oA6Mg5JWhMHwjh/f4XMaGCFE2x?=
 =?iso-8859-1?Q?S5u2+b26m5lX8bw9vOXybbH4tbqcjbUfnHLVHRb+oguV2ncu42NjekyDCg?=
 =?iso-8859-1?Q?ZZYGtujJyEGP0FBEC4Ho3UMSsVroyuJ74HxAd5qY10E3GZvdVdXpRWCveR?=
 =?iso-8859-1?Q?VyPDt1quFuD7byp42a6Y5DhruznWeOnYqtx/xvllqwFeyYKLvHdwSLVoDD?=
 =?iso-8859-1?Q?y3ld8OOqwa5X4ZXxjynC8Zys3HZP2KtFIysIPewIZ39x89EldevIS0fiyN?=
 =?iso-8859-1?Q?C7RBkGp9llpzGzL6kRHSEzFjSlm+kZZ0Phk2GFdZBzF1qnmlot9FsSZNWj?=
 =?iso-8859-1?Q?EVBL8aI/MWmIJT2tNoBjJk5EziO2js0ZiYCaknJoYJZDslz5RW0rBA72BK?=
 =?iso-8859-1?Q?BrhI7SdBrjtAEkIRu0wSPu3WVGhRXo6o8cXDrscTOp04zSLCBI4qu+2vLU?=
 =?iso-8859-1?Q?w/xyaoJ3oOnCRIN4lc7zcI1VeyYQMGvlyw+4pJ0OepO0PwDbzZ8zD+15BH?=
 =?iso-8859-1?Q?rzvIuACQtLLJR9UF9JkOa9zF5prAX4SuN090990BRflU62L5kbCa7jctyW?=
 =?iso-8859-1?Q?rbErp53LAJ/tQRoiGx4cjrRE+3+3WAfsx10OYs3pqyLahjYbRr+BR3FVQF?=
 =?iso-8859-1?Q?MCCg0O+RloBMyiPfaG1Nw563BtxclxBziBoo2QYJoC6qjHo99nZoAZ6Jia?=
 =?iso-8859-1?Q?ALxsLqInWvjzJlN729iBaz9n0TnnQCmOjjwTr6yC8Fwc/LgydX8quuKWzE?=
 =?iso-8859-1?Q?pYzmG8curRQ5HXikWupNph?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c17fde-eaa0-4dca-c9a2-08da07e89342
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 07:34:30.9844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAtJpVd/ebxcBczR67BtqP2otu1Pghw5pAZiMXbXgveSQUpz4cCCyh4dFTOoJLQntq5WzhIHeU0OiMf3G/qQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB4445

Greetings Greg,=0A=
=0A=
>On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:=0A=
>> Introducing the vSMP guest driver which allows interaction with the vSMP=
 control device when=0A=
>> running a Linux OS atop of the vSMP hypervisor.=0A=
>> vSMP is a resource aggregation hypervisor from SAP.=0A=
>> =0A=
>> the driver comprises of 3 modules, vsmp which includes all the api neede=
d to interact with the=0A=
>> control driver, vsmp_logs which allows reading logs from the hypervisor =
and vsmp_common_info which=0A=
>> allows reading generic information the hypervisor exposes, currently onl=
y the version is exposed.=0A=
>=0A=
>Please wrap changelog text at 72 columns, like git asks you to.=0A=
git didn't asked me to do so, I'll fix it in the next iteration.=0A=
=0A=
>=0A=
>Also, why did you not cc: the staging maintainer?  :(=0A=
I've probably missed that when I was going over the docs, my bad.=0A=
=0A=
>=0A=
>> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>=0A=
>> ---=0A=
>>  MAINTAINERS                             |   6 +=0A=
>>  drivers/staging/Kconfig                 |   2 +=0A=
>>  drivers/staging/Makefile                |   1 +=0A=
>>  drivers/staging/vsmp/Kconfig            |  14 +=0A=
>>  drivers/staging/vsmp/Makefile           |   7 +=0A=
>>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++=
=0A=
>>  drivers/staging/vsmp/api.h              |  61 ++++=0A=
>>  drivers/staging/vsmp/common/Kconfig     |  11 +=0A=
>>  drivers/staging/vsmp/common/Makefile    |   7 +=0A=
>>  drivers/staging/vsmp/common/common.c    |  64 ++++=0A=
>>  drivers/staging/vsmp/common/common.h    |  27 ++=0A=
>>  drivers/staging/vsmp/common/version.c   |  85 +++++=0A=
>>  drivers/staging/vsmp/logs/Kconfig       |  10 +=0A=
>>  drivers/staging/vsmp/logs/Makefile      |   7 +=0A=
>>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++=0A=
>>  drivers/staging/vsmp/registers.h        |  16 +=0A=
>=0A=
>Without looking at the code, I do not see a TODO file here that lists=0A=
>the tasks that need to be completed to get this out of the=0A=
>drivers/staging/ directory.  This is a requirement.=0A=
there are tasks to complete it however I'm not sure they are blockers.=0A=
=0A=
>=0A=
>Also, why is this submitted for drivers/staging/ ?  What prevents it=0A=
>from being merged to the "correct" place in the kernel tree today?=0A=
afaiu, the correct order for new drivers is staging =3D> mainline.=0A=
in addition, from past experience with the main kernel mailing list, I thou=
ght the driver will get more traction here than in the main kernel mailing =
list.=0A=
unless there is a specific mailing list for drivers beside the staging tree=
 one=0A=
=0A=
Thank,=0A=
=0A=
Eial=0A=
