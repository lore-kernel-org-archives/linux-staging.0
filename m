Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF9F7E
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 22:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afAMZlwjZyqxFj+udHS/Eal7ac2Yt8VcH3FwJKc2hqhAzr4MUiRyETlTUI4IANgkccv/59g+n2pfOFQDQwLYVQ9fFNg2z8qNIjCgLAtJnelBpPiBKzpRYcifQpfzKVso6LGjRSZDxMT9vYspWMpiffqm+i6G0/Qbk5d+/z8Z5pDowdcPLzSCCUeuQCNC176bm82l5s7tVCv5RdLpGg/i7ID8A5YqChU4MomWqmJhGCaDnyYnPDFEupVxF58/rVmL7++cmV6SKT6ElnjNcyw/gDbG27ly4Hp0EB3CaH7UE8JLTnOmoyoK2OTR+fZAx1MS0s2MMsD48J9j1reA193xwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5LBEjyD8uimCGljrEZCDJUQHigd2HlNXAzgC0WTLBI=;
 b=gloGXEkC/FCsA7gOgnKqkVMQMIqK3ZpwYLi+D46ikY+vkkVESv2m+1mbymAA2njsJq3/yLtwr+kMTVYCUbXeaSuqacR0bGR1XDdaXiiaq2fqgIVJm2HtQ9RXFtgqZGp+J0QfBeA7qtNpTzdSImTxsI4ChTxcAhLlxK8+RK9wgn2F4UKT1AtPZtkUcaAHGgZ7WjcScsLoefRK9LkwQeCaQudoVob6DrpGJWlU0wCeItyi6J6WqPXfP8mTi6zk1Nkvj2Enuou+Gd5u11kzl9WQoGQTE2sjRy2Etjf9q3Q1q3mwnobMJCZ8eaXFbV/Mf1cO3ZDposULqXYofqBWY9tKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5LBEjyD8uimCGljrEZCDJUQHigd2HlNXAzgC0WTLBI=;
 b=RyIVp1awHSkKLzj+OCFhS0IQaRqWoXCxZpZaiUo2MIF86FF44Qu3ncQiXfwE3C4I5T2zZeHnOK/n0aMetmJM6t2ej0E7edi7a+MrfutjjetmQXJB7Y/tMULxPz+zyJegXtyqYDKPXIzxbBRjINewP9snxVEYZ0QNVJQ/Ny6PS5NouoVWgiQQatRx51/5b90QWg9v0XM6UjjjzTzyjn7nMJN4j6RazZ3GEbfZmZhlW6GPL7YlzQhTzT0kTa5/2RPzOPLMmp5OqcmlTJOA4IjFJXEhSWjYRHkSiQC0u0P70VoXg5KsDr8ShTp+ooP7yjSi3XbDVAB4CORDWzs4IX2dSQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by PR3PR02MB6140.eurprd02.prod.outlook.com (2603:10a6:102:2e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 22:58:25 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::85db:196b:d199:9fbb]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::85db:196b:d199:9fbb%7]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 22:58:25 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
CC: SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: help in address issues with a new driver
Thread-Topic: help in address issues with a new driver
Thread-Index: AQHYNNHMA26xNAOrmUS+yj4QsxENP6y5OuCs
Date: Thu, 10 Mar 2022 22:58:25 +0000
Message-ID:
 <PAXPR02MB7310A014368829393A8D8692810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73108745861C53FA175BA588810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
