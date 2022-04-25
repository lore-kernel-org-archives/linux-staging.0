Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60076.outbound.protection.outlook.com [40.107.6.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA747C
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 13:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvuFnhLDpK1hbvsbDmghXedwsp3lBGV7OX4YdgMSlwm4NwAS7qQlmlnV9SigMgntJAusvMVyiDBXZUHPmZ3GpiRB+zHYhVQZ6Lc87ln9pF7PO8lEoahwQV8b50YzIJREzbaeoluDk7WhzZv/iAI0kJssKrxvB2aCJB4py+7cXf9RFqehfOMl2RGisR6rCFt8h44mQXkpNjC1Ap6BvpI3ZN0KSnrgG1Z61WJF8hBjap7IXMVwGkYWTNNfD3UEtjl0LQaSBmcDrUiSQDhMiMIikhsIGj8f/4Fa35dVdip0tUl15zxObQ7lAxopy5FJk+y+4DN25ruqX6huZfX5tyAxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNoRuPWy7Ro+xt2SR35sjdIYj2iHVbGHC2hUrX6LRaI=;
 b=lHFRdMGIsRyDVPdxzO7QDKHXIVZQcwdB4f3k6AbPfWjy62Op1S5WPMj4lihl8WUqywQjFueuGJqRA7gRokwRIqPkjpj2IOywc3Y4eEhS/+Vs2J8ObslVWDU786HCGiryY1HGrS6oCFtU5xIl+9FySWbXLXDR1VyO65t8fmc7f8RbY0y3BC06PMi4+Azg6m0nTUbNRMzLTSQnOZs8lYsj2eWBaH3gU1yBMrk5SiE3cc9R+jhreWcDwni9vFIfbEM7dy790swtlavxzMe8ndpkDdCSR4PmP+Tg6crgelVuU34ub+wcAMMkBQ59I6n7ZHQLvTc107rPN+MljdH45A58rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNoRuPWy7Ro+xt2SR35sjdIYj2iHVbGHC2hUrX6LRaI=;
 b=Amfkk4pwU12+fiU5YsAy7Rao9R1GLHnEm0RgkDMV50eC6erhIw7dMP+FLGYvifXBIlfqVk6ji6MX83jkvNCugXlwD3JMJooX7U9LJCQ245gDivVDyTOoJjFfwO6eNsErQ9raBFO6pAPdyI3vAhW064NUH0rQj36RS3X2zT1UJdupZqdk+8LyqaZTIXJ211K+kCrBA7pIBSyF7HprcL+1JuWFasFhEji2IgS1I0UG60eO5DTkV3CCNUF2DnZr8quwoEBcqa5Fdd/1OQFYkRK3kSQa+sQV1b0KNGBBE4Q5OkRkwUl2YWh3xc9IEO3v0U4lXBmpQMyelbSUP9juyeoloQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AS8PR02MB8615.eurprd02.prod.outlook.com (2603:10a6:20b:54d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 13:56:46 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:56:46 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Thread-Topic: [RFC V2] drivers/virt/vSMP: new driver
Thread-Index: AQHYV8TvbsysO1IV902JKnQurGWPjK0An2SAgAAJSaI=
Date: Mon, 25 Apr 2022 13:56:45 +0000
Message-ID:
 <PAXPR02MB7310E5269837139E1C5722D381F89@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <20220425132209.GO2462@kadam>
In-Reply-To: <20220425132209.GO2462@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 789791e5-98c1-60cd-9341-9c28fe8d32f9
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d546ac1-cc78-49a0-2d76-08da26c36fac
x-ms-traffictypediagnostic: AS8PR02MB8615:EE_
x-microsoft-antispam-prvs:
 <AS8PR02MB861554E42FFC9A2838D6FA0981F89@AS8PR02MB8615.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MF8epqxDjYzh2qEB9g4FyspPZjtn60v2yr+3lXWqM0EAtNQTpsIGlavuUrya4XxZWmt4ZKLdokfgn/JGwRVekilgYYCmt72lgkEFyxdcIdJjV8OccfGwjwPCFnppJUdYAjWfsnVfaxsuxGju6UDMx7PR90Rq53cL+80Waz5oJA7lnHrf9y6nbRIpbV+ltW/Hm/80mJX6K0vlpW7tekQKvRNEjndMdyQq2Nd22d7QVW23Ho8IDD2H2eyk52nsqJgENogVm1R4EoNAn4W92HFitSIfE+xI4r9smLqYNJgVbLOCAwFCCqfPcjikquk5C8J8oc9+8cl+aNj/PRNZMbEnJGhqyM1AeopKrvWzYh2bcTXX91GnGZ4ZzzD+xvZbT0UIw9PpJBrVk8amx6L09Z6tCTQ1wCw0keOQznMyEzCueKJ5GT2BKwk2J8hL8kpCvnq2+ZihE5xSEe7s+zf2Qgp+Cs3d+dY5TCFO4nU+FqPGGNT+4TsB+4ZIbSfI0OfDbdO90X9iwnNTBEvOm0PQ0VbRIwDRhfhMq65JhVCP3M0InoxELLjouYHRtjNPgwLh75ChbQ1rNSinC/zuD0/iF9YgbC1JkkJBO/kM3i5STs6b7hZsj2XMufW++0j1o4xqNQoRRPH5pgTTbVoFymkyCPOW9TkEowOshg0wrhIQvdQSfxaIVnvfev/1sIoTFopC8FdCiu8VBOIbKKFU95fcOJk4wQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(52536014)(33656002)(8936002)(508600001)(86362001)(6506007)(9686003)(4744005)(2906002)(7696005)(26005)(82960400001)(122000001)(38070700005)(38100700002)(55016003)(186003)(8676002)(66476007)(66446008)(66556008)(64756008)(54906003)(316002)(71200400001)(76116006)(91956017)(6916009)(4326008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DeSs0Q4e/+bNyzFQabqw8Ift8NQUxMBzEDPryk5ka35u4bReW9uk/dI+XI?=
 =?iso-8859-1?Q?DPBIlaDfWW83i+hmVdVfYfvum6m9Ch5XSX3JX6u8yaaEhYZXTmx0TMDi/q?=
 =?iso-8859-1?Q?ifyBZfGHxEnTk6mkP10MY+N13oQX1ngv2yz7f/Fip8qvA1HQSoklv26AJP?=
 =?iso-8859-1?Q?pcYqOHRqqgQxolx9N/DNXPrg56k4UWvtD3Z1WvjA7AZJ+7G8WmZg/53L/K?=
 =?iso-8859-1?Q?caQNjU0Yauvxh7DUlN2CwuJfCZSxrEMJKW9jvFygsgbQjpxf9vjTF64XlF?=
 =?iso-8859-1?Q?T88msv+r9GW7tz/oXqY5A6dBOE7P2tQdNnr3evoO0qX51XsVnsPHFEkJ//?=
 =?iso-8859-1?Q?8nFzXLcfofu+CZ8iGR5NE4qheAp7TrwVZCU7ZGtaCxGOyJjus127olM3Ju?=
 =?iso-8859-1?Q?A32IQsVmFBNm4qbRtnWwOnLGe3uAYPdQzRx/022bQX0wXsgwHiz/aTRM9l?=
 =?iso-8859-1?Q?gThxNHH20IdKfEcDtE2Rqj8XUCcgtVexZK27IYJHdkZkKRR8ty5jDe04Pj?=
 =?iso-8859-1?Q?5rquTSFU/MAcoJx63SNJmS/D1+SqstDeTGsQt9JPSEGYsKNN9bwgMsIMDl?=
 =?iso-8859-1?Q?utxXdHixqHsqc/WNIciuVsOI3JMITlPqEd9DoY1COChq+7v8P9c7OEJ9AU?=
 =?iso-8859-1?Q?6DQ0SxXsqCo11qPApkcmqoHh6FE1RdxXQA2Xddw9SE7zldDX2YooCWFCs1?=
 =?iso-8859-1?Q?6p5USlbxhnSkfdMdLsR6n1uFFKSqtuzdhyeP3CpWCUUvAqcITiN7JX4vns?=
 =?iso-8859-1?Q?z5Wc8XVvzdtsmnqAKQUv2t/hfavgdBlIegP9OJG3t0isuSxr2qzFwdoapQ?=
 =?iso-8859-1?Q?gqS5yuSGpRul8xSliQl1zpOqe8ipcjtPnVrzhtfSsN7ellzC+DUFReiUrC?=
 =?iso-8859-1?Q?JHIufW7cMeM/c9YRLo9fCkY5kcfdRDXOC4S0p10l2O7l2pSRSXkWo70Mzz?=
 =?iso-8859-1?Q?qvBt5CaphY/gPx5eAtrDhxMKgHgKTG4LFNImjqii7Be/Ggi3PY2Rny4oKp?=
 =?iso-8859-1?Q?xPQlvOyl44QP+XQ4SS65x3z/vRr8Kg2NYOwp/jHybAicwpzCnTKP6Mx6Z3?=
 =?iso-8859-1?Q?mnuE3BzfV2cgN+ITPIddbWPnPxQLD5ImolsTTa03/JfcJ2E90ZC0/D0lBn?=
 =?iso-8859-1?Q?bMfS16D62qcLkRoI9EVbF7H/GYuLQrKxeHgih56t0l4woNUzkBrrp5ZZ3U?=
 =?iso-8859-1?Q?jS7Vj6YmUA4TQp0soKmSOxeHZDxd6WXYN7VCTuPN5tsuWDv15s1Rta3Xfi?=
 =?iso-8859-1?Q?K29IEXuIyv98I2b8L+J4yl9ISIrY8kNoLW9MymGrh99QPfPbp60P6sJz5P?=
 =?iso-8859-1?Q?L0MiwAsCUTfN5H8ZiAYC2WCXoEl36U+fO2e5sGcPbXLydSQByPtqrULE6q?=
 =?iso-8859-1?Q?Yg8ArBjk8aU8IgWAVnI50TUWY6p61gOnJWw1fe+NUZU9OR0d6VLholtTn8?=
 =?iso-8859-1?Q?0H28g+zG0vekN+MxSqjmtbBJrXuui4GGwWVk9h360ZOExXyi6OO+alb95x?=
 =?iso-8859-1?Q?HDUxnJEaEu0guncprYRjZvDeXPQDsVowmNWzOxg9DlG5z16Mp1jYsfObzF?=
 =?iso-8859-1?Q?rVuD/TtqcmIBjKxJbanLzwfuIGne/Z+K0TXsnkzaD3+tfKORXaUtGUimuV?=
 =?iso-8859-1?Q?SJBJeqOVzGFmEpacHPFibZlkVc+kslVQYbJEdiecRsDCugy6GdHjKcxcIW?=
 =?iso-8859-1?Q?XKbqaaorvgi5q0k13CvQrvghqDYQGouUeu9Vq0e5mMbtD/9NScb/38p779?=
 =?iso-8859-1?Q?R4ROT5dBSmmGjWPcXqjFFuvolm+FCMfYmiHB4NsN2JAZ6gCCbucobWgfdj?=
 =?iso-8859-1?Q?LGewtJdr7Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d546ac1-cc78-49a0-2d76-08da26c36fac
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 13:56:46.0067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kK/DyCTSjxBcILPETgsJ3b+3PUW9e7DuF5vRPTiZCdtwAyBrmPMvUgfLiGj6tpzcQo/vXUmSHDqvI2N2AWdvYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8615

>From: Dan Carpenter <dan.carpenter@oracle.com>=0A=
>Sent: Monday, April 25, 2022 16:22=0A=
>To: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSM=
P Linux Maintainer <linux.vsmp@sap.com>=0A=
>Subject: Re: [RFC V2] drivers/virt/vSMP: new driver =0A=
> =0A=
>On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:=0A=
>[ snip ]=0A=
=0A=
Thanks for the review, I'll handle them.=0A=
=0A=
Eial=
