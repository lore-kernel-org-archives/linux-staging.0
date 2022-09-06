Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829A4431
	for <linux-staging@lists.linux.dev>; Tue,  6 Sep 2022 12:28:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWiXI93HR0jWti0+LNkKyhA8bXA7wuRHum0aZIT2OWk1z/E/BeXiNgmORPVHiuBQBUDq0TCxlTXY4fv8YcsSKIUP9Tcn2388uI0mj4e4YQ4CyRxn3vQ+04Qiwf9kNdDbq/vWahIMEAdKLlLQ3ntRn8xOYYxaPEiHXGoSz0H7rJz/05Fv+DexBvLe1lel28j0PtDAs8COzYoeyCz5bEMkh3UqUPvv8ZoG77VA225DWMm1hUkkhIu7+hQcBY5vz+XGpUpD6YvqPfBEgUY3KFFmNPg0L1zjbb0+Do+vrvrVzJXE1OhFVa+wkjdxBkbVjWuxjLEwmLO1qd+A04/Fbl6wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mtp7ofo5AB80TN8E6HytfXagjOip1Ahth6vHxTYxng=;
 b=XUfPSPa1OXnwfgxayrQSbgBvQ4O+ViABMlfaUQM7IjVNZgNFkRBOs4L2EVrbZtQFf3EeLqgqBO+1yJFwvuMp2jRNl4VM98ehLxj9UqJ0hA8aOHB8ZB4gwB4lajja1SWs59x8YN5r/54MqwX/0yUtvcQjLa8zkHassYHEW2rga1hT8GcHcSpEBu78dvII0CEavpBmgVBsimOMDAAssGdoQeI4y5Tej1UBunJ63dQjp07vGwCVB+jveQb2HV9ID9d+oWA6iRKHZPnlWkOOJDRWeqMFkLe9JP6Y3u5Cytcd7sk+5C2F3WB8j1OUYZV66QaniVgRnaz99Isvmrv1cmhuSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mtp7ofo5AB80TN8E6HytfXagjOip1Ahth6vHxTYxng=;
 b=QNeVE6GCpUAFKjgGMXIqulMsG6xQorOJ9WW2c4eNT2wFCtAW4aL3CSUpi0ByLt8tF4YsWtVaXRmregQweTFb3D2XcBsaRTEIK4nNrq3u7RxAKY9LmxHAqQcNWGDZwI3WH0uSsyq6PHOsCQKzGNVGjU3Xlk3p6GANWO0GJcnQwIvL9jK6qvKfvS1B3LdJj5+vluGsveogbpJ+BILN8UlOoo+LGzMqbs/nmB1SMmYWvpA//2COhPLbSDkmPVmOT/y7qAT+9oxe3CZx4kky/AVTjaEMlth/ONEm/PHEr6OQUcy+5Lx9zu2aVbrVZGa30s9FQcVSThg7f/gr4o2gUxTqqQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by GV1PR02MB8539.eurprd02.prod.outlook.com (2603:10a6:150:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 12:28:43 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 12:28:43 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>, SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index:
 AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZSAABLdAIAAAL6qgABNnYCAAAH0kYAABi2AgAAD6Y+AAC7bgIAACcP3gAAEIgCAAQJwi4AATt4AgAAFGZc=
Date: Tue, 6 Sep 2022 12:28:43 +0000
Message-ID:
 <PAXPR02MB73102937D8E0A9614F20269D817E9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References: <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYR5SyPB6G5vDXH@kroah.com>
 <PAXPR02MB7310AAA80455E4B3A97C3A1F817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxYdjBiOSWhqI/M8@kroah.com>
 <PAXPR02MB731082B5F72C5E2D9D35A4D6817E9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <Yxc4gLCBtvM9fQ2M@kroah.com>
