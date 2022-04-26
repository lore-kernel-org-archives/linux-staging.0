Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B387B
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 11:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg2LEcD2jbHRNzR7UJ7VEDhKQE8Q3Qje6YrqlBn1oYTamv0HEo/7fLFet2yggykcI1mI+ttGvcSk/RzuKDkDJBc3fp7tETzEINGt92eih4EUibDzhOScTK9L1Ok0X5DZ4yAjiIz4ozaUMAndwRmc2T8UvLOtD/MfJpOjnJzawC3d7I0tNStvT+UEW5X0DnwpiCDp7Y5Xg4f+1ji0f5DAhb299+w8wcVPUIs+cVTezikHfuuRf3pELfTi/eI9VqY6bAVOCIQEX3z9tQpcLqh+Ije5zi/tvjZi1kqgJsFni8+e7JMdxD0SaRSBlUmhiUr45/VY82DwvAud6bFcJAonmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxAYMWi4uno+ueSy3hksmfG2aAVWB9BN08/TYay2jO8=;
 b=dStUk/vFaEiseoevujxtjd7YvXyqzRbIEA5eiesWApdWH+e3Z3oteyo24jWEhayquG4hBAXd/blalLRwMdIvDyonfkmhKQbANZC1MTtPtuOO/noJx5X/TcNJbOxnakacfSpXs5a1Ue5ACJpr9VNOrBiYRs1Gnj94fP40BV7wLP0HK+haoL/jXZw0UL10sdWgxnBr+xiPjeJ9KKm5E2xluJCe2qqWZ3G1Vz7fSSHoVyBS72X5a2hUgNX50aBdnCenerU6nkbXo3udb2hXi9v/tz65CwMIcoHJ8eQVoHKU/gbjcpnuH7Wl1xT7AdoK1PATwYCnWxEkQ9AxposBr3BfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxAYMWi4uno+ueSy3hksmfG2aAVWB9BN08/TYay2jO8=;
 b=c4H0eJrv3mpD3y5EmGn1lSbXHoGqo5kKVu3nEh4x7WcDHlgptct6trFvvjor8/KKMR/KqxSZyG9LeX1VCT+h5c08yP1aVLm8WaaWogcrCA/FgMyTbNqkrLbaNSssuXYS0pXH0ixpRW01ZvgaNLZH59wQ/AYPgM3llTBe/u2DiBvfozv4b7SPR7hYfwJWa8GJPUe+mrEjwHx1bZrKL4rY2RswKr5G3sd+yk1iZRsNgdnouVu1ds1zpGzLlJo5srPZauHRO43+xLAKqxjCLr7yoASD45aqD0CM2vloJPQ7ipozX7Yalrs1mHzgEpQobyXXaY1Uy2L6c/Li9vdAJGQikQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB7PR02MB5226.eurprd02.prod.outlook.com (2603:10a6:10:32::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 11:58:19 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 11:58:19 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Thread-Topic: [RFC V2] drivers/virt/vSMP: new driver
Thread-Index: AQHYV8TvbsysO1IV902JKnQurGWPjKz/EjAAgAMGedc=
Date: Tue, 26 Apr 2022 11:58:19 +0000
Message-ID:
 <PAXPR02MB7310B471C4AFAE6FCC2D26DF81FB9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YmVTTvQBSd5nzN3k@kroah.com>
In-Reply-To: <YmVTTvQBSd5nzN3k@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 53afce8e-3263-9803-4ba8-31ac2dd8f56c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81d7540c-61c0-4876-18c7-08da277c0e47
x-ms-traffictypediagnostic: DB7PR02MB5226:EE_
x-microsoft-antispam-prvs:
 <DB7PR02MB5226813113EEF8F836C0B7FD81FB9@DB7PR02MB5226.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LCtSsNtf5DhpJsv8asxQKCUDsqsWE9tgCk9ANbf9vI0qBYhC0nbjtcfA+QiS6t3PQBRhmbIgI46MjbNOFe7vsw2JI7K64OEfuMTFgnkZU6JREqZEnRztNO9/QOtYciktnzpx+FddoxPAO445fcpuU2nChzyIC/oI0P5mvO6kF3NrkTob/wqC4tHFb7lSrNmNFr2UZl56AMpnmpc0uRESmTbxUWBh2B0VonEFyltBP31KF8A2m3N39NdrjzIqV2KNTsat3WmOrhHVSKree9t8iPtv8i7g5IGyppIizj5m4aBVYsT15OjOvDE0+Pg9WMTgQBkvcgCSDSBNkNvQK0RIHM6uyChQCcsYHvzj6a2mxkQKM6MtHEIjsWRAw2OXeOvyMePNmDkJlEJ3R+0dRZstdNCJV+LYTfHlfx0ZLjXjDOjmmLqd5ONGEGZjIK3k1t+CxIvFCTCaOBCZpXECtz16UVCFcHd6CAH5ZaaQjemlhbBp1LUL8bVHjg7gJAdCaJMeuPWb6Kezs1ozFwhBm+saVBiEFQedVfYtmeD5gmDJlB5muhyZNlTsjBdR5F7U+6yQ8jPHgKqbmFmNvxZSRBydYoB0GksJ3xAfTKk9LBu0FP59ldUC10Kv4vXZpSU6PqlaH2rcmUTXf7EHaJWcEmm2m54n7NIbvVZjDx1CIf/KFLBbvr4QXdLXeM3QokEFMyQPq1vAcW3Ahr/QANDVAWozdQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66946007)(5660300002)(8936002)(82960400001)(122000001)(55016003)(26005)(66556008)(316002)(91956017)(4744005)(2906002)(86362001)(38070700005)(54906003)(6916009)(52536014)(38100700002)(508600001)(7696005)(71200400001)(4326008)(9686003)(66446008)(8676002)(64756008)(66476007)(186003)(6506007)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oX6zrMx1+b/FIJsCiMWHtOf6ETXYr7ig5P+auUHPmHIvFkaainZiMwahiy?=
 =?iso-8859-1?Q?SEWvjf21es2FMnx02GSGilJj5rHrE7NRZv18sf246+qWvIEbceQ4P2Cnp5?=
 =?iso-8859-1?Q?c5qns/EUkr5G81o2cG+XFAll1GfEi6y7o3526ZoQ+VH3L4a5zWyUEUorE8?=
 =?iso-8859-1?Q?H2ronPLRCQT+WnnZMtZ5j1nBGR1cIGunHJAzipptCDAaiMsRR/mEtQsU4k?=
 =?iso-8859-1?Q?0oyy6y5RrHH/Q4lnyPpiixPnD5j7WCbnFpmo1IZgWsT+VhI+rJlYktR3xz?=
 =?iso-8859-1?Q?mDG9vWD+xBkDE8sjvEOoAR5Z5y7E0SQhzJNNtedC9ouDUZ0OT+TgFxYA58?=
 =?iso-8859-1?Q?Q0Z652M6xm1b543/XooFafcUY7FhjVTrPm3mIm9BFrMmKkmoyRZAAJJaDk?=
 =?iso-8859-1?Q?28P2Rhd94otRhlw9GJtKx97vOkeEN9LNnmhOhkCpJo6gw7C/ICi0uY8+Aq?=
 =?iso-8859-1?Q?xou8PxyAYKUTV7zXnc5VTIsv4zekL5oRJoA7G7O9e2AfCUFBOq/uO/mXYu?=
 =?iso-8859-1?Q?DMRkNknp79jZGFKGaD8YoXoh8/CIYn9b8mSex8E/I6HSilletAkJwmNhEN?=
 =?iso-8859-1?Q?OBIxMK/VTePsURjT4jrvrbSr63S1YqBFaZVyawwzdSMFvBZmajygGfEk6l?=
 =?iso-8859-1?Q?meywYZN81yevZyh4ckFKYVv3IxI/E5nBPQJaxsLTungwcah9LUytWDHGkT?=
 =?iso-8859-1?Q?yhQUY7MlY8uDB1Nqj9jUMl7RyXx10bbDyH38o75Sz98XIgTJRI0nqtNU0S?=
 =?iso-8859-1?Q?smb+M20QbR1gSzwrY7/IqI/sdkvTbvIsFogQcbDLzoPqG9a/hjXhKhkPv/?=
 =?iso-8859-1?Q?s92PxKTCSt238J6o67LOsMABB+KFhV3SJcSNxLUZ1WuIaCla71Hmt2hDNw?=
 =?iso-8859-1?Q?9nPH91VDh8oKcqxFt9mW2FMk+9Rn3nTQawVpuVzpEd+3EjO4eHlepGYtRo?=
 =?iso-8859-1?Q?bEto+KYHfgzGODQswcdblIpvnlz+E8lJHzSBPkFafCpbhB8B0uKrvm8kFz?=
 =?iso-8859-1?Q?2mIJ8YB5lS7UUXa9kd7x4IC44Oygz0UlFrGZvOwItwYc0gBnaCkQopLz3i?=
 =?iso-8859-1?Q?XQfSBtCepSXhThPAYq7LF1xKl3PgcKlTvEtSKI8uFqK0nj0+WH7RUSu71R?=
 =?iso-8859-1?Q?tVG88Uh5QA0chRQia7gfhcuql7vbJ3AkPpFcnCNejwWvwdOpfA9Zqu1Izf?=
 =?iso-8859-1?Q?byjqCw53Bvoae4o4cd4Kp+Px2iSmg7lvyJSadC095y9M2XUdnxNzYwrK20?=
 =?iso-8859-1?Q?21nTo8W7UbMQTfguAeniH7r6fPsABZyUdtIcHHSpLhfvMGneZiRJtZIVER?=
 =?iso-8859-1?Q?7Yn5wY/yQcgSdJQbNCQTeKZQqmTo/aRxu7OGcE9OmZHheiNbYV7fxFTPkH?=
 =?iso-8859-1?Q?eldB0qGrux0s6QCwQjTQ13Ohu1It5qHc+5LP26t7+022CA2+LcMGmWbhvx?=
 =?iso-8859-1?Q?3sV4y64mAuSjCuIpGJXU9TfS/5nM8t+OvNIxySzDF8yOr8fsi4qr4SNI3d?=
 =?iso-8859-1?Q?7jPKK46KPVfzXXrhaewiWrxHBvTBBNIZ/s+niKytwGQn0RC/D/F8Vc9CLv?=
 =?iso-8859-1?Q?1Z1L4fYZK0sx0PVItIo/Te0db1C15LepZVAcgWjxaE7KjMt915xmcoI2Lg?=
 =?iso-8859-1?Q?OPZVe9RnB8r/dLDtTDvb9hlQByKHAYXBygk8ARBHhcyQpo8QGg1JF44TPB?=
 =?iso-8859-1?Q?DgmXhbTqASyi9nHbnS3VOz1khXYfpH5hVGzQZ3QuqHf3h1cbNCRVVyi+jn?=
 =?iso-8859-1?Q?U2V/8SiDCuWcXdQsgEO38nZNlSLGUhItvKrObm6xg8C18Tv1UmRUlR+ol3?=
 =?iso-8859-1?Q?Lyxa6YQLwg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d7540c-61c0-4876-18c7-08da277c0e47
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 11:58:19.5002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wFnaG+gL1XcFUTlA6DSs1GFdsB+MQgS2ssKbngYkJAZCWxjhxboo58Jumjq6j93iHbCPK//dnpWE8SyukKAtXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5226

