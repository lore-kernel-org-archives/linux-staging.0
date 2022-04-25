Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290128.outbound.protection.outlook.com [40.107.129.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AA27A
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJrptxBbr1gBClnlfCvIyRrQwW9I4l2HZ4omjoZjREcc2jWmDdz94Y6ynYk9i7P41Ja7Lp6KLQ6X2850Rv0gW8Gsetp3Lr5vbT1qLlUSp9H4ZyjfLOpG8fEQZP67lno5evAIlL07UoAxIrdaxG55mr5fmtjoZYMKgagANITIhg7xcyXMDpBMshk1+M+GkKcoMvlT1t1Os85YysKECKuUp1giQysEzmSpW57Hcz8uL+AWZtA+N7Xz1C6zWfQkZc/rG3ULvMSPdvaMIxbNs4+1+U1NnGjSod9LGYQuPU95ZD3GH1vQ/gAwoaWaNNeG7OJa6pF9Wg5Hsfy4yAWufU+9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS6QEw6F2ksG0Eung5wmRR7fsx6wzluRcfGYdgKnQRU=;
 b=C6WGX+0a/fqmDhYYWARWYN38jS7r6wUp740YlE6nIhT1ymbh2xItE2TNMEC6AwkkCwa2T1fZWUAx4Bg/3ebaGPnt4DViSTlH0xIUHNdfk6bunn4PQJZ7U7+yRPHSnm5p0hoMD3TFluiwCFMqN1mFuRQb4tsmYS3oYuj/YLdOXKXAWalEzavlZ4Bsw82RwGjG7I3nUsfGz748yEj9of2k2/CXaRjch4oNui/n2porDqCTdZLYTeGnyKP1KGbwbZA2MhgetXLlHtfklLLFs1jlBvxsBvECjU2aqIHbqIg25i7CJDjPoTmx/5JywIvPp4yYE7b72uKb2nrmOiMe0d4iFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS6QEw6F2ksG0Eung5wmRR7fsx6wzluRcfGYdgKnQRU=;
 b=Y6P6BRsR5/4eQXhMsseNbtmJHdXLjX7qlNHcTap72Bto2TJFf0B1SGLa3NAcYtMTiQNgUEbljyQ4xNp9Ll9KwV33xejgRDQONJRn/UpqzeVmExCEk4mC/RGkbTWdct0kxZe5jJAZsmrvx2qKlyWsNZarVImHNySEo36XxM/vJsA=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0120.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 10:16:05 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:16:04 +0000
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
Subject: [PATCH v7 3/6] staging: media: wave5: Add the v4l2 layer
Thread-Topic: [PATCH v7 3/6] staging: media: wave5: Add the v4l2 layer
Thread-Index: AdhYi/eio3h1HFVITmG9qHfyiDt9aA==
Date: Mon, 25 Apr 2022 10:16:04 +0000
Message-ID:
 <SL2P216MB12461983C2F310B42EB732B6FBF89@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1ea6e0f-59a9-4077-1bba-08da26a49b4f
x-ms-traffictypediagnostic: PSXP216MB0120:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB0120C231BE1FE84A219AC0EFFBF89@PSXP216MB0120.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 T/oHl6IaJuZr3zsrF5ZdYekNesAZVJthskL0G4PdnB/YGnnO3uyh0zJWL7NsvRvPKRkTiOlLbToTJgbbhRi6klSWSKgn8aZY+zl1I7g8l7nEW1GIHv5OA4D9/UMdQZelI/GQyLvZoDIsLOOqcHtXy7L8s9jqwr96K6owJnLqW9iFrZKW5XeHhO66Xgtrx7A4/AKTvzyLcRH9uG9pEvzLxbGIovHzsIfdobw+cYxHSFZ5mjY0nyF1HUfMpKUPy9brq3aDvd7QqTloBkugouhKH0AJGdHwSRHvCabukpmSp9iiJYD6Ro3lugf1y5GQWVU3u2iFM13TmurnsbLbaaxB2M63H7qymhceKAtFUWLictU5jnOdYRyCMF6Kvslh6f1wQyN/4T5j/qK9ZmmCBKMrlQANjx/kWFBEcoGI/uMgkP2sArQfBVzpAO2yQxiKlBbCO7ja5AbMigY7NT9ID9dvJ/o+ZHyVU318vVPl78IM/KJruiUaChunYRf1j1Hu5MTV/+ry7ov865qLlvd9JFkUo1QQd+zWE2HoJzaAG7sEHSEs+veyh06tr10RT074Upvdawz9mnki3428lMqsAclW5SI9DAhYU6r+1/QsSyI4tA2PDkCeTyEdoQ+SxBAMV4MQi9bzMWNjpKUdFpngvy2EhVAld9vznX7Wt3JPVNOh0X8PkrHoRfty7V1rYlf6F9GZ2gWPBuLeIz4AjRCQyJ5opw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(6916009)(54906003)(64756008)(8676002)(83380400001)(66476007)(33656002)(6506007)(9686003)(66556008)(66446008)(4326008)(76116006)(5660300002)(66946007)(316002)(26005)(7416002)(55016003)(8936002)(122000001)(508600001)(7696005)(71200400001)(86362001)(38070700005)(30864003)(52536014)(38100700002)(2906002)(44832011)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FMDeFFpQzcr3wCJL19ARxyGMppa8Khu2cJEDxA+3nfbBE3ZgkHWdFrz5ENHH?=
 =?us-ascii?Q?/5AxxT1eMxuENG1YVwfKEPO4luRZpOPS21xkFbNYD337v8vh3s6tkA3FHvzL?=
 =?us-ascii?Q?jmrhUhHkwNlWX4Ihwu//vTz+GThNGWghKxcibP7OapKpkmMSz8vegvi8P0ql?=
 =?us-ascii?Q?A3Bmu9JULks9Aka+TNBJNKsqiM+6kmSUkveSIZyg4M69+5yPeBkkmhlF1ILl?=
 =?us-ascii?Q?SIfgguQ5qokpWxuq7Pc9H44KITSTsFeQbPFtZJyrFnIyHJ5YwScCk6QwF4r8?=
 =?us-ascii?Q?ywRUEjhLCcZLIWrTG3LG/spK3eFR1DDlQxfpmWVzvBZQHNFgpZ3uRPDPOaYS?=
 =?us-ascii?Q?iXC6lQIxhz0fODcnZwUx3/Yty4L3/XdTxMPiZ8B7ycmQNm6kJuE/GNi9jfv5?=
 =?us-ascii?Q?W5J2/Kco2BLVf0oQN0JJa0Lp5J3iyvLw7B7co9V3Zn/j/ZD5K9QhM0dGkk/O?=
 =?us-ascii?Q?UNCR2nng5i84Xh/innqzf52IYUMDF7GHbKtRT2j3+fOKTYdB/LfDBX0bNdn4?=
 =?us-ascii?Q?y82Xj+MognLwMHZYBwfFWTx3VgJqPPuuG5b0ecRW5LdsCfrYNci1tKuzS6v4?=
 =?us-ascii?Q?2MnN4l7L00qlzX0DN5TCYbeQSq9Wk84bLalDUHpKTmS9agvbVQfgt7c7tOgE?=
 =?us-ascii?Q?4IEvft1zFMWo+WB+tVCgHU0Ay65y+p9RcppgVSpIvolBmDucBVB3OZ5f9vn4?=
 =?us-ascii?Q?92RhoGUq7uG4PONyWiGq7siH59Yaar2bL8nsAr/FgVO6mD8EyBSfREV89jut?=
 =?us-ascii?Q?Pbtip6uivfUz0pz0OAnTcZLQTWrO3qaiJaBTSxVn/eJkOPSd7a1XSxx8eEa8?=
 =?us-ascii?Q?BJgXGE0BJK0qAfmmLN04K1ZA4h+i9xeNm7MR9s/fRHhzW9Sgta21R0DEqPzL?=
 =?us-ascii?Q?B3se8ZBhw9ln+09jI6CUo02PsLg6iTqqCKrB/A8piZTohSkMSUF0wABNZMnh?=
 =?us-ascii?Q?qZFN9si+IHLIbpoPVl3CMkRssxLMVgdXq90bB/1f2EdDfOhaoQ6SOb0bgA5W?=
 =?us-ascii?Q?P+lNgiAxILhUbdj6OMNpnwYxFFp4qFWfac6zrCEljqTn+4c1dMfW5hErhIj3?=
 =?us-ascii?Q?WUiNHMV5dBRMYZBykSo/Kbr+ehuUi0ci3lSbFq0Makua4p7PrZajI9EZxp+f?=
 =?us-ascii?Q?SQ+3BjOP+KN8fcIYfLhcx+EKg+Z3zqSaL+37kcNMfHwwShie2HJzPN/GbtB9?=
 =?us-ascii?Q?bvySUtz+vjMUBclaTwJ0nARvBkmBXqXC2XisaIBSRH7CEaCbNZvFs0CYT/Fy?=
 =?us-ascii?Q?h9nJ62pyizFg3+xwmGqPqyv0vMv9e6VZk3Sn/8EPaMwMCi05fjfgytJrATk3?=
 =?us-ascii?Q?Qo6PU+phGsy+wsyaLetyGLGIpCOT/JKmNEcteiKi3qdYmptGEGb4g9csZXKU?=
 =?us-ascii?Q?XGw+LedHxSgRTTS7nt7jwRrpQzUz0v58VaNB0CbFc1jLuTwR7plzEWEHI/xF?=
 =?us-ascii?Q?RkKgwB40p9SC5cju9whARClaCmprCoM77yH7bYiu7ewcFdBP4PPLJcs9/wE/?=
 =?us-ascii?Q?jlqVORhE+2D0L5xBm7Dv93SJoli5FYkKaZT4FSQNi6VeOTqFlgMTTf7oL8/0?=
 =?us-ascii?Q?1uBxmjr6YlK2fOpKLfp0MYZplxMXmPIQzQR/xm7JW/XFct//z6s2061UF5wj?=
 =?us-ascii?Q?myAKAk72sTwY8rAUARg4vEvaOp6kPAxa7cns3zcs/oqq7btTE1YM58FxpkhM?=
 =?us-ascii?Q?8e64mrQqnZ0CI5FZIx80QqYvQau8PWUC7xErKxyLhzzmP3Orr+VZwiPPLBzU?=
 =?us-ascii?Q?XzmlmSIp8NnqszcwmuugGTukHeOAsnw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ea6e0f-59a9-4077-1bba-08da26a49b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 10:16:04.8022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdXYGvLOZWe1rtdtp0wg+CxVMfLsoSLy5Oz+4y57MRlYY/ayTleFcGLiOZMINiRIoT+z2C/8ShYWWPGSvaNzkjsVrnHGcojiOs3QeeW5tkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0120

Add the decoder and encoder implementing the v4l2
API. This patch also adds the Makefile and the VIDEO_WAVE_VPU config

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/staging/media/Kconfig               |    2 +
 drivers/staging/media/Makefile              |    1 +
 drivers/staging/media/wave5/Kconfig         |   12 +
 drivers/staging/media/wave5/Makefile        |   10 +
 drivers/staging/media/wave5/wave5-vpu-dec.c | 1385 +++++++++++++++++
 drivers/staging/media/wave5/wave5-vpu-enc.c | 1532 +++++++++++++++++++
 drivers/staging/media/wave5/wave5-vpu.c     |  381 +++++
 drivers/staging/media/wave5/wave5-vpu.h     |   73 +
 8 files changed, 3396 insertions(+)
 create mode 100644 drivers/staging/media/wave5/Kconfig
 create mode 100644 drivers/staging/media/wave5/Makefile
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-dec.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-enc.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 1fd6a0c6e1d8..0a371654f524 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -44,4 +44,6 @@ source "drivers/staging/media/ipu3/Kconfig"
=20
 source "drivers/staging/media/av7110/Kconfig"
=20
+source "drivers/staging/media/wave5/Kconfig"
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefil=
e
index 66d6f6d51c86..c5bda2ef97f8 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+=3D hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+=3D ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+=3D zoran/
 obj-$(CONFIG_DVB_AV7110)	+=3D av7110/
+obj-$(CONFIG_VIDEO_WAVE_VPU)	+=3D wave5/
diff --git a/drivers/staging/media/wave5/Kconfig b/drivers/staging/media/wa=
ve5/Kconfig
new file mode 100644
index 000000000000..9f4ccc77fcbf
--- /dev/null
+++ b/drivers/staging/media/wave5/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_WAVE_VPU
+	tristate "Chips&Media Wave Codec Driver"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_MEM2MEM_DEV
+	help
+	  Chips&Media stateful encoder and decoder driver.
+	  The driver supports HEVC and H264 formats.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave5.
diff --git a/drivers/staging/media/wave5/Makefile b/drivers/staging/media/w=
ave5/Makefile
new file mode 100644
index 000000000000..56f3a5289103
--- /dev/null
+++ b/drivers/staging/media/wave5/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_VIDEO_WAVE_VPU) +=3D wave5.o
+wave5-objs +=3D  	wave5-hw.o \
+		wave5-vpuapi.o \
+		wave5-vdi.o \
+		wave5-vpu-dec.o \
+		wave5-vpu.o \
+		wave5-vpu-enc.o
+
diff --git a/drivers/staging/media/wave5/wave5-vpu-dec.c b/drivers/staging/=
media/wave5/wave5-vpu-dec.c
new file mode 100644
index 000000000000..6d56451977fa
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vpu-dec.c
@@ -0,0 +1,1385 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave5 series multi-standard codec IP - decoder interface
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#include "wave5-vpu.h"
+
+#define VPU_DEC_DEV_NAME "C&M VPU decoder"
+#define VPU_DEC_DRV_NAME "vpu-dec"
+#define V4L2_CID_VPU_THUMBNAIL_MODE (V4L2_CID_USER_BASE + 0x1001)
+
+static const struct vpu_format wave5_vpu_dec_fmt_list[2][6] =3D {
+	[VPU_FMT_TYPE_CODEC] =3D {
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
+			.max_width =3D 8192,
+			.min_width =3D 32,
+			.max_height =3D 8192,
+			.min_height =3D 32,
+		},
+	},
+	[VPU_FMT_TYPE_RAW] =3D {
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420M,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12M,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+	}
+};
+
+static enum wave_std wave5_to_vpu_codstd(unsigned int v4l2_pix_fmt)
+{
+	switch (v4l2_pix_fmt) {
+	case V4L2_PIX_FMT_H264:
+		return W_AVC_DEC;
+	case V4L2_PIX_FMT_HEVC:
+		return W_HEVC_DEC;
+	default:
+		return STD_UNKNOWN;
+	}
+}
+
+static const struct vpu_format *wave5_get_vpu_fmt(unsigned int v4l2_pix_fm=
t, enum vpu_fmt_type type)
+{
+	unsigned int index;
+
+	for (index =3D 0; index < ARRAY_SIZE(wave5_vpu_dec_fmt_list[type]); index=
++) {
+		if (wave5_vpu_dec_fmt_list[type][index].v4l2_pix_fmt =3D=3D v4l2_pix_fmt=
)
+			return &wave5_vpu_dec_fmt_list[type][index];
+	}
+
+	return NULL;
+}
+
+static const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx=
, enum vpu_fmt_type type)
+{
+	if (idx >=3D ARRAY_SIZE(wave5_vpu_dec_fmt_list[type]))
+		return NULL;
+
+	if (!wave5_vpu_dec_fmt_list[type][idx].v4l2_pix_fmt)
+		return NULL;
+
+	return &wave5_vpu_dec_fmt_list[type][idx];
+}
+
+static void wave5_handle_bitstream_buffer(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_buffer *v4l2_m2m_buf =3D NULL;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&inst->bitstream_lock, flags);
+
+	v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		struct vb2_v4l2_buffer *vbuf =3D &v4l2_m2m_buf->vb;
+		struct vpu_buffer *vpu_buf =3D wave5_to_vpu_buf(vbuf);
+		u32 src_size =3D vb2_get_plane_payload(&vbuf->vb2_buf, 0);
+		void *src_buf =3D vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+		dma_addr_t bs_rd_ptr =3D 0;
+		dma_addr_t bs_wr_ptr =3D 0;
+		u32 bs_remain_size =3D 0;
+		size_t offset;
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "already consumed buffer\n");
+			continue;
+		}
+
+		wave5_vpu_dec_get_bitstream_buffer(inst, &bs_rd_ptr, &bs_wr_ptr, &bs_rem=
ain_size);
+
+		if (bs_remain_size < src_size) {
+			dev_dbg(inst->dev->dev, "fill next time : remained size < source size.\=
n");
+			continue;
+		}
+
+		offset =3D bs_wr_ptr - inst->bitstream_vbuf.daddr;
+		if (bs_wr_ptr + src_size > inst->bitstream_vbuf.daddr + inst->bitstream_=
vbuf.size) {
+			int size;
+
+			size =3D inst->bitstream_vbuf.daddr + inst->bitstream_vbuf.size - bs_wr=
_ptr;
+			wave5_vdi_write_memory(inst->dev, &inst->bitstream_vbuf, offset, src_bu=
f,
+					       size, VDI_128BIT_LITTLE_ENDIAN);
+			wave5_vdi_write_memory(inst->dev, &inst->bitstream_vbuf, 0,
+					       src_buf + size, src_size - size,
+					       VDI_128BIT_LITTLE_ENDIAN);
+		} else {
+			wave5_vdi_write_memory(inst->dev, &inst->bitstream_vbuf, offset, src_bu=
f,
+					       src_size, VDI_128BIT_LITTLE_ENDIAN);
+		}
+
+		ret =3D wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "vpu_dec_update_bitstream_buffer fail: %d\n", r=
et);
+			continue;
+		}
+
+		vpu_buf->consumed =3D true;
+
+		if (inst->state =3D=3D VPU_INST_STATE_WAIT_BUF)
+			inst->state =3D VPU_INST_STATE_PIC_RUN;
+	}
+
+	spin_unlock_irqrestore(&inst->bitstream_lock, flags);
+}
+
+static void wave5_handle_src_buffer(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *src_buf;
+
+	unsigned long flags;
+
+	spin_lock_irqsave(&inst->bitstream_lock, flags);
+
+	src_buf =3D v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (src_buf) {
+		struct vpu_buffer *vpu_buf =3D wave5_to_vpu_buf(src_buf);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "already consumed buffer\n");
+			src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+			inst->timestamp =3D src_buf->vb2_buf.timestamp;
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+		}
+	}
+	spin_unlock_irqrestore(&inst->bitstream_lock, flags);
+}
+
+static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, un=
signed int width,
+				 unsigned int height)
+{
+	switch (pix_mp->pixelformat) {
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[0].sizeimage =3D width * height * 3 / 2;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		break;
+	case V4L2_PIX_FMT_YUV420M:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[0].sizeimage =3D width * height;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32) / 2;
+		pix_mp->plane_fmt[1].sizeimage =3D width * height / 4;
+		memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->plane_fmt[1].re=
served));
+		pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32) / 2;
+		pix_mp->plane_fmt[2].sizeimage =3D width * height / 4;
+		memset(&pix_mp->plane_fmt[2].reserved, 0, sizeof(pix_mp->plane_fmt[2].re=
served));
+		break;
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[0].sizeimage =3D width * height;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[1].sizeimage =3D width * height / 2;
+		memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->plane_fmt[1].re=
served));
+		break;
+	default:
+		pix_mp->width =3D width;
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D 0;
+		pix_mp->plane_fmt[0].sizeimage =3D width * height / 2;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		break;
+	}
+}
+
+static void wave5_vpu_dec_start_decode(struct vpu_instance *inst)
+{
+	struct dec_param pic_param;
+	u32 max_cmd_q =3D 0;
+	int ret;
+
+	memset(&pic_param, 0, sizeof(struct dec_param));
+
+	if (inst->state =3D=3D VPU_INST_STATE_STOP) {
+		max_cmd_q =3D 1;
+	} else {
+		max_cmd_q =3D (inst->min_src_frame_buf_count < COMMAND_QUEUE_DEPTH) ?
+			inst->min_src_frame_buf_count : COMMAND_QUEUE_DEPTH;
+	}
+
+	while (max_cmd_q) {
+		u32 fail_res =3D 0;
+
+		ret =3D wave5_vpu_dec_start_one_frame(inst, &pic_param, &fail_res);
+		if (ret) {
+			struct vb2_v4l2_buffer *src_buf;
+
+			if (fail_res =3D=3D WAVE5_SYSERR_QUEUEING_FAIL)
+				break;
+
+			*src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+			inst->state =3D VPU_INST_STATE_STOP;
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			break;
+		}
+		max_cmd_q--;
+	}
+}
+
+static void wave5_vpu_dec_stop_decode(struct vpu_instance *inst)
+{
+	unsigned int i;
+	unsigned long flags;
+
+	inst->state =3D VPU_INST_STATE_STOP;
+
+	spin_lock_irqsave(&inst->bitstream_lock, flags);
+	wave5_vpu_dec_update_bitstream_buffer(inst, 0);
+	spin_unlock_irqrestore(&inst->bitstream_lock, flags);
+
+	for (i =3D 0; i < inst->min_dst_frame_buf_count; i++)
+		wave5_vpu_dec_clr_disp_flag(inst, i);
+
+	v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
+{
+	struct dec_output_info dec_output_info;
+	int ret;
+	int irq_status;
+
+	if (kfifo_out(&inst->dev->irq_status, &irq_status, sizeof(int)))
+		wave5_vpu_clear_interrupt_ex(inst, irq_status);
+
+	if (irq_status & BIT(INT_WAVE5_BSBUF_EMPTY)) {
+		dev_dbg(inst->dev->dev, "bitstream EMPTY!!!!\n");
+		inst->state =3D VPU_INST_STATE_WAIT_BUF;
+		wave5_handle_src_buffer(inst);
+		wave5_handle_bitstream_buffer(inst);
+	}
+
+	if (!(irq_status & BIT(INT_WAVE5_DEC_PIC)))
+		return;
+	ret =3D wave5_vpu_dec_get_output_info(inst, &dec_output_info);
+	if (ret) {
+		v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
+		return;
+	}
+	if (dec_output_info.index_frame_decoded =3D=3D DECODED_IDX_FLAG_NO_FB &&
+	    dec_output_info.index_frame_display =3D=3D DISPLAY_IDX_FLAG_NO_FB) {
+		dev_dbg(inst->dev->dev, "no more frame buffer\n");
+		if (inst->state !=3D VPU_INST_STATE_STOP)
+			inst->state =3D VPU_INST_STATE_WAIT_BUF;
+	} else {
+		wave5_handle_src_buffer(inst);
+
+		if (dec_output_info.index_frame_display >=3D 0) {
+			struct vb2_v4l2_buffer *dst_buf =3D
+				v4l2_m2m_dst_buf_remove_by_idx(inst->v4l2_fh.m2m_ctx,
+							       dec_output_info.index_frame_display);
+			int stride =3D dec_output_info.disp_frame.stride;
+			int height =3D dec_output_info.disp_pic_height;
+
+			if (inst->dst_fmt.num_planes =3D=3D 1) {
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+						      (stride * height * 3 / 2));
+			} else if (inst->dst_fmt.num_planes =3D=3D 2) {
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+						      (stride * height));
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 1,
+						      ((stride / 2) * height));
+			} else if (inst->dst_fmt.num_planes =3D=3D 3) {
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+						      (stride * height));
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 1,
+						      ((stride / 2) * (height / 2)));
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 2,
+						      ((stride / 2) * (height / 2)));
+			}
+
+			dst_buf->vb2_buf.timestamp =3D inst->timestamp;
+			dst_buf->field =3D V4L2_FIELD_NONE;
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+		} else if (dec_output_info.index_frame_display =3D=3D DISPLAY_IDX_FLAG_S=
EQ_END) {
+			static const struct v4l2_event vpu_event_eos =3D {
+				.type =3D V4L2_EVENT_EOS
+			};
+			struct vb2_v4l2_buffer *dst_buf =3D
+				v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+
+			if (!dst_buf)
+				return;
+
+			if (inst->dst_fmt.num_planes =3D=3D 1) {
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+						      vb2_plane_size(&dst_buf->vb2_buf, 0));
+			} else if (inst->dst_fmt.num_planes =3D=3D 2) {
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+						      vb2_plane_size(&dst_buf->vb2_buf, 0));
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 1,
+						      vb2_plane_size(&dst_buf->vb2_buf, 1));
+			} else if (inst->dst_fmt.num_planes =3D=3D 3) {
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+						      vb2_plane_size(&dst_buf->vb2_buf, 0));
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 1,
+						      vb2_plane_size(&dst_buf->vb2_buf, 1));
+				vb2_set_plane_payload(&dst_buf->vb2_buf, 2,
+						      vb2_plane_size(&dst_buf->vb2_buf, 2));
+			}
+
+			dst_buf->vb2_buf.timestamp =3D inst->timestamp;
+			dst_buf->flags |=3D V4L2_BUF_FLAG_LAST;
+			dst_buf->field =3D V4L2_FIELD_NONE;
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+
+			inst->state =3D VPU_INST_STATE_PIC_RUN;
+			v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eos);
+
+			v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
+		}
+	}
+}
+
+static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2=
_capability *cap)
+{
+	strscpy(cap->driver, VPU_DEC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VPU_DEC_DRV_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" VPU_DEC_DRV_NAME, sizeof(cap->bus_info=
));
+
+	return 0;
+}
+
+static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct =
v4l2_frmsizeenum *fsize)
+{
+	const struct vpu_format *vpu_fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	vpu_fmt =3D wave5_get_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		vpu_fmt =3D wave5_get_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_RAW);
+		if (!vpu_fmt)
+			return -EINVAL;
+	}
+
+	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width =3D vpu_fmt->min_width;
+	fsize->stepwise.max_width =3D vpu_fmt->max_width;
+	fsize->stepwise.step_width =3D 1;
+	fsize->stepwise.min_height =3D vpu_fmt->min_height;
+	fsize->stepwise.max_height =3D vpu_fmt->max_height;
+	fsize->stepwise.step_height =3D 1;
+
+	return 0;
+}
+
+static int wave5_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct =
v4l2_fmtdesc *f)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt =3D wave5_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+	f->flags =3D 0;
+
+	return 0;
+}
+
+static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v=
4l2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "4cc %d width %d height %d nm planes %d colorspac=
e %d field : %d\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fmt.pix_mp.field)=
;
+
+	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	vpu_fmt =3D wave5_get_vpu_fmt(f->fmt.pix_mp.pixelformat, VPU_FMT_TYPE_RAW=
);
+	if (!vpu_fmt) {
+		f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
+		f->fmt.pix_mp.num_planes =3D inst->dst_fmt.num_planes;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fmt.=
height);
+	} else {
+		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->ma=
x_width);
+		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt-=
>max_height);
+		const struct v4l2_format_info *info =3D v4l2_format_info(vpu_fmt->v4l2_p=
ix_fmt);
+
+		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+		f->fmt.pix_mp.num_planes =3D info->mem_planes;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+	}
+
+	f->fmt.pix_mp.flags =3D 0;
+	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace =3D inst->colorspace;
+	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
+	f->fmt.pix_mp.hsv_enc =3D inst->hsv_enc;
+	f->fmt.pix_mp.quantization =3D inst->quantization;
+	f->fmt.pix_mp.xfer_func =3D inst->xfer_func;
+	memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved));
+
+	return 0;
+}
+
+static int wave5_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "4cc %d width %d height %d num_planes %d colorspa=
ce %d field %d\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fmt.pix_mp.field)=
;
+
+	ret =3D wave5_vpu_dec_try_fmt_cap(file, fh, f);
+	if (ret)
+		return ret;
+
+	inst->dst_fmt.width =3D f->fmt.pix_mp.width;
+	inst->dst_fmt.height =3D f->fmt.pix_mp.height;
+	inst->dst_fmt.pixelformat =3D f->fmt.pix_mp.pixelformat;
+	inst->dst_fmt.field =3D f->fmt.pix_mp.field;
+	inst->dst_fmt.flags =3D f->fmt.pix_mp.flags;
+	inst->dst_fmt.num_planes =3D f->fmt.pix_mp.num_planes;
+	for (i =3D 0; i < inst->dst_fmt.num_planes; i++) {
+		inst->dst_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp.plane_fmt[i].b=
ytesperline;
+		inst->dst_fmt.plane_fmt[i].sizeimage =3D f->fmt.pix_mp.plane_fmt[i].size=
image;
+	}
+
+	if (inst->dst_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
+	    inst->dst_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M) {
+		inst->cbcr_interleave =3D true;
+		inst->nv21 =3D false;
+	} else if (inst->dst_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
+		   inst->dst_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M) {
+		inst->cbcr_interleave =3D true;
+		inst->nv21 =3D true;
+	} else {
+		inst->cbcr_interleave =3D false;
+		inst->nv21 =3D false;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i;
+
+	f->fmt.pix_mp.width =3D inst->dst_fmt.width;
+	f->fmt.pix_mp.height =3D inst->dst_fmt.height;
+	f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
+	f->fmt.pix_mp.field =3D inst->dst_fmt.field;
+	f->fmt.pix_mp.flags =3D inst->dst_fmt.flags;
+	f->fmt.pix_mp.num_planes =3D inst->dst_fmt.num_planes;
+	for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
+		f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->dst_fmt.plane_fmt[i].b=
ytesperline;
+		f->fmt.pix_mp.plane_fmt[i].sizeimage =3D inst->dst_fmt.plane_fmt[i].size=
image;
+	}
+
+	f->fmt.pix_mp.colorspace =3D inst->colorspace;
+	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
+	f->fmt.pix_mp.hsv_enc =3D inst->hsv_enc;
+	f->fmt.pix_mp.quantization =3D inst->quantization;
+	f->fmt.pix_mp.xfer_func =3D inst->xfer_func;
+
+	return 0;
+}
+
+static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct =
v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "index : %d\n", f->index);
+
+	vpu_fmt =3D wave5_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+	f->flags =3D 0;
+
+	return 0;
+}
+
+static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v=
4l2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "4cc %d width %d height %d num_planes %d colorspa=
ce %d field %d\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.colorspace, f->fmt.pix_mp.field)=
;
+
+	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	vpu_fmt =3D wave5_get_vpu_fmt(f->fmt.pix_mp.pixelformat, VPU_FMT_TYPE_COD=
EC);
+	if (!vpu_fmt) {
+		f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
+		f->fmt.pix_mp.num_planes =3D inst->src_fmt.num_planes;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.=
height);
+	} else {
+		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->ma=
x_width);
+		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt-=
>max_height);
+
+		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+		f->fmt.pix_mp.num_planes =3D 1;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+	}
+
+	f->fmt.pix_mp.flags =3D 0;
+	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
+	memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved));
+
+	return 0;
+}
+
+static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "pixelformat %d width %d height %d num_planes %d =
field : %d\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
+
+	ret =3D wave5_vpu_dec_try_fmt_out(file, fh, f);
+	if (ret)
+		return ret;
+
+	inst->src_fmt.width =3D f->fmt.pix_mp.width;
+	inst->src_fmt.height =3D f->fmt.pix_mp.height;
+	inst->src_fmt.pixelformat =3D f->fmt.pix_mp.pixelformat;
+	inst->src_fmt.field =3D f->fmt.pix_mp.field;
+	inst->src_fmt.flags =3D f->fmt.pix_mp.flags;
+	inst->src_fmt.num_planes =3D f->fmt.pix_mp.num_planes;
+	for (i =3D 0; i < inst->src_fmt.num_planes; i++) {
+		inst->src_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp.plane_fmt[i].b=
ytesperline;
+		inst->src_fmt.plane_fmt[i].sizeimage =3D f->fmt.pix_mp.plane_fmt[i].size=
image;
+	}
+
+	inst->colorspace =3D f->fmt.pix_mp.colorspace;
+	inst->ycbcr_enc =3D f->fmt.pix_mp.ycbcr_enc;
+	inst->hsv_enc =3D f->fmt.pix_mp.hsv_enc;
+	inst->quantization =3D f->fmt.pix_mp.quantization;
+	inst->xfer_func =3D f->fmt.pix_mp.xfer_func;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.h=
eight);
+
+	return 0;
+}
+
+static int wave5_vpu_dec_g_fmt_out(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i;
+
+	f->fmt.pix_mp.width =3D inst->src_fmt.width;
+	f->fmt.pix_mp.height =3D inst->src_fmt.height;
+	f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
+	f->fmt.pix_mp.field =3D inst->src_fmt.field;
+	f->fmt.pix_mp.flags =3D inst->src_fmt.flags;
+	f->fmt.pix_mp.num_planes =3D inst->src_fmt.num_planes;
+	for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
+		f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->src_fmt.plane_fmt[i].b=
ytesperline;
+		f->fmt.pix_mp.plane_fmt[i].sizeimage =3D inst->src_fmt.plane_fmt[i].size=
image;
+	}
+
+	f->fmt.pix_mp.colorspace =3D inst->colorspace;
+	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
+	f->fmt.pix_mp.hsv_enc =3D inst->hsv_enc;
+	f->fmt.pix_mp.quantization =3D inst->quantization;
+	f->fmt.pix_mp.xfer_func =3D inst->xfer_func;
+
+	return 0;
+}
+
+static int wave5_vpu_dec_g_selection(struct file *file, void *fh, struct v=
4l2_selection *s)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d | target : %d\n", s->type, s->target);
+
+	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+		s->r.left =3D 0;
+		s->r.top =3D 0;
+		s->r.width =3D inst->dst_fmt.width;
+		s->r.height =3D inst->dst_fmt.height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r.left =3D 0;
+		s->r.top =3D 0;
+		s->r.width =3D inst->src_fmt.width;
+		s->r.height =3D inst->src_fmt.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_dec_s_selection(struct file *file, void *fh, struct v=
4l2_selection *s)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d | target : %d\n", s->type, s->target);
+
+	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
+		return -EINVAL;
+
+	dev_dbg(inst->dev->dev, "V4L2_SEL_TGT_COMPOSE w: %d h: %d\n", s->r.width,=
 s->r.height);
