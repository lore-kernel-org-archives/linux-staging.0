Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A31E3D82
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 12:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgJFbNFtBSay0SkhPg7zYIEbhy0WGBm3fKijWELcnCuYXOdN/iy/3YgCQXxHav9LW7SnA6XPg6v7IlaU3umm8ZkIL4+6Vy/SMyYUB1txB5L0Jsdbofk/6BC33eVOb//EMgX8A+EVOr5+IQM+tu2yoFz5/wGjUXgeH8MbMNKr8UcMMSvxETwjCiAtteByt5YHWJGiYvxVptt54zsVAXoAgTRbopXGIGLh1VC0Ea4ZyMLfK3OJJd+o7GqzvdXrFpTkeHttCAPY67StmvspIWiVdZlO6wUu/0ld1KIsp6kTNINh//kGPvp5Go685nsA/uUHqfVCHHS8fbEdpBTGXazIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx1TT86hgxJlyyOSrLZ4Sa0E3Qf69+ZvMVpN4KYxinM=;
 b=TeJMnjtw7P6JNzVxkOjmJuRcKF8CuihVMQMZawUq+ofyYOKefkhiHr4x5jd8iB/HvKn96wqBys21L5goSn105PvBFEj5ucZbLAKWYGsAGu1xSr3xjhCXljwAAlx92CJW5W3ATHojC2VtLLTIh8ZYVsPafCAY0FJwfGflmrgnlPOz/af0fEtx/w1ca4ZjOfLQfP2vUJ/qRls/XD4eOWRdOuTfsg/pjGyQkfnb5o4I0/GL3p5GjDDNtW0Mn1+6svqTvFJBfhN+ELD+cIwuYG52VGyX+7iHofYjJvTe0aQZxmJiBUhf0rOVoJ1x/8qDAJPm/Ga72nfJwu/yvvJEjfp+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx1TT86hgxJlyyOSrLZ4Sa0E3Qf69+ZvMVpN4KYxinM=;
 b=HuBNaHioH/vIkB8wWM1wWg92gzYRFfvo0k+8FnVjA15OdKiC8ld4d+atyhWxJKBUnS7Y5gwcuAwtUyEkt5yvhdOxjXZVD7qN0Bs1Tpo8ekjAQKoMx7ObwYNJZpmUuTpvGTGY8BbRMpRakdtW75Mkn3OCsnc36jSa3DixZyekmh3PVrIvhAiB9WuEiNbuHf90xdxnkxFQtvlq9jDH9y9OVREvn/Y+qi2y0dUgfKVYdJQ/QSye088fUvkCngg0pzfSUkDX50UX5lO+6syCAyKhhclWAl6yqyV+lowJmZikNnr1nbDpL6pdoBpPoOABg4s/qZpt2HOb7mhnZi8hCM1Ccg==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB4PR02MB8583.eurprd02.prod.outlook.com (2603:10a6:10:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 12:02:47 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 12:02:47 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>, SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index:
 AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZSAABLdAIAAAL6qgABNnYCAAAH0kQ==
Date: Mon, 5 Sep 2022 12:02:47 +0000
Message-ID:
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
In-Reply-To: <YxXgfRx/E26kl/N7@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0067ac57-23a5-43bd-5e18-08da8f368c48
x-ms-traffictypediagnostic: DB4PR02MB8583:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jVxSHOL+FVCIzF6KiWOv9NL9Yh/vqNxvlg+WSp6Faigzbwe6XbH4YRngaM8CbQO7J352b2kfmfRG1YU05pB6zhCSAqxQs2sIuXJYzmCJcnfEZ6lfkgQvElvqHXkH1rVBFZSLSwvVKvDyAD6+BAAlqnj6corcZ8YcSrXpPqOreumP1sM6L5GaLWdTt5ERNp87QqmATjRWKLakq2XCrBHTD+gk7SQBaKqlZaoeU7VZLN2ci7CVcEzqYl3LobkHxoqjgdRa0UoDR1FcGraMRpO//1bF11EKo8Ulg5XJguAjrSmvpB4mMfM4CRp59kZqCIXsgshqC5qFBKlkh3fVqI8bt0WicR0Pn9SjfxrSm0NAAHbHliQgOtzIF5rYzlL3ZiWrfC9dHAeFM8ZhSXdONp/TpVPkBFKuaWJ4Li/m57VJoywccSK9L+W4bUideRiTjZRnihuvVN6QraH+w0vDbTuzIwVKrP7d00ZJF5z5o4GiYH9z9Wan4yi8JMWqxrGKh4wIOLaVkm5qF85HFB53VJUyIQ4HdxZjtnPdh9hHN4r5+e/6pSQ8y+wZvRqqLhQcbg12aXSpttNvRU7tPSTcykz6iY3d6YA6syg+bE9gb2y0Rp8aV4sWYmFw5Rnsnws2DFlWGxrjFi0dXfWWXI7CEqx+hiIUDCFevULpv5hsAvYMy6TLtxaW41pbTp8ld3LO0pzWdL1ANAzUchoccxqMy+ZLNBNJz+XL8YlyXrN8HxPpnS7IhKFCTi0SRMNagKPkE8zYYv4HNPk5Qe1OzMJXodSYcA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(2906002)(26005)(9686003)(7696005)(122000001)(41300700001)(186003)(478600001)(6506007)(38100700002)(5660300002)(52536014)(8936002)(33656002)(86362001)(76116006)(38070700005)(8676002)(64756008)(71200400001)(66556008)(66946007)(83380400001)(91956017)(82960400001)(316002)(4326008)(66476007)(6916009)(55016003)(66446008)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AZG62g+VUSFlY5KSqa5RcH2/dDZKgyvmFZm1CU/uGh5KtcB+4AGH2ZkASt?=
 =?iso-8859-1?Q?gNAophsduTwPU/KKgLDHjmYlf3QFm+hYuZ2hAKSPWFAVUt6Ucbt9mshflD?=
 =?iso-8859-1?Q?A8o/BhzNSBsFgumNtfpJQSWx0okwznjJrREplU5qdb0ED0nyyRQuK1+SAW?=
 =?iso-8859-1?Q?yZkDecmVEjQ5y3Vo6LfDAPFw1VTXt9eGEZJZKoLOn4u2Obgw2MmGgMH0Mr?=
 =?iso-8859-1?Q?8uYFlKH2gUfXtjsQ+LMsXjg20GoISwANd0gTtZI/ge/7RMizfYhzvQ1+Ni?=
 =?iso-8859-1?Q?n1NrOSLeIhMiUbr/c9eJDG+MyRUHLdSg6AWQ7cvoRCWJouxZMpMjNwg16s?=
 =?iso-8859-1?Q?BFLyooL79fQ7UzDZrR816NAlErY78aOk6pXyBmciQFAyb4muJ/l4Ar4EV3?=
 =?iso-8859-1?Q?ec/ifvHKs5MOIPDuqx1MwNDLeESFhss362+RlpXPv0fa2DMg5jAOvIIINH?=
 =?iso-8859-1?Q?lIYU8eFd2wopUwpYZbNiJWg41dWYAdF4KLDZUTSJNXUibpIfEFLyRubGm3?=
 =?iso-8859-1?Q?PzEtf2Uxm8+dObxsH7Z7lBD4k+QkZM8KySKE8FNIE4nIGdfdFeQ+PeBpT/?=
 =?iso-8859-1?Q?eo8ARTKPDCboyUxoqEs9MjvvNzXifuDNWcI7PFqwvdzacctXydW1B7rZZI?=
 =?iso-8859-1?Q?AiCniyPgd/WDtemdaq9OFfXUt0V78qD/dScja8xz7waLZaLZKT/l7rvr3l?=
 =?iso-8859-1?Q?Y757FAWoEPRlly/8Z+sGZtJUg2L16LcRic2qqi89g8uYFG5OvJBFWrmYyf?=
 =?iso-8859-1?Q?dPXIXhOHg1SWp2F6SRu5HTI0xJWjcks2GJkdFUTcTM/NtHZtdrigYAG9Y1?=
 =?iso-8859-1?Q?5BMh9ZoP8o1gh3qfGkIK9iOaBDuXiE/gW4+klLRax1IC5bAfB5KxWyLequ?=
 =?iso-8859-1?Q?ji5WDsD9cKh5e0LqPCfDe3xUAQAjEC+zRxpVjGU0ZzrEUoJ2QQHZuCu9rq?=
 =?iso-8859-1?Q?CcegT/nYUogplS+wyr1XzCAJA7/7GxMd/yAMDyPxIpaRiEkGE5UKg6r5ZH?=
 =?iso-8859-1?Q?6NUHF/vLNsT0/1I8rNTNZlXFO68ruw5ICKARLHP0bijyPsKJH18BtvmI+N?=
 =?iso-8859-1?Q?cQtyKXUFq8yHURs9mnxk6chaDR+aa/IYiCI12an7182kCmUhpONV0fEP0A?=
 =?iso-8859-1?Q?weVbtA4OHjC9D7FUUDmskzf6KnPA5HkKcZHIzLHUlQRlhD50EfOe/Lr2D0?=
 =?iso-8859-1?Q?/Cy/onautXQHcZWrjm/XhD2fuOxH14luDjo5o+OwYocilQIlPGTJvGyFqx?=
 =?iso-8859-1?Q?ISTLbUr0qTs4bv4DqsKulUXiyU7BY3dFWZhnnlZXCifPOavQlgPe4XTO6g?=
 =?iso-8859-1?Q?XYpQnO0MvBiCQNv5paU3yDKOSC8duP+fEVB4osFzpDzTqHfWEXg/0fHGYd?=
 =?iso-8859-1?Q?l3DeOQvAtmDLjKGDFeO0/SqlDHeEJk3hOiyp2NL7OGduuIOOdX/SrQHxN+?=
 =?iso-8859-1?Q?mDHm2qlporYH53Q4/3vePdbU4SLHYPBNOKKEfn4Z5ZJuSQrUCV+5HQiZ6X?=
 =?iso-8859-1?Q?U+2BAwCMrhDOKm1rLXoewHamLVtCS/Ovq/zrbA5KmgHtXVN3FMP9yEZo65?=
 =?iso-8859-1?Q?LdrWKV381EXA/kah/la4VVOBr64feQjx9Kt/VYOHpGxhoKouZtDRnoYoZo?=
 =?iso-8859-1?Q?3qEwOfLHaPjjhWEj3WJFq7yGIIlccVQDgd?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0067ac57-23a5-43bd-5e18-08da8f368c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 12:02:47.0280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZwnCKiCP5ers7TvPOztsgn3YYm+JBT0ilOVFc9mOFtGprvscbdgFXXFO8drXfaE6lzyVnJwxVu3VJBA7ylW6pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8583

>On Mon, Sep 05, 2022 at 07:28:02AM +0000, Czerwacki, Eial wrote:=0A=
>> >On Mon, Sep 05, 2022 at 06:07:07AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >=A0=0A=
>> >> >On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:=0A=
>> >> >> Greetings,=0A=
>> >> >> =0A=
>> >> >> while working on a driver, I've found a bug that I'm unable to und=
erstand.=0A=
>> >> >> I assume that I'm doing something wrong. here is my reduced c file=
:=0A=
>> >> >=0A=
>> >> ><snip>=0A=
>> >> >=0A=
>> >> >I'll provide a better review after my coffee, but just one comment=
=0A=
>> >> >first.=A0 Ok, two:=0A=
>> >> >=0A=
>> >> >> #ifndef sysfs_emit=0A=
>> >> >> #define sysfs_emit sprintf=0A=
>> >> >> #endif // sysfs_emit=0A=
>> >> >=0A=
>> >> >Wait what?=A0 You mention at the end that you do nto have sysfs_emit=
 in=0A=
>> >> >your kernel tree, but all activly maintained kernels does have this=
=0A=
>> >> >function.=A0 You should NEVER be working on a kernel tree that is no=
t=0A=
>> >> >actually supported, and for new code like you are wanting to submit,=
 you=0A=
>> >> >should always work on Linus's tree, or the last release, or somethin=
g=0A=
>> >> >newer.=0A=
>> >> >=0A=
>> >> >Please move to 5.19 now, it will save you so much time later on...=
=0A=
>> >> well, I'm kinda binded to this kernel version buy you are right.=0A=
>> >=0A=
>> >What kernel version does not have sysfs_emit()?=0A=
>> SELS 15 SP2, it uses kernel 5.3.18-24.67=0A=
>=0A=
>Ick, never work on an enterprise kernel for new stuff, they are crazy=0A=
>and you will need to usually redo your whole thing for upstream in the=0A=
>end.=0A=
>=0A=
>Just work off of the latest tree please and then backport when needed.=0A=
understood, that is the main focus now=0A=
=0A=
>=0A=
>> >> >Write the Documentation/ABI/ entries first, what do they look like f=
or=0A=
>> >> >your new sysfs files?=0A=
>> >> =0A=
>> >> I thought that is my issue but wasn't sure.=0A=
>> >> what I'm looking for is this tree:=0A=
>> >> - vsmp=0A=
>> >> -- version=0A=
>> >> -- summery=0A=
>> >> --- data#1=0A=
>> >> ...=0A=
>> >> --- data#n=0A=
>> >> -- boards=0A=
>> >> --- 0=0A=
>> >> ---- data#1=0A=
>> >> ...=0A=
>> >> ---- data#k=0A=
>> >> --- 1=0A=
>> >> ...=0A=
>> >> --- l=0A=
>> >> =0A=
>> >> each board has a predefine set of attributes when I need to add anoth=
er depending on the type.=0A=
>> >> also there are shared attributes between summery folder and the board=
s. that I was able to implement based on the name of the entry=0A=
>> >=0A=
>> >So "boards" are devices, and then you need a bus to manage them.=A0 Are=
=0A=
>> >you sure you need/want all of this?=0A=
>> no, boards are not devices, they logical partitions inside the hyperviso=
r.=0A=
>=0A=
>Which can be a device, we have loads of virtual devices, it's how the=0A=
>driver model works.=0A=
>=0A=
>> each board has its own data I'd like to export.=0A=
>=0A=
>Then they should be treated as a device.=0A=
not sure I understand how they are connected, is there an example I can loo=
k at?=0A=
=0A=
>=0A=
>> >And what exactly is in the other files?=0A=
>> version is the hypervisor's version, the summery is data the user can ex=
tract=0A=
>> in order to build a complete image of the system configuration=0A=
>=0A=
>Ok, those can be simple attribute groups, if they are static and do not=0A=
>change.=0A=
that's correct, all the information in the initial stage (system or board-w=
ise) is static and per boot.=0A=
=0A=
>=0A=
>> >> that I'd like to see under /sys/hypervisor=0A=
>> >=0A=
>> >/sys/hypervisor probably isn't the place for all of that mess.=A0 You a=
re=0A=
>> >going to have devices and a bus and all sorts of other complex things.=
=0A=
>> from what I understand, when I add a sysfs tree to a device, it exists i=
n side the device's full path.=0A=
>> as the device can sit on different slots, it will have different path.=
=0A=
>> to enable simpler data extraction, I'd like place it under a constant pa=
th, like every block device=0A=
>> can be accessed via /sys/block=0A=
>=0A=
>Then you need to have a bus, or a class, as that is how you orginize=0A=
>things.=A0 Please read the driver model chapter in the Linux Device=0A=
>Drivers book as an example of the basic ideas here.=0A=
I'll look it up=0A=
=0A=
>=0A=
>> >Step back and explain exactly what you are trying to export, who will b=
e=0A=
>> >using it, and what format you want it in.=A0 This feels like a lot of=
=0A=
>> >stuff that is probably not needed except for debugging.=0A=
>> each instance of vSMP is comprised of logical partitions.=0A=
>> the instance has it's own data required to be exported.=0A=
>> each logical partition has it's own data required to be exported.=0A=
>> that is why the above tree was suggested.=0A=
>=0A=
>Great, make them devices.=0A=
I still need to understand how to make them as devices.=0A=
if I understood you correctly, your suggestion is to run modprobe vsmp and =
there will be virtual device per board?=0A=
then for each I'll create the relevant sysfs entries?=0A=
if so, where can I find the global sysfs entries?=0A=
also, how can organize the entries so they will appear under one location w=
hich is static?=0A=
I'd prefer not adding complex code to the utils which need to traverse the =
sysfs tree to collect the right data=0A=
=0A=
>=0A=
>> the data will be used by a layer that gather the information and exports=
 it to ui and to scripts that log the info=0A=
>> it isn't a debug info because there are some tools that need to know the=
 a partition's information to run properly=0A=
>=0A=
>Ok, then they all need to be "one value per file" like sysfs requires.=0A=
the current implementation does that exactly. each file represents one valu=
e either numerical or string=0A=
=0A=
Eial=
