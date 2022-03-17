Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A34352
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 14:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOMiSTA3sAk0VSqrjhntVZjdGpl7nfwf1iq35wUFWD8P+DgV/jnRChJHL5/+kad9ISRSm2B9+Qb7RuypwFzzStp4EsRp4cU75DsV8msBR/iq8E9e2d5SSTEe2nLefJh2SvUc3e8YTB5i0WiHLzTC2oJMXcCsRra0Q3GdWGd4Si/AWEhLHUHG0kI6lYE0/uOl/Hdjqli6TCr8F7Qdsf/6CHBIPnMwhRTNtcojqt5ZXLyLakIoC35Z5e+8NcL34sbb8HLfwAGHLFq3qvcD+HMVB7ou98ILMS/tYYcu5Ql8caqSQ09S3oC3QHwR83/b4sbrpwRYPI/tTJohFXDvqnz/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcGeRkCyO+QUa0+vv8YOWfMdrGbFaVe7AXB7fodTd0I=;
 b=g2/2/dxSP9CGv3z0pclyFAXJ6RF16t8AbmyWsjvc7jR1nO1zgpT9cAWZR2JUcD/phUJxT2Kk0UW3QKuiXPeLP9tdtcfHteuTPreW+xdvAiMwJrlMRBKqlO5aYz4DEBLzZALmB7b9OoFbpoJICXO1R/jmkXgu2hAD6FPAS+6qNGTAOrOKf5KYvm8hlcw1Z1LIMPvJOiWzO/564LIuT8p8nV3V65qE9q859EpgNlFt939zZFvenxenKdfhjqP+tJ3EPJjGH71Ocsqjcf+5JvUbati7mvThDlhkC+dkmvpetAGAUcSAElJO+iiKq0vD0xzfFBHSF1Cp3CC1KU8tBnAvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcGeRkCyO+QUa0+vv8YOWfMdrGbFaVe7AXB7fodTd0I=;
 b=kU5c3uqaA7dhVwUi3fKRtKmW9/5aoUeF0a0ToV1ralJTY2Kxc3ym7f2Nd4zUbAr+LX0vRey9AVstFuVncsWIfN+ohF0V55XCRyretl6wWyQVCVRBw7KfgMCydyfuOMtAVMCqry6D3vUIu+d8Z1FjKKsI8CSimhTCxzpQ4jfmyIL7TD7DHHdBylInXE+W9yf5iog1f8JhrpEJGSQXBQDRDJHGe5E+5F2YAZAUT1zT0gPi1Nperc6mM3Y/DkB+C5X0sTajOsdHvgeGay/FLALLwPc9J0k7szVO5GR0AbXuYlqHNDmL+PpSnpE1yU25oCKfj25DM4En+gtaiLr4+P8SZQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DBAPR02MB5976.eurprd02.prod.outlook.com (2603:10a6:10:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.32; Thu, 17 Mar
 2022 14:05:26 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 14:05:25 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDXkaAgAAeIw+AAB5tAIAAAO9q
Date: Thu, 17 Mar 2022 14:05:25 +0000
Message-ID:
 <PAXPR02MB7310A543B3B89D889D67776B81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <20220317101942.GX3293@kadam>
 <PAXPR02MB73109408A4070F19F34AD7D181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <20220317135628.GC3293@kadam>
In-Reply-To: <20220317135628.GC3293@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 5f8654bd-8033-25c9-aa3a-e335579dc9e9
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed595731-b7ca-4e44-d508-08da081f2f75
x-ms-traffictypediagnostic: DBAPR02MB5976:EE_
x-microsoft-antispam-prvs:
 <DBAPR02MB59769E6586153BF6A3AC027C81129@DBAPR02MB5976.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 H7yjAqY/qQVoqM+GovjMy4AxEMJ5Nak7Cdw9NzmpWmB2eR73WMOATXfomOGP13vkSYngLAdo6x5auEiW70xlHUhDFZ5QDP41TugPqTYs0U/EWBzdMQze60SAnXJGN1NakmBJdc9u6c6NeyUs6T9eIMsJyZvEZYNVpCsgRUB6HK3dYRm5PTpZaMD07bPQa01kRo4bYgXlOKmnv8kKJ+sMkXRsFCINLHch1xqcdaaWlkloFtlAOZTPewpOnzohsCvWwo6zdxOyVkzeqVg1vY8Qy0zFb74igw6DijwJ8DISTXFFddNhASRddN4qCb1KtY09jnQyqrYXUDm6cIiaGbzzYTHeGM3fhDFbNPGK4oKcU7lqXqhVy6J42+1xlqRjRmRULBMoTnJZEsOOfElwAfQ8zSWMlXVof1CfmDPfke88VisKAucIG/8ss73GslA+jAngLM2x1hvyIaT3k/T3l0e2VUZFrFXxxR6+IZ1dC1WZTPk+vcqsYsVhpejOaXGRmSXx+f1hBadq40wCgqhB+dNQReqRKbfK53NVNqHVksPrmre1cDtpCfdTOhCWO6PZC2UvH76soZeVw3M6kiTLDxcfRVj3Lq9ojr9w87XaMzXbKoAiO3xNaf6qwZy5dIdF5KpElmfNkdxg8K3k4Zz1KTMwYl23SX+cVP72S+IpBcbv2UvGIDih04Sq++3fHGbjStUPr+zXA7TLbCZ2cTJsz7MoHA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(83380400001)(6916009)(316002)(7696005)(6506007)(71200400001)(9686003)(2906002)(508600001)(55016003)(186003)(26005)(33656002)(76116006)(91956017)(64756008)(66946007)(38070700005)(66476007)(66556008)(4326008)(8936002)(66446008)(5660300002)(8676002)(86362001)(52536014)(38100700002)(82960400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?l8Ynhlnuy6sMQWjaBYaQrBQh29cM5Iz8Iqk7TFunVpPahTfIvpAiqSanKg?=
 =?iso-8859-1?Q?JZL+Z/9+bCKTxc/8pdIL3qioX7sTS3yx/UtGZ9C3HjO5Mwwky1K5mGYxGN?=
 =?iso-8859-1?Q?cy4+jLPfbEonlrTDGPQMHlozIEStwm3mRP+hu8UfaALLM/87QsYTsE+qP9?=
 =?iso-8859-1?Q?uIDmqTH3qX02J4H++2NxlrgclvlMKuty62APNqyQHU+B0c56KXp7cHZP1v?=
 =?iso-8859-1?Q?/DdDfdJNCyTZ2fs7vD0Uul8JvaRnUSR7kTtLl+I2NLyZEZauFj1mJ1VW5b?=
 =?iso-8859-1?Q?DLfKDTyS7v2gpgmY4aLhQbuhl6cxFHZoa3eFnVhud8jVoJlolnFrKeR2ed?=
 =?iso-8859-1?Q?ugyzfsmihw2Hh5rM8q+iwJ45xZ2Hr5C8ZVrZozAZj8RzEL7gQL8v/b+9Rn?=
 =?iso-8859-1?Q?CIOOM5TzmYJuR3ZmW0ODY9Q3fkNCm/YbRnmG+E8YWE9YQlmPjRjpFd42Cf?=
 =?iso-8859-1?Q?3k4vYW55F8+wCPcT/36Xk4rgyMYUmphGvUpRADxBNSKN516vZX27B9nJ7T?=
 =?iso-8859-1?Q?0ktynwcI+FQGUxhsZR/oaP9Ybr0bYoVEjOk/JQmIEF8r/l8Ma8U9cYjJRb?=
 =?iso-8859-1?Q?lonKsk1G/kPGoYbX9Y202aFv25K83rA9cs+cgl3x2YUSzqxvSx+1k0Mf05?=
 =?iso-8859-1?Q?e9GnVUAMhpyXeHn6JUKm0wdBsiWZyVfrTf/U4Q9EwnT7dT8wQDj2Qzkvme?=
 =?iso-8859-1?Q?Y3ngc3YAtfitkakekOCumprh94HM6p1zJDibHacS5/7l0KM++6c8FJGu7y?=
 =?iso-8859-1?Q?YYrkxLqV0q1LTVLCPdBYZUZw5/e3vVXQtdi9frLpWSIswAhqOuPI1DLaGj?=
 =?iso-8859-1?Q?gBf7qDbe/8s/df5Q1MbjNztShAKabXv9EtS4AKpXTn8X1OPrUBD6SU1KBI?=
 =?iso-8859-1?Q?PK6wM0CmtTaB0kBcW6CMp9Xe1nWE7JKEWEk40CTvna+RE9jEBDDw2186fj?=
 =?iso-8859-1?Q?PLx+7vuHPhu0toya8kiYk5A2VJnoFaC9RrNLpMqH11ATTai4dMxhDdU4FT?=
 =?iso-8859-1?Q?c5Bm2M9MiYEJkdZS7woTNkQR9q+5wczslkX55nHydece60QTEJyl/eEJO3?=
 =?iso-8859-1?Q?B7yRYiSxrTfKKTdX8VPeJLO948B09Y/zWLm8LUWS3bmFtjBrhZxrbHM5Qc?=
 =?iso-8859-1?Q?49NhRLATdx7i0xn3T7oXO9Bf6evPOcTGlAWt3zJ+k2kgrzYbqg1OSLd62O?=
 =?iso-8859-1?Q?A/pVRbUQve/tiyygGn4CJM4ayQbm+4rrkKcaBaZtotw9Lb1TY0KhX6/qAq?=
 =?iso-8859-1?Q?auWie/w4DdPZtR1xJdAb7UDwV/K41MiSwUGp4/abC0X03JrREVgOrzl858?=
 =?iso-8859-1?Q?THYpheBW5Chw7PpuWhrNdc4/4HyE6BMsIjKAjoq0ptwswHOsyTe32K9Xsd?=
 =?iso-8859-1?Q?dOlyfbjWMM48bGDDHNXUOO9/CjQZjWuuM6oOnsMPb4drSYmyucGhynUI9l?=
 =?iso-8859-1?Q?aKAHX9R1ifPuCN7Y2TCAOtafRJ9LJN8YwRnxnrlrceOnkaLGRG0XBMFuzB?=
 =?iso-8859-1?Q?xEhkKCvA8vN8Vsq3+R+vcL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed595731-b7ca-4e44-d508-08da081f2f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 14:05:25.8981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvUPqMc9vInyaNKS0G8UhWXmjPZ0Vkf9pBGZ0Kr8UPrl/QDqeQT9E/P0dOWihxMHNi8XdU/2w0vIw/RZoRp84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB5976

>On Thu, Mar 17, 2022 at 01:41:30PM +0000, Czerwacki, Eial wrote:=0A=
>> >> +     printk(KERN_INFO "mapping bar 0: [0x%llx,0x%llx]\n",=0A=
>> >> +            mapped_bars[0].start, mapped_bars[0].start + mapped_bars=
[0].len);=0A=
>> >> +     cfg_addr =3D ioremap(mapped_bars[0].start, mapped_bars[0].len);=
=0A=
>> >> +=0A=
>> >> +     if (!cfg_addr) {=0A=
>> >=0A=
>> >Delete the blank link between the call and the error checking.  They ar=
e=0A=
>> >part of the same thing.=0A=
>> did you meant line?=0A=
>> =0A=
>=0A=
>What I mean is that it's like paragraphs.=0A=
>=0A=
>        cfg_addr =3D ioremap(mapped_bars[0].start, mapped_bars[0].len);=0A=
>        if (!cfg_addr)=0A=
>                return -ENOMEM;=0A=
>=0A=
>The call and the check go together.=0A=
you are correct=0A=
=0A=
>=0A=
>> >=0A=
>> >> +             printk(KERN_ERR=0A=
>> >> +                    "failed to map vSMP pci controller at %x:%x.%x, =
exiting.\n",=0A=
>> >> +                    vsmp_bus, vsmp_dev, vsmp_func);=0A=
>> >> +             return -1;=0A=
>> >> +     }=0A=
>> >> +=0A=
>> >> +     return 0;=0A=
>> >> +}=0A=
>> >> +=0A=
>> >> +/* exported functions */=0A=
>> >> +=0A=
>> >> +/**=0A=
>> >> + * read a value from a specfic register in the vSMP's device config =
space=0A=
>> >> + */=0A=
>> >> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size=
_type type)=0A=
>> >=0A=
>> >=0A=
>> >Use u64 when 64 bit types are intended.=0A=
>> >=0A=
>> >> +{=0A=
>> >> +     unsigned long ret_val;=0A=
>> >=0A=
>> >=0A=
>> >u64 ret_val;=0A=
>> sure=0A=
>> =0A=
>> >=0A=
>> >> +=0A=
>> >> +     switch (type) {=0A=
>> >> +     case VSMP_CTL_REG_SIZE_8BIT:=0A=
>> >> +             ret_val =3D readb(cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     case VSMP_CTL_REG_SIZE_16BIT:=0A=
>> >> +             ret_val =3D readw(cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     case VSMP_CTL_REG_SIZE_32BIT:=0A=
>> >> +             ret_val =3D readl(cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     case VSMP_CTL_REG_SIZE_64BIT:=0A=
>> >> +             ret_val =3D readq(cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     default:=0A=
>> >> +             printk(KERN_ERR "unsupported reg size type %d.\n", type=
);=0A=
>> >> +             ret_val =3D (unsigned long)(-1);=0A=
>> >=0A=
>> >=0A=
>> >64 bit types.  "ret_val =3D -1ULL;"=0A=
>> >=0A=
>> >=0A=
>> >> +     }=0A=
>> >> +=0A=
>> >> +     dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%lx from reg 0x%x of %d=
 bits\n",=0A=
>> >> +             __func__, ret_val, reg, (type + 1) * 8);=0A=
>> >> +     return ret_val;=0A=
>> >> +}=0A=
>> >> +EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);=0A=
>> >> +=0A=
>> >> +/**=0A=
>> >> + * write a value to a specfic register in the vSMP's device config s=
pace=0A=
>> >> + */=0A=
>> >> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,=0A=
>> >> +                        enum reg_size_type type)=0A=
>> >> +{=0A=
>> >> +     switch (type) {=0A=
>> >> +     case VSMP_CTL_REG_SIZE_8BIT:=0A=
>> >> +             writeb((unsigned char)value, cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     case VSMP_CTL_REG_SIZE_16BIT:=0A=
>> >> +             writew((unsigned short)value, cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     case VSMP_CTL_REG_SIZE_32BIT:=0A=
>> >> +             writel((unsigned int)value, cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     case VSMP_CTL_REG_SIZE_64BIT:=0A=
>> >> +             writeq(value, cfg_addr + reg);=0A=
>> >> +             break;=0A=
>> >> +=0A=
>> >> +     default:=0A=
>> >> +             printk(KERN_ERR "unsupported reg size type %d.\n", type=
);=0A=
>> >> +     }=0A=
>> >> +=0A=
>> >> +     dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%x to reg 0x%x of %u b=
its\n",=0A=
>> >> +             __func__, reg, reg, (type + 1) * 8);=0A=
>> >> +}=0A=
>> >> +EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);=0A=
>> >> +=0A=
>> >> +/**=0A=
>> >> + * reag a buffer from a specific offset in a specific bar, maxed to =
a predefined len size-wise from the vSMP device=0A=
>> >> + */=0A=
>> >> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int =
offset,=0A=
>> >=0A=
>> >This is unsigned int but it returns zero or negative error codes.=0A=
>> >=0A=
>> >Create a separate function for "halt_on_null".  It will be cleaner that=
=0A=
>> >way.=0A=
>> I'll refractor this code properly.=0A=
>> =0A=
>> >=0A=
>> >> +                                  char *out, unsigned int len,=0A=
>> >> +                                  bool halt_on_null)=0A=
>> >> +{=0A=
>> >> +     unsigned char __iomem *buff;=0A=
>> >> +=0A=
>> >> +     BUG_ON(!mapped_bars[bar].start);=0A=
>> >> +     BUG_ON(ARRAY_SIZE(mapped_bars) <=3D bar);=0A=
>> >> +     BUG_ON((offset + len) > mapped_bars[bar].len);=0A=
>> >> +=0A=
>> >> +     buff =3D ioremap(mapped_bars[bar].start + offset, len);=0A=
>> >> +     if (!buff)=0A=
>> >> +             return -ENOMEM;=0A=
>> >> +=0A=
>> >> +     if (halt_on_null) {=0A=
>> >> +             int i;=0A=
>> >> +             unsigned char c;=0A=
>> >> +=0A=
>> >> +             for (i =3D 0; i < len; i++) {=0A=
>> >> +                     c =3D ioread8(&buff[i]);=0A=
>> >> +                     if (!c)=0A=
>> >> +                             break;=0A=
>> >> +                     out[i] =3D c;=0A=
>> >=0A=
>> >Copy the NUL terminator to out[i] before the break.=0A=
>> >=0A=
>> should I memset out to zero instead?=0A=
>=0A=
>Right now you're relying on the caller to set the NUL terminator and=0A=
>that's ugly.  Just do:=0A=
>=0A=
>                for (i =3D 0; i < len; i++) {=0A=
>                        c =3D ioread8(&buff[i]);=0A=
>                        out[i] =3D c;=0A=
>                        if (!c)=0A=
>                                break;=0A=
>=0A=
>=0A=
I think I've tried your suggestion and it didn't went well, I'll retry it.=
=0A=
=0A=
>> =0A=
>> >> +             }=0A=
>> >> +     } else=0A=
>> >> +             memcpy_fromio(out, buff, len);=0A=
>> >> +=0A=
>> >> +     iounmap(buff);=0A=
>> >> +=0A=
>> >> +     return 0;=0A=
>> >> +}=0A=
>=0A=
>[ snip ]=0A=
>=0A=
>> >> +static ssize_t version_read(struct file *filp, struct kobject *kobj,=
=0A=
>> >> +                         struct bin_attribute *bin_attr,=0A=
>> >> +                         char *buf, loff_t off, size_t count)=0A=
>> >> +{=0A=
>> >> +     ssize_t ret_val =3D vsmp_generic_buff_read(&op, 0,=0A=
>> >> +                                              vsmp_read_reg32_from_c=
fg(VSMP_VERSION_REG),=0A=
>> >> +                                              buf, off, count);=0A=
>> >=0A=
>> >Don't put functions which can fail in the declaration block.=0A=
>> >=0A=
>> >        ret_val =3D vsmp_generic_buff_read(&op, 0,=0A=
>> >                                         vsmp_read_reg32_from_cfg(VSMP_=
VERSION_REG),=0A=
>> >                                         buf, off, count);=0A=
>> >=0A=
>> can you explain what is the reason behind this recommendation?=0A=
>> =0A=
>=0A=
>That's just my own preference, not really a rule.  I stole that=0A=
>guideline from someone else.  I forget who.  But it's a fact that the=0A=
>declaration block is more bug prone than other code.  (Very clean in=0A=
>static analysis results).  Plus it means that you put a blank line=0A=
>between the call and the check which I do not like (again just my=0A=
>preference).=0A=
>=0A=
>=0A=
>> >> +=0A=
>> >> +     if ((ret_val !=3D -ENOMEM) && ((ret_val !=3D -EINVAL)))=0A=
>> >=0A=
>> >Don't test for specific error codes.=0A=
>> >=0A=
>> >        if (ret_val < 0)=0A=
>> >                return ret_val;=0A=
>> >=0A=
>> >=0A=
>> now I understand, there was a patchset which fixes for all the -1 and th=
e specific ret_val testing, I see it=0A=
>> was misplaced at some point of the work.=0A=
>> thanks for pointing it out=0A=
>> =0A=
>> >> +         buf[ret_val++] =3D '\n';=0A=
>> >> +=0A=
>> >> +     return ret_val;=0A=
>> >> +}=0A=
>> >> +=0A=
>> >> +struct bin_attribute version_raw_attr =3D __BIN_ATTR(version, FILE_P=
REM, version_read, NULL, VERSION_MAX_LEN);=0A=
>> >> +=0A=
>> >> +/**=0A=
>> >> + * retrive str in order to determine the proper length.=0A=
>> >> + * this is the best way to maintain backwards compatibility with all=
=0A=
>> >> + * vSMP versions.=0A=
>> >> + */=0A=
>> >> +static int get_version_len(void)=0A=
>> >> +{=0A=
>> >> +     unsigned reg;=0A=
>> >> +     char *version_str =3D kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __G=
FP_NOWARN);=0A=
>> >=0A=
>> >VERSION_MAX_LEN is 524288 bytes.  That's too long.  Create a small=0A=
>> >buffer and loop over it until you find the NUL terminator.  Why does=0A=
>> >this need to be ATOMIC, are we holding a lock?  Hopefully if we can fix=
=0A=
>> >the length the __GFP_NOWARN will be unnecessary.=0A=
>> I'm not sure it is possible to loopover, I'll take that into considerati=
on.=0A=
>> in this flow, only one access is possible, so I assume GFP_ATOMIC is not=
 needed=0A=
>> =0A=
>=0A=
>This get_version_len() is cray cray...  It needs to loop.=0A=
it all depends on the hypervisor's implementation below, I think loop over =
can be used but I'll need to check=0A=
=0A=
>=0A=
>> >=0A=
>> >> +=0A=
>> >> +     if (!version_str)=0A=
>> >> +             return -1;=0A=
>> >> +=0A=
>> >> +     reg =3D vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);=0A=
>> >> +     memset(version_str, 0, VERSION_MAX_LEN);=0A=
>> >> +=0A=
>> >> +     if (vsmp_read_buff_from_bar(0, reg, version_str, VERSION_MAX_LE=
N, true)) {=0A=
>> >> +             printk(KERN_ERR "failed to read buffer from bar\n");=0A=
>> >> +             return -1;=0A=
>> >> +     }=0A=
>> >> +=0A=
>> >> +     version_raw_attr.size =3D strlen(version_str);=0A=
>> >=0A=
>> >get_version_len() should return the length instead of setting a global.=
=0A=
>> do you mean version_raw_attr.size =3D get_version_len()?=0A=
>> =0A=
>=0A=
>Yes, but with negative error codes.=0A=
ok=0A=
=0A=
>=0A=
>> >=0A=
>> >> +     kfree(version_str);=0A=
>> >> +=0A=
>> >> +     return 0;=0A=
>> >> +}=0A=
>> >> +=0A=
>> >> +/**=0A=
>> >> + * register the version sysfs entry=0A=
>> >> + */=0A=
>> >> +int sysfs_register_version_cb(void)=0A=
>> >> +{=0A=
>> >> +     if (get_version_len()) {=0A=
>> >> +             printk(KERN_ERR "failed to init vSMP version module\n")=
;=0A=
>> >> +             return -1;=0A=
>> >> +     }=0A=
>> >> +=0A=
>> >> +     if (!vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {=0A=
>> >=0A=
>> >This if statement is reversed so this code can never work.=0A=
>> not sure I follow, can you explain?=0A=
>> =0A=
>=0A=
>The vsmp_init_op() function returns zero on success and this code treats=
=0A=
>success as failure.=0A=
weird, I'll check it out.=0A=
=0A=
>=0A=
>> >=0A=
>> >> +             printk(KERN_ERR "failed to init vSMP version op\n");=0A=
>> >> +             return -1;=0A=
>> >> +     }=0A=
>> >> +=0A=
>> >> +     return vsmp_register_sysfs_group(&version_raw_attr);=0A=
>> >> +}=0A=
=0A=
Thanks,=0A=
=0A=
Eial=