+	inst->dst_fmt.width =3D s->r.width;
+	inst->dst_fmt.height =3D s->r.height;
+
+	return 0;
+}
+
+static int wave5_vpu_dec_try_decoder_cmd(struct file *file, void *fh, stru=
ct v4l2_decoder_cmd *dc)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "decoder command : %d\n", dc->cmd);
+
+	if (dc->cmd !=3D V4L2_DEC_CMD_STOP && dc->cmd !=3D V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	dc->flags =3D 0;
+
+	if (dc->cmd =3D=3D V4L2_DEC_CMD_STOP) {
+		dc->stop.pts =3D 0;
+	} else if (dc->cmd =3D=3D V4L2_DEC_CMD_START) {
+		dc->start.speed =3D 0;
+		dc->start.format =3D V4L2_DEC_START_FMT_NONE;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v=
4l2_decoder_cmd *dc)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int ret;
+	unsigned long flags;
+
+	dev_dbg(inst->dev->dev, "decoder command : %d\n", dc->cmd);
+
+	ret =3D wave5_vpu_dec_try_decoder_cmd(file, fh, dc);
+	if (ret < 0)
+		return ret;
+
+	if (!wave5_vpu_both_queues_are_streaming(inst))
+		return 0;
+
+	switch (dc->cmd) {
+	case V4L2_DEC_CMD_STOP:
+		inst->state =3D VPU_INST_STATE_STOP;
+
+		spin_lock_irqsave(&inst->bitstream_lock, flags);
+		wave5_vpu_dec_update_bitstream_buffer(inst, 0);
+		spin_unlock_irqrestore(&inst->bitstream_lock, flags);
+		break;
+	case V4L2_DEC_CMD_START:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_dec_subscribe_event(struct v4l2_fh *fh,
+					 const struct v4l2_event_subscription *sub)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d id : %d | flags : %d\n", sub->type, su=
b->id, sub->flags);
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops wave5_vpu_dec_ioctl_ops =3D {
+	.vidioc_querycap =3D wave5_vpu_dec_querycap,
+	.vidioc_enum_framesizes =3D wave5_vpu_dec_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap	=3D wave5_vpu_dec_enum_fmt_cap,
+	.vidioc_s_fmt_vid_cap_mplane =3D wave5_vpu_dec_s_fmt_cap,
+	.vidioc_g_fmt_vid_cap_mplane =3D wave5_vpu_dec_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap_mplane =3D wave5_vpu_dec_try_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out	=3D wave5_vpu_dec_enum_fmt_out,
+	.vidioc_s_fmt_vid_out_mplane =3D wave5_vpu_dec_s_fmt_out,
+	.vidioc_g_fmt_vid_out_mplane =3D wave5_vpu_dec_g_fmt_out,
+	.vidioc_try_fmt_vid_out_mplane =3D wave5_vpu_dec_try_fmt_out,
+
+	.vidioc_g_selection =3D wave5_vpu_dec_g_selection,
+	.vidioc_s_selection =3D wave5_vpu_dec_s_selection,
+
+	.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_decoder_cmd =3D wave5_vpu_dec_try_decoder_cmd,
+	.vidioc_decoder_cmd =3D wave5_vpu_dec_decoder_cmd,
+
+	.vidioc_subscribe_event =3D wave5_vpu_dec_subscribe_event,
+	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
+};
+
+static int wave5_vpu_dec_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst =3D wave5_ctrl_to_vpu_inst(ctrl);
+
+	dev_dbg(inst->dev->dev, "name : %s\n", ctrl->name);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		if (inst->state !=3D VPU_INST_STATE_NONE && inst->state !=3D VPU_INST_ST=
ATE_OPEN)
+			ctrl->val =3D inst->min_dst_frame_buf_count;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(inst->dev->dev, "value : %d\n", ctrl->val);
+
+	return 0;
+}
+
+static int wave5_vpu_dec_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst =3D wave5_ctrl_to_vpu_inst(ctrl);
+
+	dev_dbg(inst->dev->dev, "name : %s | value : %d\n", ctrl->name, ctrl->val=
);
+
+	switch (ctrl->id) {
+	case V4L2_CID_VPU_THUMBNAIL_MODE:
+		inst->thumbnail_mode =3D ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops wave5_vpu_dec_ctrl_ops =3D {
+	.g_volatile_ctrl =3D wave5_vpu_dec_g_volatile_ctrl,
+	.s_ctrl =3D wave5_vpu_dec_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config wave5_vpu_thumbnail_mode =3D {
+	.ops =3D &wave5_vpu_dec_ctrl_ops,
+	.id =3D V4L2_CID_VPU_THUMBNAIL_MODE,
+	.name =3D "thumbnail mode",
+	.type =3D V4L2_CTRL_TYPE_BOOLEAN,
+	.def =3D 0,
+	.min =3D 0,
+	.max =3D 1,
+	.step =3D 1,
+	.flags =3D V4L2_CTRL_FLAG_WRITE_ONLY,
+};
+
+static void wave5_set_default_dec_openparam(struct dec_open_param *open_pa=
ram)
+{
+	open_param->bitstream_mode =3D BS_MODE_INTERRUPT;
+	open_param->stream_endian =3D VPU_STREAM_ENDIAN;
+	open_param->frame_endian =3D VPU_FRAME_ENDIAN;
+}
+
+static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *nu=
m_buffers,
+				     unsigned int *num_planes, unsigned int sizes[],
+			 struct device *alloc_devs[])
+{
+	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane inst_format =3D
+		(q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : ins=
t->dst_fmt;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "num_buffers : %d | num_planes : %d | type : %d\n=
", *num_buffers,
+		*num_planes, q->type);
+
+	if (*num_planes) {
+		if (inst_format.num_planes !=3D *num_planes)
+			return -EINVAL;
+
+		for (i =3D 0; i < *num_planes; i++) {
+			if (sizes[i] < inst_format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes =3D inst_format.num_planes;
+
+		if (*num_planes =3D=3D 1) {
+			sizes[0] =3D inst_format.width * inst_format.height * 3 / 2;
+			if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+				sizes[0] =3D inst_format.plane_fmt[0].sizeimage;
+			dev_dbg(inst->dev->dev, "size[0] : %d\n", sizes[0]);
+		} else if (*num_planes =3D=3D 2) {
+			sizes[0] =3D inst_format.width * inst_format.height;
+			sizes[1] =3D inst_format.width * inst_format.height / 2;
+			dev_dbg(inst->dev->dev, "size[0] :%d | size[1] : %d\n", sizes[0], sizes=
[1]);
+		} else if (*num_planes =3D=3D 3) {
+			sizes[0] =3D inst_format.width * inst_format.height;
+			sizes[1] =3D inst_format.width * inst_format.height / 4;
+			sizes[2] =3D inst_format.width * inst_format.height / 4;
+			dev_dbg(inst->dev->dev, "size[0] : %d | size[1] : %d | size[2] : %d\n",
+				sizes[0], sizes[1], sizes[2]);
+		}
+	}
+
+	if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D V4L2_BUF_TYP=
E_VIDEO_OUTPUT_MPLANE) {
+		struct dec_open_param open_param;
+
+		memset(&open_param, 0, sizeof(struct dec_open_param));
+		wave5_set_default_dec_openparam(&open_param);
+
+		inst->bitstream_vbuf.size =3D ALIGN(inst->src_fmt.plane_fmt[0].sizeimage=
, 1024) * 4;
+		ret =3D wave5_vdi_allocate_dma_memory(inst->dev, &inst->bitstream_vbuf);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "alloc bitstream of size %zu failed\n",
+				inst->bitstream_vbuf.size);
+			return ret;
+		}
+
+		inst->std =3D wave5_to_vpu_codstd(inst->src_fmt.pixelformat);
+		if (inst->std =3D=3D STD_UNKNOWN) {
+			dev_warn(inst->dev->dev, "unsupported pixelformat: %.4s\n",
+				 (char *)&inst->src_fmt.pixelformat);
+			return -EINVAL;
+		}
+		open_param.bitstream_buffer =3D inst->bitstream_vbuf.daddr;
+		open_param.bitstream_buffer_size =3D inst->bitstream_vbuf.size;
+
+		ret =3D wave5_vpu_dec_open(inst, &open_param);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "wave5_vpu_dec_open failed: %d\n", ret);
+			return ret;
+		}
+
+		inst->state =3D VPU_INST_STATE_OPEN;
+
+		if (inst->thumbnail_mode)
+			wave5_vpu_dec_give_command(inst, ENABLE_DEC_THUMBNAIL_MODE, NULL);
+
+		inst->min_src_frame_buf_count =3D *num_buffers;
+	} else if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ &&
+		q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		u32 non_linear_num =3D inst->min_dst_frame_buf_count;
+		u32 fb_stride, fb_height;
+		u32 luma_size, chroma_size;
+
+		*num_buffers =3D inst->min_dst_frame_buf_count;
+
+		for (i =3D 0; i < non_linear_num; i++) {
+			struct frame_buffer *frame =3D &inst->frame_buf[i];
+			struct vpu_buf *vframe =3D &inst->frame_vbuf[i];
+
+			fb_stride =3D inst->dst_fmt.width;
+			fb_height =3D ALIGN(inst->dst_fmt.height, 32);
+			luma_size =3D fb_stride * fb_height;
+			chroma_size =3D ALIGN(fb_stride / 2, 16) * fb_height;
+
+			vframe->size =3D luma_size + chroma_size;
+			ret =3D wave5_vdi_allocate_dma_memory(inst->dev, vframe);
+			if (ret) {
+				dev_dbg(inst->dev->dev, "alloc FBC buff of size %zu failed\n",
+					vframe->size);
+				return ret;
+			}
+
+			frame->buf_y =3D vframe->daddr;
+			frame->buf_cb =3D vframe->daddr + luma_size;
+			frame->buf_cr =3D (dma_addr_t)-1;
+			frame->size =3D vframe->size;
+			frame->width =3D inst->src_fmt.width;
+			frame->stride =3D fb_stride;
+			frame->map_type =3D COMPRESSED_FRAME_MAP;
+			frame->update_fb_info =3D true;
+		}
+	}
+
+	return 0;
+}
+
+static void wave5_vpu_dec_start_streaming_inst_open(struct vb2_queue *q, u=
nsigned int count)
+{
+	struct dec_initial_info initial_info;
+	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
+	int ret;
+
+	ret =3D wave5_vpu_dec_issue_seq_init(inst);
+	if (ret)
+		dev_dbg(inst->dev->dev, "failed wave5_vpu_dec_issue_seq_init %d\n", ret)=
;
+
+	if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		dev_dbg(inst->dev->dev, "failed to call vpu_wait_interrupt()\n");
+
+	ret =3D wave5_vpu_dec_complete_seq_init(inst, &initial_info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "vpu_dec_complete_seq_init: %d, reason : %d\n",
+			ret, initial_info.seq_init_err_reason);
+	} else {
+		static const struct v4l2_event vpu_event_src_ch =3D {
+			.type =3D V4L2_EVENT_SOURCE_CHANGE,
+			.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
+		};
+
+		dev_dbg(inst->dev->dev, "width %d height %d profile %d | minbuffer : %u\=
n",
+			initial_info.pic_width, initial_info.pic_height,
+			initial_info.profile, initial_info.min_frame_buffer_count);
+
+		inst->state =3D VPU_INST_STATE_INIT_SEQ;
+		inst->min_dst_frame_buf_count =3D initial_info.min_frame_buffer_count + =
1;
+
+		if (initial_info.pic_width !=3D inst->src_fmt.width ||
+		    initial_info.pic_height !=3D inst->src_fmt.height) {
+			wave5_update_pix_fmt(&inst->src_fmt, initial_info.pic_width,
+					     initial_info.pic_height);
+			wave5_update_pix_fmt(&inst->dst_fmt, initial_info.pic_width,
+					     initial_info.pic_height);
+		}
+		v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_src_ch);
+	}
+}
+
+static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
+	struct vpu_buffer *vpu_buf =3D wave5_to_vpu_buf(vbuf);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld |=
 size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+
