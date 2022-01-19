Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2067.outbound.protection.outlook.com [40.92.91.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C63B2C82
	for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 15:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7j1CKh3BPnE8/vCnI1zKcqK9zeltvBCLc5E04uy9BgqASsAsXfmkIOR3WNjB3qEHDmf2pNOjrQPlqpD8NsZBEGnWyTLkC4ztO5tWVXTjwqmk5s3yhjKOHOddHn8zPQ3gfPB+3uj1+ZUqKPo+2gAj51UXoP4CYdlvcCjDbepLgiBbX9i/kpNsIrakMf+XhOdcCWCmQMlsZr3TNvLGB4KfBi6Fwt4oaPb3VeKMffPUITblQTOPCwryz5Oi/SCDGN/NXCSnZW5V1xIw6AIUqYYNGfSQZnEaAUvwuafdcJhDXKFlyhHgLSwM36FjvzcbplhA+7Ro4DEI+bQ/Y+9MA348A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArdGgZDbM8Q93A13UxsJc+qZ9kP0jLw4bv+yx/d9XHg=;
 b=NgSk39VbGI1rsOqTAKx9mlU2obK/Yt31R/V6yo/6sWGuOn1EuFViDXa8StzYYB2fZR9OqFwl1sTzNgwGp+HoMf+vMEYVD9IhmZ64e29ieIezzTuqxQEGzZYmbquqYytrTsSZjUN0yvP7q847luvi7Cn0R89fIpaUP63EZiqs+tYMKxr/1isn3NKSu+SruWyuNvDxHM+n1txGYuI2Z0+XEOQtwPLz0quIy9D/nn882nK6b48PnXQvwlPm3QPO0i4lr/oUfiN8D1qTdOrYxNjiGkYO1ikhhFzx/+nsr2wgZ+a4VkRBBMtFOgEs5O7Z2LfJRmG/vXChZcF6BY8kkdfpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArdGgZDbM8Q93A13UxsJc+qZ9kP0jLw4bv+yx/d9XHg=;
 b=iq5zEfFpeoYN4egMxnEvNYZnAXaZg+EnkDO2PTrf4PVAl2mbWOE1Pk7YEaua+Bqlm68nMroz/W/MMDHWcxoMelchSfgWLia/Sm4ZRmscS4/I/v5LG6a8tnVjSBUKwU1qVKXG9t2LqYHcynmVeWL0q2SAwrGK5y2bDmi4UZJ2MqQuOO7waT9PRICZhH3vBO2aXSh6Ny4CpySWKAU/rnyr1WR8qHZvKjnLSjpo0Y+5K7pl8Bnd0rVoZI1wiaoEBPFc78amjRRZLXigYfP/IgJTqZyJG4Kjr5xjsp2ghD1z3JpJlaVNLlXO1HjEEXh74q1f9MRXXl/Ap96+Ywdn4+rjsQ==
Received: from HE1P189MB0571.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:55::12) by
 AM8P189MB1362.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:242::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Wed, 19 Jan 2022 15:37:54 +0000
