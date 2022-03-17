Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D463D79
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 09:04:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bilx9EBIF++1Mz9ZSKWwMaY1mm9/IqlOOCSOOb1ZYi07qrg5yyDbKl3pTREjEOBIg7pL+X7wxiVCDj8DbO4LJicuFi14mLAoG3YYiZmi3jQYmcrjA3+JKOBtkoA4+HBDvp0InvJByv+fBnP7yMgZOBL9yJ7nGf+EIgfLo8ADVjY8xmT1/0+wPqLdKldYHmsgd02BZXLMEIg7a0U3FNNbkKVqcIKJsRLm//0Muvsm6iQuUKI1xWZLM/PJL2wntLN8S6F/1znz+b5AN+2sI1usyg+/xLQu4JocLl9L/0XNFTxDWFkkVeRXwR81qTLdASy70TC0+AdyTeoSKu5p4mTEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8PbftdjFxBm75z4J5r4U/U0G8bqlRtvdgxiIJpsTpg=;
 b=dkGA+WNKhbyMuheeKCSg3bjMlJrHjVqvDFr27UEMp58+c7OwUzSWCrFNeOsyJgVzDq7NiZaE6TlIWM2QEvwvJqsHfzmW6bmWno61P4FGd8dIBIBIgeE4veENvO9vl4588x1/UcVSnwEF287VouHvYjmXicpUBKEw/swrNh5ECZwSrRXU2MMbh6AJtB7M2VgxojFVNrAnjyyrXjuPxWc4vaKy2HG0gdymFm0iFW6c3KBBWFDzndjLERDN8uXZjZuXqHgq2VR8eGDS4xljk1Tq2+L01cQ60yMEaMmPU+g3pwwYM6grGBzHr/S26XKWhg+3MgksaJcTm1c4foqjs5rgFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8PbftdjFxBm75z4J5r4U/U0G8bqlRtvdgxiIJpsTpg=;
 b=UpNqYDA8ZgXnD8f0PMWy5dDGVCPOa+jwlM19mcwNkGY0rP+P9YcH7SwJts+ROyJzhwe5Z+Cm2zfNvtdSPNwLMWlh+1dhzMnMFykMwFmSDtUOSQDbIMk+QF864E9B+ULDCnTAAAeVmihpnJW1+5H0600CgQ3xHSvGYRc4FyyOFzWsATn8k1Qwm6s91KhFEtnY05jH3qvQgqRafqNEeOhBVQjmjPc8SN43TBKMs5ZuMOyfp3d9tWU8q28AeCgZ6XbUWq2ho/Uy/fuGpbfFKwgbnXI2477YIs4oGH5ZxNTWB9YCchWo1iDm9GOSaLgJhZMT3kMP4D0B9bsktts7Bde0Zw==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by PA4PR02MB6912.eurprd02.prod.outlook.com (2603:10a6:102:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 09:04:23 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 09:04:23 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index:
 AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBqgAAIDoCAAAPEY4AAAsaAgAABLx0=
Date: Thu, 17 Mar 2022 09:04:23 +0000
Message-ID:
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
In-Reply-To: <YjL4Y2l6oOabjmpX@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: b40dd0ec-ae12-8786-fe9f-625854b0be13
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ebd5a89-95b3-42bb-0d97-08da07f52133
x-ms-traffictypediagnostic: PA4PR02MB6912:EE_
x-microsoft-antispam-prvs:
 <PA4PR02MB691247373AE159C784E2571281129@PA4PR02MB6912.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lShwcHv/vdGlx2Zs+FBp8gxCxudBUWYtzif2EapBFEB4YPmOn0RwYAOSnfw8NUh0bQQvu2mhp5bIzOdj0XUP+YmNqHm/TPTwPCgFJk4ZDshz+yHaSMbc3LZ/zetOAfGK+Y7WTwoutwwMUBvWswrJF5gabzUOB3fgOgRM0RSFedW2JWSH4j03LcJRqDo+oVa6PjQVHmt/KLBIvjJLgbKq+zD/DSAuUX0Xp/g8RJxP18xmfIcI3GWzjmkFnW8wtyGOpyZMIacdGHVDrFqWYcJgRevahBtT1HPUX6srpRYCVKjAEBx5oEtJXM9m2xTId7qUFxpYqyIleuJJ4eM9KNM5ayFo3xZau5ZraneBnfUxzOEKntUUSTmq3U92evDct/2yR4CkEVHqe2kSt1af+V9bIqgj7XyM2P2anZcqcoEucpkZpu1ML1ICh4i3wSRL4JOD/VGdwFdYujARB8ek7jj3R3ZyG8ISmE0jjN9CTPXHq+QPoIk8yFfo2t1HAXa+RmofIDMReigfxQ1BBmI2J6Eic+Eglr+9LLKjiveUWjQwWI2JZsU2nxanDfr4mHZx64WBCN2KN+AhwNjLJ90GOK0vVloIxNElc24Ra82SL9ZPw5saax6XabNWFbchfzsV27CfwbYiAUib+dTjeopPgNhN/upgsNfDEiA/WHMErkXawsR4noJhErr5THVVCIWZOZF2eqClvkLEtlCP+gDyNMNhwg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(6916009)(38070700005)(316002)(8936002)(4744005)(52536014)(8676002)(82960400001)(4326008)(66946007)(64756008)(66476007)(66446008)(66556008)(54906003)(38100700002)(76116006)(33656002)(6506007)(5660300002)(55016003)(122000001)(508600001)(9686003)(7696005)(86362001)(26005)(186003)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GndQtDjhqs3jKKt/lQlBH5LQCFNRU/Hp5oD00AXPs47IsKICoV0gzF0w0F?=
 =?iso-8859-1?Q?LXDnTTHegA+W6iLJ4QVTZ8tO+bGMSpQ50b/eXMBO4nuzB1M4TgxMhf4v8a?=
 =?iso-8859-1?Q?1INwg5D6/Qlovj1SjOPr9mxotuE+cifQSafjF9YQyYLsDZH8Vwcr1B/MaC?=
 =?iso-8859-1?Q?6gDyEbHC/CzheczHojYfbCWACIcuQ9BpbW2HJxtu8BfIAbYXQ2ld+EqUxn?=
 =?iso-8859-1?Q?1krFXv6em51hyODnnaC4CR3ofGOBdJmIaHvt0WPmrtxVvU6WcbbPViatpV?=
 =?iso-8859-1?Q?WanKQqnS1rT5A8YDDFvYO+q0ZT2U5KVVKZbgkY66e2Sa2tExq7kdDqgGqd?=
 =?iso-8859-1?Q?0XO0W8K0+bkg3YlfirC7KGgE9Rk3n9FiXESjwPNQLyzMfaALvcV3ZhStNY?=
 =?iso-8859-1?Q?4siBiP0aPxyZ8Fzd0MskjjNwa1REeU5Uk0F9A0zvGkLiaqsnPNl6c79zZ/?=
 =?iso-8859-1?Q?R3MaAp6Gxp2lxRzIRKiktWgq0EM/jpjhD6CnQ+N1git6X7kbanKbnjFNUp?=
 =?iso-8859-1?Q?5DiqSIl+qhqZhv0wZwLTJIpD2MUVdVNldgiJZwA9pKko3og11xczUaBv0v?=
 =?iso-8859-1?Q?KQNwpqdLyFBQV+C8o9XGUqDpINWC4iTcRkMv0OF3qaEmO8R8GhSjmIoFag?=
 =?iso-8859-1?Q?AwDcNQD9UBWl5PteT/pa10hjV24asFw91l8k/tdcc1YpqH76T2qAuUs3S9?=
 =?iso-8859-1?Q?q2AyIZQPpQUG6rjLyEL5Rey4g0p/oBGwSYYl1DminrQQFHV7zFbG06M4O8?=
 =?iso-8859-1?Q?gBFxItIK6RY/3YuOLxTziUJeHL79QzQYgX7wf75FmQaabjAMkbyfZj8Tqn?=
 =?iso-8859-1?Q?MCAAqNZjjya3l4sjtfgvfWsEyGoqeCV6SX3Jrx6sFiBiYmM5queNpxeucr?=
 =?iso-8859-1?Q?Zf3/ElgnK9vmImDxi9BM/KQoEmFXwYoowZil4nANUmF+y0SaIs2dgi0SfK?=
 =?iso-8859-1?Q?/mol2W0xM/ScECqCqtZxR6ewTqwlLSuSp5ohi+imhYjGLSxU+TcBAm/CRV?=
 =?iso-8859-1?Q?yrPR+YXiQQZf9amn0uQO8HPMGBjO0NAeQMPT7UZucLdrabYOY9rxQ4jsg4?=
 =?iso-8859-1?Q?RDaxIq02J3edsZ9DfRK8cplr484xIDnXb73Ko68frrLGCDkaL8Je0+UYcs?=
 =?iso-8859-1?Q?HhCqW0fmGsjhnYghulx3icV9sLdWz7HrCDucd6w8FA+/RClYyD+VFNfwbQ?=
 =?iso-8859-1?Q?RzVyRKc8RHJSPy2ETBT0edRWrDh6IwVvaVEwzxepW361CScAo8HvJPKcrn?=
 =?iso-8859-1?Q?kkOAzeoCcawtJOXHBvyPnWh4oS5xa1ShcV/W9qPbv9hFz1OVh/v5SpJ8hQ?=
 =?iso-8859-1?Q?8PbqPKnUxXJ6/wwRnr0YxwebJwqtbXd8AoMPxU475zLwH5CYnvbQq5B9xq?=
 =?iso-8859-1?Q?NLXKoOtV2obxlupB43rL5RufSMkS0SdHqW0UXtJjG/MaIy5WW2/J5J8wS6?=
 =?iso-8859-1?Q?eqZRRsZIPUWOK/wqtIbGM7e4UqPVJMcSxXsht1Z864Yq4nktzVYwI97wxH?=
 =?iso-8859-1?Q?SPfatpwQFXna+0rY2Z92A7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebd5a89-95b3-42bb-0d97-08da07f52133
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 09:04:23.1409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNlZ5yP0xkwG7P7QDlhreYkZIe7EQ7LBFMWZc/va9rULefIMdVMTJEYUh3wyprOMWTLOsO1bDyNen2bAyiy3PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6912

>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:=0A=
>> >> >What tasks?=0A=
>> >> support of other information bits like stats=0A=
>> >=0A=
>> >I have no idea what that means :)=0A=
>> in short, the hypervisor can provide stats it collects, future implement=
ation will export that too=0A=
>=0A=
>The trick will be _how_ you export this information.  Let's wait on that=
=0A=
>one for now, your current api has lots of other questions to work out=0A=
>first :)=0A=
=0A=
sure, thanks for all the help.=0A=
=0A=
Eial=