In-Reply-To: <Yxc4gLCBtvM9fQ2M@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9bc9b11-846c-4f91-cb35-08da9003565f
x-ms-traffictypediagnostic: GV1PR02MB8539:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KMiuXz9nHWqlazl2XFbcybF0le6lysQFPrWffcUIPeE2O9L3h7d58iGvrmv68eTr+K5qeBWwX9vPaFG8iC6E7os9YXDL4KiiD9NV1ixGf0RDLS+0JLR+FSnCH6ytbFktxRz981fMjGzMOB0bB1vaIllXH3BIbn9GL+4+dYb9b/puQ7fc0pZnXqbypCtP0+NLP1Q4wbQaJmyy3XJ2reCyGy8wTLLY+xfqVv81K5cnNXuSzOH/+Gbbkt+ZA1JBHi7xpf+RUoNSNsz+yg1E+O44pGhOhzMeWKkYBtR4jUYQPAN23TI4wPjxOfBHo+NiP28igCXlujbqBuPTb7SX31x976OIfNWEP6tDFkK7qxhvDm3QrZfDxkEiUtDBXdrGHtriRMvpaoaavLZyT7XG9EB8lcpqSMI1P746LFXuDrUhWi/r2pPeB56wKwLrsSVVVETRvhS9dtVcz2Km6erMKlgs+RMKGWXeJoiHpSktwiMLeTevwx0xWd8bH8gRdoIf+S1xILbMchLjrNZtDRJk7ISSNK0Ap4zikyoxKXuwricqAhLtWTQJCf3X7El2K48RWNXGIOMrn/QvyfAZicMOMR9KYi/qikZq1GUJUkQdCgOA7TlkL5SH7jXZT2iuEC/XkmQjn9PJUx6mKKfO81rTXn7XnZd69yW3faogk6m7IQAIwdBb8K+J4E/B39MAlZqjy4mmAavl2Q15qbJQYEvlvTFFxnGfKDVa7G5Ttt4rlrI69jbx4jH+Dulv1rQ7lGa9lHgRbQpzhwht0JhQmHU9lr7b2Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(2906002)(82960400001)(38070700005)(66446008)(8676002)(54906003)(4326008)(66556008)(38100700002)(66946007)(122000001)(66476007)(91956017)(76116006)(55016003)(6916009)(316002)(64756008)(7696005)(5660300002)(26005)(8936002)(6506007)(52536014)(186003)(71200400001)(9686003)(478600001)(41300700001)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?k/wPMzang0h4moGSkfRjEIHutp449ojkZwagdLG7wNhEa8Nk6y3BI23Mei?=
 =?iso-8859-1?Q?Gqkuw9QxF1RMubyVv568sqlFtjZ027pykjc8j2+gZN4zsvBJOw50J5+kDu?=
 =?iso-8859-1?Q?bk00ZHqFlCSa5RjFxgsIUOZLUvafBZZ1V1bfGIxJaSYfTRXmeS3840F1I9?=
 =?iso-8859-1?Q?IxVEK3EPDOasnEMS00FBK+nf3ymI0zpaA35R8stVy9hlgOIkzqevwfWZcs?=
 =?iso-8859-1?Q?zhhsuRE1h7+ddnt2NytQ/04wGABT3arwCF4rptOYqxFRmkRK4D+86XMJ9g?=
 =?iso-8859-1?Q?If/eWnsE9e1MI3TrkQVFQlEFQoFX9m8MV15b/M8w9KzYoyOyhirNKhdQ7j?=
 =?iso-8859-1?Q?EmvRj6c46C+KoS6gjouydGSlNGGh7byiq+JJGeW3RGVKQPUJ5/ZNicDvQC?=
 =?iso-8859-1?Q?QEWdEarF7JuFMvKzL4Rl/IVMKqsMjFOkZO5keKqi8D/PrR+MLNUelcpEFL?=
 =?iso-8859-1?Q?r2Pw3WlNPGtsSR/BuZn7fnJTli+61pJGd/W2yMeQRqayqx8qTNQnRODoCA?=
 =?iso-8859-1?Q?B3oPMcLpRtuLWCfjHKhDdZlpEg1tHS0LN4GbC8835sgI0oN12eJolQvGd/?=
 =?iso-8859-1?Q?jgWCDmKIW7HfFaEXBimPsojeLnxTuQKxSoURut3UpX5PKuTUOxN+DicSyK?=
 =?iso-8859-1?Q?jzr3HOkBVsOz7fYJ2iYwTYw+iSpwHNvg8vN0i3BvEdkmfojHfz0Tw1MJ/H?=
 =?iso-8859-1?Q?Qc87OFJjTX2VKrJ4Mo/y9VAVKJYdjsNMpUKL6mc3A5IE5q2ZdJgtjIECJF?=
 =?iso-8859-1?Q?kExLAuvk25RQhsqjdGdEZjUtltVPIUCkaKIJIBj3Ikm1mg3eAuPs7KW6yd?=
 =?iso-8859-1?Q?Q76kqRxXC9g2MputhbN8/hJUHsmjIX+Djr14GpCjpiRzcAc4P9iz0KXvIv?=
 =?iso-8859-1?Q?Ed5OOM+uuuq2/JdzkfF6ucW9bKWuuPNsofnULiyYrWxRhGUlfxJTE0Mi9y?=
 =?iso-8859-1?Q?tCUixYI07MzpBocRPwbMPjOjec1AIh0CaDbFPa6UHGSFegcaieZfxTG/JK?=
 =?iso-8859-1?Q?dcjhb10PhGLvqG+T5i4y/poljD47LwDz1BRwm5ao7ZHER+Sc6DMYmPXgRL?=
 =?iso-8859-1?Q?oWYxJmJlIUhTWlOHtAj1tJnkquqT9Wwodato+ugdwh5A51ua9xSfKI0sQa?=
 =?iso-8859-1?Q?WRy4AKq/o2Xwb0zgjF3Nli4HH+T0n7LAlPnMIfuoxemAgdRMRiirebr67p?=
 =?iso-8859-1?Q?VG4R4xVzST7RYu/0D6GkkcblVpyBEK9BO4ZMUOFrBnKCDra3BfS4epdoFc?=
 =?iso-8859-1?Q?8iUlprJDR9vtuMeQfwc0xW7bQslXEa/hyLQRz0NqNGd44Jo8Fpj/PuW9L0?=
 =?iso-8859-1?Q?eQujc34r7HRPeGYayhje9y/hgb4VvTMJ5hk3g4MgFdhmbTHpuHxWpDciQn?=
 =?iso-8859-1?Q?vgrILgD+JSJafY+WSCDj/d74AEwXVRy5EfS+9lCxRxSucs+ILjzeznDwO/?=
 =?iso-8859-1?Q?Nc+3PZnRr9zw70JYnoy0hjtHrsFL6Uvw8zThoVEUl5heYGsHa0H6Gk0GhH?=
 =?iso-8859-1?Q?bKXLhi+pigDlTS0tazO7y/WqQ1SywUrkRcI5pjJImRxFR8/T2C9zqE6VYm?=
 =?iso-8859-1?Q?N4jHPyIAWS5ri1wSM5nVmayEGU+1jgxDw8cj+MHD1qCWupX0+wzQNwwEU9?=
 =?iso-8859-1?Q?OnLlTyCIBvsgzcwHQkjcP2KiM85hTmdNco?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bc9b11-846c-4f91-cb35-08da9003565f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 12:28:43.4297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTnne2qFXDyKRBAMB48UrtrBgGN49zZ9CFnYbvLDUU6hTyQm3lfetgs+qhDC7CFHiIWkNOgFk+08AJAcTIKW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8539