+	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		vpu_buf->consumed =3D false;
+		wave5_handle_bitstream_buffer(inst);
+		vbuf->sequence =3D inst->queued_src_buf_num++;
+
+		if (inst->state =3D=3D VPU_INST_STATE_PIC_RUN)
+			inst->ops->start_process(inst);
+	}
+
+	if (vb->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return;
+
+	if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ) {
+		dma_addr_t buf_addr_y =3D 0, buf_addr_cb =3D 0, buf_addr_cr =3D 0;
+		u32 buf_size =3D 0;
+		u32 non_linear_num =3D inst->min_dst_frame_buf_count;
+		u32 fb_stride =3D inst->dst_fmt.width;
+		u32 luma_size =3D fb_stride * inst->dst_fmt.height;
+		u32 chroma_size =3D (fb_stride / 2) * (inst->dst_fmt.height / 2);
+
+		if (inst->dst_fmt.num_planes =3D=3D 1) {
+			buf_size =3D vb2_plane_size(&vbuf->vb2_buf, 0);
+			buf_addr_y =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+			buf_addr_cb =3D buf_addr_y + luma_size;
+			buf_addr_cr =3D buf_addr_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes =3D=3D 2) {
+			buf_size =3D vb2_plane_size(&vbuf->vb2_buf, 0) +
+				vb2_plane_size(&vbuf->vb2_buf, 1);
+			buf_addr_y =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+			buf_addr_cb =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 1);
+			buf_addr_cr =3D buf_addr_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes =3D=3D 3) {
+			buf_size =3D vb2_plane_size(&vbuf->vb2_buf, 0) +
+				vb2_plane_size(&vbuf->vb2_buf, 1) +
+				vb2_plane_size(&vbuf->vb2_buf, 2);
+			buf_addr_y =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+			buf_addr_cb =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 1);
+			buf_addr_cr =3D vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 2);
+		}
+		inst->frame_buf[vb->index + non_linear_num].buf_y =3D buf_addr_y;
+		inst->frame_buf[vb->index + non_linear_num].buf_cb =3D buf_addr_cb;
+		inst->frame_buf[vb->index + non_linear_num].buf_cr =3D buf_addr_cr;
+		inst->frame_buf[vb->index + non_linear_num].size =3D buf_size;
+		inst->frame_buf[vb->index + non_linear_num].width =3D inst->src_fmt.widt=
h;
+		inst->frame_buf[vb->index + non_linear_num].stride =3D fb_stride;
+		inst->frame_buf[vb->index + non_linear_num].map_type =3D LINEAR_FRAME_MA=
P;
+		inst->frame_buf[vb->index + non_linear_num].update_fb_info =3D true;
+	}
+
+	if (inst->state =3D=3D VPU_INST_STATE_PIC_RUN ||
+	    inst->state =3D=3D VPU_INST_STATE_STOP ||
+	    inst->state =3D=3D VPU_INST_STATE_WAIT_BUF) {
+		wave5_vpu_dec_clr_disp_flag(inst, vb->index);
+		if (inst->state =3D=3D VPU_INST_STATE_WAIT_BUF)
+			inst->state =3D VPU_INST_STATE_PIC_RUN;
+		if (inst->state =3D=3D VPU_INST_STATE_STOP)
+			inst->ops->start_process(inst);
+	}
+	vbuf->sequence =3D inst->queued_dst_buf_num++;
+}
+
+static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int=
 count)
