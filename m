Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20B7A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 08:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcB3pfnsMCCW19a8AHCNnZnR0sasl/7ZqLg4ZWbnAkWsVDhQ+uOd7XjRmlcmMiidoWVd0QuXwIVEZilkP2X4I+1Xy66ZHQntYxgsrwlQhafb5J9TdSGv0oJRlu9AWmJVhPmmfTbVbCCYG/0FZHKAWJ1bXxRo+o3TYg55AWEg4l3dDOwxxtipSsSpEpcie5MyMJj215mEvU7McAZQw+PXGn9IFv5sdgeHYSdYolDexK326h6zVRWGYQOoHp/pKEPZwWWZamq12rrZ9Xl+xOzbKeayzytvgcmFAlwpk+mL27m+cOGsMvB5BjscIn1kfychMnmH+8k4b6ubgGq0W4d5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaCXHlEwdvJQFYPzjeIknnZlgux1bz/w4Uen8LEPtlM=;
 b=BK4NM6bJtgux3uP29QT75MJHggB7ijm2tswqBJBklN143wCjE9n38TF82EEk+VCKmxJ+2q4Fct3ZyPONBfK/Q8bIcRcxi2Bs02bKrls4EHg6bH9Z3W9XdWpeFZzCKxOOLvfWZGbqVDVxZi+OV4nrw1IegprCMcR9wn+q9+ccBi30GgCe5I660BMIvqwB/J86eZ2+CoE4MvPYOBRtzSf16T2Qf8cOGmEal7TAHEA74kJ/gjHrsrLQi+pFqC3vfbXDCTQfgGc6mq4fzdq5TpIZmJryFsVXhA/+mZmFqJVz8rWEdiQHSDbnTy/2+5fxKwuBQshhwQHjhY4jxeDfLEvZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaCXHlEwdvJQFYPzjeIknnZlgux1bz/w4Uen8LEPtlM=;
 b=Y9jQkXdV5z8TOXPAyMJdrdCVPk8oMBHUx1weqyM30NHQpUAAM6KGuWc+mcyY1QAMlsszVrtKVsIGRf5U1nN5T52aXk3xcz0Oi4Lfgxm3Ougq90H9TA01dvcAjc0TGuLESsyVUNPPU2OC83oj/SEBpIpk/uHScGR32ZFEusgoTsqLtX4+tY7pgk4bHzkmLSQl6GC8dSc7KHbnmb/17Ufz1hvZ3XaB1C1Dyh1L6kubXqp4Zzoti+ZayESy6e8i5mry1aFViohLU0GfwB+L645IykEBjLzy5WNCu0CodthOnoNvpXzXcFe0temoghBQ9Qt22895ixMhj+XqeUPZLTW9fA==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB9PR02MB7940.eurprd02.prod.outlook.com (2603:10a6:10:33a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Thu, 17 Mar
 2022 08:17:04 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:17:04 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBq
Date: Thu, 17 Mar 2022 08:17:04 +0000
Message-ID:
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
In-Reply-To: <YjLolEqaRgZKawHl@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 0fa2340b-86e8-2f7b-d4e4-a84bca63e9db
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30126a23-e3aa-4d8d-b902-08da07ee854f
x-ms-traffictypediagnostic: DB9PR02MB7940:EE_
x-microsoft-antispam-prvs:
 <DB9PR02MB794050372DEC0B9CD032FD9D81129@DB9PR02MB7940.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6HKn0P7fLuU5V73LorR2Pakj5XeLJ+U/+xOX4fXZbZdPAwjnVfBjJgwSj0Gsm3yPknIvWPRMmNqUi+WsNnqHJsD5sjQqKhe5Yu/5GfE32WrQn9l1pvsJl2/ZSx6nziITA5bPt0Fx8rbs+zw+y/H+S2/KID3P5UBBojaoWScaJKcBj7UNXFks2vRcrfiObNtuPlIxi4v+cot5fekj/69zNsrN0y2Q7/g/sX2SGajWjtIqTf1oLtsIimrWNeMbTfLt0TSpK2hibSIZ1eoHCicqyDj8mseE9/lpfHUZ6eu4PyP7tkaPv15fEZDOSrXH3ZG/qNSD7vNJpCtgqxR0yB/JSQVV39GcspQ92RNMGFeP/Je13kTWE4QwOiTJnJb2a/uUnm45DA8i+2my95SCB5OcZz2gpU1BclYtz0jPycc1StK05jLSd+ZpDLpkj+nOfx15W0bniS6E0MAG9FxBL8XC7n3FvPgbNZqR86HoF48kqjWLfyLFwpF+DIi5+Qh4s288m5xxkVOwB0KDJq3HuXUJAPI/qCtWv7iPPa022oel3ZXMxDVa7eDXxItmyxh/Wypp4ShKfX2bWNJsnmv5EX591VM/ZdfC3tISSg0jmRuLq+UlM9nuKuTMtc5bHKGqE4DSL1tAWaIq/J8ytCm8CVobxGIj3OLl+5X9of7RCqN/3dt8AR9aBqvl15sDxOs/A2KX9DMB48JtwN2DLI8qlStWlg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6506007)(38100700002)(82960400001)(316002)(6916009)(4326008)(5660300002)(8676002)(38070700005)(52536014)(54906003)(7696005)(9686003)(91956017)(66556008)(66446008)(66476007)(83380400001)(66946007)(76116006)(64756008)(26005)(186003)(8936002)(508600001)(71200400001)(86362001)(33656002)(2906002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L6qLimA1rgJBgHxJZQZyK5czG6CKkISF7dDdP2yPOb6NRsKF98Wnheh3Xg?=
 =?iso-8859-1?Q?ELAQauNOcO2Fo0A9+xH4GVi5tvZqqlPRiSOWriPT5o6JH1zqc256dmexon?=
 =?iso-8859-1?Q?pmZyJvdfOQB900QzG6bnoKhhvHwtFEl9lCUDyyLIu8azEftqmNGIkHp3hV?=
 =?iso-8859-1?Q?YhuZj+82M4iS+wMScN0RCQPtXZ/sj4c38z7ijZJUdFdnrG/ZpMRjT7Hfl4?=
 =?iso-8859-1?Q?VnI9GF8WS2ztK5YSyjsQWtePq94Ss9Xo/wkprsSSFT2VIVG5oJ5um7qHqQ?=
 =?iso-8859-1?Q?kqRYW9/9+MZnKodTv7UEdHdiU0zk3vgGXfNiLP7a7Z2XqUcMr7cedu3qdM?=
 =?iso-8859-1?Q?NqZNTb+8YIBsm8BX3T7CJJ/BpuflQbLb7l3mJxmBbQ8hAGhAWRZx6P1/05?=
 =?iso-8859-1?Q?DtYKGQmJuM+QIV0iTgLIX80eEb2OF0wVVWQu2JGWQSDDH8gV65ZqpnQlu9?=
 =?iso-8859-1?Q?SCL5cU3GsCBp039O5Gr6QxjgNK5mBb5PPjFI/i5BfPvzfpukMgxdtEQ12M?=
 =?iso-8859-1?Q?S9mCpdSd6Q2kIbxpRltTqTX9kimX8PhTWfrQaiCXBqZ4tUGSVQwzdxhLTo?=
 =?iso-8859-1?Q?c/j2G9AUE2obaiP/OFU4nXZ2O0JVjPLFLlI6MABEKJwRsiGZ2RLZugSGHw?=
 =?iso-8859-1?Q?joP7dY5bWlhj3GRhrcyDgK8fypr8//D5j4kl08l1OYl+r2Ojhf+TfypsvP?=
 =?iso-8859-1?Q?0wxQ3W1wDiF/gv0tWWVmbTHvnvfZSdUHPGRiOzrYdGo4mFds05Ht3ZI4Xk?=
 =?iso-8859-1?Q?aa0ACX/DdPzm5gUeBVKB1XxV3iiFInBWo8Mub2m4qrzhElF7V0+qNfr9H1?=
 =?iso-8859-1?Q?RFX9ORnOAC+YvWHmIPU6J3LvwoNm2qcb28CbvrNQHgZSXZ2Q0AAaDGgoCW?=
 =?iso-8859-1?Q?0dcdjvZ/XztIa/ISwWa+09VHb2lwf+fItyySLjMwmPxnAjvWU9+mdxSzgS?=
 =?iso-8859-1?Q?+oMIQ2EOBv5553mAIVOQoeL0CbwnBFtTVIDrePJLOzfncvkuX1Y99yO7H8?=
 =?iso-8859-1?Q?JR3WJU0G2/mY37ERIw1D1O026g8aP8S6iXiqqZtJxkzmW4RVrR+aIknX3O?=
 =?iso-8859-1?Q?EIciQ1MmpAuiknrSina+Z6RmsxcgnreJ9xGkkxrjbdDLV6RUtltyfpMcrd?=
 =?iso-8859-1?Q?asoDuEsskqsp1JABzByO0i6KP2U8cS72yseTQkTJqdc3fNhOOMcVDgCvEN?=
 =?iso-8859-1?Q?ToqnDBbvz4xDe+pwVLavfIYz+hwY1uZW7kJWEA7hon6mbCuh6pZVZ6ahNn?=
 =?iso-8859-1?Q?6U5cClZpfGr8HV9V301txoNP25LzicXQmUwHVeIQXk36HIzkzJZ9c1Z8yD?=
 =?iso-8859-1?Q?tRJCy3MHzlRtS7RQGz++nWWT5sp6SjLZDWkgn42b6NY0U49Nc39Y31sQSV?=
 =?iso-8859-1?Q?sNKQqQO8XeNJ0k3m1EY/yS4Qsu4egYkSDXuMRUCWv8TNBp1ATOIUlJhKXA?=
 =?iso-8859-1?Q?UrSKetxGnMuw833K5repWYfMiH9HEriKXcAZQecEh/E1MxRlX2919vAUUy?=
 =?iso-8859-1?Q?8xYr7hSUetriDioUC1GBJb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30126a23-e3aa-4d8d-b902-08da07ee854f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 08:17:04.6239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syMDPJZ7scZJZz3duntu4IBEu0JEPj/gWMXYzwDTaOFN9D93Ho+pQO5H0oJ6Dm8HL32y7yxWZwtYGev44A3xdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7940

Greetings Greg,=0A=
=0A=
>On Thu, Mar 17, 2022 at 07:34:30AM +0000, Czerwacki, Eial wrote:=0A=
>> Greetings Greg,=0A=
>> =0A=
>> >On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:=0A=
>> >> Introducing the vSMP guest driver which allows interaction with the v=
SMP control device when=0A=
>> >> running a Linux OS atop of the vSMP hypervisor.=0A=
>> >> vSMP is a resource aggregation hypervisor from SAP.=0A=
>> >> =0A=
>> >> the driver comprises of 3 modules, vsmp which includes all the api ne=
eded to interact with the=0A=
>> >> control driver, vsmp_logs which allows reading logs from the hypervis=
or and vsmp_common_info which=0A=
>> >> allows reading generic information the hypervisor exposes, currently =
only the version is exposed.=0A=
>> >=0A=
>> >Please wrap changelog text at 72 columns, like git asks you to.=0A=
>> git didn't asked me to do so, I'll fix it in the next iteration.=0A=
>> =0A=
>> >=0A=
>> >Also, why did you not cc: the staging maintainer?  :(=0A=
>> I've probably missed that when I was going over the docs, my bad.=0A=
>> =0A=
>> >=0A=
>> >> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>=0A=
>> >> ---=0A=
>> >>  MAINTAINERS                             |   6 +=0A=
>> >>  drivers/staging/Kconfig                 |   2 +=0A=
>> >>  drivers/staging/Makefile                |   1 +=0A=
>> >>  drivers/staging/vsmp/Kconfig            |  14 +=0A=
>> >>  drivers/staging/vsmp/Makefile           |   7 +=0A=
>> >>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++=
++=0A=
>> >>  drivers/staging/vsmp/api.h              |  61 ++++=0A=
>> >>  drivers/staging/vsmp/common/Kconfig     |  11 +=0A=
>> >>  drivers/staging/vsmp/common/Makefile    |   7 +=0A=
>> >>  drivers/staging/vsmp/common/common.c    |  64 ++++=0A=
>> >>  drivers/staging/vsmp/common/common.h    |  27 ++=0A=
>> >>  drivers/staging/vsmp/common/version.c   |  85 +++++=0A=
>> >>  drivers/staging/vsmp/logs/Kconfig       |  10 +=0A=
>> >>  drivers/staging/vsmp/logs/Makefile      |   7 +=0A=
>> >>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++=0A=
>> >>  drivers/staging/vsmp/registers.h        |  16 +=0A=
>> >=0A=
>> >Without looking at the code, I do not see a TODO file here that lists=
=0A=
>> >the tasks that need to be completed to get this out of the=0A=
>> >drivers/staging/ directory.  This is a requirement.=0A=
>> there are tasks to complete it however I'm not sure they are blockers.=
=0A=
>=0A=
>What tasks?=0A=
support of other information bits like stats=0A=
=0A=
>=0A=
>> >Also, why is this submitted for drivers/staging/ ?  What prevents it=0A=
>> >from being merged to the "correct" place in the kernel tree today?=0A=
>> afaiu, the correct order for new drivers is staging =3D> mainline.=0A=
>=0A=
>No, not at all.  This is the "hard way" to get drivers merged.  I would=0A=
>never recommend doing it this way for anyone as it will take more time=0A=
>and effort than just doing it the correct way the first time.=0A=
I understand, thanks for clearing it up=0A=
=0A=
>=0A=
>> in addition, from past experience with the main kernel mailing list, I=
=0A=
>> thought the driver will get more traction here than in the main kernel=
=0A=
>> mailing list.  unless there is a specific mailing list for drivers=0A=
>> beside the staging tree one=0A=
>=0A=
>There are zillions of subsystem mailing lists out there.  Always target=0A=
>the specific one you are interested in.  For this code, it should live=0A=
>in drivers/virt/ right?  Ah, no mailing list specific for that one, but=0A=
>I usually am the one that merges the code in there, so cc: me and Arnd=0A=
>and lkml and we can go from there!=0A=
drivers/virt looks like the correct place, so I need to send it as [PATCH] =
to the lkml with Arnd and yourself in the CC of the mail?=0A=
=0A=
>=0A=
>Also, you have a bunch of sysfs files, all of those need to be=0A=
>documented in Documentation/ABI/ entries as you will see if you run=0A=
>scripts/get_abi.pl with your driver loaded.=0A=
will do.=0A=
=0A=
>=0A=
>Also, rip out the old-school PCI bus scanning stuff.  That hasn't been=0A=
>needed since the 2.4 kernel days :)=0A=
can you point me to a doc that states how I can retrieve the dev struct of =
the device in question?=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
