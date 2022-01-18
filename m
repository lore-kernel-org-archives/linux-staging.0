Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-oln040092075093.outbound.protection.outlook.com [40.92.75.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932E2C9D
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 09:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHsu5ujsuIjaGQM75K/RBe2wQm/X9ouSn0fY2niHwgO7T31rr6B+QMC83lQs//5s9K5CnTxohZo0dVSTMqDNi6znKfmQL7iSAVESQM/Xw0r3/nAa4mK/DnNbRI4mNXTfZvJc6xtJahsHn3uSDiHHlnd9Kx9MrSMqbE4+Ri+XO5LY28xHhdPjHgb/1W91T6zyP0XByIO5T2xqHwftJGMiOIQYdidm1c3NxIQrCrRI40rRGRp4wA8J2u/60+YW6WvKiErh2onrYV+MuAyKRamzFw2hbZAhDSySTkEBWJM78+FczzQ6MlwfT7rbZ7d5kpOpEL726Ng3ZRPCFoqL3VnLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ltal5HSb5b5p8d7BbjwXkaWNZoxJUlj130L7yH/l3Gw=;
 b=LDIjJWsyzhkzbaOhOfXUyVo8SJ6CIz8RUfNAQkKOJr2fa6r+NNSNPKwWKjCJnTSQEhDmS5kF/z75kRH9YzT+J7OoU3tfvOepekPrY863vSsHoNj63UoJVAcSvLsW6YYkli+OzKx3yaj4+tRajKfzmSuFP73rJ9y8P7VQifPQAIEQAT1/jUQD9U2HiQIUV1B5OuFMYPlsPQiKIiP1IEdOpB839Zkp3AA0eU1EPpnCDMCj5wrm8U2Q2T33Wpa5ohP/O6oVHiIZrRSd0mO/405ztfMPRS5gJ091Q2NSN3neuNa5rw4fCGvKuemPfspGpS/kZmLNA7rRbV79VeJi3Ein5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ltal5HSb5b5p8d7BbjwXkaWNZoxJUlj130L7yH/l3Gw=;
 b=QvLChPH1HrS3aHkFfZO1uuss4ffg419yeFFZSNrjrSu5XseAQLE3svXNzMxB2hUa9WpBfdAsSlmoQY3Q5ZpjxFCJQ9uCHeJiu5r0cExRdzAOvjuzahBbdfhiwQEZcwUaWXoRxHE6tVkMLrUNTZ8DmUu0zyUJPMKlP1vw2ExdtVRIvXjEAnZvAHqA1blqmAbTYpnQw8B6hOj59z+jRsNwL3XXtWW6l4AA1UFRHP9gw77/hDD2bThp38vWq9elGma2ZUQdA0J3U2/RUofCfq7kAPDVL4767pJPFt7aqd5UizKrtgl3aR5jQqVT3uqxMYjQFil1hQ3I+hN6gUomdM+Ihg==
Received: from HE1P189MB0571.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:55::12) by
 PA4P189MB1453.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Tue, 18 Jan 2022 09:53:48 +0000
