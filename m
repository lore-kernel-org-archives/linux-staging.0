Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A32919
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 07:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hA9LCnumHuPE/eai6yCe5LWMTk79orZAlM27fL1N3nK33Ah1JEm3OBJoNKpIRneVTp5Q8eBbUYRHDhS/k5LGZwnuou79h8FZmesAF9PYOtfozv25BS7dRIvUHD+Jlnd8wrnEi6wbD30I2WvWOEpnp2JFd80x7KZ4PQCeUiwxgb5P4iGgO7IJxjH2VTK2IVcMebEAeUgJG92WmdRPoZ8rks6bh0PrgVNF9pBi252bbGOIpoePhBKYJxPfW9OUq2mwRQbfBzX1nTLKLWEn70FxqVk2rpIOBbstk477VsR6Y2g5eZP0sW9mjQPS6mMEiJ5lWwkSZAyRzN/M7LCWlgscFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQJ1lieUn0+dgn04BSELSORzDy5s//rjB96OOFqUuck=;
 b=V1Dl5L3MwKh1zcyfihNez7qWWe8DHRelTbyRuFoHqFGlA8mjH++WF+G8hxG7kDf5LyzUB25aRBFIfKGV/uAwBHX4BGnd6vIMFvkp03NdELNhRCOK+BJPZ9Cy747Xk9SH/zP2UC8JUDJkBFKMqph9bJYrwWzpbj9PTMw6UFuTFnMiAxhzQm8Fjwi3Yy1OWy8qxYyNLmcCBtZvynXYtKyPRn6La0LHmAwZFaLVjx8o5jS0tgZVyxoSK1we4Hyds3xpI8dqyKifOlG8UyX7J7YNyiR2savOla3agaXzCNxSFbpCjrIr7OIFhkNV3MeApnT+B3sGYOoHiJxXDHD8VoB1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQJ1lieUn0+dgn04BSELSORzDy5s//rjB96OOFqUuck=;
 b=ncnp5C5Np4UxslMYjYbqvtPbkR3CDSh/zF7Dl1Evjjl01I4SMCnEuAvAMD7bl4+XZuSMTMghg7DWfbs/kczedg67AnLHuDgn7pz3JVDBijgE5dh59DCRoacjaR77i6pD3dB61GvL2vkzc+I8W87Oso6lI6XUxFo6APzAwjo0B4TOu0e4FjGND8YdeuYzOaohsAnw0v0E6dnOnQjmoVw/g/n+qE+uuhVaWxJ2AeMZR/1D47YxQqwZKB3Ju7rXyweyu3k3CSay3c2e1ZiBDRyOiuLOibzmlF9jvVboKaEKc/mMkg+ew8DtZq9bID6bgNPTaWeUeKTV1ojLm296qObZwg==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AS1PR02MB8208.eurprd02.prod.outlook.com (2603:10a6:20b:483::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 07:28:02 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 07:28:02 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index: AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZSAABLdAIAAAL6q
Date: Mon, 5 Sep 2022 07:28:02 +0000
Message-ID:
 <PAXPR02MB7310F72EB4259C35A364F8BB817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWewlIruFL500al@kroah.com>
In-Reply-To: <YxWewlIruFL500al@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dec732a0-3ee5-4fd6-3e0f-08da8f102abc
x-ms-traffictypediagnostic: AS1PR02MB8208:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pRNYTY05HzswpvLMmo1aj7Cqw/xJwXq4c/Vvi5pbCUgbhHgaGz3wZ5LLe4+GmIzSftY0+5AWVBVK3RYgHUx5PKae9Hn6EehIaITMUUG/LALAQ6okZTH7gWXDEMQ0ogidhc6K4vLpUdMcCnSAldRKBd0D9is4vQ4muG5L8S7dmOl+elkFH10NyVyChAG2B3T3/NOAZ9n0dizsbLWhU1FDH/9S5AOuGuWXZ2iq7F43S10ian8ENVbKECqb6LcHkGZrmbdcEeeVq/FNmS4Ez5/N5LbHcE+QHh9Qqi37GxMfHypIy5C84eP4u8gsgWVzX0/ce53IX1eZxz3qhMRQSe8308zbWyjH0+I44gRHsY2dYlULxHbApTsId5DU0nexFtrBiZtTK3x8ZL4RbkCc5NMlsTWa65+gACmIduVdRHEaj0yrOn5VCgVJfmEeET5/yaxU9cbDrb9AUAucYReKvJYHdS8akRTAPTqsD6wh3Gza1N4Q5e2S8r+Gqn/H6XJ+joCs5mlEMb2IvgXNpxsBNDFMgFZXZOInF6LbByypg7s3F0WNRIwEZAyWgA2hWCc9xf+qtITvFcbpYA7G4VP2MAmzFEiOftECLpDH02poZYcMtnVWZI36znknRQaAKFyaLW37OQmR5AweopCdkcvjgwDuZP5KFHNcYkgTDtRbyYG4KtVwkI+Taj/iwGhhHbDkRm6+grQ+HkWoaLuoMz99x9kaKMB0HHY1c27IWBho4Vi+JOswjA6j/ahenzvE7gwckUuoKcnPwQ2M+OK5cEzVcagXiQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(71200400001)(186003)(7696005)(8936002)(9686003)(122000001)(26005)(52536014)(6506007)(5660300002)(33656002)(41300700001)(478600001)(86362001)(82960400001)(83380400001)(38070700005)(38100700002)(6916009)(54906003)(316002)(55016003)(2906002)(91956017)(76116006)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+WvZcsbBet8EVBy6ZZa3sSQlMBmTKjF1Hqq3CVi6nmDc2Oa+KsHnVPbsj2?=
 =?iso-8859-1?Q?mkgeJfj9IPR1/FGZnmGTwwD+3P/oK2XGqT3SP66rBXYXR8/eTgUGidR0Io?=
 =?iso-8859-1?Q?Ubalz0FRWQgdUonoGENR9DA99hSs3JUiK7EOSlaXwVupWsiEiVXhAT5iZz?=
 =?iso-8859-1?Q?FO7LSuQRERXWMLYd7hP6SryXx+YvWK51CNsCegeQDQMzPN3vCpzhsT8Wzg?=
 =?iso-8859-1?Q?iahWbcczyET/iMn3xAm/kvZujZ0pHPORc2PnYAgV3AHaDUrs4ukDo2JpZr?=
 =?iso-8859-1?Q?qrNPaZ6xO5LvO/VO7yBmOt0Bed0i8OeBCpmqdsRwoe2KDI921ADNEJ7yV7?=
 =?iso-8859-1?Q?JZJtxGZR6XPoKMQCNFsgvoGjvzqkK7Dl8EEjwnwOW9lm2/NoCuJK9NJt+5?=
 =?iso-8859-1?Q?zHAzQ/djDKMCh0nZApoDl0afZvYnlV90ej4lrJA/WjbOU11K+sf1tB/+po?=
 =?iso-8859-1?Q?lV9BS+/P0lTzvGud1EEmcAbznHZ9KcxRk/DfTv5yR/EvXtcvhYpI+Jf97G?=
 =?iso-8859-1?Q?ulaxlB9e/8ZXnHZp7BRwP4x8t7EvG4U5Pv/Lai9qUuAL3IapanroVtHIXz?=
 =?iso-8859-1?Q?W4CHg5wAXXNaUI9C1Fcl4RWMLIsKHZ6+1mW8pL4m5rFixwRdjbBg5i4sym?=
 =?iso-8859-1?Q?XR97U8JOBALPQCpfAcT73jn6dL6hcURMd4sj6CC01/AmGK43/m5eyAmUIa?=
 =?iso-8859-1?Q?XDMEJjE5ZiDragbAGLSuAWp7EMSjk7/MD/0ZjbW1zdIB1T/E9rXJyxqtI9?=
 =?iso-8859-1?Q?8g6Hc1j8sxqA8cZoe/Gq+ae+bkEYxbWbcabV1CpJmhA2Jc1tl2J2Nkxf55?=
 =?iso-8859-1?Q?fQcWjtk2VJ9F8oCFDWq3GBZXXN11NT06O6uYl9GyukdRnDSlTzeyNP0R1x?=
 =?iso-8859-1?Q?GhTX7qTbqvmu9x6bDXqe6iVBe6fEAQTyCGUSl/GgOFq6mqhcRsIIrGGCVQ?=
 =?iso-8859-1?Q?81oLe6kDXYm+140KJsB6HOgp7h6DNAKeob/eBilZz8XtSXX2fbWEqhvPAl?=
 =?iso-8859-1?Q?wEPPpZqxZR2zD7+lcVjwtiWX8sPhwRfJFcGT+6f8Twl5/sft5UIAjMQ7rb?=
 =?iso-8859-1?Q?mvDfMigLR/e59LSYe+sd7v8KSqG3coA1VW0dqqDYIMeT1Inwk+dlyTfApJ?=
 =?iso-8859-1?Q?pqOXLsxsVVyOuOYNDSl+ke32qduBPolFJZhb+/CnRfsNMac2B8tRFfnnMN?=
 =?iso-8859-1?Q?cVwnp7tHVqTa3ICk6ZZrXni+DsV+gIhocns+YheHhPJc1Fs502+t/eoeKN?=
 =?iso-8859-1?Q?Oqj0jV2EIDgo9Sl1d3QoRqCd3HAfMQXP2DcX2Xhe094XFkGeQLJ3+QnyUF?=
 =?iso-8859-1?Q?A1MJUHp3DO+QprVuwVeoxZeGH+XgVNh6CkpB1Gre5FVv4LhttfA84eM4YB?=
 =?iso-8859-1?Q?gC0q5LeJ9HVq063TDYKvUY6IXvJ82Y9BPyJV6C2Dd8XqvKBstbo4h1WoZn?=
 =?iso-8859-1?Q?BALgaIca+sstaKY2rxsX6C8ADsDyFwIAnlzNcAf7YnjEops9JrcsQdk9hL?=
 =?iso-8859-1?Q?zp1cqkBseRRzv8q2K287l9eZHzGjCBz8NfmGIZ7Cn1vCq7CT2ctpsWwLOg?=
 =?iso-8859-1?Q?5I6HdfkT4pdgSUpA4pmGLvZkK/44r/hfLF7cYhUAEHUg+aRfNUJRCBH345?=
 =?iso-8859-1?Q?mE1n8HfTFODJu08rqTJ19CAhntvLOOvj7h?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dec732a0-3ee5-4fd6-3e0f-08da8f102abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 07:28:02.5262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3ljRCQgPogd9cg21jtJs2nvnCCABjPXVZKRZEanAyau/JHVOeJXmo9A59TzWP6QGFMgwhkJWy1/bH3REbizTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8208

>On Mon, Sep 05, 2022 at 06:07:07AM +0000, Czerwacki, Eial wrote:=0A=
>> >=A0=0A=
>> >On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:=0A=
>> >> Greetings,=0A=
>> >> =0A=
>> >> while working on a driver, I've found a bug that I'm unable to unders=
tand.=0A=
>> >> I assume that I'm doing something wrong. here is my reduced c file:=
=0A=
>> >=0A=
>> ><snip>=0A=
>> >=0A=
>> >I'll provide a better review after my coffee, but just one comment=0A=
>> >first.=A0 Ok, two:=0A=
>> >=0A=
>> >> #ifndef sysfs_emit=0A=
>> >> #define sysfs_emit sprintf=0A=
>> >> #endif // sysfs_emit=0A=
>> >=0A=
>> >Wait what?=A0 You mention at the end that you do nto have sysfs_emit in=
=0A=
>> >your kernel tree, but all activly maintained kernels does have this=0A=
>> >function.=A0 You should NEVER be working on a kernel tree that is not=
=0A=
>> >actually supported, and for new code like you are wanting to submit, yo=
u=0A=
>> >should always work on Linus's tree, or the last release, or something=
=0A=
>> >newer.=0A=
>> >=0A=
>> >Please move to 5.19 now, it will save you so much time later on...=0A=
>> well, I'm kinda binded to this kernel version buy you are right.=0A=
>=0A=
>What kernel version does not have sysfs_emit()?=0A=
SELS 15 SP2, it uses kernel 5.3.18-24.67=0A=
=0A=
>=0A=
>> I'll move to newer kernel.=0A=
>> I'll worry about backports later=0A=
>=0A=
>backports are always easier than forward-ports.=0A=
sounds logical=0A=
=0A=
>=0A=
>> >> static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_devic=
e_id *id)=0A=
>> >> {=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 struct data *d;=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 int ret_val =3D 0;=0A=
>> >> =0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 d =3D devm_kzalloc(&pci->dev, sizeof(*d), GFP_KE=
RNEL);=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(d))=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(d);=0A=
>> >> =0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 d->pdev =3D pci;=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 pci_set_drvdata(pci, d);=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0 d->kobj =3D kobject_create_and_add(ROOT_SYFS_FOL=
DER, &d->pdev->dev.kobj);=0A=
>> >=0A=
>> >This is the issue, no driver should ever be calling any kobject_*() or=
=0A=
>> >sysfs_*() calls, unless something went very very wrong.=0A=
>> >=0A=
>> >Drivers and devices have their own tree in sysfs, with 'struct device'=
=0A=
>> >to use.=A0 You have a device here, use that, don't try to create a whol=
e=0A=
>> >new sysfs tree somewhere else in the heiarchy which does not reflect th=
e=0A=
>> >actual device you are using here.=0A=
>> >=0A=
>> >You then try to tie a device as a child to a kobject, which breaks the=
=0A=
>> >whole logical chain here, and then confuses your callback as you really=
=0A=
>> >don't have the device pointer anymore, it's some other random thing.=0A=
>> >=0A=
>> >So step back and try to describe first what you want to see in sysfs,=
=0A=
>> >and then maybe it will be more obvious as to what you need to do here.=
=0A=
>> >=0A=
>> >Write the Documentation/ABI/ entries first, what do they look like for=
=0A=
>> >your new sysfs files?=0A=
>> =0A=
>> I thought that is my issue but wasn't sure.=0A=
>> what I'm looking for is this tree:=0A=
>> - vsmp=0A=
>> -- version=0A=
>> -- summery=0A=
>> --- data#1=0A=
>> ...=0A=
>> --- data#n=0A=
>> -- boards=0A=
>> --- 0=0A=
>> ---- data#1=0A=
>> ...=0A=
>> ---- data#k=0A=
>> --- 1=0A=
>> ...=0A=
>> --- l=0A=
>> =0A=
>> each board has a predefine set of attributes when I need to add another =
depending on the type.=0A=
>> also there are shared attributes between summery folder and the boards. =
that I was able to implement based on the name of the entry=0A=
>=0A=
>So "boards" are devices, and then you need a bus to manage them.=A0 Are=0A=
>you sure you need/want all of this?=0A=
no, boards are not devices, they logical partitions inside the hypervisor.=
=0A=
each board has its own data I'd like to export.=0A=
=0A=
>=0A=
>And what exactly is in the other files?=0A=
version is the hypervisor's version, the summery is data the user can extra=
ct=0A=
in order to build a complete image of the system configuration=0A=
=0A=
>=0A=
>> that I'd like to see under /sys/hypervisor=0A=
>=0A=
>/sys/hypervisor probably isn't the place for all of that mess.=A0 You are=
=0A=
>going to have devices and a bus and all sorts of other complex things.=0A=
from what I understand, when I add a sysfs tree to a device, it exists in s=
ide the device's full path.=0A=
as the device can sit on different slots, it will have different path.=0A=
to enable simpler data extraction, I'd like place it under a constant path,=
 like every block device=0A=