+{
+	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
+	int ret;
+
+	dev_dbg(inst->dev->dev, "type : %d\n", q->type);
+
+	if (inst->state =3D=3D VPU_INST_STATE_OPEN)
+		wave5_vpu_dec_start_streaming_inst_open(q, count);
+
+	if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ &&
+	    q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		u32 non_linear_num =3D inst->min_dst_frame_buf_count;
+		u32 linear_num =3D inst->min_dst_frame_buf_count;
+		u32 stride =3D inst->dst_fmt.width;
+
+		dev_dbg(inst->dev->dev, "stride %d dst height %d\n", stride, inst->dst_f=
mt.height);
+		ret =3D wave5_vpu_dec_register_frame_buffer_ex(inst, non_linear_num, lin=
ear_num,
+							     stride, inst->dst_fmt.height,
+							    COMPRESSED_FRAME_MAP);
+		if (ret)
+			dev_dbg(inst->dev->dev, "fail vpu_dec_register_frame_buffer_ex %d", ret=
);
+
+		inst->state =3D VPU_INST_STATE_PIC_RUN;
+	}
+
+	return 0;
+}
+
+static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
+	struct vb2_v4l2_buffer *buf;
+	bool check_cmd =3D TRUE;
+
+	dev_dbg(inst->dev->dev, "type : %d\n", q->type);
+
+	if (wave5_vpu_both_queues_are_streaming(inst))
+		inst->state =3D VPU_INST_STATE_STOP;
+
+	while (check_cmd) {
+		struct queue_status_info q_status;
+		struct dec_output_info dec_output_info;
+		int ret;
+
+		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
+
+		if (q_status.instance_queue_count + q_status.report_queue_count =3D=3D 0=
)
+			break;
+
+		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+			break;
+
+		ret =3D wave5_vpu_dec_get_output_info(inst, &dec_output_info);
+	}
+
+	if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		while ((buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx))) {
+			dev_dbg(inst->dev->dev, "buf type : %4d | index : %4d\n", buf->vb2_buf.=
type,
+				buf->vb2_buf.index);
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
+		}
+	} else {
+		while ((buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx))) {
+			u32 plane;
+
+			dev_dbg(inst->dev->dev, "buf type : %4d | index : %4d\n", buf->vb2_buf.=
type,
+				buf->vb2_buf.index);
+
+			for (plane =3D 0; plane < inst->dst_fmt.num_planes; plane++)
+				vb2_set_plane_payload(&buf->vb2_buf, plane, 0);
+
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
+		}
+	}
+}
+
+static const struct vb2_ops wave5_vpu_dec_vb2_ops =3D {
+	.queue_setup =3D wave5_vpu_dec_queue_setup,
+	.wait_prepare =3D vb2_ops_wait_prepare,
+	.wait_finish =3D vb2_ops_wait_finish,
+	.buf_queue =3D wave5_vpu_dec_buf_queue,
+	.start_streaming =3D wave5_vpu_dec_start_streaming,
+	.stop_streaming =3D wave5_vpu_dec_stop_streaming,
+};
+
+static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fm=
t,
+				     struct v4l2_pix_format_mplane *dst_fmt)
+{
+	unsigned int dst_pix_fmt =3D wave5_vpu_dec_fmt_list[VPU_FMT_TYPE_RAW][0].=
v4l2_pix_fmt;
+	const struct v4l2_format_info *dst_fmt_info =3D v4l2_format_info(dst_pix_=
fmt);
+
+	src_fmt->pixelformat =3D wave5_vpu_dec_fmt_list[VPU_FMT_TYPE_CODEC][0].v4=
l2_pix_fmt;
+	src_fmt->field =3D V4L2_FIELD_NONE;
+	src_fmt->flags =3D 0;
+	src_fmt->num_planes =3D 1;
+	wave5_update_pix_fmt(src_fmt, 720, 480);
+
+	dst_fmt->pixelformat =3D dst_pix_fmt;
+	dst_fmt->field =3D V4L2_FIELD_NONE;
+	dst_fmt->flags =3D 0;
+	dst_fmt->num_planes =3D dst_fmt_info->mem_planes;
+	wave5_update_pix_fmt(dst_fmt, 736, 480);
+}
+
+static int wave5_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, =
struct vb2_queue *dst_vq)
+{
+	struct vpu_instance *inst =3D priv;
+	int ret;
+
+	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->mem_ops =3D &vb2_dma_contig_memops;
+	src_vq->ops =3D &wave5_vpu_dec_vb2_ops;
+	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
+	src_vq->allow_zero_bytesused =3D 1;
+	src_vq->min_buffers_needed =3D 0;
+	src_vq->drv_priv =3D inst;
+	src_vq->lock =3D &inst->dev->dev_lock;
+	src_vq->dev =3D inst->dev->v4l2_dev.dev;
+	ret =3D vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
+	dst_vq->ops =3D &wave5_vpu_dec_vb2_ops;
+	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
+	dst_vq->allow_zero_bytesused =3D 1;
+	dst_vq->min_buffers_needed =3D 0;
+	dst_vq->drv_priv =3D inst;
+	dst_vq->lock =3D &inst->dev->dev_lock;
+	dst_vq->dev =3D inst->dev->v4l2_dev.dev;
+	ret =3D vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct vpu_instance_ops wave5_vpu_dec_inst_ops =3D {
+	.start_process =3D wave5_vpu_dec_start_decode,
+	.stop_process =3D wave5_vpu_dec_stop_decode,
+	.finish_process =3D wave5_vpu_dec_finish_decode,
+};
+
+static int wave5_vpu_open_dec(struct file *filp)
+{
+	struct video_device *vdev =3D video_devdata(filp);
+	struct vpu_device *dev =3D video_drvdata(filp);
+	struct vpu_instance *inst =3D NULL;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->dev =3D dev;
+	inst->type =3D VPU_INST_TYPE_DEC;
+	inst->ops =3D &wave5_vpu_dec_inst_ops;
+
+	spin_lock_init(&inst->bitstream_lock);
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data =3D &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh);
+
+	inst->v4l2_fh.m2m_ctx =3D
+		v4l2_m2m_ctx_init(dev->v4l2_m2m_dev, inst, wave5_vpu_dec_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret =3D PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(&inst->v4l2_ctrl_hdl, 10);
+	v4l2_ctrl_new_custom(&inst->v4l2_ctrl_hdl, &wave5_vpu_thumbnail_mode, NUL=
L);
+	ctrl =3D v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave5_vpu_dec_ctrl_ops,
+				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
+	if (ctrl)
+		ctrl->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
+
+	if (inst->v4l2_ctrl_hdl.error) {
+		ret =3D -ENODEV;
+		goto free_inst;
+	}
+
+	inst->v4l2_fh.ctrl_handler =3D &inst->v4l2_ctrl_hdl;
+	v4l2_ctrl_handler_setup(&inst->v4l2_ctrl_hdl);
+
+	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->colorspace =3D V4L2_COLORSPACE_REC709;
+	inst->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
+	inst->hsv_enc =3D 0;
+	inst->quantization =3D V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
+
+	return 0;
+
+free_inst:
+	kfree(inst);
+	return ret;
+}
+
+static int wave5_vpu_dec_release(struct file *filp)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(filp->private_data);
+	u32 fail_res;
+	int retry_count =3D 10;
+	int i, ret;
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	if (inst->state !=3D VPU_INST_STATE_NONE) {
+		do {
+			fail_res =3D 0;
+			ret =3D wave5_vpu_dec_close(inst, &fail_res);
+			if (ret && ret !=3D -EIO)
+				break;
+			if (fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNING)
+				break;
+			if (!wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT))
+				break;
+		} while (--retry_count);
+
+		if (fail_res =3D=3D WAVE5_SYSERR_VPU_STILL_RUNNING)
+			dev_warn(inst->dev->dev, "close fail res %u\n", fail_res);
+		if (ret && ret !=3D -EIO)
+			dev_warn(inst->dev->dev, "close fail ret=3D%d\n", ret);
+	}
+
+	for (i =3D 0; i < inst->min_dst_frame_buf_count; i++)
+		wave5_vdi_free_dma_memory(inst->dev, &inst->frame_vbuf[i]);
+
+	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	kfree(inst);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations wave5_vpu_dec_fops =3D {
+	.owner =3D THIS_MODULE,
+	.open =3D wave5_vpu_open_dec,
+	.release =3D wave5_vpu_dec_release,
+	.unlocked_ioctl =3D video_ioctl2,
+	.poll =3D v4l2_m2m_fop_poll,
+	.mmap =3D v4l2_m2m_fop_mmap,
+};
+
+int wave5_vpu_dec_register_device(struct vpu_device *dev)
+{
+	struct video_device *vdev_dec;
+	int ret;
+
+	vdev_dec =3D devm_kzalloc(dev->v4l2_dev.dev, sizeof(*vdev_dec), GFP_KERNE=
L);
+	if (!vdev_dec)
+		return -ENOMEM;
+
+	dev->video_dev_dec =3D vdev_dec;
+
+	strscpy(vdev_dec->name, VPU_DEC_DEV_NAME, sizeof(vdev_dec->name));
+	vdev_dec->fops =3D &wave5_vpu_dec_fops;
+	vdev_dec->ioctl_ops =3D &wave5_vpu_dec_ioctl_ops;
+	vdev_dec->release =3D video_device_release_empty;
+	vdev_dec->v4l2_dev =3D &dev->v4l2_dev;
+	vdev_dec->vfl_dir =3D VFL_DIR_M2M;
+	vdev_dec->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_dec->lock =3D &dev->dev_lock;
+
+	ret =3D video_register_device(vdev_dec, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	video_set_drvdata(vdev_dec, dev);
+
+	return 0;
+}
+
+void wave5_vpu_dec_unregister_device(struct vpu_device *dev)
+{
+	video_unregister_device(dev->video_dev_dec);
+}
+
diff --git a/drivers/staging/media/wave5/wave5-vpu-enc.c b/drivers/staging/=
media/wave5/wave5-vpu-enc.c
new file mode 100644
index 000000000000..acd2cb9020fd
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vpu-enc.c
@@ -0,0 +1,1532 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave5 series multi-standard codec IP - encoder interface
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#include "wave5-vpu.h"
+
+#define VPU_ENC_DEV_NAME "C&M VPU encoder"
+#define VPU_ENC_DRV_NAME "vpu-enc"
+
+static const struct vpu_format wave5_vpu_enc_fmt_list[2][6] =3D {
+	[VPU_FMT_TYPE_CODEC] =3D {
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_HEVC,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_H264,
+			.max_width =3D 8192,
+			.min_width =3D 32,
+			.max_height =3D 8192,
+			.min_height =3D 32,
+		},
+	},
+	[VPU_FMT_TYPE_RAW] =3D {
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUV420M,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV12M,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+		{
+			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV21M,
+			.max_width =3D 8192,
+			.min_width =3D 8,
+			.max_height =3D 8192,
+			.min_height =3D 8,
+		},
+	}
+};
+
+static enum wave_std wave5_to_vpu_wavestd(unsigned int v4l2_pix_fmt)
+{
+	switch (v4l2_pix_fmt) {
+	case V4L2_PIX_FMT_H264:
+		return W_AVC_ENC;
+	case V4L2_PIX_FMT_HEVC:
+		return W_HEVC_ENC;
+	default:
+		return STD_UNKNOWN;
+	}
+}
+
+static const struct vpu_format *wave5_find_vpu_format(unsigned int v4l2_pi=
x_fmt,
+						      enum vpu_fmt_type type)
+{
+	unsigned int index;
+
+	for (index =3D 0; index < ARRAY_SIZE(wave5_vpu_enc_fmt_list[type]); index=
++) {
+		if (wave5_vpu_enc_fmt_list[type][index].v4l2_pix_fmt =3D=3D v4l2_pix_fmt=
)
+			return &wave5_vpu_enc_fmt_list[type][index];
+	}
+
+	return NULL;
+}
+
+static const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx=
, enum vpu_fmt_type type)
+{
+	if (idx >=3D ARRAY_SIZE(wave5_vpu_enc_fmt_list[type]))
+		return NULL;
+
+	if (!wave5_vpu_enc_fmt_list[type][idx].v4l2_pix_fmt)
+		return NULL;
+
+	return &wave5_vpu_enc_fmt_list[type][idx];
+}
+
+static struct vb2_v4l2_buffer *wave5_get_valid_src_buf(struct vpu_instance=
 *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf =3D NULL;
+
+	v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
+		vpu_buf =3D wave5_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "no consumed src idx : %d\n",
+				vb2_v4l2_buf->vb2_buf.index);
+			return vb2_v4l2_buf;
+		}
+	}
+
+	return NULL;
+}
+
+static struct vb2_v4l2_buffer *wave5_get_valid_dst_buf(struct vpu_instance=
 *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
+		vpu_buf =3D wave5_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "no consumed dst idx : %d\n",
+				vb2_v4l2_buf->vb2_buf.index);
+			return vb2_v4l2_buf;
+		}
+	}
+
+	return NULL;
+}
+
+static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, un=
signed int width,
+				 unsigned int height)
+{
+	switch (pix_mp->pixelformat) {
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height * 3 / 2;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		break;
+	case V4L2_PIX_FMT_YUV420M:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32) / 2;
+		pix_mp->plane_fmt[1].sizeimage =3D round_up(width, 32) * height / 4;
+		memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->plane_fmt[1].re=
served));
+		pix_mp->plane_fmt[2].bytesperline =3D round_up(width, 32) / 2;
+		pix_mp->plane_fmt[2].sizeimage =3D round_up(width, 32) * height / 4;
+		memset(&pix_mp->plane_fmt[2].reserved, 0, sizeof(pix_mp->plane_fmt[2].re=
served));
+		break;
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		pix_mp->plane_fmt[1].bytesperline =3D round_up(width, 32);
+		pix_mp->plane_fmt[1].sizeimage =3D round_up(width, 32) * height / 2;
+		memset(&pix_mp->plane_fmt[1].reserved, 0, sizeof(pix_mp->plane_fmt[1].re=
served));
+		break;
+	default:
+		pix_mp->width =3D round_up(width, 32);
+		pix_mp->height =3D height;
+		pix_mp->plane_fmt[0].bytesperline =3D 0;
+		pix_mp->plane_fmt[0].sizeimage =3D round_up(width, 32) * height;
+		memset(&pix_mp->plane_fmt[0].reserved, 0, sizeof(pix_mp->plane_fmt[0].re=
served));
+		break;
+	}
+}
+
+static void wave5_vpu_enc_start_encode(struct vpu_instance *inst)
+{
+	int ret;
+	u32 max_cmd_q =3D 0;
+
+	max_cmd_q =3D (inst->min_src_frame_buf_count < COMMAND_QUEUE_DEPTH) ?
+		inst->min_src_frame_buf_count : COMMAND_QUEUE_DEPTH;
+
+	if (inst->state =3D=3D VPU_INST_STATE_STOP)
+		max_cmd_q =3D 1;
+
+	while (max_cmd_q) {
+		struct vb2_v4l2_buffer *src_buf;
+		struct vb2_v4l2_buffer *dst_buf;
+		struct vpu_buffer *src_vbuf;
+		struct vpu_buffer *dst_vbuf;
+		struct frame_buffer frame_buf;
+		struct enc_param pic_param;
+		u32 luma_size =3D (inst->dst_fmt.width * inst->dst_fmt.height);
+		u32 chroma_size =3D ((inst->dst_fmt.width / 2) * (inst->dst_fmt.height /=
 2));
+		u32 fail_res;
+
+		memset(&pic_param, 0, sizeof(struct enc_param));
+		memset(&frame_buf, 0, sizeof(struct frame_buffer));
+
+		src_buf =3D wave5_get_valid_src_buf(inst);
+		dst_buf =3D wave5_get_valid_dst_buf(inst);
+
+		if (!dst_buf) {
+			dev_dbg(inst->dev->dev, "no valid dst buf\n");
+			break;
+		}
+
+		dst_vbuf =3D wave5_to_vpu_buf(dst_buf);
+		pic_param.pic_stream_buffer_addr =3D
+			vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+		pic_param.pic_stream_buffer_size =3D
+			vb2_plane_size(&dst_buf->vb2_buf, 0);
+
+		if (!src_buf) {
+			dev_dbg(inst->dev->dev, "no valid src buf\n");
+			if (inst->state =3D=3D VPU_INST_STATE_STOP)
+				pic_param.src_end_flag =3D 1;
+			else
+				break;
+		} else {
+			src_vbuf =3D wave5_to_vpu_buf(src_buf);
+			if (inst->src_fmt.num_planes =3D=3D 1) {
+				frame_buf.buf_y =3D
+					vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+				frame_buf.buf_cb =3D frame_buf.buf_y + luma_size;
+				frame_buf.buf_cr =3D frame_buf.buf_cb + chroma_size;
+			} else if (inst->src_fmt.num_planes =3D=3D 2) {
+				frame_buf.buf_y =3D
+					vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+				frame_buf.buf_cb =3D
+					vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
+				frame_buf.buf_cr =3D frame_buf.buf_cb + chroma_size;
+			} else if (inst->src_fmt.num_planes =3D=3D 3) {
+				frame_buf.buf_y =3D
+					vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+				frame_buf.buf_cb =3D
+					vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
+				frame_buf.buf_cr =3D
+					vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 2);
+			}
+			frame_buf.stride =3D inst->dst_fmt.width;
+			pic_param.src_idx =3D src_buf->vb2_buf.index;
+		}
+
+		pic_param.source_frame =3D &frame_buf;
+		pic_param.code_option.implicit_header_encode =3D 1;
+		ret =3D wave5_vpu_enc_start_one_frame(inst, &pic_param, &fail_res);
+		if (ret) {
+			if (fail_res =3D=3D WAVE5_SYSERR_QUEUEING_FAIL)
+				break;
+
+			dev_dbg(inst->dev->dev, "fail wave5_vpu_enc_start_one_frame() %d\n",
+				ret);
+			src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+			dst_buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+			inst->state =3D VPU_INST_STATE_STOP;
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+		} else {
+			dev_dbg(inst->dev->dev, "success  wave5_vpu_enc_start_one_frame()\n");
+			if (src_buf)
+				src_vbuf->consumed =3D TRUE;
+			if (dst_buf)
+				dst_vbuf->consumed =3D TRUE;
+		}
+
+		max_cmd_q--;
+	}
+}
+
+static void wave5_vpu_enc_stop_encode(struct vpu_instance *inst)
+{
+	inst->state =3D VPU_INST_STATE_STOP;
+
+	v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+static void wave5_vpu_enc_finish_encode(struct vpu_instance *inst)
+{
+	int ret;
+	struct enc_output_info enc_output_info;
+	int irq_status;
+	struct vb2_v4l2_buffer *dst_buf =3D NULL;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf =3D NULL;
+
+	if (kfifo_out(&inst->dev->irq_status, &irq_status, sizeof(int)))
+		wave5_vpu_clear_interrupt_ex(inst, irq_status);
+
+	ret =3D wave5_vpu_enc_get_output_info(inst, &enc_output_info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "vpu_enc_get_output_info fail %d  reason: %d | i=
nfo : %d\n",
+			ret, enc_output_info.error_reason, enc_output_info.warn_info);
+		return;
+	}
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		dst_buf =3D &v4l2_m2m_buf->vb;
+		if (enc_output_info.bitstream_buffer =3D=3D
+			vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0))
+			break;
+	}
+
+	if (enc_output_info.enc_src_idx >=3D 0) {
+		struct vb2_v4l2_buffer *src_buf =3D
+			v4l2_m2m_src_buf_remove_by_idx(inst->v4l2_fh.m2m_ctx,
+						       enc_output_info.enc_src_idx);
+
+		inst->timestamp =3D src_buf->vb2_buf.timestamp;
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+	}
+
+	if (enc_output_info.recon_frame_index =3D=3D RECON_IDX_FLAG_ENC_END) {
+		static const struct v4l2_event vpu_event_eos =3D {
+			.type =3D V4L2_EVENT_EOS
+		};
+
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		dst_buf->vb2_buf.timestamp =3D inst->timestamp;
+		dst_buf->field =3D V4L2_FIELD_NONE;
+		dst_buf->flags |=3D V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+
+		inst->state =3D VPU_INST_STATE_PIC_RUN;
+		v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eos);
+
+		v4l2_m2m_job_finish(inst->dev->v4l2_m2m_dev, inst->v4l2_fh.m2m_ctx);
+	} else {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, enc_output_info.bitstream_si=
ze);
+
+		dst_buf->vb2_buf.timestamp =3D inst->timestamp;
+		dst_buf->field =3D V4L2_FIELD_NONE;
+		if (enc_output_info.pic_type =3D=3D PIC_TYPE_I) {
+			if (enc_output_info.enc_vcl_nut =3D=3D 19 ||
+			    enc_output_info.enc_vcl_nut =3D=3D 20)
+				dst_buf->flags |=3D V4L2_BUF_FLAG_KEYFRAME;
+			else
+				dst_buf->flags |=3D V4L2_BUF_FLAG_PFRAME;
+		} else if (enc_output_info.pic_type =3D=3D PIC_TYPE_P) {
+			dst_buf->flags |=3D V4L2_BUF_FLAG_PFRAME;
+		} else if (enc_output_info.pic_type =3D=3D PIC_TYPE_B) {
+			dst_buf->flags |=3D V4L2_BUF_FLAG_BFRAME;
+		}
+
+		v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+	}
+}
+
+static int wave5_vpu_enc_querycap(struct file *file, void *fh, struct v4l2=
_capability *cap)
+{
+	strscpy(cap->driver, VPU_ENC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VPU_ENC_DRV_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" VPU_ENC_DRV_NAME, sizeof(cap->bus_info=
));
+
+	return 0;
+}
+
+static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct =
v4l2_frmsizeenum *fsize)
+{
+	const struct vpu_format *vpu_fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	vpu_fmt =3D wave5_find_vpu_format(fsize->pixel_format, VPU_FMT_TYPE_CODEC=
);
+	if (!vpu_fmt) {
+		vpu_fmt =3D wave5_find_vpu_format(fsize->pixel_format, VPU_FMT_TYPE_RAW)=
;
+		if (!vpu_fmt)
+			return -EINVAL;
+	}
+
+	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width =3D vpu_fmt->min_width;
+	fsize->stepwise.max_width =3D vpu_fmt->max_width;
+	fsize->stepwise.step_width =3D 1;
+	fsize->stepwise.min_height =3D vpu_fmt->min_height;
+	fsize->stepwise.max_height =3D vpu_fmt->max_height;
+	fsize->stepwise.step_height =3D 1;
+
+	return 0;
+}
+
+static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct =
v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "index : %d\n", f->index);
+
+	vpu_fmt =3D wave5_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+	f->flags =3D 0;
+
+	return 0;
+}
+
+static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v=
4l2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "fourcc: %d width %d height %d num_planes %d fiel=
d : %d\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
+
+	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	vpu_fmt =3D wave5_find_vpu_format(f->fmt.pix_mp.pixelformat, VPU_FMT_TYPE=
_CODEC);
+	if (!vpu_fmt) {
+		f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
+		f->fmt.pix_mp.num_planes =3D inst->dst_fmt.num_planes;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fmt.=
height);
+	} else {
+		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->ma=
x_width);
+		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt-=
>max_height);
+
+		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+		f->fmt.pix_mp.num_planes =3D 1;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+	}
+
+	f->fmt.pix_mp.flags =3D 0;
+	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace =3D inst->colorspace;
+	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
+	f->fmt.pix_mp.hsv_enc =3D inst->hsv_enc;
+	f->fmt.pix_mp.quantization =3D inst->quantization;
+	f->fmt.pix_mp.xfer_func =3D inst->xfer_func;
+	memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved));
+
+	return 0;
+}
+
+static int wave5_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "4cc %d width %d height %d num_planes %d field %d=
\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
+
+	ret =3D wave5_vpu_enc_try_fmt_cap(file, fh, f);
+	if (ret)
+		return ret;
+
+	inst->dst_fmt.width =3D f->fmt.pix_mp.width;
+	inst->dst_fmt.height =3D f->fmt.pix_mp.height;
+	inst->dst_fmt.pixelformat =3D f->fmt.pix_mp.pixelformat;
+	inst->dst_fmt.field =3D f->fmt.pix_mp.field;
+	inst->dst_fmt.flags =3D f->fmt.pix_mp.flags;
+	inst->dst_fmt.num_planes =3D f->fmt.pix_mp.num_planes;
+	for (i =3D 0; i < inst->dst_fmt.num_planes; i++) {
+		inst->dst_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp.plane_fmt[i].b=
ytesperline;
+		inst->dst_fmt.plane_fmt[i].sizeimage =3D f->fmt.pix_mp.plane_fmt[i].size=
image;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i;
+
+	f->fmt.pix_mp.width =3D inst->dst_fmt.width;
+	f->fmt.pix_mp.height =3D inst->dst_fmt.height;
+	f->fmt.pix_mp.pixelformat =3D inst->dst_fmt.pixelformat;
+	f->fmt.pix_mp.field =3D inst->dst_fmt.field;
+	f->fmt.pix_mp.flags =3D inst->dst_fmt.flags;
+	f->fmt.pix_mp.num_planes =3D inst->dst_fmt.num_planes;
+	for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
+		f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->dst_fmt.plane_fmt[i].b=
ytesperline;
+		f->fmt.pix_mp.plane_fmt[i].sizeimage =3D inst->dst_fmt.plane_fmt[i].size=
image;
+	}
+
+	f->fmt.pix_mp.colorspace =3D inst->colorspace;
+	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
+	f->fmt.pix_mp.hsv_enc =3D inst->hsv_enc;
+	f->fmt.pix_mp.quantization =3D inst->quantization;
+	f->fmt.pix_mp.xfer_func =3D inst->xfer_func;
+
+	return 0;
+}
+
+static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct =
v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "index : %d\n", f->index);
+
+	vpu_fmt =3D wave5_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+	f->flags =3D 0;
+
+	return 0;
+}
+
+static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v=
4l2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "4cc %d width %d height %d num_planes %d field %d=
\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
+
+	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	vpu_fmt =3D wave5_find_vpu_format(f->fmt.pix_mp.pixelformat, VPU_FMT_TYPE=
_RAW);
+	if (!vpu_fmt) {
+		f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
+		f->fmt.pix_mp.num_planes =3D inst->src_fmt.num_planes;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.=
height);
+	} else {
+		int width =3D clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->ma=
x_width);
+		int height =3D clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt-=
>max_height);
+		const struct v4l2_format_info *info =3D v4l2_format_info(vpu_fmt->v4l2_p=
ix_fmt);
+
+		f->fmt.pix_mp.pixelformat =3D vpu_fmt->v4l2_pix_fmt;
+		f->fmt.pix_mp.num_planes =3D info->mem_planes;
+		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+	}
+
+	f->fmt.pix_mp.flags =3D 0;
+	f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
+	memset(&f->fmt.pix_mp.reserved, 0, sizeof(f->fmt.pix_mp.reserved));
+
+	return 0;
+}
+
+static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "4cc %d width %d height %d num_planes %d field : =
%d\n",
+		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+		f->fmt.pix_mp.num_planes, f->fmt.pix_mp.field);
+
+	ret =3D wave5_vpu_enc_try_fmt_out(file, fh, f);
+	if (ret)
+		return ret;
+
+	inst->src_fmt.width =3D f->fmt.pix_mp.width;
+	inst->src_fmt.height =3D f->fmt.pix_mp.height;
+	inst->src_fmt.pixelformat =3D f->fmt.pix_mp.pixelformat;
+	inst->src_fmt.field =3D f->fmt.pix_mp.field;
+	inst->src_fmt.flags =3D f->fmt.pix_mp.flags;
+	inst->src_fmt.num_planes =3D f->fmt.pix_mp.num_planes;
+	for (i =3D 0; i < inst->src_fmt.num_planes; i++) {
+		inst->src_fmt.plane_fmt[i].bytesperline =3D f->fmt.pix_mp.plane_fmt[i].b=
ytesperline;
+		inst->src_fmt.plane_fmt[i].sizeimage =3D f->fmt.pix_mp.plane_fmt[i].size=
image;
+	}
+
+	if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
+	    inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV12M) {
+		inst->cbcr_interleave =3D true;
+		inst->nv21 =3D false;
+	} else if (inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
+		   inst->src_fmt.pixelformat =3D=3D V4L2_PIX_FMT_NV21M) {
+		inst->cbcr_interleave =3D true;
+		inst->nv21 =3D true;
+	} else {
+		inst->cbcr_interleave =3D false;
+		inst->nv21 =3D false;
+	}
+
+	inst->colorspace =3D f->fmt.pix_mp.colorspace;
+	inst->ycbcr_enc =3D f->fmt.pix_mp.ycbcr_enc;
+	inst->hsv_enc =3D f->fmt.pix_mp.hsv_enc;
+	inst->quantization =3D f->fmt.pix_mp.quantization;
+	inst->xfer_func =3D f->fmt.pix_mp.xfer_func;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.h=
eight);
+
+	return 0;
+}
+
+static int wave5_vpu_enc_g_fmt_out(struct file *file, void *fh, struct v4l=
2_format *f)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int i;
+
+	dev_dbg(inst->dev->dev, "\n");
+
+	f->fmt.pix_mp.width =3D inst->src_fmt.width;
+	f->fmt.pix_mp.height =3D inst->src_fmt.height;
+	f->fmt.pix_mp.pixelformat =3D inst->src_fmt.pixelformat;
+	f->fmt.pix_mp.field =3D inst->src_fmt.field;
+	f->fmt.pix_mp.flags =3D inst->src_fmt.flags;
+	f->fmt.pix_mp.num_planes =3D inst->src_fmt.num_planes;
+	for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
+		f->fmt.pix_mp.plane_fmt[i].bytesperline =3D inst->src_fmt.plane_fmt[i].b=
ytesperline;
+		f->fmt.pix_mp.plane_fmt[i].sizeimage =3D inst->src_fmt.plane_fmt[i].size=
image;
+	}
+
+	f->fmt.pix_mp.colorspace =3D inst->colorspace;
+	f->fmt.pix_mp.ycbcr_enc =3D inst->ycbcr_enc;
+	f->fmt.pix_mp.hsv_enc =3D inst->hsv_enc;
+	f->fmt.pix_mp.quantization =3D inst->quantization;
+	f->fmt.pix_mp.xfer_func =3D inst->xfer_func;
+
+	return 0;
+}
+
+static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v=
4l2_selection *s)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d | target : %d\n", s->type, s->target);
+
+	if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		switch (s->target) {
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+			s->r.left =3D 0;
+			s->r.top =3D 0;
+			s->r.width =3D inst->src_fmt.width;
+			s->r.height =3D inst->src_fmt.height;
+			break;
+		case V4L2_SEL_TGT_CROP:
+			s->r.left =3D 0;
+			s->r.top =3D 0;
+			s->r.width =3D inst->dst_fmt.width;
+			s->r.height =3D inst->dst_fmt.height;
+			dev_dbg(inst->dev->dev, "V4L2_SEL_TGT_CROP width : %d | height : %d\n",
+				s->r.width, s->r.height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v=
4l2_selection *s)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d | target : %d\n", s->type, s->target);
+
+	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	if (s->target !=3D V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	dev_dbg(inst->dev->dev, "V4L2_SEL_TGT_CROP width : %d | height : %d\n",
+		s->r.width, s->r.height);
+	inst->dst_fmt.width =3D s->r.width;
+	inst->dst_fmt.height =3D s->r.height;
+
+	return 0;
+}
+
+static int wave5_vpu_enc_try_encoder_cmd(struct file *file, void *fh, stru=
ct v4l2_encoder_cmd *ec)
+{
+	if (ec->cmd !=3D V4L2_ENC_CMD_STOP && ec->cmd !=3D V4L2_ENC_CMD_START)
+		return -EINVAL;
+
+	ec->flags =3D 0;
+	return 0;
+}
+
+static int wave5_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v=
4l2_encoder_cmd *ec)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+	int ret;
+
+	ret =3D wave5_vpu_enc_try_encoder_cmd(file, fh, ec);
+	if (ret < 0)
+		return ret;
+
+	if (!wave5_vpu_both_queues_are_streaming(inst))
+		return 0;
+
+	switch (ec->cmd) {
+	case V4L2_ENC_CMD_STOP:
+		inst->state =3D VPU_INST_STATE_STOP;
+		inst->ops->start_process(inst);
+		break;
+	case V4L2_ENC_CMD_START:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave5_vpu_enc_subscribe_event(struct v4l2_fh *fh,
+					 const struct v4l2_event_subscription *sub)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type %d | id : %d | flags : %d\n", sub->type, su=
b->id, sub->flags);
+
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int wave5_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_s=
treamparm *a)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d\n", a->type);
+
+	if (a->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT && a->type !=3D V4L2_BUF_TYPE=
_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	a->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
+	a->parm.output.timeperframe.numerator =3D 1;
+	a->parm.output.timeperframe.denominator =3D inst->frame_rate;
+
+	dev_dbg(inst->dev->dev, "numerator : %d | denominator : %d\n",
+		a->parm.output.timeperframe.numerator,
+			a->parm.output.timeperframe.denominator);
+
+	return 0;
+}
+
+static int wave5_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_s=
treamparm *a)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "type : %d\n", a->type);
+
+	if (a->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT && a->type !=3D V4L2_BUF_TYPE=
_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	a->parm.output.capability =3D V4L2_CAP_TIMEPERFRAME;
+	if (a->parm.output.timeperframe.denominator && a->parm.output.timeperfram=
e.numerator) {
+		inst->frame_rate =3D a->parm.output.timeperframe.denominator /
+				   a->parm.output.timeperframe.numerator;
+	} else {
+		a->parm.output.timeperframe.numerator =3D 1;
+		a->parm.output.timeperframe.denominator =3D inst->frame_rate;
+	}
+
+	dev_dbg(inst->dev->dev, "numerator : %d | denominator : %d\n",
+		a->parm.output.timeperframe.numerator,
+		a->parm.output.timeperframe.denominator);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops wave5_vpu_enc_ioctl_ops =3D {
+	.vidioc_querycap =3D wave5_vpu_enc_querycap,
+	.vidioc_enum_framesizes =3D wave5_vpu_enc_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap	=3D wave5_vpu_enc_enum_fmt_cap,
+	.vidioc_s_fmt_vid_cap_mplane =3D wave5_vpu_enc_s_fmt_cap,
+	.vidioc_g_fmt_vid_cap_mplane =3D wave5_vpu_enc_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap_mplane =3D wave5_vpu_enc_try_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out	=3D wave5_vpu_enc_enum_fmt_out,
+	.vidioc_s_fmt_vid_out_mplane =3D wave5_vpu_enc_s_fmt_out,
+	.vidioc_g_fmt_vid_out_mplane =3D wave5_vpu_enc_g_fmt_out,
+	.vidioc_try_fmt_vid_out_mplane =3D wave5_vpu_enc_try_fmt_out,
+
+	.vidioc_g_selection =3D wave5_vpu_enc_g_selection,
+	.vidioc_s_selection =3D wave5_vpu_enc_s_selection,
+
+	.vidioc_g_parm =3D wave5_vpu_enc_g_parm,
+	.vidioc_s_parm =3D wave5_vpu_enc_s_parm,
+
+	.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_encoder_cmd =3D wave5_vpu_enc_try_encoder_cmd,
+	.vidioc_encoder_cmd =3D wave5_vpu_enc_encoder_cmd,
+
+	.vidioc_subscribe_event =3D wave5_vpu_enc_subscribe_event,
+	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
+};
+
+static int wave5_vpu_enc_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst =3D wave5_ctrl_to_vpu_inst(ctrl);
+
+	dev_dbg(inst->dev->dev, "name : %s\n", ctrl->name);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+		if (inst->state !=3D VPU_INST_STATE_NONE && inst->state !=3D VPU_INST_ST=
ATE_OPEN)
+			ctrl->val =3D inst->min_src_frame_buf_count;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(inst->dev->dev, "value : %d\n", ctrl->val);
+
+	return 0;
+}
+
+static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst =3D wave5_ctrl_to_vpu_inst(ctrl);
+
+	dev_dbg(inst->dev->dev, "name : %s | value : %d\n", ctrl->name, ctrl->val=
);
+
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		inst->mirror_direction |=3D (ctrl->val << 1);
+		break;
+	case V4L2_CID_VFLIP:
+		inst->mirror_direction |=3D ctrl->val;
+		break;
+	case V4L2_CID_ROTATE:
+		inst->rot_angle =3D ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:
+		inst->vbv_buf_size =3D ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		switch (ctrl->val) {
+		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+			inst->profile =3D HEVC_PROFILE_MAIN;
+			inst->bit_depth =3D 8;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+			inst->profile =3D HEVC_PROFILE_STILLPICTURE;
+			inst->bit_depth =3D 8;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
+			inst->profile =3D HEVC_PROFILE_MAIN10;
+			inst->bit_depth =3D 10;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		switch (ctrl->val) {
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+			inst->level =3D 10 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+			inst->level =3D 20 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+			inst->level =3D 21 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+			inst->level =3D 30 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+			inst->level =3D 31 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+			inst->level =3D 40 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+			inst->level =3D 41 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+			inst->level =3D 50 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+			inst->level =3D 51 * 3;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
+			inst->level =3D 52 * 3;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+		inst->min_qp_i =3D ctrl->val;
+		inst->min_qp_p =3D ctrl->val;
+		inst->min_qp_b =3D ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+		inst->max_qp_i =3D ctrl->val;
+		inst->max_qp_p =3D ctrl->val;
+		inst->max_qp_b =3D ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		switch (ctrl->val) {
+		case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+			inst->profile =3D H264_PROFILE_BP;
+			inst->bit_depth =3D 8;
+			break;
+		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+			inst->profile =3D H264_PROFILE_MP;
+			inst->bit_depth =3D 8;
+			break;
+		case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+			inst->profile =3D H264_PROFILE_EXTENDED;
+			inst->bit_depth =3D 8;
+			break;
+		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+			inst->profile =3D H264_PROFILE_HP;
+			inst->bit_depth =3D 8;
+			break;
+		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10:
+			inst->profile =3D H264_PROFILE_HIGH10;
+			inst->bit_depth =3D 10;
+			break;
+		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422:
+			inst->profile =3D H264_PROFILE_HIGH422;
+			inst->bit_depth =3D 10;
+			break;
+		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE:
+			inst->profile =3D H264_PROFILE_HIGH444;
+			inst->bit_depth =3D 10;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		switch (ctrl->val) {
+		case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+			inst->level =3D 10;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+			inst->level =3D 9;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+			inst->level =3D 11;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+			inst->level =3D 12;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+			inst->level =3D 13;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+			inst->level =3D 20;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+			inst->level =3D 21;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+			inst->level =3D 22;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+			inst->level =3D 30;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+			inst->level =3D 31;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+			inst->level =3D 32;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+			inst->level =3D 40;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+			inst->level =3D 41;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+			inst->level =3D 42;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+			inst->level =3D 50;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+			inst->level =3D 51;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+		inst->min_qp_i =3D ctrl->val;
+		inst->min_qp_p =3D ctrl->val;
+		inst->min_qp_b =3D ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+		inst->max_qp_i =3D ctrl->val;
+		inst->max_qp_p =3D ctrl->val;
+		inst->max_qp_b =3D ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops wave5_vpu_enc_ctrl_ops =3D {
+	.g_volatile_ctrl =3D wave5_vpu_enc_g_volatile_ctrl,
+	.s_ctrl =3D wave5_vpu_enc_s_ctrl,
+};
+
+static void wave5_set_default_enc_openparam(struct enc_open_param *open_pa=
ram)
+{
+	unsigned int i;
+
+	open_param->stream_endian =3D VPU_STREAM_ENDIAN;
+	open_param->source_endian =3D VPU_SOURCE_ENDIAN;
+	open_param->line_buf_int_en =3D TRUE;
+
+	open_param->wave_param.gop_preset_idx =3D PRESET_IDX_IPP_SINGLE;
+	open_param->wave_param.decoding_refresh_type =3D 1;
+	open_param->wave_param.intra_qp =3D 30;
+	open_param->wave_param.tmvp_enable =3D 1;
+	open_param->wave_param.max_num_merge =3D 2;
+	open_param->wave_param.lf_cross_slice_boundary_enable =3D 1;
+	open_param->wave_param.skip_intra_trans =3D 1;
+	open_param->wave_param.sao_enable =3D 1;
+	open_param->wave_param.transform8x8_enable =3D 1;
+	open_param->wave_param.intra_nx_n_enable =3D 1;
+	for (i =3D 0; i < MAX_GOP_NUM; i++)
+		open_param->wave_param.fixed_bit_ratio[i] =3D 1;
+	open_param->wave_param.cu_level_rc_enable =3D 1;
+	open_param->wave_param.hvs_qp_enable =3D 1;
+	open_param->wave_param.hvs_qp_scale =3D 2;
+	open_param->wave_param.hvs_max_delta_qp =3D 10;
+	open_param->wave_param.gop_param.custom_gop_size =3D 1;
+	open_param->wave_param.initial_rc_qp =3D -1;
+	open_param->wave_param.nr_intra_weight_y =3D 7;
+	open_param->wave_param.nr_intra_weight_cb =3D 7;
+	open_param->wave_param.nr_intra_weight_cr =3D 7;
+	open_param->wave_param.nr_inter_weight_y =3D 4;
+	open_param->wave_param.nr_inter_weight_cb =3D 4;
+	open_param->wave_param.nr_inter_weight_cr =3D 4;
+	open_param->wave_param.strong_intra_smooth_enable =3D 1;
+	open_param->wave_param.bg_thr_diff =3D 8;
+	open_param->wave_param.bg_thr_mean_diff =3D 1;
+	open_param->wave_param.bg_lambda_qp =3D 32;
+	open_param->wave_param.bg_delta_qp =3D 3;
+	open_param->wave_param.rdo_skip =3D 1;
+	open_param->wave_param.intra_mb_refresh_arg =3D 1;
+	open_param->wave_param.entropy_coding_mode =3D 1;
+	open_param->wave_param.rc_weight_param =3D 16;
+	open_param->wave_param.rc_weight_buf =3D 128;
+	open_param->wave_param.lambda_scaling_enable =3D 1;
+}
+
+static int wave5_vpu_enc_queue_setup(struct vb2_queue *q, unsigned int *nu=
m_buffers,
+				     unsigned int *num_planes, unsigned int sizes[],
+			       struct device *alloc_devs[])
+{
+	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane inst_format =3D
+		(q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : ins=
t->dst_fmt;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "num_buffers : %d | num_planes : %d | type : %d\n=
", *num_buffers,
+		*num_planes, q->type);
+
+	if (*num_planes) {
+		if (inst_format.num_planes !=3D *num_planes)
+			return -EINVAL;
+
+		for (i =3D 0; i < *num_planes; i++) {
+			if (sizes[i] < inst_format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes =3D inst_format.num_planes;
+		for (i =3D 0; i < *num_planes; i++) {
+			sizes[i] =3D inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "size[%d] : %d\n", i, sizes[i]);
+		}
+	}
+
+	dev_dbg(inst->dev->dev, "size : %d\n", sizes[0]);
+
+	if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D V4L2_BUF_TYP=
E_VIDEO_OUTPUT_MPLANE) {
+		u32 non_linear_num =3D 0;
+		u32 fb_stride =3D 0;
+		u32 fb_height =3D 0;
+		struct enc_open_param open_param;
+		struct enc_initial_info initial_info;
+
+		memset(&open_param, 0, sizeof(struct enc_open_param));
+		wave5_set_default_enc_openparam(&open_param);
+
+		inst->std =3D wave5_to_vpu_wavestd(inst->dst_fmt.pixelformat);
+		if (inst->std =3D=3D STD_UNKNOWN) {
+			dev_warn(inst->dev->dev, "unsupported pixelformat: %.4s\n",
+				 (char *)&inst->dst_fmt.pixelformat);
+			return -EINVAL;
+		}
+		open_param.pic_width =3D inst->dst_fmt.width;
+		open_param.pic_height =3D inst->dst_fmt.height;
+		open_param.frame_rate_info =3D inst->frame_rate;
+		open_param.vbv_buffer_size =3D inst->vbv_buf_size;
+		open_param.wave_param.profile =3D inst->profile;
+		open_param.wave_param.level =3D inst->level;
+		open_param.wave_param.internal_bit_depth =3D inst->bit_depth;
+		open_param.wave_param.min_qp_i =3D inst->min_qp_i;
+		open_param.wave_param.max_qp_i =3D inst->max_qp_i;
+		open_param.wave_param.min_qp_p =3D inst->min_qp_p;
+		open_param.wave_param.max_qp_p =3D inst->max_qp_p;
+		open_param.wave_param.min_qp_b =3D inst->min_qp_b;
+		open_param.wave_param.max_qp_b =3D inst->max_qp_b;
+
+		ret =3D wave5_vpu_enc_open(inst, &open_param);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "failed wave5_vpu_enc_open : %d\n", ret);
+			return ret;
+		}
+
+		inst->state =3D VPU_INST_STATE_OPEN;
+
+		if (inst->mirror_direction) {
+			wave5_vpu_enc_give_command(inst, ENABLE_MIRRORING, NULL);
+			wave5_vpu_enc_give_command(inst, SET_MIRROR_DIRECTION,
+						   &inst->mirror_direction);
+		}
+		if (inst->rot_angle) {
+			wave5_vpu_enc_give_command(inst, ENABLE_ROTATION, NULL);
+			wave5_vpu_enc_give_command(inst, SET_ROTATION_ANGLE, &inst->rot_angle);
+		}
+
+		ret =3D wave5_vpu_enc_issue_seq_init(inst);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "failed wave5_vpu_enc_issue_seq_init() : %d\n",
+				ret);
+			return ret;
+		}
+
+		if (wave5_vpu_wait_interrupt(inst, VPU_ENC_TIMEOUT) < 0) {
+			dev_dbg(inst->dev->dev, "failed to call wave5_vpu_wait_interrupt()\n");
+			return -EINVAL;
+		}
+
+		ret =3D wave5_vpu_enc_complete_seq_init(inst, &initial_info);
+		if (ret)
+			return ret;
+
+		dev_dbg(inst->dev->dev, "min_frame_buffer : %d | min_source_buffer : %d\=
n",
+			initial_info.min_frame_buffer_count, initial_info.min_src_frame_count);
+		inst->state =3D VPU_INST_STATE_INIT_SEQ;
+		inst->min_src_frame_buf_count =3D initial_info.min_src_frame_count +
+						COMMAND_QUEUE_DEPTH;
+		inst->min_dst_frame_buf_count =3D initial_info.min_frame_buffer_count;
+		*num_buffers =3D inst->min_src_frame_buf_count;
+		dev_dbg(inst->dev->dev, "source buffer num : %d", *num_buffers);
+
+		non_linear_num =3D inst->min_dst_frame_buf_count;
+
+		fb_stride =3D inst->dst_fmt.width;
+		fb_height =3D ALIGN(inst->dst_fmt.height, 32);
+
+		for (i =3D 0; i < non_linear_num; i++) {
+			u32 luma_size =3D fb_stride * fb_height;
+			u32 chroma_size =3D ALIGN(fb_stride / 2, 16) * fb_height;
+
+			inst->frame_vbuf[i].size =3D luma_size + chroma_size;
+			if (wave5_vdi_allocate_dma_memory(inst->dev, &inst->frame_vbuf[i]) < 0)
+				dev_dbg(inst->dev->dev, "failed to allocate FBC buffer : %zu\n",
+					inst->frame_vbuf[i].size);
+
+			inst->frame_buf[i].buf_y =3D inst->frame_vbuf[i].daddr;
+			inst->frame_buf[i].buf_cb =3D (dma_addr_t)-1;
+			inst->frame_buf[i].buf_cr =3D (dma_addr_t)-1;
+			inst->frame_buf[i].update_fb_info =3D true;
+			inst->frame_buf[i].size =3D inst->frame_vbuf[i].size;
+		}
+
+		ret =3D wave5_vpu_enc_register_frame_buffer(inst, non_linear_num, fb_str=
ide,
+							  fb_height, COMPRESSED_FRAME_MAP);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "failed wave5_vpu_enc_register_frame_buffer %d\=
n",
+				ret);
+			return -EINVAL;
+		}
+
+		inst->state =3D VPU_INST_STATE_PIC_RUN;
+	}
+
+	if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ &&
+	    q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		*num_buffers =3D inst->min_src_frame_buf_count;
+		dev_dbg(inst->dev->dev, "source buffer num : %d", *num_buffers);
+	}
+
+	return 0;
+}
+
+static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
+	struct vpu_buffer *vpu_buf =3D wave5_to_vpu_buf(vbuf);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld |=
 size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		vbuf->sequence =3D inst->queued_src_buf_num++;