Received: from HE1P189MB0571.EURP189.PROD.OUTLOOK.COM
 ([fe80::a5f9:80fa:e67d:25d2]) by HE1P189MB0571.EURP189.PROD.OUTLOOK.COM
 ([fe80::a5f9:80fa:e67d:25d2%4]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 15:37:54 +0000
From: David Binderman <dcb314@hotmail.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re:
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275: dangling
 pointer ?
Thread-Topic:
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275: dangling
 pointer ?
Thread-Index: AQHYDFDSXDsLdkCQYE+BEgKvRCmmvKxqJi8AgABVq10=
Date: Wed, 19 Jan 2022 15:37:54 +0000
Message-ID:
 <HE1P189MB0571BD2F120F3775019F295F9C599@HE1P189MB0571.EURP189.PROD.OUTLOOK.COM>
References:
 <HE1P189MB05719D490E35B19D832195139C589@HE1P189MB0571.EURP189.PROD.OUTLOOK.COM>
 <Yefn/J0D33c9bDO+@kroah.com>
In-Reply-To: <Yefn/J0D33c9bDO+@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 7a9ea7b3-ae5d-1113-902f-639851a3ef1e
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [8VqepobJenJWqWeCNnl+TQCoO4Abvqxn]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1634df22-98a3-4053-fe42-08d9db61a90d
x-ms-traffictypediagnostic: AM8P189MB1362:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7diUwC7xRBMBez7d3RqVCXvfPy4hJLE6cS/TGjGv2JOCB7mvaybaHqgSBYPjbRkbra3Sw7HODUvuD1rERjtw3auOWT/lKkkxcs49utlIozkJxa5jXNZN1DzF6eCxHHsl9/8RtKd2YD4KB2xat6JTBseo8rsz2Ij9TCn7crQS5D3B9llFJR+j30qQpjLyuwOBQy5fjsBMorM+WvAX0nvChQlJ76kPRbGTbuWdX8pQrK8P4j20uF7QXG/A/4JErpu0CKVPxmzA5S0EHdTDZsjXwK/r2Bi5Stj0iGfxYoJcdYjfF7yaVIPJqxuDeHZa3XNVRgx2Ciw9CB4zWMNmBb0FNVI8KS1dftFkQLCvrmWkFDw7cSWZkRPw0PWCDc359F22J3Q0n75KaBM/Pg2G3Vo/I/dMcfk9Jh+fYsuD0YklkHH4N+IYXPfxQOV0k6Zy5vzb1NvBIznEa85MUCRoYCbPaiMi61pMkhV64fdHvPRCe+CMcXnQLPjuV8TYLPKcnhmlBWGfrTsh1MyWXz8aoO2pOp52PYf832GXPGL9rFkEwyMFiZtUytWycBe4LJ7B2RsSKR5DKYPrWHwL38m+sTCn+g==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 9gJniojhVkifDmB0ko9YjPw3vbJs3DOeCGO8CKzWq9ShiGrOp3TmgZ5KjXkcnKsvMliOOw76kvl5GCJOodgg0sq/e2mQMKvacKNFp3Bgd/g8gneM0XrsFJBe6vJGFzwHslPnFqy2TRVH3/2/P9nrKqJvkT+qvql/aO/o1U45pz+HYIt11H7G3yb90hB3i70pptu58TlXQhI1uP+vZH9mOc47VW2wFuKvIikxAhPUor4VeY6oY+lh+9oLzWFxMatIHU9wfZiPJDhoiSkVYbsqPlOlN2dXgi2FL+F83AAU5x/fTIzHd5jx7mZ+dw0TYvUek2MyGQlbF8ubIOFqCTCws6W30CNlc5aKSWskPhIG/sLX7Iso9xLeXhxXs4seRRPZ778Jm8uw/G5wB6+wkWxrAzlJXWoz5CWJtHIDUpFLjaHhsnwKFfpodq1hpm632K8S3URXDwPEYr4PFay8ElIHPUmtUl64UYBt3C9bJH3Ybiqo75X1oebQYoKpq/js6bqtYOabE0VPUYpX77dMxW+3rDXSEpYIjXBpJLYbZEiW96Bh+bMQyHzn/Du6Ts7rWcHr9IUTjFShhAuN8FgWQlfAOUY49WTm8+QsElPxU6M6lBf6+c4GVEqZA0+Jn7+eUDmaZ6x7I2pBEcnzBFDx6oF/25uty+fB5tEEoxZOaL11v/ol+fCY7QRtRdWW22kLGL4eI8Y41ldnziJZXFLxVtcnEeUIpIc755z7Xz0lSBEAZ0LSk+9Mli6pVKOorobhAyxX0j5mEda+kI2MZpvLsbcA0AR2Mj/wzAkq9NCHsrD/3Au6YBQfbekDymJdxv79FAv/eQBT7BA0z651mefppBh6fEUk4Ao2cyBCDz8VKla2djCdsn5HYqKYvDF2tAUoVmEAiTExh/GllgRZHGlwiLu6Kp0tdvX7S4zVT+5tuKqXT8IaE5dmZMzQzra6wBvhY3Wp
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1634df22-98a3-4053-fe42-08d9db61a90d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 15:37:54.3275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1362

Hello there Greg,=0A=
=0A=
>Great, can you send a patch to fix this up?=0A=
=0A=
Sorry no. I have no idea what the fix is for this problem.=0A=
=0A=
I just find them, I don't fix them.=0A=
=0A=
Regards=0A=
=0A=
David Binderman=
