Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FF2F3D
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 07:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoMxwAgqeYYYMUZRdne9bwpseqDz42Bf+729h3gy1ZsM20oI6o0f2hhN9/zL8Lb2xdX8u/QoG1z4XqXvVwaf9r2qlAg9ukJuGYVvttjgWxV7TiOM9A7ltJ/DkV9UTkcms1GudGJOIod6h8of2T+aNLIK0I7K0OTO1ABNTlpjq2lCrs0bsXtUb7fCOF3nY1TJnnF+yBQtJHFuIqnRsh4eZpF8djota1OoVHOQSj/amCn6SXJt9+VRGO4T90/jK7Upa04+LsQYAxfo3WN+PsDc8NooB0IELXGYgMkzCWqQUjpGgr6mYXpPPkNZUxC8x4+oEMrMzPoSt1cIg8yDrdKkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WqjZWM0htU2dSASxllPzhqfA3RBEP+ptVntcPSFzp4=;
 b=YiPQjNCji6NjHOGXRW4fX3EpOO5AJfLHtFu4g5feEvudiJRN8x2vYQBHuw1CBIhHr60LmiBW6YTWYFQSbLYYoUrNVAr+JifwZVj/rLuk01HqjYwr5ADAezUiYZmci8/KwmzCcEpzVg6bF4oJsECuK3CfWTgTcFzQ/TWgTosX/fiTyQ2LcneEO8CK9LbjQZHACqM3sw3lkm3F12GrwLYG76iuMjlexVRKCRK8l8OuzcOClkCDvqmOH1zWbdKHLRtlh0xCJg1AB1wW9wDh8kpu0MCqVZNliFmvUaZngIU4qRYUXefgtLXpoq2ROk9cRNJzFwBzB9D0r7Y8AqWo9P4u2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WqjZWM0htU2dSASxllPzhqfA3RBEP+ptVntcPSFzp4=;
 b=ebbAD014ZJbM96S+/agJ4hUbjLN+99KP0WkoVBxpt7Z/+iiP2A58KHIc2ZJzIpNv0fKrmw9KC0xn0vbxt74KtkcCuvntSqzgcpp++kvkmWd7MUXfCQCtHSRqw0nyzZOCGaUsIrCHQe3GRGWPSVaMFDA+TWWfD16zX8RcIdB8r7udETX8Zza+oqRZaoV8PPq89ZsQAfKb9jhv6Jaohs2ZbnXzF4ybZVdum7Hw98NOwczDHAwx7Eb7G3aiiLYZ9QdUx8jwsP8p5hq3S+6lxAMaQgCFXZ/4m1yI0c0ima+BeKcNcSsI2Vc1HRJGZiJE6E42ey8t67oGzn3PZGRdpk9Wiw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM7PR02MB6241.eurprd02.prod.outlook.com (2603:10a6:20b:1b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 07:44:44 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::25a4:e5d5:aefc:fe46%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 07:44:44 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <greg@kroah.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "Hammer,
 Gal" <gal.hammer@sap.com>
Subject: Re: invalid drv data in show attribute
Thread-Topic: invalid drv data in show attribute
Thread-Index: AQHYwGq9NvHSxWjabESaa5oh/fCdV63Qa5aAgAAF2qo=
Date: Mon, 5 Sep 2022 07:44:44 +0000
Message-ID:
 <PAXPR02MB73102949EA5E56F543DB97D5817F9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310E14184AA4389841AE89E817C9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YxWgR+/jBC/uBkAS@kroah.com>
In-Reply-To: <YxWgR+/jBC/uBkAS@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0df7705-de93-4cdb-5012-08da8f128013
x-ms-traffictypediagnostic: AM7PR02MB6241:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MiOYQaMJ/VmUCIChbnXO/6y73NteNIE8tnBdOEV+3dYuhyj2H2uOZufQ8ZF9M17DL23NFjt9XjGAURbM2os0AarRq8fuWale/rlGiW/SevxJqz0o2wJk1lqDkLoU3FTMF4ryeQ2GxuaobqDur8zgyIpoznq0j+RN+F3/GHkhGjiEZj/6rMsc3ak0AFtRty+V0j/yrxYhx6u6C/f1ZIEwxy+68fa+V69ofqzWx+valS4hCAQ8lvi6O63DpY4jDSea0mGOcgjUabyJI/zp1zDNH4N6QAOkb7npVwd859A3NaUSj/o3y+Khb5+YLbwXQcyhbGQ1a9HteM6TAZxpmjn8b7J2JFiLbItEj9bxpx3F9AQHJQ4UXFCEEl2k7jOnXlF7VP4L5rsyjVnpQcyIvOORHRfz1qJcD9MRgeSFPsd8zomdczN7ywClySvOK+Tbol26t28RLQXbSUfgz+I+9yoeAQDzh/FcUpW/xFUph7oF5ineJpw7H+EL2zYQCOj9+hLK0GqWGv6/pPtto3jKbJQpKiYOrct2wRK2noo9prxw6uE8cnOAWcsI91gDY1EG9mtxmbra64CLYhSFPUhThUk/2/jUs1qSHO0pqzydzO/ugN16yUcHuzD0U5j1lMXnRjJRm+0qwUtsPwCTkbJRrT3Q7mbRqKDcq5EVE7dt5WMslMWLAvDutxXhq2CAbVxAmxLojKmSxdHl3EtcLIKsxhra9Xw0sjf6DaQ/aOsCP/x+M/vcevDF2T0O+OvFbdnlBFT/7MVX2N4u3xDu6h/yt+NXgw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(52536014)(5660300002)(9686003)(41300700001)(8936002)(2906002)(122000001)(26005)(478600001)(33656002)(38100700002)(66556008)(66446008)(66946007)(76116006)(66476007)(86362001)(64756008)(91956017)(6506007)(8676002)(4326008)(7696005)(82960400001)(38070700005)(54906003)(6916009)(186003)(71200400001)(316002)(55016003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ip6GjMb8BUHnAZUhO3dACJDS5SzhW/6Zi/g1fkfd4FrFx/of3ALklqcJlz?=
 =?iso-8859-1?Q?cYVhdaJKGZYkeS3Sbwc+PITN7Plxqg9MgYrKUFAxlhUbAm+Krc8voNJvSi?=
 =?iso-8859-1?Q?JhLyOFMUs5S7Doy02PcTJewfxcGg55E1dvKzVNhB8TNjlqm7ViGkzIAKG7?=
 =?iso-8859-1?Q?bOZvHdzkPOzSmpd7S2o3pj7Zr67fT7/dwii87xnPhfhe9aF9zD5yNr9cCW?=
 =?iso-8859-1?Q?PxECV+PL5IRJW1/NWvhwCuUARBYVEyxDlPc4oF+RA5uJbyjV2XaE3dG0uy?=
 =?iso-8859-1?Q?cO6LGElEvisiClQ8JYXA3dUVHWdtfrTs7OJtuSl70YW4qgu5wccp8kUtOv?=
 =?iso-8859-1?Q?eohxjMf50cprdhh6uUT9JYDDlI1ksCCWxMRLaaveGV9xPU/Sa4JucyK8L/?=
 =?iso-8859-1?Q?zlpQD60nTE4/t5meXdX+NcQHgng9iGv/W3TyAKdXiyQwoY8/Xu1Mr0oTCI?=
 =?iso-8859-1?Q?mOHTOb5A29/hyIae4WvgmX3mdpKImNwEeM8AlBTd+ZGEw0O+f+3tjH6ewj?=
 =?iso-8859-1?Q?AbrKPz+XQvaXX4yQ4jkZnOv3HxQHgeVEUWBLdVqL7jqdGRPw7jfakrB0Lz?=
 =?iso-8859-1?Q?BDnEP/d91IBNoNe5Q4ZRyIz1WjKpJjJea+kmjP4NkCHklIo7J9eP3qzjX6?=
 =?iso-8859-1?Q?AWHyerD4USoLHW3Gog3MEvWn8GZLxlcDx3w0pxr1nr4CeDwAMQo3DAaXkL?=
 =?iso-8859-1?Q?UI8Svh//c1Te5Wp0sUO8s3etuxNHStqvXt5hs1pUuFFEmner23pty2D3x4?=
 =?iso-8859-1?Q?UPNUyCOCZEDvY0DTV7/SrIFt8ge2uypiHe3nMUcLHVyGPLuOR22SUQcn1q?=
 =?iso-8859-1?Q?/VG2VaDSEuxncx5ycx9t4opbhb8Xkkr0UGS2DwpNm3nwn7G9/HmIk66tfx?=
 =?iso-8859-1?Q?WDRnL8FyOaKC45qolwjJkxxwvKgviLXpyPs68tSNyoXWGqq8AIREL9CFs8?=
 =?iso-8859-1?Q?5hHCkcBlbqIt4hAiCbL2hyRc+IyHWG0goShU/AYGvGPKLLp4gcAzHI2eYh?=
 =?iso-8859-1?Q?xR7xFbKRzg/0JV0yy7hLsKcvy1HmgL3D6j3g7ahcZgVT/1/zZRb6sDBRg+?=
 =?iso-8859-1?Q?exU2UJhMG/w3DmJcGEKJXZH+50Z5l9hlCUuq+HhdyLnLvmrZ/HipjWlO4z?=
 =?iso-8859-1?Q?tb2DpsLEpT3vDcM0LVIsvTN2IgqpQka1QNBqW3fCKkPadvgdk0h9GfatIx?=
 =?iso-8859-1?Q?AaI7m9AXd1DGHniNwdsRXRtLSpvmVGwDjZPqVWMg5P27HED+Uci2Do/Ykr?=
 =?iso-8859-1?Q?8kqH313KcQLnpJEomGGP9kmVEziWgcHPt1S+oXnFG94MKd/aWPRLmU+G7v?=
 =?iso-8859-1?Q?BU23E2DDDUGT+ZmYsfq6Yq6RVPk2ev5NvTDcBIjP2Tx8So49+9lGV00CFG?=
 =?iso-8859-1?Q?AlsJS91Xz0VwbYACWM0rXrSJYbqBbY7OCQtzY3oxdTJIf/mrSMDyrN/SR7?=
 =?iso-8859-1?Q?k9G0aWVP5tCjE7+QZOsF7eJwjGRhN9Gti+eER7gGFchznNLySFs7mhvGsU?=
 =?iso-8859-1?Q?C29f2r0OK6WcF+1KjzyPntwv6QTc1MLM8BM2sOw2cEO4zuUoNqYnFlv2Lp?=
 =?iso-8859-1?Q?4j2aCUeGwUxYkBZG6THFr+br2bL9jhdpsI1z13MfLnkTE1bXEYkqtaGqsv?=
 =?iso-8859-1?Q?UYZ1P90N0coUHAzqSz5vQORJHOzCMvWXe2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f0df7705-de93-4cdb-5012-08da8f128013
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 07:44:44.6654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okNLlO5jJeMvFvBmvIyhtysbK5VGCvS4ECReQD5wKDxyOEyh2wQJgeVD/F3f4Mlci6eG2CLurQ+6HhSITlBMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6241

>On Sun, Sep 04, 2022 at 02:37:32PM +0000, Czerwacki, Eial wrote:=0A=
>> Greetings,=0A=
>>=0A=
>> while working on a driver, I've found a bug that I'm unable to understan=
d.=0A=
>> I assume that I'm doing something wrong. here is my reduced c file:=0A=
>=0A=
>Other minor things now that my coffee has kicked in:=0A=
>=0A=
>> /* modules info */=0A=
>> #define DEVICE_NAME "vSMP"=0A=
>> #define DRIVER_LICENSE "GPL v2"=0A=
>> #define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
>> #define DRIVER_DESC "vSMP hypervisor driver"=0A=
>=0A=
>For things that you only ever use once, no need for a #define.=0A=
sure=0A=
=0A=
>=0A=
>> #define DRIVER_VERSION "0.1"=0A=
>=0A=
>drivers never have versions once they are merged into the kernel tree,=0A=
>just drop it.=0A=
acked=0A=
=0A=
>=0A=
>>=0A=
>> #define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011=0A=
>>=0A=
>> #define ROOT_SYFS_FOLDER "vsmp"=0A=
>> #define DEVICE_ATTR_NAME(_name_) &dev_attr_##_name_ .attr=0A=
>=0A=
>That's very very odd, don't do that.=A0 Spell it out so that it makes=0A=
>sense what is happening, otherwise this looks like a driver-core #define=
=0A=
>that I had never known was there.=A0 Turns out it wasn't there :)=0A=
will do=0A=
=0A=
>=0A=
>> #ifndef sysfs_emit=0A=
>> #define sysfs_emit sprintf=0A=
>> #endif // sysfs_emit=0A=
>>=0A=
>> MODULE_LICENSE(DRIVER_LICENSE);=0A=
>> MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
>> MODULE_DESCRIPTION(DRIVER_DESC);=0A=
>> MODULE_VERSION(DRIVER_VERSION);=0A=
>>=0A=
>> #define MAX_LABEL_LEN 81=0A=
>>=0A=
>> struct data {=0A=
>>=A0=A0=A0=A0=A0=A0 char version[MAX_LABEL_LEN];=0A=
>>=A0=A0=A0=A0=A0=A0 struct pci_dev *pdev;=0A=
>>=A0=A0=A0=A0=A0=A0 struct kobject *kobj;=0A=
>=0A=
>Think about which structure is going to own this data.=A0 You have=0A=
>pointers to 2 reference counted objects, yet no reference count on this=0A=
>object.=A0 So who controls the lifespan of it and how?=0A=
>=0A=
the kobj ptr is just for the link I've mentioned in the other mail.=0A=
as for pdev, I assume that I can get the bars somehow from the device struc=
t right?=0A=
=0A=
>> };=0A=
>>=0A=
>> static ssize_t version_show(struct device *dev, struct device_attribute =
*attr,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 char *buf)=0A=
>> {=0A=
>>=A0=A0=A0=A0=A0=A0 struct data *d =3D dev_get_drvdata(dev);=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 return sysfs_emit(buf, "%s\n", d->version);=0A=
>> }=0A=
>>=0A=
>> DEVICE_ATTR_RO(version);=0A=
>>=0A=
>> static int populate_version(struct data *d)=0A=
>> {=0A=
>>=A0=A0=A0=A0=A0=A0 int ret_val;=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 snprintf(d->version, sizeof(d->version) - 1,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "%u.%u.%u.%u", 1,2,3,4);=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 ret_val =3D sysfs_add_file_to_group(d->kobj, DEVICE_AT=
TR_NAME(version), NULL);=0A=
>=0A=
>Just call sysfs_create_file(), don't add a file to a group like this.=0A=
>=0A=
>If you want a named group, then statically create it ahead of time with=0A=
>a name, which makes this all much simpler.=0A=
>=0A=
>In fact, never call any "create_file()" function, use lists of attribute=
=0A=
>groups as the driver core handles them automatically for you, no need to=
=0A=
>manually add or remove or anything else.=A0 Much simpler and easier for a=
=0A=
>driver writer to use instead of having to have the same error handling=0A=
>logic everywhere.=0A=
you are correct, I don't know why I decided to treat the parent folder as g=
roup.=0A=
will use that, thanks=0A=
=0A=
>=0A=
>>=A0=A0=A0=A0=A0=A0 if (ret_val) {=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&d->pdev->dev, "Failed=
 to create version entry, error (%d)\n",=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret_va=
l);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>>=A0=A0=A0=A0=A0=A0 }=0A=
>>=A0=A0=A0=A0=A0=A0 dev_info(&d->pdev->dev, "version is %s\n", d->version)=
;=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 return ret_val;=0A=
>> }=0A=
>>=0A=
>> static const struct pci_device_id vsmp_pci_table[] =3D {=0A=
>>=A0=A0=A0=A0=A0=A0 { PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL)=
, 0, },=0A=
>>=A0=A0=A0=A0=A0=A0 { 0, }, /* terminate list */=0A=
>> };=0A=
>>=0A=
>> static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_i=
d *id)=0A=
>> {=0A=
>>=A0=A0=A0=A0=A0=A0 struct data *d;=0A=
>>=A0=A0=A0=A0=A0=A0 int ret_val =3D 0;=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 d =3D devm_kzalloc(&pci->dev, sizeof(*d), GFP_KERNEL);=
=0A=
>>=A0=A0=A0=A0=A0=A0 if (IS_ERR(d))=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(d);=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 d->pdev =3D pci;=0A=
>>=A0=A0=A0=A0=A0=A0 pci_set_drvdata(pci, d);=0A=
>>=A0=A0=A0=A0=A0=A0 d->kobj =3D kobject_create_and_add(ROOT_SYFS_FOLDER, &=
d->pdev->dev.kobj);=0A=
>=0A=
>That's a crazy pointer chain there.=0A=
>=0A=
>Never add a "raw" kobject to a struct device as you then just broke the=0A=
>tree and userspace will never know it is there so userspace tools and=0A=
>libraries can't see it unless they manually walk the sysfs tree (and you=
=0A=
>really don't want them doing that.)=A0 With what you did here, this object=
=0A=
>is now invisible to libudev so no library will see it :(=0A=
that is the root of my issue, right?=0A=
=0A=
>=0A=
>=0A=
>>=A0=A0=A0=A0=A0=A0 if (!d->kobj) {=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(d);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&d->pdev->dev, "Failed=
 to create vSMP sysfs entry.\n");=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>>=A0=A0=A0=A0=A0=A0 }=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 ret_val =3D sysfs_create_link(hypervisor_kobj, d->kobj=
, ROOT_SYFS_FOLDER);=0A=
>=0A=
>Again, no need to ever create a link here.=A0 symlinks are usually for=0A=
>pointing to attributes of something (driver, device, etc.) or for when=0A=
>we have messed up in the past and had to move an object somewhere else=0A=
>and keep userspace from breaking by adding a link so that tools continue=
=0A=
>to work properly.=0A=
>=0A=
>Don't create links to start with for no good reason.=A0 And if you do,=0A=
>document the heck out of it so we understand why.=0A=
I understand, as said in the other mail, the link is for easy access to the=
 data like=0A=
block devices can be found under /sys/block=0A=
=0A=
>=0A=
>>=A0=A0=A0=A0=A0=A0 if (ret_val) {=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kobject_del(d->kobj);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kfree(d);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&d->pdev->dev, "Failed=
 to link obj to hypervisor, error (%d)\n", ret_val);=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret_val;=0A=
>>=A0=A0=A0=A0=A0=A0 }=0A=
>>=0A=
>>=A0=A0=A0=A0=A0=A0 populate_version(d);=0A=
>=0A=
>No error handling :)=0A=
right, thanks!=0A=
=0A=
Eial=