>From: Greg KH <gregkh@linuxfoundation.org>=0A=
>Sent: Sunday, April 24, 2022 16:40=0A=
>To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSM=
P Linux Maintainer <linux.vsmp@sap.com>=0A=
>Subject: Re: [RFC V2] drivers/virt/vSMP: new driver =0A=
> =0A=
>On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:=0A=
[snip]=0A=
=0A=
>> +static struct kobject *vsmp_sysfs_kobj;=0A=
>> +static struct pci_dev *vsmp_dev_obj;=0A=
>=0A=
>static variables are not global :)=0A=
>=0A=
>And you should not need this, again, use the proper PCI api insted.=0A=
>=0A=
[snip]=0A=
=0A=
>=0A=
>Do not use global data for anything, that's a huge hint that your driver=
=0A=
>is incorrectly written.=0A=
>=0A=
[snip]=0A=
=0A=
>=0A=
>greg k-h=0A=
=0A=
I understand the logic behind that, however, I'm not sure I understand what=
 PCI api I can use to replace such vars?=0A=
for example for the pci_dev struct of the device or the sysfs object which =
is used for the other modules=0A=
is there a doc on this I can be pointed to?=0A=
as for saving the iomapping, I assume that I should map the bar regions rat=
her than having it mapped all the time, am I right?=0A=
=0A=
Eial=
