Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1A2561
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 06:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQMOTVAySVScS7/e6t8GnHynmseFEbcXTyFtQC0dTd4/O7TOBh5zttNx/X1++2aSl4TXa4CsRiAGwMmAYX0zwrFlErJDqQpMG+QPXG+bzHS+cW8pVWI8cx2n73QQ/2/dBi15bEhu4gbSLRV8ScEOeHf5CUcRDKfBbd9iDrDQPDKPVn1sW+zuJOkumC+G2ZIYl8yVQUP+3XuYXD+n35fCdm696xuUZuHX0CYFiA7O4S+Sr5LIgPTHXdwag0i6tjuBArsmZx1pc34txN2A4YeFkpYyon/W+PG2gvRkKi95+SGRDs7obeiTugcs1OIgZm4pH6/WwFER5y5qjXiSmDaCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g338jZ8s2qyR/HY2ABUAPkZLt+E7F+uCbZkLbfcsYLU=;
 b=VThtn5Ix+DNigf0F3MOPJ4ASyUUFhvcwTnp0o3vP7EtpOnrqU6B88ymYOFQElWntdZq6d7mlHxM8btRMx6c4WOl0Zu5+O+sx2TjmUncFVJHAFgRRB98rQ75FLHJDmXzVNVAxhQ3nynjMoXisDiyTSpugZgo5l1QWembyE99cpnDlZt/7NV698ZgrrgpOhsVjWgAiGzHcI1p8rlLfOZ2ax5U70MBVXrVnyCpnzOm4vgemo1DbGl4TYHuItBZ1pLUKM9LjIIGOxCGEGaVl/5gCbHcGFRE4aBVqqNgf1LJZVYXb+21+PUG0BUoSQWg9Cu6lT3OehvRRjuKv0WZ7GBSamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g338jZ8s2qyR/HY2ABUAPkZLt+E7F+uCbZkLbfcsYLU=;
 b=kjKTelLOovVcHvWloCKamM4vnVOd9gzjn7LRY+LRLIMXE1arhbYysvHN9yus8DrsePhVSz2dVCb1gmNMqWGj+GyWR1k+R93uRU4Bj9jkFXfwOlIk6NNtbuzCxXAXXRdFGeWUoHyCKrVIirFCesYQ3yIWZ1RlPP+N8d35YfJqFh4EdY/Szr3rSXJdlDLZk/cnjpXx2IIfkEh1O46DiHUhIZibFvc3/F+guR9AXi8e0xZPgSkMyU7IevP5o+B8IhFibaTZCFeUDRzpK2Pev0zO8CrE09YH/x5yFZ4WzG4Gr4bpWNI/EtcDPrDNZxwoW8cB1qsmQFfb7gbIRCVcUNBexA==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by PR3PR02MB6411.eurprd02.prod.outlook.com (2603:10a6:102:5f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 06:07:08 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 06:07:07 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index: AQHYwGq9NvHSxWjabESaa5oh/fCdV63QVbUAgAABNZQ=
Date: Mon, 5 Sep 2022 06:07:07 +0000
Message-ID:
 <PAXPR02MB7310BEB4DB4237CDE90D9F1A817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWN7Fm07segTeqU@kroah.com>
In-Reply-To: <YxWN7Fm07segTeqU@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67631d04-df92-4610-e289-08da8f04dd26
x-ms-traffictypediagnostic: PR3PR02MB6411:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d7ny61JO6wHkk2hIhbKXmbWklQ1tpRJTD/gF4d+IkzmClMpQKsMzwwPia5b4W33KN1nNlhvO5OrUj3wwzeFlfv7/m0snm3SIejRERRqHtT1cnhwO6eCkbOhISMBK96yJaDpdCokIMj+NenSBZnFnKuBtstg15dA66A0e0TdBNWkviuh+ZWHDEZGM5lGcUsArbPxUVM9kSpmO1+O8za7kxz/Vkk4g4y/gkPsGE4N8CLEVZz25tMJXYGIBueUjJftyqY5AwEKfv8PnENLmBhvEPSdQ89JPo1ed56id/ExfUAIHhFTqZNyfUyzRNnQ13VuM/AObyYIxu+OhMxXDNH4EjJQxXw11zkuaZFWgEyDBCxKiHVE53oXcEhrdWwT6fQSruAWZ+z9sOPegpgSgR8Rhb1I0WR6/24Xc7Haq1FGqqvKFgGvAFl3+3X2ATf1sjUesOb/rvp7uWMdlgQYukM3p+9VuBhdwgNY6HcANY3yl9OplHJ1+Fomi02Eb5aCTAFa12LVUfxBgIMF6wdIJdexkoIQAfbqX7b/nb1XYAY8XxAe1FIK+GE0IcSm9MDQBefCWV5kDyouPFuo4uC/UwjU9nXrTfToIh9xPBQyXdOGyfY1AhOcZRx6N67Tn3tUsSS3/wD6JLzLgivLDc8S4SKG9YYQkvtgjSCQi5ge8xvVwNW0kJCvQWLCyJ3vVeTgokmQLjTIRCs3Jv7ECVD8nh3nD8FPTxO7n754c7I2KAKwpBGaSY6c74h6+9a1D/UC25hMFPmgkCAzgb45iqOAO/GHS+Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(316002)(54906003)(6916009)(33656002)(52536014)(5660300002)(2906002)(8676002)(91956017)(4326008)(8936002)(64756008)(66476007)(66946007)(66446008)(76116006)(66556008)(71200400001)(478600001)(41300700001)(55016003)(6506007)(83380400001)(186003)(26005)(7696005)(82960400001)(86362001)(9686003)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Lw/9uIu4yuTMl99rhVN/tkteyAWs6ZQcSxKfrsc/Xv4mxVvOZWwrX+aKDd?=
 =?iso-8859-1?Q?gC4hw9Uco282dygtFk2ipk0cZXjyNJuWcOmIDWweM03w0c4kanwJio7FBp?=
 =?iso-8859-1?Q?LC7jSQkBx7wdxLft33WWba1wJxVIx++jn3SPSGa6imSBhlMt9SC+xjrM2S?=
 =?iso-8859-1?Q?mAm9A14Ppi7JC4an3oC1scTLkQ7Sbmvp73SDUrAskSexpqIrSn68Jmu+/o?=
 =?iso-8859-1?Q?Ef8jMJRxLsxxf4CWHVjIe2YivaWxyUSs7bMcF++yFMe4mK+LjHn+2Sm5yy?=
 =?iso-8859-1?Q?rI+x7BfA8Se+J0c0Symd+zbTy6gk/T6BOFkMIQeOAnjPrkLavJHMlseeLS?=
 =?iso-8859-1?Q?AbE1PycDHT5auY7FnjNNEGp8SwkbLoVrGLQpFuRzGMfnd0BQfmeRjy4nBJ?=
 =?iso-8859-1?Q?AFp4d31KDd0WGF8dMCcc2uEnE6fHWArtjbFjkF6tMZNqx6ftE+J46X9dP0?=
 =?iso-8859-1?Q?1MnUbzwLcXBCQEnT4UoP6ES5lXnbIX+SOOnLKCrQmvMte9Eu19m9O2wlnd?=
 =?iso-8859-1?Q?0ZnwoFa/vtKPbTWVBhWb1jckItaNk9JPo0sZgYTkmh/ApExhHnXAuQhG+3?=
 =?iso-8859-1?Q?Ia0Qu6iM0diLk4EXKrs/TStuDTTVcY40Aml+701ypMWgkJMJ5U6bOWYy+3?=
 =?iso-8859-1?Q?5oaqLi4kfDqxk35mqn1cTCHdaYi7/VqUksGRTFGyv53L5EPSYB7eFnAUzk?=
 =?iso-8859-1?Q?r3sw02q+uS2dXdz/Dij+5JY8NPdXLIuYe4ZS+dDm7FTxLOE9sZfoL3Nc3a?=
 =?iso-8859-1?Q?ZqkvoXqyBtPSh2hXMZLp7blWEXEhDVI3dRvmdjyTZa+a9io2lXcaw/CYtZ?=
 =?iso-8859-1?Q?iiPBnyLkfHG9VoOk0lS0i+g8HAOEV0TLXV7uRSbZnznrTjRH8j5CCh8G8y?=
 =?iso-8859-1?Q?4qZR+HmDuhoSxWxAjmCxbMcaAYHaHg1+Qd2M4oFcE6hIvz+CNAgCW1wQ23?=
 =?iso-8859-1?Q?m4DvFUsWvgt4jecKo3Yr10xUjIFnL0m/cNSdtWK+YSQT627AwwfT0x/UFC?=
 =?iso-8859-1?Q?0cjjcdCBblhUBkxzDAJnWPFKF9Qq5UbzrnzgpJfTbUONw9Axs4Vj1l3gsp?=
 =?iso-8859-1?Q?Ypcrs44zxI/dI35quNp+DhrdXX3RSWaWR/nhXWwjKypv7Gqc8wiKWxjVsT?=
 =?iso-8859-1?Q?5tDy8Hl3pwmqmTonznpohW5Yak6zwekXeuyxaJPiINejkCFZ6OjqosraNq?=
 =?iso-8859-1?Q?+2CfUCHergVyN6KribaO6yCcUduHV/ApuU7/YqPYQ4sR4E+ws7OQMEjEvf?=
 =?iso-8859-1?Q?gDW7V1EcSxI2RtIO0D7prIF8fCyEx+lSnj5Eh48OUJn9AOsQhDXSWXQ04R?=
 =?iso-8859-1?Q?m4/nGJB0yWQSZT+Y6OF4Ubba8W0c7DaAOnxUhauGeKBcB5fTZgPyb7huhz?=
 =?iso-8859-1?Q?wAjxvL6L2m2dh0iDlvDsuFFaSOCa9HP0X6eU9YWjwfNSq8XIAasKZBRG7C?=
 =?iso-8859-1?Q?vhTFp864aTKWPvxBLM4bPa/llO3tWjxO/ql4a+Xo1dmBCZXnGF9RXDvjNM?=
 =?iso-8859-1?Q?on/W33OkVNh2WmUQq8Py56qKGtkn65UZsfqc6TBYxDw5sxSRrCDZg77MtH?=
 =?iso-8859-1?Q?9cGaAQpqbfH3aggZFZxPsLO6Gs5KGxxEr4JK+c4vEdytVoLOdDYGHzvLRU?=
 =?iso-8859-1?Q?ux3WRTXxAfB17KUvDwGz8UpiZJmKlCY+A8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67631d04-df92-4610-e289-08da8f04dd26
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 06:07:07.8988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kpfcKKbdo8yg//+BiZTj6pMwAVHQbe4yAjZsaa1H+83oOMfWdsK6bHxdYEvU2XkSf6hxT0jEJ/Cu0AITf4IS2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6411

>=A0=0A=
>On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:=0A=
>> Greetings,=0A=
>> =0A=
>> while working on a driver, I've found a bug that I'm unable to understan=
d.=0A=
>> I assume that I'm doing something wrong. here is my reduced c file:=0A=
>=0A=
><snip>=0A=
>=0A=
>I'll provide a better review after my coffee, but just one comment=0A=
>first.=A0 Ok, two:=0A=
>=0A=
>> #ifndef sysfs_emit=0A=
>> #define sysfs_emit sprintf=0A=
>> #endif // sysfs_emit=0A=
>=0A=
>Wait what?=A0 You mention at the end that you do nto have sysfs_emit in=0A=
>your kernel tree, but all activly maintained kernels does have this=0A=
>function.=A0 You should NEVER be working on a kernel tree that is not=0A=
>actually supported, and for new code like you are wanting to submit, you=
=0A=
>should always work on Linus's tree, or the last release, or something=0A=
>newer.=0A=
>=0A=
>Please move to 5.19 now, it will save you so much time later on...=0A=
well, I'm kinda binded to this kernel version buy you are right.=0A=
I'll move to newer kernel.=0A=
I'll worry about backports later=0A=
=0A=
>=0A=
>> static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_i=
d *id)=0A=
>> {=0A=
>>=A0=A0=A0=A0=A0=A0=A0 struct data *d;=0A=
>>=A0=A0=A0=A0=A0=A0=A0 int ret_val =3D 0;=0A=
>> =0A=
>>=A0=A0=A0=A0=A0=A0=A0 d =3D devm_kzalloc(&pci->dev, sizeof(*d), GFP_KERNE=
L);=0A=
>>=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(d))=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(d);=0A=
>> =0A=
>>=A0=A0=A0=A0=A0=A0=A0 d->pdev =3D pci;=0A=
>>=A0=A0=A0=A0=A0=A0=A0 pci_set_drvdata(pci, d);=0A=
>>=A0=A0=A0=A0=A0=A0=A0 d->kobj =3D kobject_create_and_add(ROOT_SYFS_FOLDER=
, &d->pdev->dev.kobj);=0A=
>=0A=
>This is the issue, no driver should ever be calling any kobject_*() or=0A=
>sysfs_*() calls, unless something went very very wrong.=0A=
>=0A=
>Drivers and devices have their own tree in sysfs, with 'struct device'=0A=
>to use.=A0 You have a device here, use that, don't try to create a whole=
=0A=
>new sysfs tree somewhere else in the heiarchy which does not reflect the=
=0A=
>actual device you are using here.=0A=
>=0A=
>You then try to tie a device as a child to a kobject, which breaks the=0A=
>whole logical chain here, and then confuses your callback as you really=0A=
>don't have the device pointer anymore, it's some other random thing.=0A=
>=0A=
>So step back and try to describe first what you want to see in sysfs,=0A=
>and then maybe it will be more obvious as to what you need to do here.=0A=
>=0A=
>Write the Documentation/ABI/ entries first, what do they look like for=0A=
>your new sysfs files?=0A=
=0A=
I thought that is my issue but wasn't sure.=0A=
what I'm looking for is this tree:=0A=
- vsmp=0A=
-- version=0A=
-- summery=0A=
--- data#1=0A=
...=0A=
--- data#n=0A=
-- boards=0A=
--- 0=0A=
---- data#1=0A=
...=0A=
---- data#k=0A=
--- 1=0A=
...=0A=
--- l=0A=
=0A=
each board has a predefine set of attributes when I need to add another dep=
ending on the type.=0A=
also there are shared attributes between summery folder and the boards. tha=
t I was able to implement based on the name of the entry=0A=
=0A=
that I'd like to see under /sys/hypervisor=0A=
I have no problems using link from the device's path to /sys/hypervisor=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
