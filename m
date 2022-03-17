Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05D34352
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 13:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdEB8HfADFoaxYczz+g2aVQJUZHWxJtZy2imEY5D2+eTdx+3tiHmi5qWkEcnf1arwFTWHno8Ku5qLu1mo7e7vHS6hEL1e3DLTI2wWIUR7ddPO7U/sRv8E5RbfSUvvMpSrsEGn6mzxxJwvATcq0w6JW+sWQvzDrzzAi4Gyiizfhpr5ZbMyQM2NH/V6TimmuQYlvHfCBkJDp+2jinEDMG03oAUWEY0lPWWjw4sPqeL+w0qSiPGiKT+ulxmC5QcD2XGHbA2NuZzI4TcDej74UdFSQdUaeewTs+lmQiejYNGQfjK4dmYYJ12KjJIuy8Ah5V5Sgw2I6RFnMbgyvoECsZITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrEf0QxKEmH4XVwLMcSE32V9q8Mzezk2/JA/RP3l13A=;
 b=DDgaxrDPFIyfiI3sBfxWwHMYahnkcZFiG83mmB3DqXM7F6f3dVE1adS1vk4YwOT4HSN1Oi9JOJo99noqstEi1/FWJjCL8tgU0mivF4a2Q3WGsvushqaXYKj6m9T0Dt0yEHp3xiyGb3N/XKxSkweX13QXxdVuVT/dWd43aQio28rNE/OKh8TQ1EibA9CMgejYGlfE4FNuds9hjal2EpK1UXgFuGC3+o5P17LKUlSoujYIalJZmGBSXYZRCeGX56H5uTE9o1rUQnn6TjKNDGeEbdFXCYjZWtQaAG5T0idZV56NfqlRuZrYRn55nDlvLtJbi8/UuJWdgHSrQfV/fNXP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrEf0QxKEmH4XVwLMcSE32V9q8Mzezk2/JA/RP3l13A=;
 b=RvEJyS9NF7wEGahBFugUYHNSGPReWDmqOhGo8ZELNNrPv9RvQkk7ZtaXzmoZDwhc6uPyrEGoY5LNtAe0fItgZN/zbdD+YTUra0sZ1UzSdtdMxiNtizj4SJROcZpcdN8bBA8uWFxzfr/AKvi9F4bjV05+qL5m4V2lr25sSSxhrHBh/LZW7wRwi+bwJEk2s5m9R8fEoUBJLD4l0DP8kl+GIGaT7UKMLv0/T7yN8pisiaf8FA8UZxppKTTxCNpFo81iV2USS9Af81/FmpeBVBBtbXMMUO0NsbJyZTmilxbMKW4CauIDYRV8vZByyOZu66Ma+wNGBqkk7Zb4lp4aN8q1Tg==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM0PR02MB5841.eurprd02.prod.outlook.com (2603:10a6:208:181::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 13:41:30 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:41:30 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDXkaAgAAeIw8=
Date: Thu, 17 Mar 2022 13:41:30 +0000
Message-ID:
 <PAXPR02MB73109408A4070F19F34AD7D181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <20220317101942.GX3293@kadam>
In-Reply-To: <20220317101942.GX3293@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: e0c8051e-62ab-11cc-2c7a-ec17360490d4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d599c7a4-144f-4d90-60f2-08da081bd804
x-ms-traffictypediagnostic: AM0PR02MB5841:EE_
x-microsoft-antispam-prvs:
 <AM0PR02MB58411617C1A16318B9F8EDFF81129@AM0PR02MB5841.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 myY/MPSPxtN4ajvmV6KoksptYLVn2mFUVpQokAP+8qUXy2vLqO0D1MX3d5iGAtMHVPM8Zm9LvZW8CFZRCAkIRnsMWKxyAti1OtOmM1JtI1WDcGfJ/0RjAp1yOEWE9iF9xtjNP6/XslogDM4A74ousxdtA57aEWxc5VvZuTyzZqQK0Gh0xU5J0c26A5IY423KAYQobha5JbZKAzvCS2bO6HUQMETaYooxeCXu8Qm4dz8YqG93rB3oBQbQQL8iIkYxsKGvYSlRGKiLhWcFEuZwenDQt/SjtmU6fGWiNCTujwcB9TpmyeDtY+Phxy6Wi0fts2C5WKYxgjm+Gs73TFegYI7kFiD2P3QkVlDGelUzgnzOsc/GrKE3kiaG8FC0YSunFWPrZNOl+P+zwYO4HSQdEkkKaDn6o8xLrRtY7DgTlC2lilJVOloQM/UO5mMR7arUUN7PQxvYQzBWEvjLPFiwN4hscT5ChtxH8OsaJ8OqcPcru/Brivv+fi3BkorczxVlc92MKPohIu5BPEUJiikp5gZ2IG6OTZdF5ZxEbEIZMBB5H+YzlvAj7PK2oPg22rxsWvSc8aY5CKGQDW1K9ihbvjRehJg5whxb7tfnIj7yO/BCGoQeMhrjcVw/UjrEEcJr/qbjFlljcYOATkQ49377+3Emzlkf1EJV6udO+bFLKkREpuol1zJ7eH0gvGrfi6uUftuM80uY/4DELchpDkz3+TcTFoda1vkTVCvdl0WChU2En2++FFP+QjPQv2zaQS1IXKqI9u3xLkrJNbFi4Fl+bApZnteTVUR6r9WhleBqLr8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(30864003)(52536014)(54906003)(508600001)(33656002)(5660300002)(38070700005)(122000001)(83380400001)(86362001)(55016003)(316002)(45080400002)(6916009)(71200400001)(38100700002)(4326008)(82960400001)(6506007)(91956017)(7696005)(64756008)(66946007)(66446008)(76116006)(66556008)(9686003)(8676002)(66476007)(2906002)(26005)(186003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jaOBiShqBNgVDo0dDOqbYk1DmAE4ewUlmtxaV4Qz+t9i8AAW/JGFaOEhxz?=
 =?iso-8859-1?Q?TZq4wjiEGazhTF9V5Pg1ZdDmkleA1EcDXqlsj1FlXIgEs2DyfEiZPrmnPO?=
 =?iso-8859-1?Q?NTsJte+IXGHSy+cHACw8hkiH7Ac9sEALXaKsRJIYCd5+mfvgNzj/jaPSLp?=
 =?iso-8859-1?Q?eLIVAI5qdBelkZPSank5cmdaxuKYof5Hmxd48+Q1OAlYyVpHEojLcNLTEc?=
 =?iso-8859-1?Q?BtVqiMLylIKeHUUBpL4vv6ib4dRuhY0oqWgKJ6j5s3x5htzLht1Pq903dd?=
 =?iso-8859-1?Q?cWNWL/atxhuaRkzo8LUrqYTedI6ZEZqrnV4pJeGisOXES687xVE0Cs2oNB?=
 =?iso-8859-1?Q?lkNaYN8sYynAwt/tSrgLE+BP4fg5XOhmhdU9u6pFZKgM4TYTuk1OQlTjCH?=
 =?iso-8859-1?Q?5RKlUE8VHNODuC591KlGGz8ohRtyM4xlfKw8GfSOM8QS//d9ZjtCa4FCiw?=
 =?iso-8859-1?Q?JMXM3VFOc42pHvmh1nsBfNnncN1KarItkVdUrnSwIVQ/i+XZrvtcPu6Yla?=
 =?iso-8859-1?Q?8hRGLfPywX01ZfyALsp/RFK+LEJA2u2y3O1QG7Gc6wsKQ7hqty25L/AtTd?=
 =?iso-8859-1?Q?a1HPIix48F9zKlSqIoa2hEHzDMn+rvwlNpUPUG6d7IjeZRSxbsLxgBh3VZ?=
 =?iso-8859-1?Q?65krtqMW7c8MIKfkomrK3tBdyGRnQBrOR7z3TjPbMOgQXFgHl0S8iFxX2X?=
 =?iso-8859-1?Q?yV1rqLfME1z3pyrqWdqQC9bwMPcu+FM7JesK/MJw0IpGEzS3noVsOBQHUw?=
 =?iso-8859-1?Q?5zar+QK5KEWkm/H0XhXGfdWPL3aOTDKHtt5cwEdQoeK+dVLqyWCnD7Q9XH?=
 =?iso-8859-1?Q?R+l8FGgYYV8AjJQKVyn9dMsruEePa/mpOqnSkzbzWTp56OnsTYvbhvRxk2?=
 =?iso-8859-1?Q?deKzXNOT5ZapSn08KgvbR0TACh20ggHLpQvbzz1vQRGASZbua9x8PIlb/N?=
 =?iso-8859-1?Q?LGFxZC4YUqwbA2UonfpX1c47/itv8g9PsPISf27ojpxXSuMfyHQ47lAywl?=
 =?iso-8859-1?Q?5UGbbIrXcRjGpzFcPT18+w9aHfx06mgtbLlwo+E0TF602mxwMwH4g3HD+h?=
 =?iso-8859-1?Q?MBh0d72ndhulxNwYcaqDz6TeggiIln5MV5N3/N6KHESxqRfXv4bcFMj3lM?=
 =?iso-8859-1?Q?z0mNCin1Auurm3aUvs1omdfwEodu18yr8Y3tZmDou1nVQgKNSmuOTKNt6X?=
 =?iso-8859-1?Q?m2xGpOTkJij/Elo2owwjfzR7U/hdKZqMBuCMh2XcYvRPgaeljp4hMK6avC?=
 =?iso-8859-1?Q?Fku7G7s6AOrysA2Zajt8YR0r2BcgOSnx1mnhBucEsVcYHxgYIc9WM+MImf?=
 =?iso-8859-1?Q?wT9KrOLuPG0jZnQn2OpID6t+Qb86tskNUeYKk6om7QKqEjgRWmofJa2htH?=
 =?iso-8859-1?Q?nU6drHJLn7tamHdUuv5674KPhrZLmYv/iTzVNg89Wju6HNmZ6eZ+lzw+S+?=
 =?iso-8859-1?Q?NAXzJx04JqiKJYSBf3W6tyuHm52uSldzNDhcDbmw4rvqkQ5yd1xt84NVqs?=
 =?iso-8859-1?Q?GskXy28ZrohXe9x2aZzQwj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d599c7a4-144f-4d90-60f2-08da081bd804
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 13:41:30.6557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E89nf3et5Fj/Vq/8P6HKEPhl5pYtO97DZjCOpo8afAjJHNZY33z95v/c9lZfCxblIM5zJAXCR+JWESNGXPhSag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5841

Greetings Dan,=0A=
=0A=
>"new driver" is too vague.  What is the driver for?=0A=
the first line limitation makes it harder to describe it properly, I'll try=
 to find a more=0A=
informative line=0A=
=0A=
>=0A=
>You need a README or a TODO which explains how to move the driver out of=
=0A=
>staging and into the main kernel.=0A=
already discussed this with Greg, he pointed out that after I fix all the=
=0A=
rejects, I should post it in the lkml as proper driver=0A=
=0A=
>=0A=
>Run the patch through scripts/checkpatch.pl --strict.  You don't have=0A=
>to fix everything because this is staging but a bunch of the style=0A=
>issues are easy to fix so we may as well just do it.=0A=
I'll run it and fix resulting issues=0A=
=0A=
>=0A=
>There are a number of bugs and style issues.=0A=
>1) Find and replace every -1 with a define or a proper error code=0A=
>2) Never do assignments inside of a condition=0A=
>3) Do success handling instead of error handling.  Try to return errors=0A=
>   as directly as possible.=0A=
>=0A=
>Bad:=0A=
>        ret =3D frob();=0A=
>        if (!ret)=0A=
>                printk("success!");=0A=
>        return ret;=0A=
>=0A=
>Good:=0A=
>        ret =3D frob();=0A=
>        if (ret)=0A=
>                return ret;=0A=
>        printk("success!");=0A=
>        return 0;=0A=
>=0A=
>Keep scrolling down for the details.=0A=
sure thing, I'll go over the issues you've mentioned above and fix.=0A=
=0A=
>=0A=
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
>> =0A=
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
>>  16 files changed, 832 insertions(+)=0A=
>>  create mode 100644 drivers/staging/vsmp/Kconfig=0A=
>>  create mode 100644 drivers/staging/vsmp/Makefile=0A=
>>  create mode 100644 drivers/staging/vsmp/api.c=0A=
>>  create mode 100644 drivers/staging/vsmp/api.h=0A=
>>  create mode 100644 drivers/staging/vsmp/common/Kconfig=0A=
>>  create mode 100644 drivers/staging/vsmp/common/Makefile=0A=
>>  create mode 100644 drivers/staging/vsmp/common/common.c=0A=
>>  create mode 100644 drivers/staging/vsmp/common/common.h=0A=
>>  create mode 100644 drivers/staging/vsmp/common/version.c=0A=
>>  create mode 100644 drivers/staging/vsmp/logs/Kconfig=0A=
>>  create mode 100644 drivers/staging/vsmp/logs/Makefile=0A=
>>  create mode 100644 drivers/staging/vsmp/logs/active_logs.c=0A=
>>  create mode 100644 drivers/staging/vsmp/registers.h=0A=
>> =0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 68f21d46614c..2fc61b4d13e5 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -18381,6 +18381,12 @@ F:   Documentation/core-api/printk-formats.rst=
=0A=
>>  F:   lib/test_printf.c=0A=
>>  F:   lib/vsprintf.c=0A=
>>  =0A=
>> +VSMP GUEST DRIVER=0A=
>> +M:     Eial Czerwacki <eial.czerwacki@sap.com>=0A=
>> +M:     linux-vsmp@sap.com=0A=
>> +S:     Maintained=0A=
>> +F:     drivers/staging/vsmp-guest =0A=
>> +=0A=
>>  VT1211 HARDWARE MONITOR DRIVER=0A=
>>  M:   Juerg Haefliger <juergh@gmail.com>=0A=
>>  L:   linux-hwmon@vger.kernel.org=0A=
>> diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig=0A=
>> index 4ec5528f89fa..f61778bccb0b 100644=0A=
>> --- a/drivers/staging/Kconfig=0A=
>> +++ b/drivers/staging/Kconfig=0A=
>> @@ -114,6 +114,8 @@ source "drivers/staging/axis-fifo/Kconfig"=0A=
>>  =0A=
>>  source "drivers/staging/fieldbus/Kconfig"=0A=
>>  =0A=
>> +source "drivers/staging/vsmp/Kconfig"=0A=
>> +=0A=
>>  source "drivers/staging/kpc2000/Kconfig"=0A=
>>  =0A=
>>  source "drivers/staging/qlge/Kconfig"=0A=
>> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile=0A=
>> index 4d34198151b3..726e704ba8bc 100644=0A=
>> --- a/drivers/staging/Makefile=0A=
>> +++ b/drivers/staging/Makefile=0A=
>> @@ -47,6 +47,7 @@ obj-$(CONFIG_SOC_MT7621)    +=3D mt7621-dts/=0A=
>>  obj-$(CONFIG_STAGING_GASKET_FRAMEWORK)       +=3D gasket/=0A=
>>  obj-$(CONFIG_XIL_AXIS_FIFO)  +=3D axis-fifo/=0A=
>>  obj-$(CONFIG_FIELDBUS_DEV)     +=3D fieldbus/=0A=
>> +obj-$(CONFIG_VSMP)       +=3D vsmp/=0A=
>>  obj-$(CONFIG_KPC2000)                +=3D kpc2000/=0A=
>>  obj-$(CONFIG_QLGE)           +=3D qlge/=0A=
>>  obj-$(CONFIG_WFX)            +=3D wfx/=0A=
>> diff --git a/drivers/staging/vsmp/Kconfig b/drivers/staging/vsmp/Kconfig=
=0A=
>> new file mode 100644=0A=
>> index 000000000000..c57cfcb55033=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/Kconfig=0A=
>> @@ -0,0 +1,14 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0-only=0A=
>> +menuconfig VSMP=0A=
>> +     tristate "vSMP Guest Support"=0A=
>> +     depends on SYS_HYPERVISOR && X86_64 && PCI=0A=
>> +     help=0A=
>> +       Support for vSMP Guest Driver.=0A=
>> +=0A=
>> +       this drivers allows information gathering of data from the vSMP =
hypervisor when=0A=
>> +       running ontop of a vSMP based VM.=0A=
>> +=0A=
>> +       If unsure, say no.=0A=
>> +=0A=
>> +source "drivers/staging/vsmp/common/Kconfig"=0A=
>> +source "drivers/staging/vsmp/logs/Kconfig"=0A=
>> diff --git a/drivers/staging/vsmp/Makefile b/drivers/staging/vsmp/Makefi=
le=0A=
>> new file mode 100644=0A=
>> index 000000000000..88625cd3707d=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/Makefile=0A=
>> @@ -0,0 +1,7 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0=0A=
>> +#=0A=
>> +# Makefile for vSMP Guest drivers.=0A=
>> +#=0A=
>> +=0A=
>> +obj-$(CONFIG_VSMP)   +=3D vsmp.o common/ logs/=0A=
>> +vsmp-y                       :=3D api.o=0A=
>> diff --git a/drivers/staging/vsmp/api.c b/drivers/staging/vsmp/api.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..b0d4b5a990d4=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/api.c=0A=
>> @@ -0,0 +1,402 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP api=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/init.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/moduleparam.h>=0A=
>> +#include <linux/pci_regs.h>=0A=
>> +#include <linux/pci.h>=0A=
>> +#include <linux/kobject.h>=0A=
>> +#include <linux/kernel.h>=0A=
>> +=0A=
>> +#include <asm/io.h>=0A=
>> +=0A=
>> +#include "api.h"=0A=
>> +=0A=
>> +#define DRIVER_LICENSE "GPL"=0A=
>> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
>> +#define DRIVER_DESC "vSMP api driver"=0A=
>> +#define DRIVER_VERSION "0.1"=0A=
>> +=0A=
>> +#define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011=0A=
>> +#define VSMP_CTL_MAX_PCI_BARS 2=0A=
>> +=0A=
>> +/* modules info */=0A=
>> +MODULE_LICENSE(DRIVER_LICENSE);=0A=
>> +MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
>> +MODULE_DESCRIPTION(DRIVER_DESC);=0A=
>> +MODULE_VERSION(DRIVER_VERSION);=0A=
>> +=0A=
>> +static unsigned int vsmp_bus =3D 0;=0A=
>> +static unsigned short vsmp_dev =3D 0x1f;=0A=
>> +static unsigned char vsmp_func =3D 0;=0A=
>> +static bool vsmp_bdf_static =3D false;=0A=
>> +static char *vsmp_ctrl_pci_addr =3D "";=0A=
>> +module_param(vsmp_ctrl_pci_addr, charp, 0660);=0A=
>> +=0A=
>> +/* defines */=0A=
>> +// copied from arch/x86/pci/direct.c=0A=
>> +#define PCI_CONF1_ADDRESS(bus, devfn, reg) \=0A=
>> +        (0x80000000 | ((reg & 0xF00) << 16) | (bus << 16) \=0A=
>> +        | (devfn << 8) | (reg & 0xFC))=0A=
>=0A=
>Put the operator on the first line.=0A=
>=0A=
>> +=0A=
>> +/* global vars */=0A=
>> +void __iomem *cfg_addr =3D NULL;=0A=
>> +static struct kobject *vsmp_sysfs_kobj;=0A=
>> +static struct pci_dev *vsmp_dev_obj =3D NULL;=0A=
>> +=0A=
>> +static const struct pci_device_id pci_tbl[] =3D {=0A=
>> +     { PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },=0A=
>> +     { 0, },                 /* terminate list */=0A=
>> +};=0A=
>> +=0A=
>> +static struct {=0A=
>> +     uint64_t start;=0A=
>> +     uint64_t len;=0A=
>> +} mapped_bars[VSMP_CTL_MAX_PCI_BARS] =3D { 0 };=0A=
>> +=0A=
>> +/* internal functions */=0A=
>> +=0A=
>> +/**=0A=
>> + * parses the pci address of a given address where the vSMP=0A=
>> + * pci device is found=0A=
>> + */=0A=
>> +static void parse_vsmp_ctrl_pci_addr(void)=0A=
>> +{=0A=
>> +     if (strlen(vsmp_ctrl_pci_addr)) {=0A=
>=0A=
>Reverse this condition.=0A=
>=0A=
>        if (strlen(vsmp_ctrl_pci_addr) !=3D 0)=0A=
>                return;=0A=
>=0A=
will do.=0A=
=0A=
>> +             unsigned int bus;=0A=
>> +             unsigned short dev;=0A=
>> +             unsigned char func;=0A=
>> +=0A=
>> +             if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &=
dev,=0A=
>> +                        &func) =3D=3D 3) {=0A=
>=0A=
>Same:=0A=
>=0A=
>        if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev,=0A=
>                   &func) !=3D 3)=0A=
>                return;=0A=
>=0A=
>=0A=
>> +                     vsmp_bus =3D bus;=0A=
>> +                     vsmp_dev =3D dev;=0A=
>> +                     vsmp_func =3D func;=0A=
>> +                     vsmp_bdf_static =3D true;=0A=
>> +             }=0A=
>> +     }=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * queries as specfic device in order to determine if it is a vSMP pci =
device=0A=
>> + */=0A=
>> +static void query_pci_bus_for_vsmp_directly(unsigned int default_bus,=
=0A=
>> +                                         unsigned int devfn)=0A=
>> +{=0A=
>> +     printk(KERN_INFO=0A=
>> +            "vSMP pci controller not found in devices tree, trying dire=
ctly at %x:%x.%x...\n",=0A=
>> +            vsmp_bus, vsmp_dev, vsmp_func);=0A=
>> +=0A=
>> +     outl(PCI_CONF1_ADDRESS(vsmp_bus, devfn, PCI_BASE_ADDRESS_0), 0xcf8=
);=0A=
>> +     mapped_bars[0].start =3D inl(0xcfc);=0A=
>=0A=
>Doesn't this need to set mapped_bars[0].len as well?=0A=
>=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * scan all the devices on the system in order to locate the=0A=
>> + * vSMP pic device for a given dev end func is provided=0A=
>> + */=0A=
>> +static void scan_pci_devs_list_for_vsmp(unsigned int devfn)=0A=
>=0A=
>This function should return negatives if we do not find a device.=0A=
>The current error hanlding is convoluted and relies on globals.=0A=
>=0A=
>> +{=0A=
>> +     int found, i;=0A=
>=0A=
>"found" is never set to false.  Make it a bool.=0A=
>=0A=
>> +     struct pci_dev *pdev =3D NULL;=0A=
>=0A=
>Do not initialize "pdev" to a bogus value.=0A=
>=0A=
>> +     const struct pci_device_id *ent;=0A=
>> +=0A=
>> +     for_each_pci_dev(pdev) {=0A=
>> +             if (devfn !=3D -1) {=0A=
>=0A=
>Make this -1 a define instead of a magic number.=0A=
>=0A=
>> +                     if ((pdev->bus->number =3D=3D vsmp_bus) &&=0A=
>> +                         (devfn =3D=3D pdev->devfn)) {=0A=
>> +                             found =3D 1;=0A=
>> +                             break;=0A=
>> +                     }=0A=
>> +             } else {=0A=
>> +                     ent =3D pci_match_id(pci_tbl, pdev);=0A=
>> +                     if (ent) {=0A=
>> +                             found =3D 1;=0A=
>> +                             vsmp_bus =3D pdev->bus->number;=0A=
>> +                             vsmp_dev =3D PCI_SLOT(pdev->devfn);=0A=
>> +                             vsmp_func =3D PCI_FUNC(pdev->devfn);=0A=
>> +                             break;=0A=
>> +                     }=0A=
>> +             }=0A=
>> +     }=0A=
>=0A=
>        if (!found)=0A=
>                return -ENODEV;=0A=
>=0A=
according to Greg, I should use the probe callback in the ops struct. that=
=0A=
will provide me with the proper dev struct without the need to scan anythin=
g=0A=
=0A=
>> +=0A=
>> +     for (i =3D 0; (i < ARRAY_SIZE(mapped_bars)) && found; i++) {=0A=
>> +             mapped_bars[i].start =3D pci_resource_start(pdev, i);=0A=
>> +             mapped_bars[i].len =3D pci_resource_len(pdev, i);=0A=
>> +     }=0A=
>> +     vsmp_dev_obj =3D pdev;=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * open the cfg address space of the vSDP device=0A=
>> + */=0A=
>> +static int open_cfg_addr(void)=0A=
>> +{=0A=
>> +     unsigned int devfn =3D (vsmp_bdf_static) ? PCI_DEVFN(vsmp_dev, vsm=
p_func)=0A=
>> +                                             : -1;=0A=
>> +=0A=
>> +     scan_pci_devs_list_for_vsmp(devfn);=0A=
>> +     if (!mapped_bars[0].start)=0A=
>> +             query_pci_bus_for_vsmp_directly(0, devfn);=0A=
>> +=0A=
>> +     if (!mapped_bars[0].len) {=0A=
>> +             printk(KERN_INFO "vSMP pci controller not found, exiting.\=
n");=0A=
>> +             return -1;=0A=
>=0A=
>Return proper kernel error codes.  "return -EINVAL;"=0A=
probably missed it when I was fixing such issues. will fix.=0A=
=0A=
>=0A=
>> +     }=0A=
>> +=0A=
>> +     printk(KERN_INFO "mapping bar 0: [0x%llx,0x%llx]\n",=0A=
>> +            mapped_bars[0].start, mapped_bars[0].start + mapped_bars[0]=
.len);=0A=
>> +     cfg_addr =3D ioremap(mapped_bars[0].start, mapped_bars[0].len);=0A=
>> +=0A=
>> +     if (!cfg_addr) {=0A=
>=0A=
>Delete the blank link between the call and the error checking.  They are=
=0A=
>part of the same thing.=0A=
did you meant line?=0A=
=0A=
>=0A=
>> +             printk(KERN_ERR=0A=
>> +                    "failed to map vSMP pci controller at %x:%x.%x, exi=
ting.\n",=0A=
>> +                    vsmp_bus, vsmp_dev, vsmp_func);=0A=
>> +             return -1;=0A=
>> +     }=0A=
>> +=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +=0A=
>> +/* exported functions */=0A=
>> +=0A=
>> +/**=0A=
>> + * read a value from a specfic register in the vSMP's device config spa=
ce=0A=
>> + */=0A=
>> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_ty=
pe type)=0A=
>=0A=
>=0A=
>Use u64 when 64 bit types are intended.=0A=
>=0A=
>> +{=0A=
>> +     unsigned long ret_val;=0A=
>=0A=
>=0A=
>u64 ret_val;=0A=
sure=0A=
=0A=
>=0A=
>> +=0A=
>> +     switch (type) {=0A=
>> +     case VSMP_CTL_REG_SIZE_8BIT:=0A=
>> +             ret_val =3D readb(cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     case VSMP_CTL_REG_SIZE_16BIT:=0A=
>> +             ret_val =3D readw(cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     case VSMP_CTL_REG_SIZE_32BIT:=0A=
>> +             ret_val =3D readl(cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     case VSMP_CTL_REG_SIZE_64BIT:=0A=
>> +             ret_val =3D readq(cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     default:=0A=
>> +             printk(KERN_ERR "unsupported reg size type %d.\n", type);=
=0A=
>> +             ret_val =3D (unsigned long)(-1);=0A=
>=0A=
>=0A=
>64 bit types.  "ret_val =3D -1ULL;"=0A=
>=0A=
>=0A=
>> +     }=0A=
>> +=0A=
>> +     dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%lx from reg 0x%x of %d bi=
ts\n",=0A=
>> +             __func__, ret_val, reg, (type + 1) * 8);=0A=
>> +     return ret_val;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);=0A=
>> +=0A=
>> +/**=0A=
>> + * write a value to a specfic register in the vSMP's device config spac=
e=0A=
>> + */=0A=
>> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,=0A=
>> +                        enum reg_size_type type)=0A=
>> +{=0A=
>> +     switch (type) {=0A=
>> +     case VSMP_CTL_REG_SIZE_8BIT:=0A=
>> +             writeb((unsigned char)value, cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     case VSMP_CTL_REG_SIZE_16BIT:=0A=
>> +             writew((unsigned short)value, cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     case VSMP_CTL_REG_SIZE_32BIT:=0A=
>> +             writel((unsigned int)value, cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     case VSMP_CTL_REG_SIZE_64BIT:=0A=
>> +             writeq(value, cfg_addr + reg);=0A=
>> +             break;=0A=
>> +=0A=
>> +     default:=0A=
>> +             printk(KERN_ERR "unsupported reg size type %d.\n", type);=
=0A=
>> +     }=0A=
>> +=0A=
>> +     dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%x to reg 0x%x of %u bits=
\n",=0A=
>> +             __func__, reg, reg, (type + 1) * 8);=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);=0A=
>> +=0A=
>> +/**=0A=
>> + * reag a buffer from a specific offset in a specific bar, maxed to a p=
redefined len size-wise from the vSMP device=0A=
>> + */=0A=
>> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int off=
set,=0A=
>=0A=
>This is unsigned int but it returns zero or negative error codes.=0A=
>=0A=
>Create a separate function for "halt_on_null".  It will be cleaner that=0A=
>way.=0A=
I'll refractor this code properly.=0A=
=0A=
>=0A=
>> +                                  char *out, unsigned int len,=0A=
>> +                                  bool halt_on_null)=0A=
>> +{=0A=
>> +     unsigned char __iomem *buff;=0A=
>> +=0A=
>> +     BUG_ON(!mapped_bars[bar].start);=0A=
>> +     BUG_ON(ARRAY_SIZE(mapped_bars) <=3D bar);=0A=
>> +     BUG_ON((offset + len) > mapped_bars[bar].len);=0A=
>> +=0A=
>> +     buff =3D ioremap(mapped_bars[bar].start + offset, len);=0A=
>> +     if (!buff)=0A=
>> +             return -ENOMEM;=0A=
>> +=0A=
>> +     if (halt_on_null) {=0A=
>> +             int i;=0A=
>> +             unsigned char c;=0A=
>> +=0A=
>> +             for (i =3D 0; i < len; i++) {=0A=
>> +                     c =3D ioread8(&buff[i]);=0A=
>> +                     if (!c)=0A=
>> +                             break;=0A=
>> +                     out[i] =3D c;=0A=
>=0A=
>Copy the NUL terminator to out[i] before the break.=0A=
>=0A=
should I memset out to zero instead?=0A=
=0A=
>> +             }=0A=
>> +     } else=0A=
>> +             memcpy_fromio(out, buff, len);=0A=
>> +=0A=
>> +     iounmap(buff);=0A=
>> +=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_read_buff_from_bar);=0A=
>> +=0A=
>> +/**=0A=
>> + * register the vSMP sysfs object for user space interaction=0A=
>> + */=0A=
>> +int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr)=0A=
>> +{=0A=
>> +     int error =3D -1;=0A=
>> +=0A=
>> +     if (vsmp_sysfs_kobj && bin_attr) {=0A=
>> +             if ((error =3D sysfs_create_bin_file(vsmp_sysfs_kobj, bin_=
attr)))=0A=
>> +                     printk(KERN_CRIT "%s returned error %d\n", __func_=
_,=0A=
>> +                            error);=0A=
>> +     }=0A=
>> +=0A=
>> +     return error;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_register_sysfs_group);=0A=
>> +=0A=
>> +/**=0A=
>> + * deergister the vSMP sysfs object for user space interaction=0A=
>> + */=0A=
>> +void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr)=
=0A=
>> +{=0A=
>> +     if (vsmp_sysfs_kobj && bin_attr)=0A=
>> +             sysfs_remove_bin_file(vsmp_sysfs_kobj, bin_attr);=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_deregister_sysfs_group);=0A=
>> +=0A=
>> +/**=0A=
>> + * generic function to read from the bar=0A=
>> + */=0A=
>> +ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigne=
d reg,=0A=
>> +                            char *buf, loff_t off, size_t count)=0A=
>> +{=0A=
>> +     ssize_t ret_val =3D 0;=0A=
>> +=0A=
>> +     if (op->buff_offset >=3D op->hwi_block_size) {    // preform H/W o=
p=0A=
>> +             vsmp_reset_op(op);=0A=
>> +=0A=
>> +             if ((ret_val =3D vsmp_read_buff_from_bar(bar, reg, op->buf=
f,=0A=
>> +                                                    op->hwi_block_size,=
 false))) {=0A=
>> +                     printk(KERN_ERR "%s operation failed\n",=0A=
>> +                            (op->action =3D=3D FW_READ) ? "read" : "wri=
te");=0A=
>> +             }=0A=
>> +             op->buff_offset =3D 0;=0A=
>> +     }=0A=
>> +=0A=
>> +     if (!ret_val) {=0A=
>=0A=
>Flip this around.  Do error handling.  Don't do success handling.=0A=
>=0A=
>> +             ret_val =3D memory_read_from_buffer(buf, count, &op->buff_=
offset,=0A=
>> +                                               op->buff, op->hwi_block_=
size);=0A=
>> +     }=0A=
>> +=0A=
>> +     return ret_val;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_generic_buff_read);=0A=
>> +=0A=
>> +void vsmp_reset_op(struct fw_ops *op)=0A=
>> +{=0A=
>> +     memset(op->buff, 0, op->hwi_block_size);=0A=
>> +     op->buff_offset =3D op->hwi_block_size;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_reset_op);=0A=
>> +=0A=
>> +int vsmp_init_op(struct fw_ops *op, ssize_t max_size,=0A=
>> +               enum vsmp_fw_action action)=0A=
>> +{=0A=
>> +     op->hwi_block_size =3D max_size;=0A=
>> +     op->action =3D action;=0A=
>> +     op->buff_offset =3D op->hwi_block_size;=0A=
>> +=0A=
>> +     if (!(op->buff =3D kzalloc(op->hwi_block_size, GFP_KERNEL)))=0A=
>> +             return -ENOMEM;=0A=
>> +=0A=
>> +     vsmp_reset_op(op);=0A=
>> +=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_init_op);=0A=
>> +=0A=
>> +void vsmp_release_op(struct fw_ops *op)=0A=
>> +{=0A=
>> +     BUG_ON(!op->buff);=0A=
>> +     kfree(op->buff);=0A=
>> +     memset(op, 0, sizeof(*op));=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_release_op);=0A=
>> +=0A=
>> +bool vsmp_op_buffer_depleted(struct fw_ops *op)=0A=
>> +{=0A=
>> +     return op->buff_offset >=3D op->hwi_block_size;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL_GPL(vsmp_op_buffer_depleted);=0A=
>> +=0A=
>> +/* module functions */=0A=
>> +=0A=
>> +/**=0A=
>> + * init the module=0A=
>> + */=0A=
>> +static int __init vsmp_api_init(void)=0A=
>> +{=0A=
>> +     int ret_val;=0A=
>> +=0A=
>> +     parse_vsmp_ctrl_pci_addr();=0A=
>> +=0A=
>> +     if (!(ret_val =3D open_cfg_addr())) {=0A=
>=0A=
>Error handling not success handling.=0A=
>=0A=
>> +             printk(KERN_INFO "%s [%02x:%02x.%x] up and running\n",=0A=
>> +                    DRIVER_DESC, vsmp_bus, vsmp_dev, vsmp_func);=0A=
>> +=0A=
>> +             if (!(vsmp_sysfs_kobj =3D kobject_create_and_add("vsmp",=
=0A=
>> +                                                             hypervisor=
_kobj))) {=0A=
>=0A=
>Reverse.=0A=
>=0A=
>> +                     printk(KERN_ERR=0A=
>> +                            "failed to create sysfs entry for vSMP pci =
controller at %x:%x.%x, exiting.\n",=0A=
>> +                            vsmp_bus, vsmp_dev, vsmp_func);=0A=
>> +                     ret_val =3D -1;=0A=
>> +             }=0A=
>> +     }=0A=
>> +=0A=
>> +     return ret_val;=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * cleanup after the module upon exit=0A=
>> + */=0A=
>> +static void __exit vsmp_api_exit(void)=0A=
>> +{=0A=
>> +     if (cfg_addr)=0A=
>> +             iounmap(cfg_addr);=0A=
>> +=0A=
>> +     if (vsmp_sysfs_kobj)=0A=
>> +             kobject_put(vsmp_sysfs_kobj);=0A=
>> +}=0A=
>> +=0A=
>> +module_init(vsmp_api_init);=0A=
>> +module_exit(vsmp_api_exit);=0A=
>> diff --git a/drivers/staging/vsmp/api.h b/drivers/staging/vsmp/api.h=0A=
>> new file mode 100644=0A=
>> index 000000000000..88d81b80bd81=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/api.h=0A=
>> @@ -0,0 +1,61 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP api header=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#ifndef VSMP_API_H=0A=
>> +#define VSMP_API_H=0A=
>> +=0A=
>> +#include <linux/sysfs.h>=0A=
>> +=0A=
>> +enum reg_size_type {=0A=
>> +     VSMP_CTL_REG_SIZE_8BIT =3D 0,=0A=
>> +     VSMP_CTL_REG_SIZE_16BIT,=0A=
>> +     VSMP_CTL_REG_SIZE_32BIT,=0A=
>> +     VSMP_CTL_REG_SIZE_64BIT=0A=
>> +};=0A=
>> +=0A=
>> +enum vsmp_fw_action {=0A=
>> +     FW_READ =3D 0,=0A=
>> +     FW_WRITE =3D 1=0A=
>> +};=0A=
>> +=0A=
>> +struct fw_ops {=0A=
>> +     enum vsmp_fw_action action;=0A=
>> +     ssize_t hwi_block_size;=0A=
>> +     unsigned char *buff;=0A=
>> +     loff_t buff_offset;=0A=
>> +     bool in_progress;=0A=
>> +};=0A=
>> +=0A=
>> +#define FILE_PREM (S_IRUSR | S_IRGRP | S_IROTH)=0A=
>> +=0A=
>> +#define VSMP_ATTR_RO(_name) static struct kobj_attribute _name##_attr =
=3D __ATTR_RO(_name)=0A=
>> +#define vsmp_read_reg8_from_cfg(_reg_) ((unsigned char) vsmp_read_reg_f=
rom_cfg((_reg_), VSMP_CTL_REG_SIZE_8BIT))=0A=
>> +#define vsmp_read_reg16_from_cfg(_reg_) ((unsigned short) vsmp_read_reg=
_from_cfg((_reg_), VSMP_CTL_REG_SIZE_16BIT))=0A=
>> +#define vsmp_read_reg32_from_cfg(_reg_) ((unsigned int) vsmp_read_reg_f=
rom_cfg((_reg_), VSMP_CTL_REG_SIZE_32BIT))=0A=
>> +#define vsmp_read_reg64_from_cfg(_reg_) ((unsigned long) vsmp_read_reg_=
from_cfg((_reg_), VSMP_CTL_REG_SIZE_64BIT))=0A=
>> +#define vsmp_write_reg8_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_re=
g_),(_val_), VSMP_CTL_REG_SIZE_8BIT)=0A=
>> +#define vsmp_write_reg16_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_r=
eg_), (_val_), VSMP_CTL_REG_SIZE_16BIT)=0A=
>> +#define vsmp_write_reg32_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_r=
eg_), (_val_), VSMP_CTL_REG_SIZE_32BIT)=0A=
>> +#define vsmp_write_reg64_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_r=
eg_), (_val_), VSMP_CTL_REG_SIZE_64BIT)=0A=
>> +=0A=
>> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_ty=
pe type);=0A=
>> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,=0A=
>> +                        enum reg_size_type type);=0A=
>> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int off=
set,=0A=
>> +                                  char *out, unsigned int len,=0A=
>> +                                  bool halt_on_null);=0A=
>> +int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr);=0A=
>> +void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr);=
=0A=
>> +=0A=
>> +ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigne=
d reg,=0A=
>> +                            char *buf, loff_t off, size_t count);=0A=
>> +void vsmp_reset_op(struct fw_ops *op);=0A=
>> +int vsmp_init_op(struct fw_ops *op, ssize_t max_size,=0A=
>> +              enum vsmp_fw_action action);=0A=
>> +void vsmp_release_op(struct fw_ops *op);=0A=
>> +bool vsmp_op_buffer_depleted(struct fw_ops *op);=0A=
>> +=0A=
>> +#endif // VSMP_API_H=0A=
>> diff --git a/drivers/staging/vsmp/common/Kconfig b/drivers/staging/vsmp/=
common/Kconfig=0A=
>> new file mode 100644=0A=
>> index 000000000000..fe0cfeaca1bb=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/common/Kconfig=0A=
>> @@ -0,0 +1,11 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0-only=0A=
>> +config VSMP_COMMON=0A=
>> +     tristate "vSMP Guest driver common Support"=0A=
>> +     depends on VSMP=0A=
>> +     help=0A=
>> +       select this feature in order to be able to retrive generic data =
from the vSMP=0A=
>> +       VM.=0A=
>> +       currently old version is supported.=0A=
>> +       the data can be found under /sys/hypervisor/vsmp=0A=
>> +=0A=
>> +       If unsure, say N.=0A=
>> diff --git a/drivers/staging/vsmp/common/Makefile b/drivers/staging/vsmp=
/common/Makefile=0A=
>> new file mode 100644=0A=
>> index 000000000000..e6f6aa1d73df=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/common/Makefile=0A=
>> @@ -0,0 +1,7 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0=0A=
>> +#=0A=
>> +# Makefile for vSMP Guest common feature.=0A=
>> +#=0A=
>> +=0A=
>> +obj-$(CONFIG_VSMP_COMMON)    +=3D common_info.o =0A=
>> +common_info-y                +=3D common.o version.o=0A=
>> diff --git a/drivers/staging/vsmp/common/common.c b/drivers/staging/vsmp=
/common/common.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..31e6551f2b7f=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/common/common.c=0A=
>> @@ -0,0 +1,64 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP common=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/init.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/pci_regs.h>=0A=
>> +#include <linux/pci.h>=0A=
>> +#include <linux/kobject.h>=0A=
>> +#include <linux/kernel.h>=0A=
>> +=0A=
>> +#include <asm/io.h>=0A=
>> +=0A=
>> +#include "../api.h"=0A=
>> +#include "common.h"=0A=
>> +=0A=
>> +#define DRIVER_LICENSE "GPL"=0A=
>> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
>> +#define DRIVER_DESC "vSMP common info driver"=0A=
>> +#define DRIVER_VERSION "0.1"=0A=
>> +=0A=
>> +/* modules info */=0A=
>> +MODULE_LICENSE(DRIVER_LICENSE);=0A=
>> +MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
>> +MODULE_DESCRIPTION(DRIVER_DESC);=0A=
>> +MODULE_VERSION(DRIVER_VERSION);=0A=
>> +=0A=
>> +static struct sysfs_entry_cbs cbs_arr[] =3D {=0A=
>> +     create_entry(version),=0A=
>> +};=0A=
>> +=0A=
>> +/* module functions */=0A=
>> +=0A=
>> +/**=0A=
>> + * init the common module=0A=
>> + */=0A=
>> +static int __init vsmp_common_info_init(void)=0A=
>> +{=0A=
>> +     int ret_val =3D 0, i;=0A=
>> +=0A=
>> +     for (i =3D 0; (i < ARRAY_SIZE(cbs_arr) && !ret_val); i++) {=0A=
>> +             if ((ret_val =3D cbs_arr[i].reg_cb()))=0A=
>> +                     printk(KERN_ERR "failed to init sysfs (%d), exitin=
g.\n",=0A=
>> +                            ret_val);=0A=
>> +     }=0A=
>> +=0A=
>> +     return -1 * ret_val;=0A=
>=0A=
>sysfs_register_version_cb() already returns negatives.  Why the "-1 *"?=0A=
leftovers from prior iteration of the driver=0A=
=0A=
>=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * cleanup after the module=0A=
>> + */=0A=
>> +static void __exit vsmp_common_info_exit(void)=0A=
>> +{=0A=
>> +     int i;=0A=
>> +=0A=
>> +     for (i =3D 0; i < ARRAY_SIZE(cbs_arr); i++)=0A=
>> +             cbs_arr[i].dereg_cb();=0A=
>> +}=0A=
>> +=0A=
>> +module_init(vsmp_common_info_init);=0A=
>> +module_exit(vsmp_common_info_exit);=0A=
>> diff --git a/drivers/staging/vsmp/common/common.h b/drivers/staging/vsmp=
/common/common.h=0A=
>> new file mode 100644=0A=
>> index 000000000000..08a096628c95=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/common/common.h=0A=
>> @@ -0,0 +1,27 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP common header=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#ifndef VSM_COMMON_H=0A=
>> +#define VSM_COMMON_H=0A=
>> +=0A=
>> +#define create_entry(_label_) \=0A=
>> +     { \=0A=
>> +             .reg_cb =3D sysfs_register_ ## _label_ ## _cb, \=0A=
>> +             .dereg_cb =3D sysfs_deregister_ ## _label_ ## _cb, \=0A=
>> +     }=0A=
>> +=0A=
>> +typedef int (*sysfs_register_cb)(void);=0A=
>> +typedef void (*sysfs_deregister_cb)(void);=0A=
>> +=0A=
>> +struct sysfs_entry_cbs {=0A=
>> +     sysfs_register_cb reg_cb;=0A=
>> +     sysfs_deregister_cb dereg_cb;=0A=
>> +};=0A=
>> +=0A=
>> +int sysfs_register_version_cb(void);=0A=
>> +void sysfs_deregister_version_cb(void);=0A=
>> +=0A=
>> +#endif // !VSM_COMMON_H=0A=
>> diff --git a/drivers/staging/vsmp/common/version.c b/drivers/staging/vsm=
p/common/version.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..35b5a7785e9a=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/common/version.c=0A=
>> @@ -0,0 +1,85 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP version=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/slab.h>=0A=
>> +#include <linux/kobject.h>=0A=
>> +=0A=
>> +#include "../api.h"=0A=
>> +#include "../registers.h"=0A=
>> +=0A=
>> +#define VERSION_MAX_LEN (1 << 19)=0A=
>> +=0A=
>> +static struct fw_ops op;=0A=
>> +=0A=
>> +static ssize_t version_read(struct file *filp, struct kobject *kobj,=0A=
>> +                         struct bin_attribute *bin_attr,=0A=
>> +                         char *buf, loff_t off, size_t count)=0A=
>> +{=0A=
>> +     ssize_t ret_val =3D vsmp_generic_buff_read(&op, 0,=0A=
>> +                                              vsmp_read_reg32_from_cfg(=
VSMP_VERSION_REG),=0A=
>> +                                              buf, off, count);=0A=
>=0A=
>Don't put functions which can fail in the declaration block.=0A=
>=0A=
>        ret_val =3D vsmp_generic_buff_read(&op, 0,=0A=
>                                         vsmp_read_reg32_from_cfg(VSMP_VER=
SION_REG),=0A=
>                                         buf, off, count);=0A=
>=0A=
can you explain what is the reason behind this recommendation?=0A=
=0A=
>> +=0A=
>> +     if ((ret_val !=3D -ENOMEM) && ((ret_val !=3D -EINVAL)))=0A=
>=0A=
>Don't test for specific error codes.=0A=
>=0A=
>        if (ret_val < 0)=0A=
>                return ret_val;=0A=
>=0A=
>=0A=
now I understand, there was a patchset which fixes for all the -1 and the s=
pecific ret_val testing, I see it=0A=
was misplaced at some point of the work.=0A=
thanks for pointing it out=0A=
=0A=
>> +         buf[ret_val++] =3D '\n';=0A=
>> +=0A=
>> +     return ret_val;=0A=
>> +}=0A=
>> +=0A=
>> +struct bin_attribute version_raw_attr =3D __BIN_ATTR(version, FILE_PREM=
, version_read, NULL, VERSION_MAX_LEN);=0A=
>> +=0A=
>> +/**=0A=
>> + * retrive str in order to determine the proper length.=0A=
>> + * this is the best way to maintain backwards compatibility with all=0A=
>> + * vSMP versions.=0A=
>> + */=0A=
>> +static int get_version_len(void)=0A=
>> +{=0A=
>> +     unsigned reg;=0A=
>> +     char *version_str =3D kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_=
NOWARN);=0A=
>=0A=
>VERSION_MAX_LEN is 524288 bytes.  That's too long.  Create a small=0A=
>buffer and loop over it until you find the NUL terminator.  Why does=0A=
>this need to be ATOMIC, are we holding a lock?  Hopefully if we can fix=0A=
>the length the __GFP_NOWARN will be unnecessary.=0A=
I'm not sure it is possible to loopover, I'll take that into consideration.=
=0A=
in this flow, only one access is possible, so I assume GFP_ATOMIC is not ne=
eded=0A=
=0A=
>=0A=
>> +=0A=
>> +     if (!version_str)=0A=
>> +             return -1;=0A=
>> +=0A=
>> +     reg =3D vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);=0A=
>> +     memset(version_str, 0, VERSION_MAX_LEN);=0A=
>> +=0A=
>> +     if (vsmp_read_buff_from_bar(0, reg, version_str, VERSION_MAX_LEN, =
true)) {=0A=
>> +             printk(KERN_ERR "failed to read buffer from bar\n");=0A=
>> +             return -1;=0A=
>> +     }=0A=
>> +=0A=
>> +     version_raw_attr.size =3D strlen(version_str);=0A=
>=0A=
>get_version_len() should return the length instead of setting a global.=0A=
do you mean version_raw_attr.size =3D get_version_len()?=0A=
=0A=
>=0A=
>> +     kfree(version_str);=0A=
>> +=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * register the version sysfs entry=0A=
>> + */=0A=
>> +int sysfs_register_version_cb(void)=0A=
>> +{=0A=
>> +     if (get_version_len()) {=0A=
>> +             printk(KERN_ERR "failed to init vSMP version module\n");=
=0A=
>> +             return -1;=0A=
>> +     }=0A=
>> +=0A=
>> +     if (!vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {=0A=
>=0A=
>This if statement is reversed so this code can never work.=0A=
not sure I follow, can you explain?=0A=
=0A=
>=0A=
>> +             printk(KERN_ERR "failed to init vSMP version op\n");=0A=
>> +             return -1;=0A=
>> +     }=0A=
>> +=0A=
>> +     return vsmp_register_sysfs_group(&version_raw_attr);=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * deregister the version sysfs entry=0A=
>> + */=0A=
>> +void sysfs_deregister_version_cb(void)=0A=
>> +{=0A=
>> +     vsmp_deregister_sysfs_group(&version_raw_attr);=0A=
>> +     vsmp_release_op(&op);=0A=
>> +}=0A=
>> diff --git a/drivers/staging/vsmp/logs/Kconfig b/drivers/staging/vsmp/lo=
gs/Kconfig=0A=
>> new file mode 100644=0A=
>> index 000000000000..d41491472bab=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/logs/Kconfig=0A=
>> @@ -0,0 +1,10 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0-only=0A=
>> +config VSMP_LOGS=0A=
>> +     tristate "vSMP Guest driver logs Support"=0A=
>> +     depends on VSMP=0A=
>> +     help=0A=
>> +       select this feature in order to be able to retrive logs from the=
 vSMP=0A=
>> +       VM.=0A=
>> +       the data can be found under /sys/hypervisor/logs=0A=
>> +=0A=
>> +       If unsure, say N.=0A=
>> diff --git a/drivers/staging/vsmp/logs/Makefile b/drivers/staging/vsmp/l=
ogs/Makefile=0A=
>> new file mode 100644=0A=
>> index 000000000000..edc679803fe6=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/logs/Makefile=0A=
>> @@ -0,0 +1,7 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0=0A=
>> +#=0A=
>> +# Makefile for vSMP Guest common feature.=0A=
>> +#=0A=
>> +=0A=
>> +obj-$(CONFIG_VSMP_LOGS)      +=3D logs.o =0A=
>> +logs-y               +=3D active_logs.o=0A=
>> diff --git a/drivers/staging/vsmp/logs/active_logs.c b/drivers/staging/v=
smp/logs/active_logs.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..91492c72cc6f=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/staging/vsmp/logs/active_logs.c=0A=
>> @@ -0,0 +1,112 @@=0A=
>> +/* SPDX-License-Identifier: GPL-2.0 */=0A=
>> +/*=0A=
>> + * vSMP logs=0A=
>> + * Copyright (C) 2022 SAP.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/init.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/pci_regs.h>=0A=
>> +#include <linux/pci.h>=0A=
>> +#include <linux/kobject.h>=0A=
>> +#include <linux/kernel.h>=0A=
>> +#include <linux/mutex.h>=0A=
>> +=0A=
>> +#include <asm/io.h>=0A=
>> +=0A=
>> +#include "../api.h"=0A=
>> +#include "../registers.h"=0A=
>> +=0A=
>> +#define DRIVER_LICENSE "GPL"=0A=
>> +#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
>> +#define DRIVER_DESC "vSMP logs driver"=0A=
>> +#define DRIVER_VERSION "0.1"=0A=
>> +=0A=
>> +#define LOGS_MASK (1 << 0)=0A=
>> +=0A=
>> +/* modules info */=0A=
>> +MODULE_LICENSE(DRIVER_LICENSE);=0A=
>> +MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
>> +MODULE_DESCRIPTION(DRIVER_DESC);=0A=
>> +MODULE_VERSION(DRIVER_VERSION);=0A=
>=0A=
>Just put:=0A=
>=0A=
>MODULE_LICENSE("GPL v2");=0A=
>=0A=
>Adding unnecessary indirection is against kernel style.  It says v2 at=0A=
>the top.=0A=
>=0A=
>> +=0A=
>> +static struct fw_ops op;=0A=
>> +static unsigned log_start;=0A=
>> +DEFINE_MUTEX(log_mutex);=0A=
>> +=0A=
>> +/* module functions */=0A=
>> +static ssize_t log_read(struct file *filp, struct kobject *kobj,=0A=
>> +                     struct bin_attribute *bin_attr,=0A=
>> +                     char *buf, loff_t off, size_t count)=0A=
>> +{=0A=
>> +     ssize_t ret_val =3D 0;=0A=
>> +=0A=
>> +     if (!op.in_progress) {=0A=
>> +             if ((ret_val =3D mutex_lock_interruptible(&log_mutex))) {=
=0A=
>=0A=
>Don't do assignments inside of an if condition.=0A=
>=0A=
>> +                     printk(KERN_ERR=0A=
>> +                            "error in atemmpt to lock mutex (%lx)\n",=
=0A=
>> +                            ret_val);=0A=
>> +                     return ret_val;=0A=
>> +             }=0A=
>> +=0A=
>> +             vsmp_write_reg16_to_cfg(VSMP_LOGS_CTRL_REG,=0A=
>> +                                     vsmp_read_reg16_from_cfg=0A=
>> +                                     (VSMP_LOGS_CTRL_REG) | LOGS_MASK);=
=0A=
>> +             op.in_progress =3D true;=0A=
>> +             vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG, 0);=0A=
>> +     }=0A=
>> +=0A=
>> +     if (vsmp_op_buffer_depleted(&op)) {=0A=
>> +             if (!(vsmp_read_reg16_from_cfg(VSMP_LOGS_CTRL_REG) & LOGS_=
MASK)) {=0A=
>> +                     vsmp_reset_op(&op);=0A=
>> +                     op.in_progress =3D 0;=0A=
>> +                     mutex_unlock(&log_mutex);=0A=
>> +                     return ret_val;=0A=
>=0A=
>Return a literal when possible. "return 0;" is more clear than=0A=
>"return ret_val;".=0A=
>=0A=
>> +             }=0A=
>> +     }=0A=
>> +=0A=
>> +     ret_val =3D vsmp_generic_buff_read(&op, 1, log_start, buf, off, co=
unt);=0A=
>> +     if (!ret_val || (ret_val =3D=3D -ENOMEM) || (ret_val =3D=3D -EINVA=
L)) {=0A=
>> +             printk(KERN_ERR "error reading from buffer\n");=0A=
>> +             mutex_unlock(&log_mutex);=0A=
>> +             return 0;=0A=
>> +     }=0A=
>> +=0A=
>> +     if (vsmp_op_buffer_depleted(&op)) {=0A=
>> +             vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG,=0A=
>> +                                     ~0LL & ~(1LL << 0));=0A=
>> +     }=0A=
>> +=0A=
>> +     return count;=0A=
>> +}=0A=
>> +=0A=
>> +static struct bin_attribute log_raw_attr =3D __BIN_ATTR(log, FILE_PREM,=
 log_read, NULL, 0);=0A=