+	else
+		vbuf->sequence =3D inst->queued_dst_buf_num++;
+
+	vpu_buf->consumed =3D FALSE;
+	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+
+	if (vb2_start_streaming_called(vb->vb2_queue))
+		inst->ops->start_process(inst);
+}
+
+static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
+	struct vb2_v4l2_buffer *buf;
+	bool check_cmd =3D TRUE;
+
+	dev_dbg(inst->dev->dev, "type : %d\n", q->type);
+
+	if (wave5_vpu_both_queues_are_streaming(inst))
+		inst->state =3D VPU_INST_STATE_STOP;
+
+	while (check_cmd) {
+		struct queue_status_info q_status;
+		struct enc_output_info enc_output_info;
+		int ret;
+
+		wave5_vpu_enc_give_command(inst, ENC_GET_QUEUE_STATUS, &q_status);
+
+		if (q_status.instance_queue_count + q_status.report_queue_count =3D=3D 0=
)
+			break;
+
+		if (wave5_vpu_wait_interrupt(inst, VPU_ENC_TIMEOUT) < 0)
+			break;
+
+		ret =3D wave5_vpu_enc_get_output_info(inst, &enc_output_info);
+	}
+
+	if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		while ((buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx))) {
+			dev_dbg(inst->dev->dev, "buf type : %4d | index : %4d\n",
+				buf->vb2_buf.type, buf->vb2_buf.index);
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
+		}
+	} else {
+		while ((buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx))) {
+			dev_dbg(inst->dev->dev, "buf type : %4d | index : %4d\n",
+				buf->vb2_buf.type, buf->vb2_buf.index);
+			vb2_set_plane_payload(&buf->vb2_buf, 0, 0);
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
+		}
+	}
+}
+
+static const struct vb2_ops wave5_vpu_enc_vb2_ops =3D {
+	.queue_setup =3D wave5_vpu_enc_queue_setup,
+	.wait_prepare =3D vb2_ops_wait_prepare,
+	.wait_finish =3D vb2_ops_wait_finish,
+	.buf_queue =3D wave5_vpu_enc_buf_queue,
+	.stop_streaming =3D wave5_vpu_enc_stop_streaming,
+};
+
+static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fm=
t,
+				     struct v4l2_pix_format_mplane *dst_fmt)
+{
+	unsigned int src_pix_fmt =3D wave5_vpu_enc_fmt_list[VPU_FMT_TYPE_RAW][0].=
v4l2_pix_fmt;
+	const struct v4l2_format_info *src_fmt_info =3D v4l2_format_info(src_pix_=
fmt);
+
+	src_fmt->pixelformat =3D src_pix_fmt;
+	src_fmt->field =3D V4L2_FIELD_NONE;
+	src_fmt->flags =3D 0;
+	src_fmt->num_planes =3D src_fmt_info->mem_planes;
+	wave5_update_pix_fmt(src_fmt, 416, 240);
+
+	dst_fmt->pixelformat =3D wave5_vpu_enc_fmt_list[VPU_FMT_TYPE_CODEC][0].v4=
l2_pix_fmt;
+	dst_fmt->field =3D V4L2_FIELD_NONE;
+	dst_fmt->flags =3D 0;
+	dst_fmt->num_planes =3D 1;
+	wave5_update_pix_fmt(dst_fmt, 416, 240);
+}
+
+static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, =
struct vb2_queue *dst_vq)
+{
+	struct vpu_instance *inst =3D priv;
+	int ret;
+
+	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->mem_ops =3D &vb2_dma_contig_memops;
+	src_vq->ops =3D &wave5_vpu_enc_vb2_ops;
+	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
+	src_vq->allow_zero_bytesused =3D 1;
+	src_vq->min_buffers_needed =3D 0;
+	src_vq->drv_priv =3D inst;
+	src_vq->lock =3D &inst->dev->dev_lock;
+	src_vq->dev =3D inst->dev->v4l2_dev.dev;
+	ret =3D vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
+	dst_vq->ops =3D &wave5_vpu_enc_vb2_ops;
+	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->buf_struct_size =3D sizeof(struct vpu_buffer);
+	dst_vq->allow_zero_bytesused =3D 1;
+	dst_vq->min_buffers_needed =3D 0;
+	dst_vq->drv_priv =3D inst;
+	dst_vq->lock =3D &inst->dev->dev_lock;
+	dst_vq->dev =3D inst->dev->v4l2_dev.dev;
+	ret =3D vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct vpu_instance_ops wave5_vpu_enc_inst_ops =3D {
+	.start_process =3D wave5_vpu_enc_start_encode,
+	.stop_process =3D wave5_vpu_enc_stop_encode,
+	.finish_process =3D wave5_vpu_enc_finish_encode,
+};
+
+static int wave5_vpu_open_enc(struct file *filp)
+{
+	struct video_device *vdev =3D video_devdata(filp);
+	struct vpu_device *dev =3D video_drvdata(filp);
+	struct vpu_instance *inst =3D NULL;
+	struct v4l2_ctrl_handler *v4l2_ctrl_hdl;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+	v4l2_ctrl_hdl =3D &inst->v4l2_ctrl_hdl;
+
+	inst->dev =3D dev;
+	inst->type =3D VPU_INST_TYPE_ENC;
+	inst->ops =3D &wave5_vpu_enc_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data =3D &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh);
+
+	inst->v4l2_fh.m2m_ctx =3D
+		v4l2_m2m_ctx_init(dev->v4l2_m2m_dev, inst, wave5_vpu_enc_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret =3D PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(v4l2_ctrl_hdl, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10, 0,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1, =
0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_MPEG_V=
IDEO_HEVC_MIN_QP,
+			  0, 63, 1, 8);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_MPEG_V=
IDEO_HEVC_MAX_QP,
+			  0, 63, 1, 51);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE, 0,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL, V4L2_MPEG_VIDEO_H264_LEVEL_5_1, =
0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_1_0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_MPEG_V=
IDEO_H264_MIN_QP,
+			  0, 63, 1, 8);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_MPEG_V=
IDEO_H264_MAX_QP,
+			  0, 63, 1, 51);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_HFLIP,=
 0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_VFLIP,=
 0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_ROTATE=
