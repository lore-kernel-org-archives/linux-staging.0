Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20060.outbound.protection.outlook.com [40.107.2.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AF3D79
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 08:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfTEAXsWeTu+1TLcVCIF/JtVkJDnEWQacdNG44RfjSTzIl7UgzMsiLJXlWl6phBqknC8o2W9T0NXZ+/PssP2je3k6IoNgdpSbaRyqFLmZMdMDoRAxaOMIXmUWyWqFzuinLoRCW00+VRxNzM9LmsnS1bFHx5AXCj1e+YDbGTqUz3H9wYZmNnoF20soBJdcN7h9pcN5xIXRaUpeN8jLcTqSWKzVywGfx7B/GWAuEpBr1NvdQFEs9ueubvUPzk0o5y7/reHiymNtQmA9tt34pK7cDm+4QHyEQiowefhFv0S/GTVcWzscyfZy8u8V4c4vrqjVSZc8rGndcN2149n/Th8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkU2tQm6mV3CZ6xybTsO+/wC+bf1gNPHh/rTTuGoyoU=;
 b=FgnJjnb4p3DczdOLI0cDhB3BCeufetbH67nuCbn3+q5YytoGFW4zFrP4t5+G05gOYhFLzLgHc/hKxTBW1AX+subGozhxI/bUGUTo6oQWX0aYyyIZoQDxnETvwQ2ukFyJtfgl1INq/cDymijHrE0PnjuG+s/9CbFq3lpFQNaB0GVm91oSuedx2qt2g5hIQFqQ4jvLC2KAgoUpOplbo6eMVzB8oFCYgB7V62/6jEP+6T9JUnf8e4/6Dad80RMT0yhJ52F7sjEI89GQqtjylN0jShWd6Z/w5L6E/f6hpv/xWwQyoArevFwIFudZit+xH+mPTNUZ8VQaD+5cjlYMxESmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkU2tQm6mV3CZ6xybTsO+/wC+bf1gNPHh/rTTuGoyoU=;
 b=clkL+Xgb4ZX8m6nADpONnPhS48m3NrzlmbuU+CFk1tITMF8fZfCRML0phjaIm6oJZ9ATsEs6/8X4jsWPXXP+AYTpT9plsiyYVOdjwOAyB2hWpTMHKrG4GkJHXZQV7JKAvzxJJLzTUH/3WnLCzabYomUP1nNviB45YzmVz6iALhFLYNMIIWzUG0pya6gJwK2G5xZUr3YzN4vBgdteVeDfodwj4gBgrC7X9pA6912MRdQFU4Mar5JjnckoC1s2uL2Md4sVI9epWGDdDBNW7ESkoG7I5AnTbU6djhHOnRUFv6WTjAbdwpmI8ULHkE57lDA73dp15xQ6WwqMWPTW75tQXw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB9PR02MB7195.eurprd02.prod.outlook.com (2603:10a6:10:24d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 08:52:37 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:52:37 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index:
 AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBqgAAIDoCAAAPEYw==
Date: Thu, 17 Mar 2022 08:52:37 +0000
Message-ID:
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
In-Reply-To: <YjLy5wHtdYZvUU8t@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 4d7dd85e-d3b7-9325-9359-ecd2feb22144
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fc349c9-bf06-4c0d-7566-08da07f37c7f
x-ms-traffictypediagnostic: DB9PR02MB7195:EE_
x-microsoft-antispam-prvs:
 <DB9PR02MB7195886E98C58543397B7D2881129@DB9PR02MB7195.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sRZeSgcLixyR53f3zLvg82NzFI0DY2DQGJg+ZcozUZ8gta5+c4dQRwaaWWmM6q1QRlX2IPyEYg4Kh6S9cHgdaBGjKV3ZoVINgxtBNeRh3OTRZQug4iaH4OKCMbiEZMuAlSU+ajF+x6rlYVSJkv/GVHov2pz9aoWTiQ3hmCtPM0J/YjIiPmxSBYaqBCnkK+J2p9lFK9tbVUfBC+OSXCpH+omNWChVXVZvnqHGi2ntdKp4pdKs9lf/i26/AFE/5vsnICYMLgVVPGglWz+k2tORIAJnWnEZXO4RJ2n7v2EGHqc3jQFiMVA56u0ofcMmMkWNDXakCTor/njZTjfyx1UGAcpRzCiw8ILwVGzHcCtKsroSf8gbEXUIKtcQE1Ir5sjXlAfMmOHXdcwuejWVxEpMxfsJCArokJWz/mZgwWwrmeFppuRXVXaTLpiTaX81T4d2vpAXugaTo26QrZmyp8C+Dp2doPljP7soh92+b9UTuOmcSAE5vzDkXGPnRk7ClM5dEDa+WIngOqpeRIVCtedB5S+mNQMV44OkM4bWfFLBUKtDrUmbzYQsUtIEYY9+jMEnFXlRSEoq4CfkjL1MP2JYvBXNO+DueDWWZIkoofhT36o5sE3Ru25hSnZxK4VaXJz2nIu8IfyEBkhFWTghSc18Z4XHuf4VGMSmUnbC1sEvvYnsE/+tp36998R0nI/wDYJ7n2BWivnzx7p66rTC/qzncA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(7696005)(6506007)(316002)(122000001)(38070700005)(5660300002)(8936002)(55016003)(38100700002)(91956017)(76116006)(82960400001)(66946007)(66556008)(66476007)(8676002)(66446008)(4326008)(33656002)(52536014)(26005)(186003)(64756008)(54906003)(6916009)(83380400001)(508600001)(2906002)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7Y2+sMCN6J4uw7esqhBXsmTGmFt2nrLz5jyFNkwKu0CVPbnB98yHauovu4?=
 =?iso-8859-1?Q?tppRSrhRMCmi0vabSsgvFBGe63Ed9ulSTO5+y/PUGARDlDBVjhkCXghXr0?=
 =?iso-8859-1?Q?0YDxZtDdA/wiJoocUcT0SP0nTUseV1OSFlxmeNqxWznhGxd0eouvVu094F?=
 =?iso-8859-1?Q?8prQxLD7RKCuCPMkbUNmO5Kc+13MiiWlUhdOLeBbP6y+NDn4IO8FRcv/hI?=
 =?iso-8859-1?Q?GaECIqa1THjwcOAb0NX7HTyluQf6/o1Ky7LvLWXjb53NTpyRaCFT8aC/bC?=
 =?iso-8859-1?Q?NFe8sVBZrIN+C/cc1ygsB/JDykvROmaPs0l2nHklo8p5M4n/kxf9uLbZsx?=
 =?iso-8859-1?Q?2HH6zla9AIN02srKXeF/cZPSLLSCxD9H/1gO+qJeRlKtx/7TyzPVdxlU1X?=
 =?iso-8859-1?Q?sfK8Y9cqEyqFM+qXPSIoWUR11G7Wq4kX2wRXf0lHXgTBP9MaTzaPuWNdwB?=
 =?iso-8859-1?Q?rPPvM1mCSGIcg3LNVm0ddtIekPYM+EnD5rqKxacp4+Ed17+AN7n1Qz1UNl?=
 =?iso-8859-1?Q?es4NQE5G6wCj1eOOJ5DTnOVMWGeT8g0YZbOyt1lX/65cGOr/1KEW3bi5Hg?=
 =?iso-8859-1?Q?qKm4ahn5dlYfu/6hu0KCGlJLYHo2ioIin7TJ+IcgalQWvoeqZyCzdiM0B2?=
 =?iso-8859-1?Q?g3mE9soOxQOYLfHp5use3lRyKq/fCkSDfv6LtjUZYCspsXOc98StwXiAdh?=
 =?iso-8859-1?Q?p2KcmJi8yzLRynQqmBMME6Mvt+z+jwmVzJ+zn40JbpvwDE8iexUsKzsGYl?=
 =?iso-8859-1?Q?AwGd0rnfMt+6ghDoap/j0dLfruc8u1AI3zaEZ4QiC0k6gKZjQFWFAyUWnT?=
 =?iso-8859-1?Q?U3ukVdg/6nvx5n54Y1M8idMxHvJxg/CC5b6UYMWp3CVDXtVgVIpkyvg0Mx?=
 =?iso-8859-1?Q?8Z+yJnzbHBPCvl3vSxMaeJf0SOANie84vZDT8InrtDtqrRHK0d8EFoX8ZT?=
 =?iso-8859-1?Q?xQOP+dstUGQGLFYvztB6PkVa2wdHZ6WD2WuWqagGGQr9Uzdqlq/Tc3ZowD?=
 =?iso-8859-1?Q?yvrFpoG+q91+foXWlfytzJiyPtjF5M/dt0PlOmReEQwJFz9kBAO59TkxkC?=
 =?iso-8859-1?Q?dXJGmy556NV5ZxwXYLYTqtOg8bLAsex9eRLoXh1515ZmrmsFzkxKVwdwsQ?=
 =?iso-8859-1?Q?bywkbMaYpATXue5/MMsxsvRLl0fsjSMg9B6OpcMv6Hh1xmKd38VBBIpi5I?=
 =?iso-8859-1?Q?Dy2+FX8jTdli4i8BC3SfQvkUnABoTiIGm3CFhXEpJFvbCIm3AoGK7iP172?=
 =?iso-8859-1?Q?vv3I1oMqWH9ZYn2lgzGVfH/5gGF6wb6cxJuVchiY7zhGS5hHHHeF6mbbfx?=
 =?iso-8859-1?Q?dEWFH/cAFzI6iYmG9uJ3PcQJD/EEpAXGYORbGE4j2e2fyavWHGtd0LlzN3?=
 =?iso-8859-1?Q?EF8/zTh9CiVgsglUIrVqx32ta3F+N0f/iZE24FHiW4IGkbxmo4PkAGwcVW?=
 =?iso-8859-1?Q?pdCIAJ7JKFGm+NAThT61pycAMN9hfEGLATiVXgCJCc2SYHgnL4r3YlTcVt?=
 =?iso-8859-1?Q?7Btacbf7SV/emDDoxtEZ0K?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc349c9-bf06-4c0d-7566-08da07f37c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 08:52:37.2584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrNlicG6bqJogzunP4expcap/qoyagGtwGRX2mxfHTkohkMHMzGVLwYuzR7ZzisfRIz1k+0URkKcsOqLbi56PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7195

Greetings Greg,=0A=
=0A=
>On Thu, Mar 17, 2022 at 08:17:04AM +0000, Czerwacki, Eial wrote:=0A=
>> Greetings Greg,=0A=
>> =0A=
>> >On Thu, Mar 17, 2022 at 07:34:30AM +0000, Czerwacki, Eial wrote:=0A=
>> >> Greetings Greg,=0A=
>> >> =0A=
>> >> >On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:=0A=
>> >> >> Introducing the vSMP guest driver which allows interaction with th=
e vSMP control device when=0A=
>> >> >> running a Linux OS atop of the vSMP hypervisor.=0A=
>> >> >> vSMP is a resource aggregation hypervisor from SAP.=0A=
>> >> >> =0A=
>> >> >> the driver comprises of 3 modules, vsmp which includes all the api=
 needed to interact with the=0A=
>> >> >> control driver, vsmp_logs which allows reading logs from the hyper=
visor and vsmp_common_info which=0A=
>> >> >> allows reading generic information the hypervisor exposes, current=
ly only the version is exposed.=0A=
>> >> >=0A=
>> >> >Please wrap changelog text at 72 columns, like git asks you to.=0A=
>> >> git didn't asked me to do so, I'll fix it in the next iteration.=0A=
>> >> =0A=
>> >> >=0A=
>> >> >Also, why did you not cc: the staging maintainer?  :(=0A=
>> >> I've probably missed that when I was going over the docs, my bad.=0A=
>> >> =0A=
>> >> >=0A=
>> >> >> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>=0A=
>> >> >> ---=0A=
>> >> >>  MAINTAINERS                             |   6 +=0A=
>> >> >>  drivers/staging/Kconfig                 |   2 +=0A=
>> >> >>  drivers/staging/Makefile                |   1 +=0A=
>> >> >>  drivers/staging/vsmp/Kconfig            |  14 +=0A=
>> >> >>  drivers/staging/vsmp/Makefile           |   7 +=0A=
>> >> >>  drivers/staging/vsmp/api.c              | 402 +++++++++++++++++++=
+++++=0A=
>> >> >>  drivers/staging/vsmp/api.h              |  61 ++++=0A=
>> >> >>  drivers/staging/vsmp/common/Kconfig     |  11 +=0A=
>> >> >>  drivers/staging/vsmp/common/Makefile    |   7 +=0A=
>> >> >>  drivers/staging/vsmp/common/common.c    |  64 ++++=0A=
>> >> >>  drivers/staging/vsmp/common/common.h    |  27 ++=0A=
>> >> >>  drivers/staging/vsmp/common/version.c   |  85 +++++=0A=
>> >> >>  drivers/staging/vsmp/logs/Kconfig       |  10 +=0A=
>> >> >>  drivers/staging/vsmp/logs/Makefile      |   7 +=0A=
>> >> >>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++=0A=
>> >> >>  drivers/staging/vsmp/registers.h        |  16 +=0A=
>> >> >=0A=
>> >> >Without looking at the code, I do not see a TODO file here that list=
s=0A=
>> >> >the tasks that need to be completed to get this out of the=0A=
>> >> >drivers/staging/ directory.  This is a requirement.=0A=
>> >> there are tasks to complete it however I'm not sure they are blockers=
.=0A=
>> >=0A=
>> >What tasks?=0A=
>> support of other information bits like stats=0A=
>=0A=
>I have no idea what that means :)=0A=
in short, the hypervisor can provide stats it collects, future implementati=
on will export that too=0A=
=0A=
>=0A=
>> >> >Also, why is this submitted for drivers/staging/ ?  What prevents it=
=0A=
>> >> >from being merged to the "correct" place in the kernel tree today?=
=0A=
>> >> afaiu, the correct order for new drivers is staging =3D> mainline.=0A=
>> >=0A=
>> >No, not at all.  This is the "hard way" to get drivers merged.  I would=
=0A=
>> >never recommend doing it this way for anyone as it will take more time=
=0A=
>> >and effort than just doing it the correct way the first time.=0A=
>> I understand, thanks for clearing it up=0A=
>> =0A=
>> >=0A=
>> >> in addition, from past experience with the main kernel mailing list, =
I=0A=
>> >> thought the driver will get more traction here than in the main kerne=
l=0A=
>> >> mailing list.  unless there is a specific mailing list for drivers=0A=
>> >> beside the staging tree one=0A=
>> >=0A=
>> >There are zillions of subsystem mailing lists out there.  Always target=
=0A=
>> >the specific one you are interested in.  For this code, it should live=
=0A=
>> >in drivers/virt/ right?  Ah, no mailing list specific for that one, but=
=0A=
>> >I usually am the one that merges the code in there, so cc: me and Arnd=
=0A=
>> >and lkml and we can go from there!=0A=
>> drivers/virt looks like the correct place, so I need to send it as [PATC=
H] to the lkml with Arnd and yourself in the CC of the mail?=0A=
>=0A=
>Yes please!=0A=
will do.=0A=
=0A=
>=0A=
>> >Also, you have a bunch of sysfs files, all of those need to be=0A=
>> >documented in Documentation/ABI/ entries as you will see if you run=0A=
>> >scripts/get_abi.pl with your driver loaded.=0A=
>> will do.=0A=
>> =0A=
>> >=0A=
>> >Also, rip out the old-school PCI bus scanning stuff.  That hasn't been=
=0A=
>> >needed since the 2.4 kernel days :)=0A=
>> can you point me to a doc that states how I can retrieve the dev struct =
of the device in question?=0A=
>=0A=
>The device in question is passed to you in your pci probe function=0A=
>callback.  You do NOT allow any random PCI device number to be passed as=
=0A=
>a module parameter, as that way lies madness.=0A=
>=0A=
>If you MUST allow userspace to bind a specific PCI device to your=0A=
>driver, then use the sysfs "bind" file that the driver core provides to=0A=
>you.  Then the normal pci probe callback will be called and all is good.=
=0A=
>=0A=
>In short, your driver is doing a lot of extra work that it doesn't need=0A=
>to do at all, just remove all of that code.=0A=
I see, I just need to add the ops struct with only the probe function imple=
mented and move the init code there.=0A=
understood, will refractor and resend=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