In-Reply-To:
 <PAXPR02MB73108745861C53FA175BA588810B9@PAXPR02MB7310.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: adec87e0-4f7d-4e42-79df-6c3a44bc6236
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5156235c-3055-4db5-b09b-08da02e97bc9
x-ms-traffictypediagnostic: PR3PR02MB6140:EE_
x-microsoft-antispam-prvs:
 <PR3PR02MB6140F9464F87DB89A4EC1BF5810B9@PR3PR02MB6140.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gNE95GWqL1vODs6QBWutwPeRueRAtSDS0Vkq6vT/FGAC+Azul+0VUXWzWyxXrimuX6ryKhh/ntMlVqpmYmum6pCdwnVfvZ3kOpwRrJLloeZBJu9vbOqf3haaFnl/JEa4S1JX5G/8l+n/7jP4MqJryMZf7WbgUWW6JJhu3RThopoJLYb0HtpbMICs2b1BLmFVj1bUlhDMqKoWS6+x+j10M9lMQ+i7bpAp/O+ZFTyx14Rv9bMK430q+2tcmIYmBLVIXbRgD3tx/xmGCEH4FFCyI4M2qvv04D4KhfwRNN2CdxgXFaJqXsXvIdhF6WvX84eDxjM+NDuuVA2eLg/BidXGG8R70hf4Ssha9EiJuiWq3onRyM4G4+GTmfaX5hHR6Njt9ka7cC21YsjibjNtKU0LusVvfYC99McO3uWLk2P6xqDbOu5I6YrSFj39wnv/UO9bC7QvqqbnptKvyYwXPK349ynzTIUmOQRPbN5BRlgRFTA6sA9YUvkoKIUCto3HJgA+pMLQBNoibV2cWKIQbY+VPQYLl1Nn5tC4LofSgiH5NYBpzMJcALDXFQ7SofRS4HbCtLyZReH9c92vr0Ef/Nt444ST5Mjg6RIJ7AzQd51miNlDExp6g5fcdS2MNQNElQmKNDTvFzp7lo77zKBCClzHWT0yz2q+lCC9S/jqCspQ0luVVdz2ClegiOmIuKAh0uureifh6MU0QW/OOmeYSw1zHg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(9686003)(82960400001)(6506007)(71200400001)(7696005)(33656002)(498600001)(66476007)(38100700002)(55016003)(66556008)(66446008)(64756008)(5660300002)(76116006)(91956017)(86362001)(8676002)(4326008)(122000001)(38070700005)(52536014)(2940100002)(83380400001)(186003)(26005)(2906002)(8936002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?x1WQeTSrc98QKsJ8c0+eHuXTZClK4uOB95JcRh38IHTWn5Mh27pAE04JEc?=
 =?iso-8859-1?Q?hSmb8/P2NtbjNc+AFqeTVeWFsCi80gpc/9oPByjB1/6rIVtSopWnekEojX?=
 =?iso-8859-1?Q?KxdyixQB/PQQzr5pUhUmx73qAOf0qaT7z0yEp1CkzNvTvsZa4GFNy7VE1s?=
 =?iso-8859-1?Q?4LDo9/ZNwn01ByWpcWHBBi7f9RBdPu/JPxae4PFOSsXlemrlVOAwgN5JXg?=
 =?iso-8859-1?Q?Py5v2mjTGkSxqsMz5naWO+SHO3q199+ZaazN4LZmO1jyDgDO3Ck52vltSh?=
 =?iso-8859-1?Q?52lUEI0Qq+cTWL/H8ddG385V2jO9CmG2LRi27I1mjstqigCNMb6fhoIYa2?=
 =?iso-8859-1?Q?sp+nN/UqQZeZj1GsQ9Shp6Ip8UGENWudmchCiIY9dY3qF35l0TBZvBTecD?=
 =?iso-8859-1?Q?wF14aHPFQnouHLvHH+4QO6KZQ8Lho/Zd6jkqlMbVb2B/15Wvzgk/WGzMQq?=
 =?iso-8859-1?Q?F7lYuJFAFWm76v8XxWbhM3zS4OpkpujklGflLCYg4TPUD2ug5o5NsHM1X+?=
 =?iso-8859-1?Q?UEWBQLl7kXzMrzBORDvL8d8+J3mhDdx0EiAvGaJWXhKc4dImwAgGDnScwC?=
 =?iso-8859-1?Q?fZZVYfkNkzLU2BAeeOj4CgZfVVFLKrewDEvOTpUnKuYFk+1v/XISSG7j+e?=
 =?iso-8859-1?Q?oHQu0t4+pFgAXkneJ2H1It7yJ3hgLL8hetZkzDGD83ISHFWipE6kZcB7A1?=
 =?iso-8859-1?Q?XMP8Bmg2IPfAd9mLMXpeU28OQ72vaC5DrvrdHbxJ5/Ul41lNwEDluDKDji?=
 =?iso-8859-1?Q?WWE47CCE7QI2WccS2LZizYp/leuV1Rz9jmJIxNtNTW2My+URsEqHqHvo8M?=
 =?iso-8859-1?Q?N/hEoas4PNNAMryBO1fW8wmwTf6xk/ZJ6EGaypumxLs3IuupdYF42FX7DD?=
 =?iso-8859-1?Q?9Fh5J6p6gbNtmnnL6eH1woqX28PQintTUuVu2D/+x1dmKPJDtfug9crlMS?=
 =?iso-8859-1?Q?cb50aviGcqqR5nkxQNoDmtqxUpE7zAc9kSdQm5PfqNtFq8RgUK8wv25es7?=
 =?iso-8859-1?Q?5CJLua5pfZATTpO17DLpV67/UIYYYkTn4aTBGQrLOTVu5rPQSmAL6iQwVl?=
 =?iso-8859-1?Q?eR151clC7XN1HZEEBKJ7spbR02WXz3hqJ+sj0pf5k2TP6p4utlth64gFoR?=
 =?iso-8859-1?Q?c0VofnOkeXoqUvVgyZi5u26DZ/LJs/PZf4JTLS9CXqdGAoiCyDtWCFlGnC?=
 =?iso-8859-1?Q?gwXwoyQYGR1CWoMB0BU7ccd8RhXcuOB9W5t5sGM9AF/dsg8zbkq8q5H6Mu?=
 =?iso-8859-1?Q?r+Mm9PxAyqsrBOtT2ksGdhK7Xn19zqYRTyI4dH7pumWd3FZZHzX9AQxYG8?=
 =?iso-8859-1?Q?Q0IPuu1TzXurrV40Ii2A8HACtnXMQSEQnNV0icTWZI+bw6YgW+t0sIW/TU?=
 =?iso-8859-1?Q?0u/iFNW4klc5rkm0C1Qrp18DjOP+gRgiU2Ztf2fUsy/tdufMmCsHwNU9qP?=
 =?iso-8859-1?Q?BDCrAMfg049uhrmeeTT0/I6NGuIYuHgsSTc0gSOT5ltXrtD42PiqgLUDPs?=
 =?iso-8859-1?Q?xKs0C/oGxYg6ykKCLzUGSxBbw8Xs2JdCAmLHzDQYCeJpGqNcmPztpWY9bm?=
 =?iso-8859-1?Q?BCWiGVW4bkEiQkF683fWKehn1zI+d9F5HdO73nJSZQB8Iyd9qP4sm1/bko?=
 =?iso-8859-1?Q?G3V5oDVSBBfmqJhGMJFnqMi6M8KtsX1x3KS/2PpE+c4MIQYDpA10QJnw?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5156235c-3055-4db5-b09b-08da02e97bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 22:58:25.3016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b6sxouqlstOr6zPzFUkZXpP/gdvu9XsgnpW8y4EIgrMKAlCTIyBeZ2IijhSwoYUmRlO79G5xQGbl/GRHFIXqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6140

Greetings, =0A=
=0A=
I'm working on a driver intended to be sent to staging soon and I've encoun=
tered two issue I'd like to get help with.=0A=
the driver's hierarchy is one module file shared by other two modules.=0A=
when I try to select both all three drivers as modules, I the following the=
se two errors:=0A=
~/workspace/linux-staging.git$ make modules -j 9=0A=
scripts/kconfig/conf =A0--syncconfig Kconfig=0A=
=A0 DESCEND =A0objtool=0A=
=A0 CALL =A0 =A0scripts/atomic/check-atomics.sh=0A=
=A0 CALL =A0 =A0scripts/checksyscalls.sh=0A=
=A0 CHK =A0 =A0 include/generated/compile.h=0A=
=A0 CHK =A0 =A0 kernel/kheaders_data.tar.xz=0A=
=A0 GEN =A0 =A0 kernel/kheaders_data.tar.xz=0A=
=A0 CC [M] =A0kernel/kheaders.o=0A=
=A0 MODPOST Module.symvers=0A=
WARNING: modpost: missing MODULE_LICENSE() in drivers/staging/vsmp-guest-dr=
iver/common/vsmp_version.o=0A=
ERROR: modpost: "vsmp_release_op" [drivers/staging/vsmp-guest-driver/common=
/vsmp_version.ko] undefined!=0A=
ERROR: modpost: "vsmp_deregister_sysfs_group" [drivers/staging/vsmp-guest-d=
river/common/vsmp_version.ko] undefined!=0A=
ERROR: modpost: "vsmp_register_sysfs_group" [drivers/staging/vsmp-guest-dri=
ver/common/vsmp_version.ko] undefined!=0A=
ERROR: modpost: "vsmp_init_op" [drivers/staging/vsmp-guest-driver/common/vs=
mp_version.ko] undefined!=0A=
ERROR: modpost: "vsmp_read_buff_from_bar" [drivers/staging/vsmp-guest-drive=
r/common/vsmp_version.ko] undefined!=0A=
ERROR: modpost: "vsmp_generic_buff_read" [drivers/staging/vsmp-guest-driver=
/common/vsmp_version.ko] undefined!=0A=
ERROR: modpost: "vsmp_read_reg_from_cfg" [drivers/staging/vsmp-guest-driver=
/common/vsmp_version.ko] undefined!=0A=
ERROR: modpost: "sysfs_deregister_version_cb" [drivers/staging/vsmp-guest-d=
river/common/vsmp_common.ko] undefined!=0A=
ERROR: modpost: "sysfs_register_version_cb" [drivers/staging/vsmp-guest-dri=
ver/common/vsmp_common.ko] undefined!=0A=
make[1]: *** [scripts/Makefile.modpost:111: Module.symvers] Error 1=0A=
make[1]: *** Deleting file 'Module.symvers'=0A=
make: *** [Makefile:1370: modules] Error 2=0A=
=0A=
vsmp_version.o is one file out of two in one module named common, the other=
 one is the main entry point for the module, is it logical I need to define=
 MODULE_LICENSE in both files?=0A=
prior to the common module, the api module should be build but it isn't for=
 some reason, the makefile looks like this:=0A=
# SPDX-License-Identifier: GPL-2.0=0A=
=0A=
ccflags-y +=3D -I $(srctree)/drivers/staging/vsmp-guest-driver/include=0A=
=0A=
obj-$(CONFIG_VSMP_GUEST_DRIVER) :=3D api/vsmp_api.o=0A=
obj-$(CONFIG_VSMP_GUEST_DRIVER_COMMON) :=3D common/vsmp_common.o=0A=
obj-$(CONFIG_VSMP_GUEST_DRIVER_COMMON) +=3D common/vsmp_version.o=0A=
obj-$(CONFIG_VSMP_GUEST_DRIVER_LOG) :=3D vsmp_logs_handler.o=0A=
=0A=
any ideas what I did wrong with the configuration?=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