, 0, 270, 90, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops, V4L2_CID_MPEG_V=
IDEO_VBV_SIZE, 10,
+			  3000, 1, 3000);
+	ctrl =3D v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+				 V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	if (ctrl)
+		ctrl->flags |=3D V4L2_CTRL_FLAG_VOLATILE;
+
+	if (v4l2_ctrl_hdl->error) {
+		ret =3D -ENODEV;
+		goto free_inst;
+	}
+
+	inst->v4l2_fh.ctrl_handler =3D v4l2_ctrl_hdl;
+	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
+
+	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->colorspace =3D V4L2_COLORSPACE_REC709;
+	inst->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
+	inst->hsv_enc =3D 0;
+	inst->quantization =3D V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
+	inst->frame_rate =3D 30;
+
+	return 0;
+
+free_inst:
+	kfree(inst);
+	return ret;
+}
+
+static int wave5_vpu_enc_release(struct file *filp)
+{
+	struct vpu_instance *inst =3D wave5_to_vpu_inst(filp->private_data);
+	int retry_count =3D 10;
+	u32 fail_res;
+	int i, ret;
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	if (inst->state !=3D VPU_INST_STATE_NONE) {
+		do {
+			fail_res =3D 0;
+			ret =3D wave5_vpu_enc_close(inst, &fail_res);
+			if (ret && ret !=3D -EIO)
+				break;
+			if (fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNING)
+				break;
+			if (!wave5_vpu_wait_interrupt(inst, VPU_ENC_TIMEOUT))
+				break;
+		} while (--retry_count);
+
+		if (fail_res =3D=3D WAVE5_SYSERR_VPU_STILL_RUNNING)
+			dev_warn(inst->dev->dev, "failed wave5_vpu_enc_close()\n");
+		if (ret && ret !=3D -EIO)
+			dev_warn(inst->dev->dev, "close fail ret=3D%d\n", ret);
+	}
+
+	for (i =3D 0; i < inst->min_dst_frame_buf_count; i++)
+		wave5_vdi_free_dma_memory(inst->dev, &inst->frame_vbuf[i]);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	kfree(inst);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations wave5_vpu_enc_fops =3D {
+	.owner =3D THIS_MODULE,
+	.open =3D wave5_vpu_open_enc,
+	.release =3D wave5_vpu_enc_release,
+	.unlocked_ioctl =3D video_ioctl2,
+	.poll =3D v4l2_m2m_fop_poll,
+	.mmap =3D v4l2_m2m_fop_mmap,
+};
+
+int wave5_vpu_enc_register_device(struct vpu_device *dev)
+{
+	struct video_device *vdev_enc;
+	int ret;
+
+	vdev_enc =3D devm_kzalloc(dev->v4l2_dev.dev, sizeof(*vdev_enc), GFP_KERNE=
L);
+	if (!vdev_enc)
+		return -ENOMEM;
+
+	dev->video_dev_enc =3D vdev_enc;
+
+	strscpy(vdev_enc->name, VPU_ENC_DEV_NAME, sizeof(vdev_enc->name));
+	vdev_enc->fops =3D &wave5_vpu_enc_fops;
+	vdev_enc->ioctl_ops =3D &wave5_vpu_enc_ioctl_ops;
+	vdev_enc->release =3D video_device_release_empty;
+	vdev_enc->v4l2_dev =3D &dev->v4l2_dev;
+	vdev_enc->vfl_dir =3D VFL_DIR_M2M;
+	vdev_enc->device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_enc->lock =3D &dev->dev_lock;
+
+	ret =3D video_register_device(vdev_enc, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	video_set_drvdata(vdev_enc, dev);
+
+	return 0;
+}
+
+void wave5_vpu_enc_unregister_device(struct vpu_device *dev)
+{
+	video_unregister_device(dev->video_dev_enc);
+}
+
diff --git a/drivers/staging/media/wave5/wave5-vpu.c b/drivers/staging/medi=
a/wave5/wave5-vpu.c
new file mode 100644
index 000000000000..c8a35d41c3f6
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vpu.c
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave5 series multi-standard codec IP - platform driver
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of_address.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include "wave5-vpu.h"
+#include "wave5-regdefine.h"
+#include "wave5-vpuconfig.h"
+#include "wave5.h"
+
+#define VPU_PLATFORM_DEVICE_NAME "vdec"
+#define VPU_CLK_NAME "vcodec"
+
+#define WAVE5_IS_ENC BIT(0)
+#define WAVE5_IS_DEC BIT(1)
+
+struct wave5_match_data {
+	int flags;
+	const char *fw_name;
+};
+
+int wave5_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeo=
ut)
+{
+	int ret;
+
+	ret =3D wait_for_completion_timeout(&inst->dev->irq_done,
+					  msecs_to_jiffies(timeout));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	reinit_completion(&inst->dev->irq_done);
+
+	return 0;
+}
+
+static irqreturn_t wave5_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_device *dev =3D dev_id;
+	unsigned int irq_status;
+
+	if (wave5_vdi_readl(dev, W5_VPU_VPU_INT_STS)) {
+		irq_status =3D wave5_vdi_readl(dev, W5_VPU_VINT_REASON);
+		wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_status);
+		wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
+
+		kfifo_in(&dev->irq_status, &irq_status, sizeof(int));
+
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_device *dev =3D dev_id;
+	struct vpu_instance *inst;
+	unsigned int irq_status, val;
+	int ret;
+
+	while (kfifo_len(&dev->irq_status)) {
+		inst =3D v4l2_m2m_get_curr_priv(dev->v4l2_m2m_dev);
+		if (inst) {
+			inst->ops->finish_process(inst);
+		} else {
+			ret =3D kfifo_out(&dev->irq_status, &irq_status, sizeof(int));
+			if (!ret)
+				break;
+			dev_dbg(dev->dev, "irq_status: 0x%x\n", irq_status);
+			val =3D wave5_vdi_readl(dev, W5_VPU_VINT_REASON_USR);
+			val &=3D ~irq_status;
+			wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_USR, val);
+			complete(&dev->irq_done);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void wave5_vpu_device_run(void *priv)
+{
+	struct vpu_instance *inst =3D priv;
+
+	dev_dbg(inst->dev->dev, "inst type=3D%d state=3D%d\n",
+		inst->type, inst->state);
+
+	inst->ops->start_process(inst);
+}
+
+static int wave5_vpu_job_ready(void *priv)
+{
+	struct vpu_instance *inst =3D priv;
+
+	dev_dbg(inst->dev->dev, "inst type=3D%d state=3D%d\n",
+		inst->type, inst->state);
+
+	if (inst->state =3D=3D VPU_INST_STATE_STOP)
+		return 0;
+
+	return 1;
+}
+
+static void wave5_vpu_job_abort(void *priv)
+{
+	struct vpu_instance *inst =3D priv;
+
+	dev_dbg(inst->dev->dev, "inst type=3D%d state=3D%d\n",
+		inst->type, inst->state);
+
+	inst->ops->stop_process(inst);
+}
+
+static const struct v4l2_m2m_ops wave5_vpu_m2m_ops =3D {
+	.device_run =3D wave5_vpu_device_run,
+	.job_ready =3D wave5_vpu_job_ready,
+	.job_abort =3D wave5_vpu_job_abort,
+};
+
+static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name=
)
+{
+	const struct firmware *fw;
+	int ret;
+	u32 version;
+	u32 revision;
+	u32 product_id;
+
+	ret =3D request_firmware(&fw, fw_name, dev);
+	if (ret) {
+		dev_err(dev, "request_firmware fail\n");
+		return ret;
+	}
+
+	ret =3D wave5_vpu_init_with_bitcode(dev, (u8 *)fw->data, fw->size);
+	if (ret) {
+		dev_err(dev, "vpu_init_with_bitcode fail\n");
+		goto release_fw;
+	}
+	release_firmware(fw);
+
+	ret =3D wave5_vpu_get_version_info(dev, &version, &revision, &product_id)=
;
+	if (ret) {
+		dev_err(dev, "vpu_get_version_info fail\n");
+		goto release_fw;
+	}
+
+	dev_err(dev, "enum product_id : %08x\n", product_id);
+	dev_err(dev, "fw_version : %08x(r%d)\n", version, revision);
+
+	return 0;
+
+release_fw:
+	release_firmware(fw);
+	return ret;
+}
+
+static int wave5_vpu_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct vpu_device *dev;
+	struct device_node *np;
+	const struct wave5_match_data *match_data;
+	struct resource *res;
+	struct resource sram;
+
+	match_data =3D device_get_match_data(&pdev->dev);
+	if (!match_data) {
+		dev_err(&pdev->dev, "missing data\n");
+		return -EINVAL;
+	}
+
+	/* physical addresses limited to 32 bits */
+	dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+
+	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->vdb_register =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->vdb_register))
+		return PTR_ERR(dev->vdb_register);
+	ida_init(&dev->inst_ida);
+
+	mutex_init(&dev->dev_lock);
+	mutex_init(&dev->hw_lock);
+	init_completion(&dev->irq_done);
+	dev_set_drvdata(&pdev->dev, dev);
+	dev->dev =3D &pdev->dev;
+
+	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
+
+	/* continue without clock, assume externally managed */
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret =3D 0;
+	}
+	dev->num_clks =3D ret;
+
+	ret =3D clk_bulk_prepare_enable(dev->num_clks, dev->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	np =3D of_parse_phandle(pdev->dev.of_node, "sram", 0);
+	if (!np) {
+		dev_err(&pdev->dev, "sram node is not found.\n");
+		return -ENODEV;
+	}
+
+	ret =3D of_address_to_resource(np, 0, &sram);
+	if (ret) {
+		dev_err(&pdev->dev, "sram resource not available.\n");
+		goto err_put_node;
+	}
+	dev->sram_buf.daddr =3D sram.start;
+	dev->sram_buf.size =3D resource_size(&sram);
+
+	dev_err(&pdev->dev, "sram daddr: 0x%llx, size: 0x%lx\n",
+		dev->sram_buf.daddr, dev->sram_buf.size);
+
+	dev->product_code =3D wave5_vdi_readl(dev, VPU_PRODUCT_CODE_REGISTER);
+	ret =3D wave5_vdi_init(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to init vdi: %d\n", ret);
+		goto err_clk_dis;
+	}
+	dev->product =3D wave_vpu_get_product_id(dev);
+
+	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", ret);
+		goto err_vdi_release;
+	}
+
+	dev->v4l2_m2m_dev =3D v4l2_m2m_init(&wave5_vpu_m2m_ops);
+	if (IS_ERR(dev->v4l2_m2m_dev)) {
+		ret =3D PTR_ERR(dev->v4l2_m2m_dev);
+		dev_err(&pdev->dev, "v4l2_m2m_init fail: %d\n", ret);
+		goto err_v4l2_unregister;
+	}
+
+	if (match_data->flags & WAVE5_IS_DEC) {
+		ret =3D wave5_vpu_dec_register_device(dev);
+		if (ret) {
+			dev_err(&pdev->dev, "wave5_vpu_dec_register_device fail: %d\n", ret);
+			goto err_m2m_release;
+		}
+	}
+	if (match_data->flags & WAVE5_IS_ENC) {
+		ret =3D wave5_vpu_enc_register_device(dev);
+		if (ret) {
+			dev_err(&pdev->dev, "wave5_vpu_enc_register_device fail: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get irq resource\n");
+		ret =3D -ENXIO;
+		goto err_enc_unreg;
+	}
+	dev->irq =3D res->start;
+
+	if (kfifo_alloc(&dev->irq_status, 16 * sizeof(int), GFP_KERNEL)) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_enc_unreg;
+	}
+
+	ret =3D devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
+					wave5_vpu_irq_thread, 0, "vpu_irq", dev);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to register interrupt handler: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	ret =3D wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to wave5_vpu_load_firmware: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	dev_dbg(&pdev->dev, "Added wave driver with caps %s %s and product code 0=
x%x\n",
+		match_data->flags & WAVE5_IS_ENC ? "'ENCODE'" : "",
+		match_data->flags & WAVE5_IS_DEC ? "'DECODE'" : "",
+		dev->product_code);
+	return 0;
+
+err_kfifo_free:
+	kfifo_free(&dev->irq_status);
+err_enc_unreg:
+	if (match_data->flags & WAVE5_IS_ENC)
+		wave5_vpu_enc_unregister_device(dev);
+err_dec_unreg:
+	if (match_data->flags & WAVE5_IS_DEC)
+		wave5_vpu_dec_unregister_device(dev);
+err_m2m_release:
+	v4l2_m2m_release(dev->v4l2_m2m_dev);
+err_v4l2_unregister:
+	v4l2_device_unregister(&dev->v4l2_dev);
+err_vdi_release:
+	wave5_vdi_release(&pdev->dev);
+err_clk_dis:
+	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
+err_put_node:
+	of_node_put(np);
+
+	return ret;
+}
+
+static int wave5_vpu_remove(struct platform_device *pdev)
+{
+	struct vpu_device *dev =3D dev_get_drvdata(&pdev->dev);
+
+	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
+	wave5_vpu_enc_unregister_device(dev);
+	wave5_vpu_dec_unregister_device(dev);
+	v4l2_m2m_release(dev->v4l2_m2m_dev);
+	v4l2_device_unregister(&dev->v4l2_dev);
+	kfifo_free(&dev->irq_status);
+	wave5_vdi_release(&pdev->dev);
+	ida_destroy(&dev->inst_ida);
+
+	return 0;
+}
+
+static const struct wave5_match_data wave511_data =3D {
+	.flags =3D WAVE5_IS_DEC,
+	.fw_name =3D "wave511_dec_fw.bin",
+};
+
+static const struct wave5_match_data wave521_data =3D {
+	.flags =3D WAVE5_IS_ENC,
+	.fw_name =3D "wave521_enc_fw.bin",
+};
+
+static const struct wave5_match_data wave521c_data =3D {
+	.flags =3D WAVE5_IS_ENC | WAVE5_IS_DEC,
+	.fw_name =3D "wave521c_codec_fw.bin",
+};
+
+static const struct wave5_match_data default_match_data =3D {
+	.flags =3D WAVE5_IS_ENC | WAVE5_IS_DEC,
+	.fw_name =3D "chagall.bin",
+};
+
+static const struct of_device_id wave5_dt_ids[] =3D {
+	{ .compatible =3D "cnm,cm511-vpu", .data =3D &wave511_data },
+	{ .compatible =3D "cnm,cm517-vpu", .data =3D &default_match_data },
+	{ .compatible =3D "cnm,cm521-vpu", .data =3D &wave521_data },
+	{ .compatible =3D "cnm,cm521c-vpu", .data =3D &wave521c_data },
+	{ .compatible =3D "cnm,cm521c-dual-vpu", .data =3D &wave521c_data },
+	{ .compatible =3D "cnm,cm521e1-vpu", .data =3D &default_match_data },
+	{ .compatible =3D "cnm,cm537-vpu", .data =3D &default_match_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave5_dt_ids);
+
+static struct platform_driver wave5_vpu_driver =3D {
+	.driver =3D {
+		.name =3D VPU_PLATFORM_DEVICE_NAME,
+		.of_match_table =3D of_match_ptr(wave5_dt_ids),
+		},
+	.probe =3D wave5_vpu_probe,
+	.remove =3D wave5_vpu_remove,
+	//.suspend =3D vpu_suspend,
+	//.resume =3D vpu_resume,
+};
+
+module_platform_driver(wave5_vpu_driver);
+MODULE_DESCRIPTION("chips&media VPU V4L2 driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/staging/media/wave5/wave5-vpu.h b/drivers/staging/medi=
a/wave5/wave5-vpu.h
new file mode 100644
index 000000000000..1e0dd2e8c722
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vpu.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave5 series multi-standard codec IP - basic types
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+#ifndef __VPU_DRV_H__
+#define __VPU_DRV_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+#include "wave5-vpuconfig.h"
+#include "wave5-vpuapi.h"
+
+#define VPU_BUF_SYNC_TO_DEVICE 0
+#define VPU_BUF_SYNC_FROM_DEVICE 1
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool                   consumed;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC =3D 0,
+	VPU_FMT_TYPE_RAW   =3D 1
+};
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+};
+
+static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave5_ctrl_to_vpu_inst(struct v4l2_ctrl=
 *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave5_to_vpu_buf(struct vb2_v4l2_buffer *=
vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+int wave5_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeo=
ut);
+
+int  wave5_vpu_dec_register_device(struct vpu_device *dev);
+void wave5_vpu_dec_unregister_device(struct vpu_device *dev);
+int  wave5_vpu_enc_register_device(struct vpu_device *dev);
+void wave5_vpu_enc_unregister_device(struct vpu_device *dev);
+static inline bool wave5_vpu_both_queues_are_streaming(struct vpu_instance=
 *inst)
+{
+	struct vb2_queue *vq_cap =3D
+		v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLAN=
E);
+	struct vb2_queue *vq_out =3D
+		v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE=
);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+#endif
+
--=20
2.30.2