>On Tue, Sep 06, 2022 at 07:30:20AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >> so I can create entries in /sys/hypervisor/vsmp for the global inf=
o=0A=
>> >> >=0A=
>> >> >Yes.=0A=
>> >> >=0A=
>> >> >> and link /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?=0A=
>> >> >=0A=
>> >> >No symlink needed at all, they are independent things, right?=A0 Wha=
t=0A=
>> >> >would require such a symlink?=0A=
>> >> >=0A=
>> >> >thanks,=0A=
>> >> >=0A=
>> >> >greg k-h=0A=
>> >> I'd rather have all the info under one place than in multiple places =
if possible.=0A=
>> >> is seams more logical to me=0A=
>> >=0A=
>> >That's not how sysfs works, sorry.=A0 :)=0A=
>> >=0A=
>> >Hypervisors are not normal, the fact that you are using that location i=
n=0A=
>> >the first place is very very odd, only 1 other in-kernel user is using=
=0A=
>> >that.=A0 So maybe you don't even need that at all?=0A=
>> >=0A=
>> >thanks,=0A=
>> >=0A=
>> >greg k-h=0A=
>> as vSMP is an hypervisor, I've thought /sys/hypervisor is an appropriate=
 location.=0A=
>=0A=
>For generic stuff related to your hypervisor, yes.=A0 But for devices that=
=0A=
>are part of your hypervisor bus, no, they do not belong there.=0A=
>=0A=
>thanks,=0A=
>=0A=
>greg k-h=0A=
=0A=
I understand, thanks for the explanation=0A=
=0A=
Eial=
