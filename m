Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C591373
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 11:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcjiZu7UP+3wAbxfMp0YbguzqRjCCKtcWw0zOgrYdS3jzCbk8YXKo0bnx1ImhtzSm8bodfZTedxaI034oPsR6AQiQsxqwxyXcRypjX2ZeEMs9jx7aBG5yeyeH9X6OoJehAKAlT7VZmOhuK3GL/jYordIZ502AadLNwDggU7Ae8D6HnTvNYH2NCY6sgmbZr/C0VKqeClruIbnCHpsFOooqqlNm5m8anFqy0gDW7QjsVZqzLMDcLRP90/rOtAYYU1feURhF0N+GcLLrG328pPCZxt44HScJSurVj3DK10sQBwpAvDkAmgIJhMBa5iPX/Xyk9+kYVSb7kPjToN4kU9JxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsgVUv/uBKHH8YASYkN/AD50FwJty+2Y9IoELv7jgMY=;
 b=KIDjXQpvymn8Okd9XCyLnqpovz5jzssX3KsU+Hdn39sT8Sv/9kA71PkfAcS95qyhv5F8DPgJYQsVEdDjeOvLxii6QcBJX9EicSd4SDWNK2QJKVf72L4/a8nhNz2cvBEHSMZbt6nrwkiyCYzBCbFSZfZwvKJQ9HYMkPUtR/HxVnH9APNXVTag9ewd7ttt+gLssq6eCYwHuwJMbJQYKapOMqf9yQ9WqdkKMVqVh0Hs3PnVMMSqWv7m1w1XAG6HNcQWh+m64ackLgna5mCVeKwc2wG59N9G+V7UiAyJhFL+ibxLQruVKPw6zbb2GDEI7pUj2kLR+FpSYWvMrt5PL1UgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsgVUv/uBKHH8YASYkN/AD50FwJty+2Y9IoELv7jgMY=;
 b=Xp1TgPoSbyjCVHhNz5BIdBK9N+jzqTZwBN5VSLOtjwAp8K5ZxaOBkAiZap00hG1rlLcvIE5u4q15lJUGdCFLoVapVEzGuthmMCbWCVwH4UhT8oaytjS3wvY6eLRUtRc6hGqCRJqPxjiZm7K8VUoG795Ux2zXVcpvFeNEMtKI25ebBhoBjIDEVm9u8wJmq7xWz9A41t44OifQ1cgiBjPdJrV1eNiPx2oyE7xAiD39aMxiSkqeFcixnWgckkpa9Bx6LGIIZyFM56+I1ufUDukGaz6eZ0GGXuoPrbGVUJyZq6LKkVV7A1hTMlEkdMv3eA06/PHcdSu4xh5CCLR7drUCqQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM9PR02MB6980.eurprd02.prod.outlook.com (2603:10a6:20b:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 11:18:15 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5164.028; Wed, 20 Apr 2022
 11:18:15 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, SAP vSMP
 Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index:
 AQHYOWFVtbFVL/RlCkqxQt1YlxgURKzDLSiAgAABMryAAAaZAIAABEBqgAAIDoCAAAPEY4AAAsaAgAABLx2ANZRbzQ==
Date: Wed, 20 Apr 2022 11:18:15 +0000
Message-ID:
 <PAXPR02MB7310E609A200F01F77F2D2C381F59@PAXPR02MB7310.eurprd02.prod.outlook.com>
References:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjL4Y2l6oOabjmpX@kroah.com>
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
In-Reply-To:
 <PAXPR02MB7310CEC795999B590704AF4181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: f38de766-7c5a-2ff5-1a5f-c50e074b270a
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f3b80c9-f5ff-4c4e-d562-08da22bf76b1
x-ms-traffictypediagnostic: AM9PR02MB6980:EE_
x-microsoft-antispam-prvs:
 <AM9PR02MB698012D440FE836AAFB6FD4D81F59@AM9PR02MB6980.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NtViubhfxO4TAAwnRwxp0ZWfkGJcRa9/FRKKUFbodcioPQPcABLaQITabBSFQML8yzjSGRWIs7Sm5hU7WYjV3oKbnWOApkFofWrfiNHg4ody743nThaFIs6XfziksnepE+JOAU5RKYylH9M+PVlGG1fBo83h0kPWBlLfGZqdMeEfYS/IppppNqTpav3Xd4EK/eaY0X+pgY/+vaZAchJAwJ/+CIBU7Fx0yXILKHOFaycjYO5VziDtCxnjK+qOc8TWQBqDZoCZ8UHr/hRqq/7Tj0xR4DFmpikwR4cyebCpPuiAzC1SHMa2/fCik32BeIxlQw5I/nBD8JBuGPmk+f5vclr6QqokurGn1yf8EGBpteQyiU3MfkHBZzMA4kZo/PRte0rRyOynVOK0qX9mLu7RUXQ48wxS3B6p7ur1nagEu1Koi+/q8FpgOVUWwYn/Oondi6Bhy7QBSv3YElyMlRaom9/mTphmDr1uidT60Mo8SkMIjkt4tj/ElEvEqSD3AooCu6zCz/j6Yp7Jon4KaA+uRbEEvf5i344hEtMLGZiTTztC+HJV8FlEQL7aAQdWi9niHm0r56cVINsjtAZaOyAfVzTBWRWw4oMKqLLJ0VSribO9A6G2RcR2aVLurdfYvmAiuuYi5cPf4+7VoBJuXjO6s4Q+jM9sOz4OZ67IXmeBK8v5F311SLGP6jo4ZpOa++as
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(4326008)(8676002)(66446008)(66946007)(64756008)(66476007)(66556008)(33656002)(508600001)(82960400001)(38100700002)(6916009)(316002)(54906003)(38070700005)(7696005)(76116006)(122000001)(91956017)(186003)(55016003)(86362001)(6506007)(26005)(5660300002)(9686003)(52536014)(4744005)(8936002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?n7kursl9rkbhXa1VZdfywmMUKrnDflgpFmszyqlHuCBNb2NbCynJrEHZ9z?=
 =?iso-8859-1?Q?TfRpdnqzCxCW/tq87CPdeLdh1mtyQw93T/HSBOWQhcIas34apSxVvpgpKq?=
 =?iso-8859-1?Q?FNHO/b9E7I4ShRYGwNdwKd6qXZPdwVURmvqGV8QP0ZacPIU4ZyRsWy72xn?=
 =?iso-8859-1?Q?nmNgLk6E0x8vjh51rJ7wM20ac6hbjER2k38O//aQHpVOX1Lqa1AHni/1UC?=
 =?iso-8859-1?Q?q2zEnWIyHQSfvDe50BmSfL4RQdT6wjKmDL3a275WD4DHPmlw+Escpez0BM?=
 =?iso-8859-1?Q?KNBGpG+UgqRt6TnKvcqIBwox3RZqdObb8ti6Hrha7xSzdABeBl7ezZI3Zb?=
 =?iso-8859-1?Q?F75FW5ZIOS7qjOM2s6X2rN7aD6WL0LpW/quI/5Rstg/XnpEHcQXmIvEINX?=
 =?iso-8859-1?Q?aqSQ+uS+CRTebjxHoEJHTzN+ojXeL4tPSQE0OjBw2T+jPmta5jD/1mdWQo?=
 =?iso-8859-1?Q?UQOkOmVSPxLkyoVHZsqbvM/7FlnlVTjPl2/HRtKGxSDvJsDgcLSvTeAgGo?=
 =?iso-8859-1?Q?Zt6BburjzS7HCTivevUL2JLkR2GdfGjXwJMRGPoA6UIcqdFL3wI/qDJIKT?=
 =?iso-8859-1?Q?qnxBmjkfXAFKjbVPklxGRjeg9zXW20OUutdbkkZMXzn5bbROveIWcizEUX?=
 =?iso-8859-1?Q?wgMAI9XEsqmdCZozcAw8Iq/Ap2mQDTvY911wwTWqsyiSnA+QYl0Lid55EP?=
 =?iso-8859-1?Q?jmS398dLbSsWUZlUf1qIrcnOP/A0qAt2QkLxyRP6nhyOzghKRv+vMmxD3h?=
 =?iso-8859-1?Q?n7sdelLcZUjjA8f+q+3xsFurtS2/WeYLmbOnmH2MDJLefEOTbkyehkDb/5?=
 =?iso-8859-1?Q?42hF1KQEMN7GlPj9Hk/zrYQA2wcr4IsZ//baTZTHb6DW3NroJMOZkXe73q?=
 =?iso-8859-1?Q?MuDMqpPkzxZBc2E3RiZ8+FbYdkx23gWA9aFn9B6ONIDx5oTq6Oh4mNrJYB?=
 =?iso-8859-1?Q?hSD2AQp9HazZ+68dq6Cs8+DAWUEwU0W2ZIIes8nTCTTj4nUP6+p1754lSB?=
 =?iso-8859-1?Q?k23Fc/vsi0qrW2HOeZSLIxSa5vZ8iGQeIAxEQAcg1XKYeddwrxzx3GxRxn?=
 =?iso-8859-1?Q?vIUHMKESIBNVi/saRogGIfYoqYpjDoE2Be3Fztx4otJVPKeXrI4kBIxP0f?=
 =?iso-8859-1?Q?2Igdiq+I84vXs97wYnS15rUi9CJCc0AzpGno4qBbdaiOpEnT+0jKh2gFOt?=
 =?iso-8859-1?Q?rKaGrJQH59QcACweqbkF7IZZJltSINkf9cd9eKGyHCbv/zmpwGb7oYxdTU?=
 =?iso-8859-1?Q?BVYrYQdu+SxojzrNQ3/1CybjScZSvsYcCEUgOTSOcSt0kRazhCpKloSOqd?=
 =?iso-8859-1?Q?NYn4Vk0jnh1VdQcYg0AEn6wZ6MGd7Ag/K5rZDJAOJPJe+xRXq1GycPOx6y?=
 =?iso-8859-1?Q?P+pOxHYqLIgL/8SWEvUyIFg54REl7Wi1RKDqsoTE8O/1HEAuWm38sV1aYH?=
 =?iso-8859-1?Q?Ao5UBcWAnYxPqG70qx7a+4TaA1QRxwEfJaG2UaiumddBDhrfQJC6mvUAcX?=
 =?iso-8859-1?Q?WjRAFWehr4ADFNGlrAb6QhsExs4aY3H/8jAG2sT7vp5HnBJH2QiRm3sl4m?=
 =?iso-8859-1?Q?UrfFwle7DssjUAnQAHT4hQfV8qaDpfhFG2/b3RitwfYTTTPYzyNHn33rOD?=
 =?iso-8859-1?Q?Nr/sv1xRikbMng8RDkhVPxGLuUdxIS1sTVUeWjy04vw4H7g3be34rwKPRG?=
 =?iso-8859-1?Q?G20s35px3dYc+YyUcXXZB/Yo2UK+fSR83+y6HYh4Fbhe7u3pvNt86BR2vf?=
 =?iso-8859-1?Q?QnZEIJv5iJBG7ya5IAwiQks7U4fbq+abLInHs8Innlul9w/uZbhjnipkyz?=
 =?iso-8859-1?Q?v726svyYfw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3b80c9-f5ff-4c4e-d562-08da22bf76b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 11:18:15.1029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlUVjXTnVsDXa0AkqUL6NRLU098omx3fz1HbGJyRdaakZjUxdS3RS/jrEceVVrkCPrK6jxemDHe6mSHONmPUnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6980

Greetings Greg,=0A=
=0A=
>From: Czerwacki, Eial <eial.czerwacki@sap.com>=0A=
>Sent: Thursday, March 17, 2022 11:04=0A=
>To: Greg KH <gregkh@linuxfoundation.org>=0A=
>Cc: linux-staging@lists.linux.dev <linux-staging@lists.linux.dev>; SAP vSM=
P Linux Maintainer <linux.vsmp@sap.com>=0A=
>Subject: Re: [RFC] staging/vSMP: new driver =0A=
>=0A=
>>On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:=0A=
>>> >> >What tasks?=0A=
>>> >> support of other information bits like stats=0A=
>>> >=0A=
>>> >I have no idea what that means :)=0A=
>>> in short, the hypervisor can provide stats it collects, future implemen=
tation will export that too=0A=
>>=0A=
>>The trick will be _how_ you export this information.=A0 Let's wait on tha=
t=0A=
>>one for now, your current api has lots of other questions to work out=0A=
>>first :)=0A=
>=0A=
>sure, thanks for all the help.=0A=
>=0A=
>Eial=0A=
=0A=
I was wondering, after I've switched the driver flow to the pci driver one,=
 I lost the ability to prevent vsmp.ko from loading in case no device was f=
ound.=0A=
is there a way do to so?=0A=
=0A=
Eial=