Received: from HE1P189MB0571.EURP189.PROD.OUTLOOK.COM
 ([fe80::a5f9:80fa:e67d:25d2]) by HE1P189MB0571.EURP189.PROD.OUTLOOK.COM
 ([fe80::a5f9:80fa:e67d:25d2%4]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 09:53:48 +0000
From: David Binderman <dcb314@hotmail.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275:
 dangling pointer ?
Thread-Topic:
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275: dangling
 pointer ?
Thread-Index: AQHYDFDSXDsLdkCQYE+BEgKvRCmmvA==
Date: Tue, 18 Jan 2022 09:53:48 +0000
Message-ID:
 <HE1P189MB05719D490E35B19D832195139C589@HE1P189MB0571.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 38e46e15-014d-5ecd-7d5a-0d7477f607e1
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [+lMVBQe+NAHuSnqBxkByuCadBZVfN47o]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36531dbf-e72b-47f9-40bc-08d9da686ce7
x-ms-traffictypediagnostic: PA4P189MB1453:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3EpxRsB4UvRu4VOGyyd/ucPoLwv4EXn+9THcVH9OJlacDdecJp37ouhzJlILz8CxaStT1JEB1B914yFJTTHHOPj9m+QQSF2jS3u72Pi/wcUwyvAYyUIMPJzv9UZGtYmW59BTWPGWXRDR+m64wquKW9xk3TqBNWjskd3LNHWX6yT24YkBLBZExB4DDjDzA4AwHpaQN1Mx5OVgckVP+oNZZfFojRGdHjA7NikolP/gX9jm4pNW1vdlgr5BHhoQIvMQ8pOeoL1lvAUmPUdYv+aO0WsDKsbWylSI0cRT/ewq3kH3AKAALhjaNIRTG1Le92nTf9MNNNXrOXM9TcuZOz6UJSRKmCuXaalysHSbWlfFSX6y4Vx5OMY8vD0zLFLao+rMjeQgvZZ1TWI/ZuGQQ9UkvDfqxWBVu3SP3Ldm3u7eSwhk09FcLJmRLx5C3ouDngg3oUdZ9A+/e3/23QeWjyTVRP6cmDHjB67Rr3m1BoB7mJSKkwjXlta1GU2k4TixBk/OyAa1lOeriHudUHb3h296P4WA3AXXtO97TIxnuDvoZ9YwCFkNn/ED8DW1st2jfutEXxGqEf2GS4RbDsmt+/0d/w==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 hOYb7SJpn6iK3ZKUDoojNUrs6iLkGod24WvUDO9WP0b+H44Hn9HbT9lO3fr/cBIfMAZgpFXqExHv9mfa+MdHXHXouvFwbc3DtYmU09ERm38lRPQuR3/145kIq6nIwqa7YPrVGkR76opWirWSQNixJKDGwQ0R4Fr16fzfu0IzJ3BZktSInvqVIpYQpNAb853Y9/eqF8W+64e3Vn4v4UC25wQqk7CakqJ5yRE/HfvRtod2ipRA1XMbffB88gwOTNU6bVrbfhE30QekUhofMXVD5sPOUmKMuU7hzWOK4pSidJoYvdRMyDKkblHl9FVZHQPTnhS1V2R1c/VEXH5iKrDBCUTOZfbTSiOQy+w2w7dzXDXp/KW8tBR1h5Mbwj4MLJNh1GuuBJOvI7H5AhEFXwIlXOL62vjNMvEbeW/BbWbES62JnVA9FqyVlHSQ9QyPpPNNQgMTXO4X9OH1m7L2Lok0unEhTuOGJJIfmFYvhANJy90gGNBKv/DSsIEoCUhU/CQ6yNjPfIdkQjHFQKqXaarTTS2H8UH1mjL0Yd3HrgC8sW1d8Ofwv+NsEJHrIWq6o8bE2QnKAIzx7jwRD0joeXuQ8w0+bPYky2KgpIBRRZin/cpjHVjtg0NrklDXJGle+nwQPyT+Jf8t3o4i5ANY+z1kzUf/xp0zQ1eRUyDbRdwOMT+cpc4ZBqj5F1vTqMZV/EHyOL5NtOH2wA8zQTnissqScVrQJWJG+mP9PfPL2KXRbwTX5lZlpzq3QBa/KvtHwAlf/iH7cK+i2bu2rO9Qvodzy3tB5piB+ij14Pn6zzrUEyKXtE0rdCis8gH/Wl8kZDB+Y0ZhGmSU/YHgwIpdQRA/Nz7/oC+2ozn7HCNtOfoo/S6mFhoSjHGws2RG+imhg5RErpNAcb/0gS2WaeHjxKF7I+XWtci4ZTo6IIfHAONs69cCmRcZUMzld6+okBFFVRHI
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1P189MB0571.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 36531dbf-e72b-47f9-40bc-08d9da686ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 09:53:48.7715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1453

Hello there,=0A=
=0A=
Recent gcc development versions say:=0A=
=0A=
drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275:33: warn=
ing: storing the address of local variable =91h=92 in =91*handle=92 [-Wdang=
ling-pointer=3D]=0A=
=0A=
Source code is=0A=
=0A=
      *handle =3D &h;=0A=
=0A=
but h is a stack local variable, so exporting its address doesn't make any =
sense.=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
