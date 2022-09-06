Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0597E
	for <linux-staging@lists.linux.dev>; Tue,  6 Sep 2022 07:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvKLqQqMRWm/ngE06ekk+/f2mtROBtD3MfX3Opukmocon9EmHe93YhIOzbu7spxVsaBhy32gAMOpyEmBQirG95f+f8vlsSgK0stIksDSdKFftWPrhzjcAW+Ul0P6JKPUVaaZeYMemCBSvFJzJitnxowy6gLQJp6CqKzjOYa/pn8HTLA6Lhk8tuEtsveDSfdZivpRWRhK/mz92leHbb+HQoGxA3/3Z0IXKerGvtLeejQdCNqy2apm5/50sfDigXYFhcJooXhhn26JH4/tLSCL6fvmUptL9hjUZnyQrTR652gguZXOP8quVlF33mRHgORMOXT9wYhUl/QmzyNG5ThpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDv3PKXRUMRMiArboDFZ88sXjSf3WecBWjjIp7ki/gI=;
 b=WqeDTEa1dTIizpa8DDyYRBJ5KTfNXcNSTqbrhiVf1I7sE1NrxiaAkncyM2CJk+RyCAfiDlBEo2atntDZ1bO77/xQra8tpSnkHnxjODp7K9b4mYMaS3+te1LToOPVJXVc5zDHxJ/93MxJxgaeOVhyRkDsLKXTc/pXnx6YL15d2QWw6kFTVPk0nudS/RiIL7nXhqSOFhSVBf9PxKaDO1BngPmjaOHhPtAX1yG6wFIOHKtUX0JLFEUySLoCHh6cxNNnMg2daXjt6LXMnI/EoUsiPy1+Uq5h+lTOiqAumj80sUw4nKsjPTSECIsrnl+45BOAzZe+a5TgW4jMn1x7yRJwbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDv3PKXRUMRMiArboDFZ88sXjSf3WecBWjjIp7ki/gI=;
 b=dpLFEFG8wHcyr0CrBBYqvaL+EEAkgdH4rMoLOKMaXEd2XSI9UjOIhRcLTt5F0nrwMjIBn1J42NtLwqyflxKxk9ZignpdMJDbnMfv1tQv5IM5JQF8rE/HVvAhPuJxXZPUgBYMT423yJQTJEH1/7M6v24BgXbPxkIg9BKZ66UOL/tn/DxAeYlieV0wl/UU09gQdx4PLcw7kmGdftyZydBSVPRPMiAaWVi5frnINbLsDVLc2o4nxDODEpsLlw/tC479AZUTYlPu8x66Jq66frzXrbei3bJ/gTZZXGZTVW0FaKCU1GSf9WrNzcX4//vFXhkYaOZxAg5bsFav4MuQ4I0UAw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM7PR02MB6434.eurprd02.prod.outlook.com (2603:10a6:20b:1b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 07:30:21 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:30:20 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>, SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index:
 AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZSAABLdAIAAAL6qgABNnYCAAAH0kYAABi2AgAAD6Y+AAC7bgIAACcP3gAAEIgCAAQJwiw==
Date: Tue, 6 Sep 2022 07:30:20 +0000
Message-ID:
 <PAXPR02MB731082B5F72C5E2D9D35A4D6817E9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References: <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYR5SyPB6G5vDXH@kroah.com>
 <PAXPR02MB7310AAA80455E4B3A97C3A1F817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYdjBiOSWhqI/M8@kroah.com>