>> +=0A=
>> +/**=0A=
>> + * init the log module=0A=
>> + */=0A=
>> +static int __init vsmp_logs_init(void)=0A=
>> +{=0A=
>> +     if (!vsmp_init_op(&op, vsmp_read_reg32_from_cfg(VSMP_LOGS_LEN_REG)=
,=0A=
>> +                                                      FW_READ)) {=0A=
>> +             printk(KERN_ERR "failed to init vSMP log op\n");=0A=
>> +             return -1;=0A=
>> +     }=0A=
>> +=0A=
>> +     log_start =3D vsmp_read_reg32_from_cfg(VSMP_LOGS_START_REG);=0A=
>> +     mutex_init(&log_mutex);=0A=
>> +=0A=
>> +     return vsmp_register_sysfs_group(&log_raw_attr);=0A=
>=0A=
>If vsmp_register_sysfs_group() fails then it needs to vsmp_release_op().=
=0A=
thanks, will fix=0A=
=0A=
>=0A=
>I have written a lot about how to write error handling code:=0A=
>https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.k=
ernel.org%2Fall%2F20210831084735.GL12231%40kadam%2F&amp;data=3D04%7C01%7Cei=
al.czerwacki%40sap.com%7Cf1e83fe49d074f7552da08da07ffb8e1%7C42f7676cf455423=
c82f6dc2d99791af7%7C0%7C0%7C637831092157869913%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;s=
data=3DC5q%2BpdsckU%2FAo%2BKu2t63n6sMRv%2FGx5HID0oVYS3ZxEI%3D&amp;reserved=
=3D0=0A=
>=0A=
I'll read the link above,.=0A=
=0A=
Thanks for your remarks.=0A=
=0A=
Eial=
