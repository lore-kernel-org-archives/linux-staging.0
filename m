Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290128.outbound.protection.outlook.com [40.107.129.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAFC7A
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmQnpXb0ZbKd282LJzqWVLe5EN33F3/jqsZ4jPs7ZR0ytxGK7LtIQFn4EHcfzIVcwBdLj07yrpRiXziZ1zS7m4sPl3epl0mU794leWtRdx3/fPXnkqUumgiH6yI3Rntf5Siqph+UolOEIxHj/c+IPzI7gffaVjFZUrf4DyJar52JjInnsWIjTuL921AT8qgH2kFUgBnkzI57b2rzEBaf2gYCP5iRrQNVHllUqLFF6LePJ9KvlFPAm28xcCrcnmCSTgzB2g+YnABLtBViaeUX8mjKG1LUPFJEGae1j0F8K8gszi+9R0nh6kfRQsPGcBh93FRtL68PWLzc/gWFUupbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiI0Q3jFkUAxW7klIKm8wTxAJnyY65g5J6HjBEs46wE=;
 b=DpLULaiAaYNEFGPFgJe9MrYl58caatB2J5kqXciR7hf2XnG6PVd6GCVuc9SrNo/8drv7kuwmXAR7oCVsCNhusBk8skDiieUESZCbUSBkKgtVbJHXTZrD9PmMe6UVrHaGa5N+36qdqX67eLXVy4USMTZbd4Cx1yU88tmIAAdRSHMgC4hhCa6g/x0BgQZxlhGmtDqJo8Mp3Hj1zuhA7C8J5tz/Q7SsKROHVuo/W1o30rBNHuhQRcmxCaJszpoCLYJnfWky2sYDg7GDUXyt+YLGcJFyIZcbBE2aTztIS8TDpk75eOFYbOuBG94oudUyDA952C36sxaDdZspyXvTzUPFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiI0Q3jFkUAxW7klIKm8wTxAJnyY65g5J6HjBEs46wE=;
 b=IU/UG/Y+MhF9/vgkhDyKw2yDRNUD1PSfQVtKyFpCzrScg8+IWc6jO90g7YMd/43Sjvo05QeTmc1FxAkW8LbQC1w08O1IZFjwq01UEdpCaZpmuh3h0Xwq/baWz7Vy3xWXAQycO8fy0jV8Hwq9Fb7mycxRvBCmzKCqLeMKnWWA4hE=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0120.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 10:16:05 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:16:05 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM"
	<linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "kernel@collabora.com"
	<kernel@collabora.com>, "dafna3@gmail.com" <dafna3@gmail.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>, Scott
 Woo <scott.woo@chipsnmedia.com>, "olivier.crete@collabora.com"
	<olivier.crete@collabora.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel@0x0f.com" <daniel@0x0f.com>
Subject: [PATCH v7 4/6] staging: media: wave5: Add TODO file
Thread-Topic: [PATCH v7 4/6] staging: media: wave5: Add TODO file
Thread-Index: AdhYjB+JmImpL4gRRQC2zIFkQD8R0w==
Date: Mon, 25 Apr 2022 10:16:05 +0000
Message-ID:
 <SL2P216MB1246D793E5792ABE51800BE0FBF89@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af77c262-ed23-421d-d460-08da26a49bcf
x-ms-traffictypediagnostic: PSXP216MB0120:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB0120E5BC58BA34ACE83A5819FBF89@PSXP216MB0120.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cgj8LJ4mBtqhd+WQV267JkBEHzYRebkJy48oAIIUfcGVIF82Cj9Vv3G8t+IKNEDwhgP0hCluXKm+3MqvDCH7BgzZHpgRkmg9MKq7M6vaBD5tJ3fXdJ+SZYZ2KNhfulQ2V/hhQ7OBgjzqPmY55qk/kHUFXsCWbzEfsPWrfQTNTIq7yn/qXj4HIHVsjZDWVomUGUVeIX4UBin8zwX6Bn8uMwFIVXXoDVO6ZUJV+O4l/cfHK0meC3ng+0sDIog+GTu2LA4zymA/OMmX1dAJskIyndcjSLzN3RDEY/3ZXOUMweiWBbKWLcLhVdQraJDHz9HbmI30H9rjyH7IYy/3T+9U4fFeMuDLIpSxL1ccNd6KIsLx7b5sKrg9EJIoAGVxAD5BzdHJ3tVxqq6WYrRFnw8fPGAUfBPRFcWKuAqabVbYDIAdZQ2TDdk1BttPsooBCpTfo8vpx1k9lMDvCwQpSvyz5cOrTIRC1mq0nL6Bxr3rP5axssYf81S5Sr1eKhQpu9Vg+lcBJ2WNlix0ehj9nF7LG8rQJ9FjSmk3xHETMC4Q4ORgke3TCzso6V6+Jm9XXJrhiBWVsY5QcT5nJGhwp0yh3cfIH2YoJvz3cZoTRMKWuUDUHkKhTH8kF97APlfGw7JS4W97vmunn7QcWOm2j8Zi15YArEST2u9EpS74e3eKUksAEbzZNQR6xOk5Qaihl8CamPfBRhXQEYgEF38o6EOfmw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(6916009)(54906003)(64756008)(8676002)(83380400001)(66476007)(33656002)(6506007)(9686003)(66556008)(66446008)(4326008)(76116006)(5660300002)(66946007)(316002)(26005)(7416002)(55016003)(8936002)(122000001)(508600001)(7696005)(71200400001)(86362001)(38070700005)(52536014)(38100700002)(2906002)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bKV9n7HqyLr6Ditlb72uFN8OBzv25IOhB+8WpJoXPXbH61HM9BqXK+qdzFOk?=
 =?us-ascii?Q?urpWcEEhpnt26vkxJcELcRZc1Q5Mg06ePteSxK/KyeTH+GwvLcEbuqulXn67?=
 =?us-ascii?Q?K4wyC1ZvQCwwmuoEgnM6W13WG15etiup9Zloa+hDhtbwdGP4K6wpdR+ar1CB?=
 =?us-ascii?Q?7meERRrwnakmu2IABHZxJAxF6dFr1NyggOk49Fl0zi/cQJZKQS7Vxw0/Gi++?=
 =?us-ascii?Q?zLqrekdlHpiSWgO/lPLwiuEm827D3CpnJxt+fWSgncc5i9aW5ff8qzOPuvJD?=
 =?us-ascii?Q?bxlJhHdAB51BjJCz8o96066+iWYdDkIC5hGbi3p9A9lV+DVBxgQe8wPVPFVZ?=
 =?us-ascii?Q?I08xHq2WAIWux6nBgrP0tRRO9M+Q9G5atM+dSCGLi1fHaadDIgfoiOTvc7Ni?=
 =?us-ascii?Q?Bur1gTYFsu4OEwUL5lPErK/gP/4xWwvJO5AYHutT69+frqtj2y+FR83O/3Vl?=
 =?us-ascii?Q?cfZBrtCQa/Hq9cM/5UXAIDp22d6kx4+FU2IWHsyB+iGmw7b3wGsIhD2qnlXd?=
 =?us-ascii?Q?KmXF+FPDYkneUFlv0iGj9mMbff7dhCc1n8wtL74ZkNzx2AmHOKNpOZx0HIFD?=
 =?us-ascii?Q?nLNRpflG03q3jBpolZ+K0VxCj1EhwGnebp7Uuu3R45SPyfYv/40rCRZ+f/47?=
 =?us-ascii?Q?WU73j4d4Xv+QMK81+3E7SqNiOYgx95sct0VEgXNzjFclB4iEmIGjS1usKycm?=
 =?us-ascii?Q?QxuipauMzfaFDHHLU2YL6uMYxCe3tNTKQA595lcdy3XVcYKK0RGK1vKHTWeS?=
 =?us-ascii?Q?IRWkcK8vIT1LjpNX9vmWwO86czUgf3879nBhJhGvV+FcASDQbt4fs3ykeQfC?=
 =?us-ascii?Q?3DHiM86zR0QjjjZk3I8zjreTOg5VAzYz7cwT5bWK96QHJnXb4SLljbYW7+Sz?=
 =?us-ascii?Q?DKk7fnYVZp0/ihLRKQssmTEcOptNshUiP3/GZTosvGnPu+7hCJ8EyYdDsos/?=
 =?us-ascii?Q?MKoONSLuy6OLC9e5PQpyfRQim9MzTv96nqgHgZc99fBywPJxAEUM8/h5166k?=
 =?us-ascii?Q?nBxvQvy3byJbpBK9LgEjETA27VYNAvr65YEYqig2jWXTFBtdpQe5nMpeh9DG?=
 =?us-ascii?Q?thb2I4QTd3gONonYV1E3+kE9yT9TNyJbjjDlSnqrCDcO5aHcd/gxUWnp9NK3?=
 =?us-ascii?Q?qrbXmGTP5zSGQ1mVWxx2YuO5uU7j/+mYeNUzQWjDZWg2WHcg6UP+8/vpFkfl?=
 =?us-ascii?Q?K4szHLlGqG6PzKGrkTh9RdHDonv9EDr/4uYjqrSEvNZdTJKyR4t9beFgb3XA?=
 =?us-ascii?Q?QMRhbiLRvq2jhSRY7+McaJUX0ZEsZWmsNd58WNawrODlAXet73VuDefkyiMK?=
 =?us-ascii?Q?Jp6SiZ4qnRt3fgF+Bd8/93T8qfn9QBY8F1G0Lyb8lgDIwaVlodurhGDWte4L?=
 =?us-ascii?Q?jvFMyIhrB3f/SebaJcvSAAWrZPQUCp/zcHPpiENIeKitZXfWdz1TRsib2PMo?=
 =?us-ascii?Q?ew2cJkLa/8Mmpw2COWbM5uQqTZiklOPllZeKiGZnflcQzCSuc57Y6hIld3Vc?=
 =?us-ascii?Q?izCIeB6oOnKK0PbjiAllKpYxmtcSTpzVVuB9C8C79VB/PKOGdn55CE5vZ7xd?=
 =?us-ascii?Q?cR6sEmwXMLv2RBuTmkCV3AYolHRIVeYKkFs+lcVxyUF7NXL5qA0JsInCDWeI?=
 =?us-ascii?Q?Kvd7dXrZrGkSg7rn8CkiYdULv/gxsyfqiE7hFslwLliqf+SQPnkZTxj8hpbz?=
 =?us-ascii?Q?P1V9dvUrMCol+x+jst6UL18drYFLiofOnerYO5tIGSBnEgCDHYxDi8KZq3cX?=
 =?us-ascii?Q?nM+o+K/lBwdR06JTOv4VukikXihqzSg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af77c262-ed23-421d-d460-08da26a49bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 10:16:05.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auAy139OoGbFSIXlp/IeN+HxF/EjFCzCFM/g4LBfakRKz5J5LNY9NFJAKO21Gj/Vy0LrGHGAlcXLGngvDSvPV++B3s8LsAn1hvlvV/yydJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0120

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/staging/media/wave5/TODO | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5=
/TODO
new file mode 100644
index 000000000000..070a1171b211
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,34 @@
+* Mutli-stream Test
+
+* Loop Test
+
+* Handle interrupts better
+
+  Currently the interrupt handling uses an unusual design employing a kfif=
o to
+  transfer irq status to irq thread. This was done as a work around for dr=
opped
+  interrupts seen with IRQF_ONESHOT based handling.
+
+  This needs further investigation and fixing properly, with the aid of
+  C&M and StarFive engineers.
+
+* appropreate error handling:
+allocation failure, mutex acquire failure etc.
+
+* remove all unused struct fields
+
+* change struct fields to 'bool' type or bitfield when appropreate
+Likely good candidates are fields named '*_enable' , '*_on'
+
+* handle vdi_allocate_dma_memory failure , each function has to clean afte=
r itself
+
+* make sure that 'u32', 's32' etc. are only used when reading/writing hw
+and change s32 to u32 when s32 is not required
+
+* power management handling - add (runtime_)suspen/resume cb where the clo=
ck is enabled
+
+* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, =
LONG_LINE)
+
+* revise logic of wave5_vpu_(dec/enc)_register_framebuffer
+
+* check if the  normal kernel endianness/__swab32 routines are sufficient.=
 (instead of the ones
+  implemented in the driver
--=20
2.30.2