In-Reply-To: <YxYdjBiOSWhqI/M8@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79ff3620-682a-4022-635a-08da8fd9a739
x-ms-traffictypediagnostic: AM7PR02MB6434:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 72F0NSnHsuY3YY3Q0HkUkyUHzzKdKz1qXRPW5DUJRm7054mLA+vMmIZh+y6LByMoiIA7pq1m+RNfHGqMBs8mewCGU1hiRusyEjBN4GW4oC3xu5f1v8CrBj0WsblI40LrRYjdWHkNI0+mE+ghmHEWjmZXM+EFgUUcrOTi8BYR0Z9ej2mFA2URhQQHPltagSV8lntSfWwIxRzdnlRoI6eZiV2c/b+1X9QOI5rCQsTKlhKyCd7TfED97hA73+f6KfDrcmRSBnaK/CAfGhgJkhP0MR68sJu5n703BszSyroNbaPomMFQb+Di4/Qv2hndNXzlxhpI8ONFlTaJs3m5ElZpK9x/W+GpkgoZHFrCfikBI2aJihnPNA5r/PPC1NcTRX+lUeFntx0454qXmkNO3+dmXwS9bGL6xYzbFUdMLrGEjVjhskkPdjFglRAVkl/OSSJAhcmF+kwKRmzoBNxrN87lsM1+5EtAW1j5n8BYsiPoC9vpspG6eXNBXRuui+3DFqAxQHAYuVPXsauBy19Hd4s5H8JalajANySSZEVuKh/qiw7PecPXgy0piULxvSyjCmzOnMn3FYhvaAOp2xmfp/xpERlDy/EPEE9Dmo7iGqEPg/4GcvIDJh2lAqqiijYRST4qUGZUYAb9eIW1Sw+oeVMZnD8VkznllpURa22kWeRPrdsKkoZhJilUK0XAKApuJ9pG6syJ7MIy5lT9uoYV+yyrgD2uHBXKBZ3Gk7nTd9HBsQh48T+YqAdDY1awn5twSrgGUP8BfOzw01bxMuQPgAStjg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(26005)(7696005)(9686003)(6506007)(41300700001)(71200400001)(478600001)(2906002)(52536014)(5660300002)(8936002)(186003)(55016003)(6916009)(54906003)(66946007)(91956017)(64756008)(66556008)(66476007)(76116006)(66446008)(38100700002)(4326008)(8676002)(33656002)(86362001)(38070700005)(316002)(122000001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XMALLeKUqdfofTjIaDgCA+FiYm6Jgyqe4dAm7rmjlHYhI7V74cq+Oww297?=
 =?iso-8859-1?Q?YKYWcvPYqFWR+lQzLHTIWbC09tM0+UJvUodUt6VChBXtNwU7EL/YvyzhOA?=
 =?iso-8859-1?Q?/hh1hlWnR8UCxe467EeXtTK+C30KWnU2wmHZrIyy1TPO/CA3vcKTWEI/eI?=
 =?iso-8859-1?Q?/uKApdAnAj4kh3OF3PJOF9Hks8ZFtEyCWEPbGGY4setK0HbRUORKdHslTx?=
 =?iso-8859-1?Q?M2iO8iIshr1SXNMEqFF8zeJtXuB8NMkJVJBhYK1ColNNAZwDuPuV58WS1t?=
 =?iso-8859-1?Q?DEtj5Vrye4/ngh25vCN+BUOKz4B9tm8yKAejMAYMumul+3BQHOgOs3UXyJ?=
 =?iso-8859-1?Q?TKRIPeGbQzji385epP5u5CJWPTzLYsIcacsydiLfvdXORdknzzQzWaUpyO?=
 =?iso-8859-1?Q?9evDGTHFug4nQQ11Vmo4W+BDSpwXHyeGkAII1SKaiZvhaF0NrrzxZ/Fvfu?=
 =?iso-8859-1?Q?QWCN678DYqdUggopJYuH7pgzyYVsCO0AlEgZ0H1W4+hD0/0uPmWNOngF41?=
 =?iso-8859-1?Q?nadjfQRLXEGPMVPN2keQFPVTIzPoDVCP+bQa6IW1hjJRP+TSZXoMaqGzeQ?=
 =?iso-8859-1?Q?cpjfYjJ95chRdVntCw9u4u+rDNJSJE40/g4AKaSoDT3QsckduIHuTbvBe3?=
 =?iso-8859-1?Q?a9Q544YsyZQNXhyGcXR/Ce23NI8wQ37EekJQS8NvSE8er6KfRQGaYVAV6/?=
 =?iso-8859-1?Q?Zpp2CEyRSqLUP+qCZ2hHL6SjfMu3CZvRqoR+QcXW3XbIdwdyMChHkzSQG6?=
 =?iso-8859-1?Q?oBf2Z4sODjzEgYrHact4mRah7cmASsBiwH4dDoCIWRIs0vAjQDVdQa5qto?=
 =?iso-8859-1?Q?V9mAyDf1fQtIQhAYd8wEToYetLpYcqAjL57jIkpBs3e/qXgwsmJdEpxmmQ?=
 =?iso-8859-1?Q?AHB0e8veTJIAPV884W058pQlTytvfPOROhjcNzt1oE72WEd2k4/M8gp81H?=
 =?iso-8859-1?Q?iihtngN26yAZNgXijr/Llo/It04cBZ99bvRiy7Eckvwlbafp64ALY702zO?=
 =?iso-8859-1?Q?Llfz3rVBmtDRt23/39cegj7uEcwzOaniCI6yyZQn3ppPMYgjeydZ59AVUX?=
 =?iso-8859-1?Q?1XA3n86I8JIF17k3WLXeabLiwf9N4WNBsEfT04qURpiLicoy+VhJbYVTRJ?=
 =?iso-8859-1?Q?ISJO1nBrreHhfHcYHf3jG2iO9mSCY0iLzhOr9ao568LfcRr0B5QbBFH9HZ?=
 =?iso-8859-1?Q?BsnlBFvEiv4p+rs5VYxbe7pOaHZ2wJv/X0Vt9Oy+JLorJdMxxv15xFUuzS?=
 =?iso-8859-1?Q?h0LDlHynOicdw2mW+PIygvQ43XLsEhTDKsPaewQ9/SdjH27DP0oqHj5fSM?=
 =?iso-8859-1?Q?4w3mU2urSBFA0DJ13PycV7F25EuI+FgsQJ0LrCQKAifsE9S4G69yQS3xVE?=
 =?iso-8859-1?Q?4OvnjV8DSGDeoTnmPB46OCHdDhd1isFx81n2f1p9YQ8qgc5H6OZavoBU82?=
 =?iso-8859-1?Q?xttCxuJH9rNmWF64MqwC3LfYGfComzC8OFfeyV1U3dk96eQ80vByRlUSJk?=
 =?iso-8859-1?Q?bd5YZHGYfunk5e+swRnRDAXxIqGrUjcNXeXctAEMV5etsj6G2XxVFF9xp8?=
 =?iso-8859-1?Q?x4d+bvqsR7MH0RMgNeJX1whC91mDBU6x9B7QQznAzN5eCJp9JNUQBMDarP?=
 =?iso-8859-1?Q?bLZzb96AteM6ytnRMmu7im4rbr91QUKNEb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ff3620-682a-4022-635a-08da8fd9a739
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 07:30:20.1952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oCWHCLAGSyDWjJ7xSJ9jFkM1Pb4lj7qJYzpMzJBZVeBB6tI3AGrLzYjAEhNX+dKOuIPHYo7mg96EX0vsB9Qlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6434

>On Mon, Sep 05, 2022 at 03:52:01PM +0000, Czerwacki, Eial wrote:=0A=
>> >On Mon, Sep 05, 2022 at 12:56:29PM +0000, Czerwacki, Eial wrote:=0A=
>> >> >> I'd prefer not adding complex code to the utils which need to trav=
erse the sysfs tree to collect the right data=0A=
>> >> >=0A=
>> >> >for device in $(ls /sys/bus/vsmp/device/); do=0A=
>> >> now I understand!=0A=
>> >> that is what I was missing.=0A=
>> >> so inside /sys/bus/vsmp/device/ I can find the following tree?=0A=
>> >> 1=0A=
>> >> 2=0A=
>> >> 3=0A=
>> >> ...=0A=
>> >> n=0A=
>> >> ?=0A=
>> >=0A=
>> >Yes, or how ever you want to name these "boards".=0A=
>> /sys/bus/vsmp/boards/ or /sys/bus/vsmp/device/board#?=0A=
>=0A=
>You can not create /sys/bus/vsmp/boards/ the driver model will not let=0A=
>you do that.=0A=
>=0A=
>You will have the device/ directory created automatically.=A0 It's how you=
=0A=
>want to name the board itself is up to you, it just has to be unique on=0A=
>the bus.=0A=
I understand, I think /sys/bus/vsmp/device/board# is adequate for our needs=
.=0A=
=0A=
>=0A=
>> >> so I can create entries in /sys/hypervisor/vsmp for the global info=
=0A=
>> >=0A=
>> >Yes.=0A=
>> >=0A=
>> >> and link /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?=0A=
>> >=0A=
>> >No symlink needed at all, they are independent things, right?=A0 What=
=0A=
>> >would require such a symlink?=0A=
>> >=0A=
>> >thanks,=0A=
>> >=0A=
>> >greg k-h=0A=
>> I'd rather have all the info under one place than in multiple places if =
possible.=0A=
>> is seams more logical to me=0A=
>=0A=
>That's not how sysfs works, sorry.=A0 :)=0A=
>=0A=
>Hypervisors are not normal, the fact that you are using that location in=
=0A=
>the first place is very very odd, only 1 other in-kernel user is using=0A=
>that.=A0 So maybe you don't even need that at all?=0A=
>=0A=
>thanks,=0A=
>=0A=
>greg k-h=0A=
as vSMP is an hypervisor, I've thought /sys/hypervisor is an appropriate lo=
cation.=0A=
if you think of another location is more suitable, I'm open to suggestions=
=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
