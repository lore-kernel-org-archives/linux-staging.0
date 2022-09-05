Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9617E
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 12:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTzjVJkfntd4d6iF2RCRmYnnCuoTk+Hczfdzdldx9N/DBEWrmqLYOfFbpWEMXQnWOC0xWkkgShvyp/hTvmRsgsPzPgcrZa+eA396EsfMgYSr6JxO/ge6TWgMYCnUTSXIIYltJPW7nynqJrzPnPVhKj9xJc+hOmosa17HS7sNA3xth5AobS5en1ba+Tl9Ei8i9kkcXos3j2vnyqD/bkFCTuNU+yQ7JOWOVc7+lbNePtK5GJu53eg/AD13qb7WHXZspqUSDYhvMEW46SXf8XHasvffXowMxxDEvWCa0wiIa0Fdw8aGjE48MHZtjdZBncVw4PyCjXZH88MqZ2bnYi8imw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvusRYc/cenBj4DkFSg/IDd6k89NDIiUlFFj13UgrKU=;
 b=iWSxPmGSj5/Gf+4fm2YMDnuod5vc5JKy3XXNJd+dA2b1kQUT/T6LHbN7lL5m54Jfa2Ji3YbrrrxZcHUZOw4cibOg1oBVFivN1iInYiAo0gdjjZhoExDHy4O599glu57iVQC1bjp0qXsFkFGPD7C/Lkn38DgyJgX37sq+ZqyHRYHhpROyZYwDJvC+fJmo8mqrWoxykEzcVdHkGrZ6sPPRIQAsYeV5bHHg4GE+fBOgUsFOXEK62ylPey7BCvQHDgl539zHNSycDEhAe94oHm7q2oLtKMpKWHKmFltDTAKGxOESzOSfkjMnjywDOuegVHNawJO45MQChQfx8UusniZDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvusRYc/cenBj4DkFSg/IDd6k89NDIiUlFFj13UgrKU=;
 b=aEhlvIKGU3byr5L265Lys4+Rb8uRBNMrLQu/xG5FHqbOPWTCB1y403tXrkG0vQtWdH1w12FJ+VfYX3639Ghs/0b/sZRoo3stTseCcbIH5ovcHkvVpOUPGsgVLI0WvTMpKFEQswX+EDLqpZgGvB2fGxsAsh+z+MXmagWfP+/2WqPSc/8jbvvMt9pqmLNWOCysEPotsPL+CLNGxBIFtPPkKDHh18AA1KViMOgsUa5J00y3L7eaDjLdUtQZGc7OVAMAQB30jh3osUr9svmTC123ZGp+RRQ4vg727Rc9guvLCbfWByHnwPBlCUx4Jj6r5prlOXHcQrFoWVhejJM3E/dAUw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB9PR02MB7275.eurprd02.prod.outlook.com (2603:10a6:10:248::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 12:56:29 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 12:56:29 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>, SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index:
 AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZSAABLdAIAAAL6qgABNnYCAAAH0kYAABi2AgAAD6Y8=
Date: Mon, 5 Sep 2022 12:56:29 +0000
Message-ID:
 <PAXPR02MB7310E5970299650B7B81B399817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXgfRx/E26kl/N7@kroah.com>
 <PAXPR02MB73100F851CC17B941A5CA49D817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxXnT42bNR0got/E@kroah.com>
In-Reply-To: <YxXnT42bNR0got/E@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a6d1322-4f9c-4c23-4fbc-08da8f3e0d1c
x-ms-traffictypediagnostic: DB9PR02MB7275:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CsVcskBwSf2ldnYtdWHjsSnbKbaQwajDpEAURfIyMf8mE/4VKY0PrCwSLkhaku6QVdJmiRcWpMXQWzxUHfSGg/cyT5DM+JNhQ8cVcWjmflcaM1eO8Dru4KAZcIForFPM7hhKfHFgZefftiMBfq4sn5v58IgV+r4XHKgXeirYbImoaqPVeSDQExDcMTT762apD5RNCpDEPUR7aL1qJwGf2nJkO+x+raLQvGq2ELOvNyKOd6q7Hoou8GtnPDtWFmOEtZLw9IN0Xt/oNyEQZ3l2qYEHb57HY/2g++KvqoVE6ZlxLPvDMzJXiI6zwZYoJWs3AZNcKc48q/JRXNnKgfb1gjLlntxkrzFTwqGicx2MQ3QTWmbpPFCColAoU8zfeTts4+4vzpIpfYKK0Vgqht33v9GR8DQNINfNYWxDsc02JWkzuArIGXbX57S/IasU2C3+cVauSiQ9YX0Jrpd7n/AD9rFnHxrKPQlxt80Npivuq3QOULZpxTPXvUdb58Q/svJLyRXeAyFCENCoBpfcy20/piXC9gY6pQBf46C0noU4dAX0nZzM5/Q31eAPNG8CIwr9TXo/f3KKkM75pP/HawfvrbDzrvBm2qY3LUFlqoXVLDNtxTp0lhU6G+dwhDzeqxN8qIcl1B1MV6cg3rbrazBgl2UkZKF/EHFqElYtID98RU5pIYq59b0yI8MZ8k8Xl2vw1hggWSm2WgyoSYVeKcm0oFZIat0+38Z6rTnM6gNrzUv6WWL+EBxzyrw/Kp8sYAyffPEzFn6agCtsZPhhQbGiZQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(7696005)(6506007)(26005)(9686003)(478600001)(71200400001)(41300700001)(83380400001)(2906002)(52536014)(8936002)(5660300002)(55016003)(6916009)(54906003)(186003)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(8676002)(76116006)(33656002)(122000001)(38100700002)(86362001)(91956017)(82960400001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KlqGUE0ryZLIFPyJIC0eD8omD3I252O8Di6h+KMWGIYGriDyErN7Wk66zf?=
 =?iso-8859-1?Q?Wo7YM/PX1aL/ld1/0fc8brj/OSY7auLcXRh1lSOqafxkIi8EW4cTRmbr/Z?=
 =?iso-8859-1?Q?PdCHDqaqBF6kIJPj/kLn3ujkkkbkJ6rwSVAMgmwHkBpCqn4O3fdlXB8nwx?=
 =?iso-8859-1?Q?86rv50OgBt9mBeeJQ3yHKwvGNJzkH+CaT0FD+PyKj5DK4BGJ67748zOWk0?=
 =?iso-8859-1?Q?AxuihVM4Gq8p6B0nayOn6XYDhXwwejBTqAKcKB1L3Zi61x9bFMKOO0Xohh?=
 =?iso-8859-1?Q?cpbYslXTrIP1ExrSz0KteOgREc8eQTM0+GHjRJLqkpGDX7YuX2tt7CTAAn?=
 =?iso-8859-1?Q?pd5yVnPv5n+nl+uLAlFglW+grrVYWgJh97QNLHn+gtqLzS+mxoXSOibCWa?=
 =?iso-8859-1?Q?DjyfilcEMdhc74eweY5tVC7ykHOAYO+3pGZkk1+SBN/yBC5py3gqsqRzKV?=
 =?iso-8859-1?Q?qHXczQaJPW6rCu+JuefdrTSKrsNSFHbqPQKiXYbcHxbrt5+PFFy6+Tlksz?=
 =?iso-8859-1?Q?KowKN7hV5C68Hf77szR1MlJwzWm3hL8ryaznmE7midkb3nISrLJOMjzPOb?=
 =?iso-8859-1?Q?gmV2V7Tl46GBPpjJAFoMgH6tUs8U0P5nlgymY1nWT2FyO87ulYvkdE1E0s?=
 =?iso-8859-1?Q?WCJ0FtIbWc6QMS5a4aRVFoL3OYluRwUQl+PeFB6bY+Pg+dBGfv/ib6q6AN?=
 =?iso-8859-1?Q?lrOrAH7SlCjnP8qra40l+yTa5dVVjzB/q3zr2N84IQTt4Ct00rRWzHalCJ?=
 =?iso-8859-1?Q?xUyNUpOV2BvScCFsHJTPuhXVxMP5TlQNFxPAZFE9ONLlMeLljC7hXCo5WI?=
 =?iso-8859-1?Q?eRcIHFS7Q+VvmrQ069cLXl36xz0T+LCmI+3X5WYGCmsRqX5bZoy+nBKOPB?=
 =?iso-8859-1?Q?2EJuth3i2eZgGCkh13tjyUchFx5twywoWAP9DC0hj7j4llTeqbOts+vHSE?=
 =?iso-8859-1?Q?4s3v9QbjA4cVteU7QN/uyheD1XMrLeqjC16csuL21nqpwqQh0vVPRTzJBa?=
 =?iso-8859-1?Q?m2fcS6w6nRSP90JW2kTHbFsav7oELPj3TJ9kPK9leYYbyJdKG+YypkQVSb?=
 =?iso-8859-1?Q?Oqn6TbE1Xp5m/TNpIORXE0uEXr97Lk21yFITBbm0KVyH3NWxwEwsDlu0qk?=
 =?iso-8859-1?Q?nSpcu3Y4Fl7Xszk3p79a6ORFte7YC+mxKdD9tkVOdNZuNYEmgX3hkSMOtL?=
 =?iso-8859-1?Q?qck2EGQGsjJDeb7GxQdfZpbXU09FUdJSzveYiRThthgTkMA/GHBu3y3eTi?=
 =?iso-8859-1?Q?dM0HTrB40MMTTzHeXNVUQqq1TjQfjnxBtj5l6czod4Iu8rZe6gQeBdCiol?=
 =?iso-8859-1?Q?On9yrC2nlUg3/yndhAeVDt2AQU6zxwJx6RdXoDwX8jmIry+vJBtbt1US7j?=
 =?iso-8859-1?Q?d8jDCmu7+tRArMh/bgtOwmhWsNMNDl414OSnzTmMTdT9Y+sPmYlgy/BJDx?=
 =?iso-8859-1?Q?s6XY3W+CtQ1QlMJo/10WDBxgY8pePyRkNxEl3bDGA2amdSvupzxKNAIagI?=
 =?iso-8859-1?Q?dSDQL2psNF+hmIYzXev1e+N9/QZPU9sCnR0IsWOEtcYjt3r8hvlhwj0LD8?=
 =?iso-8859-1?Q?s7LQp1TV4hoX3vu8J3NsAyQbgcXtcjuSS1pQGgJUJtTUEPCmkXQivMTVH1?=
 =?iso-8859-1?Q?z0WZYqeq63AMsNYjVhZCIJnfIZ6BSVrUrj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d1322-4f9c-4c23-4fbc-08da8f3e0d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 12:56:29.6687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrgheaFYLkXHtxqFjGi0fuiV50XlXG+sQ4DUTjO2nOr4BJq8zKxqQKgkH5VRjm5FhW4r0qk/PII0dbDUhnQt3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7275

>On Mon, Sep 05, 2022 at 12:02:47PM +0000, Czerwacki, Eial wrote:=0A=
>> >On Mon, Sep 05, 2022 at 07:28:02AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >On Mon, Sep 05, 2022 at 06:07:07AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >> >=A0=0A=
>> >> >> >On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:=
=0A=
>> >> >> >> Greetings,=0A=
>> >> >> >> =0A=
>> >> >> >> while working on a driver, I've found a bug that I'm unable to =
understand.=0A=
>> >> >> >> I assume that I'm doing something wrong. here is my reduced c f=
ile:=0A=
>> >> >> >=0A=
>> >> >> ><snip>=0A=
>> >> >> >=0A=
>> >> >> >I'll provide a better review after my coffee, but just one commen=
t=0A=
>> >> >> >first.=A0 Ok, two:=0A=
>> >> >> >=0A=
>> >> >> >> #ifndef sysfs_emit=0A=
>> >> >> >> #define sysfs_emit sprintf=0A=
>> >> >> >> #endif // sysfs_emit=0A=
>> >> >> >=0A=
>> >> >> >Wait what?=A0 You mention at the end that you do nto have sysfs_e=
mit in=0A=
>> >> >> >your kernel tree, but all activly maintained kernels does have th=
is=0A=
>> >> >> >function.=A0 You should NEVER be working on a kernel tree that is=
 not=0A=
>> >> >> >actually supported, and for new code like you are wanting to subm=
it, you=0A=
>> >> >> >should always work on Linus's tree, or the last release, or somet=
hing=0A=
>> >> >> >newer.=0A=
>> >> >> >=0A=
>> >> >> >Please move to 5.19 now, it will save you so much time later on..=
.=0A=
>> >> >> well, I'm kinda binded to this kernel version buy you are right.=
=0A=
>> >> >=0A=
>> >> >What kernel version does not have sysfs_emit()?=0A=
>> >> SELS 15 SP2, it uses kernel 5.3.18-24.67=0A=
>> >=0A=
>> >Ick, never work on an enterprise kernel for new stuff, they are crazy=
=0A=
>> >and you will need to usually redo your whole thing for upstream in the=
=0A=
>> >end.=0A=
>> >=0A=
>> >Just work off of the latest tree please and then backport when needed.=
=0A=
>> understood, that is the main focus now=0A=
>> =0A=
>> >=0A=
>> >> >> >Write the Documentation/ABI/ entries first, what do they look lik=
e for=0A=
>> >> >> >your new sysfs files?=0A=
>> >> >> =0A=
>> >> >> I thought that is my issue but wasn't sure.=0A=
>> >> >> what I'm looking for is this tree:=0A=
>> >> >> - vsmp=0A=
>> >> >> -- version=0A=
>> >> >> -- summery=0A=
>> >> >> --- data#1=0A=
>> >> >> ...=0A=
>> >> >> --- data#n=0A=
>> >> >> -- boards=0A=
>> >> >> --- 0=0A=
>> >> >> ---- data#1=0A=
>> >> >> ...=0A=
>> >> >> ---- data#k=0A=
>> >> >> --- 1=0A=
>> >> >> ...=0A=
>> >> >> --- l=0A=
>> >> >> =0A=
>> >> >> each board has a predefine set of attributes when I need to add an=
other depending on the type.=0A=
>> >> >> also there are shared attributes between summery folder and the bo=
ards. that I was able to implement based on the name of the entry=0A=
>> >> >=0A=
>> >> >So "boards" are devices, and then you need a bus to manage them.=A0 =
Are=0A=
>> >> >you sure you need/want all of this?=0A=
>> >> no, boards are not devices, they logical partitions inside the hyperv=
isor.=0A=
>> >=0A=
>> >Which can be a device, we have loads of virtual devices, it's how the=
=0A=
>> >driver model works.=0A=
>> >=0A=
>> >> each board has its own data I'd like to export.=0A=
>> >=0A=
>> >Then they should be treated as a device.=0A=
>> not sure I understand how they are connected, is there an example I can =
look at?=0A=
>=0A=
>The kernel has loads of busses and classes as real-world examples :)=0A=
>=0A=
>Think of it this way, each of your board will have a `struct device` in=0A=
>it, and then you will add them to the system.=A0 As you don't really have=
=0A=
>a complex thing, each board will just be bound to the "same" driver, and=
=0A=
>your bus will only have one driver, but that will allow them all to be=0A=
>enumerated and handled easily.=0A=
>=0A=
>And they will all hang off of the PCI device that you had here, it's up=0A=
>to you if you want to make a "bus device" in the middle or not like many=
=0A=
>busses do, but that's getting ahead a bit I think.=0A=
>=0A=
>Go read the documentation and try it out, there's a lot of concepts here=
=0A=
>that I think you need to learn up on in order to make this work well.=0A=
>Sorry it's not the simplest thing, but then again, it is an operating=0A=
>system :)=0A=
I understand what you are saying, I'll try to search the code for it.=0A=
=0A=
>=0A=
>And aren't there others at your company that can help you with this?=0A=
afaik, there is not expert on kernel in the company.=0A=
there are some workers that have experience in kernel development but they =
are from our team=0A=
=0A=
>=0A=
>> >Great, make them devices.=0A=
>> I still need to understand how to make them as devices.=0A=
>> if I understood you correctly, your suggestion is to run modprobe vsmp a=
nd there will be virtual device per board?=0A=
>> then for each I'll create the relevant sysfs entries?=0A=
>> if so, where can I find the global sysfs entries?=0A=
>=0A=
>What do you mean by "global" here?=A0 Just put those below /sys/hypervisor=
=0A=
>if you want, that should be simple, but not for the individual devices.=0A=
>=0A=
>> also, how can organize the entries so they will appear under one locatio=
n which is static?=0A=
>=0A=
>The kernel device tree is never static.=0A=
>=0A=
>> I'd prefer not adding complex code to the utils which need to traverse t=
he sysfs tree to collect the right data=0A=
>=0A=
>for device in $(ls /sys/bus/vsmp/device/); do=0A=
now I understand!=0A=
that is what I was missing.=0A=
so inside /sys/bus/vsmp/device/ I can find the following tree?=0A=
1=0A=
2=0A=
3=0A=
...=0A=
n=0A=
?=0A=
=0A=
so I can create entries in /sys/hypervisor/vsmp for the global info and lin=
k /sys/bus/vsmp/device/ to /sys/hypervisor/vsmp/boards?=0A=
=0A=
>=0A=
>that's not that hard :)=0A=
>=0A=
>thanks,=0A=
>=0A=
>greg k-h=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
