Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30081.outbound.protection.outlook.com [40.107.3.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F37B
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 12:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZNswybCHJFKG9D2nIIh8xA9dS/w00SdhM+A2O1tMmgCBNdu1emWX1Xy4kFEiEnKk/k6QpnrDApKIhToonqtvhfmsxaD7kjx40JH/fIKCQdNGFSgovKrc3Elu5sKDlcP1CDSKIZVR5bYvluP0942OWz1f3cZT3zdY1p9bKGE2PAa5jknsN7lJpsPqm4POhjMw3NSRKDErpEaGcuUM3ONp1Yy8zhXRDitGRPQyJRaooxB9cStyGl9Ia/FMVtVCXOqSrTYJfjnqeP9A4d9uoSWq4tgYMi3B8JmAPYGez/9kYcbtiCw/dgFJ8+N+W43Nf2ysBediVDbqFYZ8QtuVGX9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULHi1QRKvdfx6w33wY+NqvzoQsOUHIjhXoyhFBjbvDQ=;
 b=mu5uTLySNUbOCddKeyNGrbbTf1979ywvEsEUtj95KxP7pP2myHGclEWOiDp9c3jQEtbj/Se1eu9UoyM7DKkWsuNvdHkSNclpHM5Acj4ovOdZMyLmaVV2SycoWleRADjCOa1ePA+6cl0UnBkWkAc6QTMd7w2Y+bq422KVa/rLgPbT+TEiOftrMRLDWMJTIa+zxq1Fsr7RTiLzqFSGih592RzqxriovOd5efoMu2jFvaBpW5NHzHxltxhCiJmAIHcA5MMXoeNVlPfEdKq38PNVfdt2GT+LlBfpLEMflm/6VCwgjydF9tBy81gmp6/Zlb4ycS7vNCkjOekq+aUv2vZp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULHi1QRKvdfx6w33wY+NqvzoQsOUHIjhXoyhFBjbvDQ=;
 b=plAFZeC9+TFCW7KGpkVHS3w8HCIdZw5QHrm/L6GsWu1oXjCptFCNHpjoX+eo+yTtFgECZWM7xTl45sBe88bkRgIphiYslq/lEIk3iwwp1dw/dn7tWJbVltZFAcQw6r8Wqld2hDT6O102SFPRMZizYuXajT0FXzjSBV72wYTyNLKtGKXhi4cW4tmKTeQBq0UERO6Gp7vX8Kc+frGWDkrP8OpDTBtbmzovxSpL04HM1C5k242c+3Tnh4qMNPwrHhwWZAYFL4VP0K91/WtKedCaUdN+yiuaSntpjqji96HgoPEdhhS7z6e92UcXub527oUGxaCrk8cJYdjVr1jYDgJUxQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB4PR02MB8776.eurprd02.prod.outlook.com (2603:10a6:10:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 12:25:46 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 12:25:46 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Thread-Topic: [RFC V2] drivers/virt/vSMP: new driver
Thread-Index: AQHYV8TvbsysO1IV902JKnQurGWPjKz/EjAAgAMGedeAAATTgIAABCnE
Date: Tue, 26 Apr 2022 12:25:46 +0000
Message-ID:
 <PAXPR02MB731092ED551723121DA2071281FB9@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YmVTTvQBSd5nzN3k@kroah.com>
 <PAXPR02MB7310B471C4AFAE6FCC2D26DF81FB9@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YmfhB6fTTNNS+HYv@kroah.com>
In-Reply-To: <YmfhB6fTTNNS+HYv@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: db017781-6b51-9fe3-8412-409f2158c04e
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9771f086-6eaa-49a3-d28e-08da277fe3fb
x-ms-traffictypediagnostic: DB4PR02MB8776:EE_
x-microsoft-antispam-prvs:
 <DB4PR02MB8776238CCFDF767CA3B22B4B81FB9@DB4PR02MB8776.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 b45NLRog9foXJVgnHU6rsdlcbf3YkZbjZDiK+zJLT4P7pSDZXXACJUuuy41SV3rLjvNHtlHcnE2fn00ODKix5zwJqTu0F74fELF2wJqSipczKoS66psKtXpwEy7acL9pKLfyvsktb+/6Zr99get8m+PhTir0O0R0zkpMR4fVQfcXc6U8A131A+WjnRpC2pnPbOt4BpYzxRfJKA8WB0X9lH3otioFdOdeI0L3vOvR9nRujWgtc3aMIOriDU9tPFZr7rMqAxb/GgCMK3OvEmfQGvYzl21GDyCkQAgzi9FdIXw7ZjtAa/QvWF3XtJdJtKH+g9AQNpME5akBUdwmlLBZhUlXY2Gioj2Zbf/wtQIW8ue64cuWehQacpKqz33IQtAuC7gZnIopzG2VRNvdiwAOpUXv42mYfkrTlZ68UFdlpCfOpdTrnIqEwAypiclFIihABycEJ8JmYtc+yvGS+GXNXzX52tCHpYMQQZiCjzKmc5VxterCHNYbMgFnFFrdB7NEPbW0ttezfP4kJCGX9AH2sPI3M8M0ZPpm4JFCMkNMVdLI/z4ZQ5WQHMZMLEWuHqxuWUMSoz4CZ/msMxiOrItaA1YoXaIKuEXTuxTPVtxSK77EKuxuc+2sfkM1qFxZgeirmH1XifraivdDL+vsMEECgbhLfBi1tLOg5sm5cCzPKqaBOi6sg6Ev4HfIpxCvMLZXIlkQM++oKYtowUxbVILEEA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(76116006)(55016003)(52536014)(8936002)(91956017)(8676002)(71200400001)(64756008)(66446008)(66476007)(9686003)(66946007)(2906002)(6506007)(5660300002)(186003)(66556008)(4326008)(33656002)(7696005)(38100700002)(38070700005)(82960400001)(316002)(54906003)(122000001)(86362001)(508600001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kno30qgJM8QunzZFGzl2VwprADAddYXopP+lIPiHq4a6XqMzLy0DmtNG7T?=
 =?iso-8859-1?Q?OBhOd5WsX6BV/yHnkqRu/EX+y7ykM20RZefPuzYhglgp5VUxk7nc7LfQY+?=
 =?iso-8859-1?Q?9MtdqdYt9NqVG6gL4tJheC+HDIx1C1CeKTtrEcuosnvGdS4DJ50npN4rLg?=
 =?iso-8859-1?Q?Rhi1RCvixhUKAeMGcpWQ9E4yUNOoUub/4dJIwC9WJHHR2QVdvzzxOA19bI?=
 =?iso-8859-1?Q?ceWr83L6avc86v/GKmWdqwAbhDKOXHL7dMUP8Fsbx/1i87pyyVhBaHf6Wz?=
 =?iso-8859-1?Q?e79qjODkKkcvBs72OGmlvpov5x8fsuNCCIU8gpZfS1+4B0DM7v9OtSsU2c?=
 =?iso-8859-1?Q?dON+VKU4bV4nDj617Z8fVm611gkjLGzKnSKxaHZR15DNGdIXpCr7coRWQt?=
 =?iso-8859-1?Q?YMV736GN5jw4B/xlsPj5uHl0CgUNKldUPRap6K4OpWzhSQhS4E54z0ZEE8?=
 =?iso-8859-1?Q?45QMoCGtKw0NPFjB8vKmPn32lFQH7GreqxrZF5+YvS0Qd13iGuCm6YrquD?=
 =?iso-8859-1?Q?eF99oJUdiK5JNrv/oDNnx2N/3AHv+EVqoowP1A7G5rfVWMRiQXBF3mw7yJ?=
 =?iso-8859-1?Q?namAIYS/WOqHUZEPSGyTkHtX+8+0UvDbboBl1KqXA3F3Qy89eMuem/IRrb?=
 =?iso-8859-1?Q?FJ58YaSJ+omQmYtT+unVisj8O1z1UoWt4ncUCU6XdB49ggcYXh0shhBqCQ?=
 =?iso-8859-1?Q?UKX39ceu0cn0BobtPtPunXguHTXNo9Q4IO4+2qZgrUTpFT/a8htb//Xbh7?=
 =?iso-8859-1?Q?3QODoQWUGoA6bJk9h49Vu8E3Oj6ukiwxdiu4mvn8aUubT2L4M4jdEZnV5Y?=
 =?iso-8859-1?Q?ahaI135YZQ/TjM/bH+I3Zjm+Yyf/hZAdx6y5suJO0QuaZWXtPReqCBaoeg?=
 =?iso-8859-1?Q?2lanJ9lAKmiWyEkjhTeESHfMTq5mA+9PAYsoU3k+HcUY8CWuXOQ3PEqz78?=
 =?iso-8859-1?Q?Vws+oe6g91OZ/mpyV/emfSlHdd0+SvOwARQhYicKU/9k9u6Eq7JseGcRBB?=
 =?iso-8859-1?Q?QDlY77SzKfcbzQeo5N2aX5U+RL1NXdZRw/GiwIowiL3XvWsH3lcmrlkYy2?=
 =?iso-8859-1?Q?5NM4tJMs6dKZCXdeVNevkSB5AfqcproqMoIiS+gH7jYeyQGloGfkM3LTOu?=
 =?iso-8859-1?Q?zr7+xJEigxTCRj2Dxsfv27/b9tJ7Hnh8pNilRun5E5/tSNBuPcaAlnSHn7?=
 =?iso-8859-1?Q?1AkImHvaflEppRYA9Ox0tjghv+y+p8eOgTnqhBtAnC92rbeaA/Ul4JYZIP?=
 =?iso-8859-1?Q?C91+l1k/HBoUSFKTlUPWrXwur2YkfTTFkaAAo8pcZpE5TC4Dg8pVvoCaRM?=
 =?iso-8859-1?Q?RLesC7rqrF49/Cd3FEuWFLrew4pbCjJ5FgZTupiuWaXULQDH4h0fT/wOel?=
 =?iso-8859-1?Q?UkMHHe67W2j4IALHh05nP3NmiXs+tviIva4cWrTup65myRY4Z/FNjTCYd2?=
 =?iso-8859-1?Q?0PebV33HL+pfCBkBvkqpqrZffWVvdVpaY5S3HbMWjqPYiD8wYLTkoo3TpK?=
 =?iso-8859-1?Q?cpvQsaeozs1ToTc3fktiJA2/Mf0X6JHlAmxV1fyvVtagkn+tmnc/T882dn?=
 =?iso-8859-1?Q?+oZJz/b2ZXiSI1N/yQESw6/MZubwvVNz5pcyCy9MGh+/QWagSLPN1Zommf?=
 =?iso-8859-1?Q?+UdXnY+OTs5/V/vbmI242HIbX1FZBWruvwKC3ZJYUW151NZfcbWVExWT2L?=
 =?iso-8859-1?Q?s6EHtptXJeFp0D0SNPKeqT6GLYyvs2cVd0siVuhq+C1tW+HAm+JZTg+XDN?=
 =?iso-8859-1?Q?4iZeRP82SJlRpjYKeGT1P5uAd8SYnOrB5VbtgNO4yBp8v8hjDfososUqdA?=
 =?iso-8859-1?Q?3s4fRKq7Aw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9771f086-6eaa-49a3-d28e-08da277fe3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 12:25:46.4982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzW8Nthq8xx64wNgHTMjszNVp/+E5+/2xCpaN/mmUcht362XLRRsje/nzUmi0xLmImvHZ6m5LMXWqQ3yvVzDsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8776

>On Tue, Apr 26, 2022 at 11:58:19AM +0000, Czerwacki, Eial wrote:=0A=
>> >From: Greg KH <gregkh@linuxfoundation.org>=0A=
>> >Sent: Sunday, April 24, 2022 16:40=0A=
>> >To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>> >Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP =
vSMP Linux Maintainer <linux.vsmp@sap.com>=0A=
>> >Subject: Re: [RFC V2] drivers/virt/vSMP: new driver =0A=
>> > =0A=
>> >On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:=0A=
>> [snip]=0A=
>> =0A=
>> >> +static struct kobject *vsmp_sysfs_kobj;=0A=
>> >> +static struct pci_dev *vsmp_dev_obj;=0A=
>> >=0A=
>> >static variables are not global :)=0A=
>> >=0A=
>> >And you should not need this, again, use the proper PCI api insted.=0A=
>> >=0A=
>> [snip]=0A=
>> =0A=
>> >=0A=
>> >Do not use global data for anything, that's a huge hint that your drive=
r=0A=
>> >is incorrectly written.=0A=
>> >=0A=
>> [snip]=0A=
>> =0A=
>> >=0A=
>> >greg k-h=0A=
>> =0A=
>> I understand the logic behind that, however, I'm not sure I understand w=
hat PCI api I can use to replace such vars?=0A=
>=0A=
>pci_register_driver() is all you need.=0A=
thanks, I'll look into it=0A=
=0A=
>=0A=
>> for example for the pci_dev struct of the device or the sysfs object whi=
ch is used for the other modules=0A=
>> is there a doc on this I can be pointed to?=0A=
>=0A=
>I do not understand, why would your driver ever care about any other PCI=
=0A=
>device in the system other than the one that you are wishing to be bound=
=0A=
>to?=0A=
ahh, I understand now, the structure I want to have for the driver is incom=
patible which the existing framework as it assumes=0A=
that each module is for a specific device whereas my the structure I want t=
o have is module per feature.=0A=
I'll adjust the structure of the driver to match the framework's structure=
=0A=
=0A=
>=0A=
>> as for saving the iomapping, I assume that I should map the bar regions =
rather than having it mapped all the time, am I right?=0A=
>=0A=
>I have no context here, sorry.=0A=
I'll try to find some examples in the code, maybe someone did something sim=
ilar=0A=
=0A=
Thanks=0A=
=0A=
Eial=