can be accessed via /sys/block=0A=
=0A=
in later stages of the driver, more information will be exported and maybe =
data will be imported into the device using=0A=
the driver=0A=
=0A=
>=0A=
>Step back and explain exactly what you are trying to export, who will be=
=0A=
>using it, and what format you want it in.=A0 This feels like a lot of=0A=
>stuff that is probably not needed except for debugging.=0A=
each instance of vSMP is comprised of logical partitions.=0A=
the instance has it's own data required to be exported.=0A=
each logical partition has it's own data required to be exported.=0A=
that is why the above tree was suggested.=0A=
=0A=
the data will be used by a layer that gather the information and exports it=
 to ui and to scripts that log the info=0A=
it isn't a debug info because there are some tools that need to know the a =
partition's information to run properly=0A=
=0A=
>=0A=
>If this isn't for debugging, it's going to be a lot more complex than=0A=
>"simple" attributes for a driver, sorry.=A0 You are going to need as I=0A=
>mention above, to use a bus and other things which feels kind of wrong=0A=
>as odds are this isn't a bus, right?=0A=
that is correct, see above explanation=0A=
=0A=
>=0A=
>> I have no problems using link from the device's path to /sys/hypervisor=
=0A=
>=0A=
>Why would you create a link?=A0 Look at what existing hypervisors do in=0A=
>/sys/hypervisor, there's no links there, only a small set of information=
=0A=
>that userspace can use for the Xen code, or a more complex virtual=0A=
>filesystem that the s390 hypervisor mounts at that location.=A0 No one=0A=
>creates a symlink under there, why would that be necessary?=0A=
>=0A=
>But again, stop and think about the information you want to export and=0A=
>who would be using it.=A0 If you can explain that first, that might make=
=0A=
>it easier to point out how to do it best.=0A=
>=0A=
=0A=
I hope I've explained myself properly,=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
