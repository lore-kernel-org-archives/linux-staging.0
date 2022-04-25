Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290128.outbound.protection.outlook.com [40.107.129.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6D7A
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elLO2I/GXEfqU2b7Q2v2WOAOud9pT+17S2aIXdJWtSO/yySLCtm7sZLQp7flI7j6KUEWIyEPCYJSWmiqwlMnaIha7dFMUSB0VPG04FPdZsMXO00VPOdjKIpxAazUUV8J4Jdzc5rr8XDHwkaGkMgfWgPOhpTuizxu6NT3Y3WvP3z4GA88hrjyhMDfM9vgH9GQWJEJ4D58+fEWVzbvSEjy4yvdvwj8H2EPRrJdsF/By0cO225bfDJEsnrIJD4Vut7BT+mVlJtEce2EjP5dZVWa3q+V2Fq3XisqOEJH9pzuAliqDbCodUSHSRkciF/uhk21Fsd7/HgGqXnwgS0FyUiXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9gYNTFXZ/uEt9LGcth0ZYJEHX3LeJUIWx+O5B9XFyM=;
 b=KN7+PiiN8Z5UoWwX0xZkQ6NoOMhAJaGaNmxszSI1OMH/jeMNLkkyiIPW3Y8TeKiNsDAHax3ketK4+ZQxhUeK9WvJMsnO/XFFoKh9Kgyf+mPsyuOwXwXKEuW3ZHmO/9eeWC2kDd+14w/eEaZ6j2GmJYfv4cajTEdfNTjp5ll41T3C6YyF14oRaLz/mpq8QyjOUWIyiU5lFcO95Ylk0arPNmUTaBrqTpN1ykpqZak988g2MlZpxlf1HFBQx5S5T4wRA9QFRTKOV9Gtz+Ne+FNebTvA14laBHFiVBsmHRinlNVerExj9GXQcNvCGejpqLZddwE8ouwLmX/0k1M9PdToeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9gYNTFXZ/uEt9LGcth0ZYJEHX3LeJUIWx+O5B9XFyM=;
 b=SuoKZlR10iIT3OmIY/05H6yWmNSrhf7LxOxfegCv/OzVCCRGKpUsBH5DC63EDftdjmwBu/gsZRyS9iBFUU/X+xP/wgPhuAS0ODjckII9gsPJ+0aRS4+kLm8IsWXYRqVoJXQA2Oj7/S14fpOmvLu+K/pMKXP0hNcwpdpV1g1I044=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0120.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 10:16:04 +0000
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
Subject: [PATCH v7 2/6] staging: media: wave5: Add the vdi layer
Thread-Topic: [PATCH v7 2/6] staging: media: wave5: Add the vdi layer
Thread-Index: AdhYi9UzM3D+oaYpTTu6XWU2TVRwaA==
Date: Mon, 25 Apr 2022 10:16:03 +0000
Message-ID:
 <SL2P216MB1246E8AAF0B432D8A7BCFC80FBF89@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a70288e6-3c73-430c-32f1-08da26a49ace
x-ms-traffictypediagnostic: PSXP216MB0120:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB0120179204184197E98966ABFBF89@PSXP216MB0120.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VIS1mzQ3hlVLECwep0v3gxIK8JXZq3K284bVc6UYsaXCwEr7nSjGEK+Y4/JWa6mgUR1B4BwDz8z8bOBcpdpXwIir8FYvonTeDEulpS7rqkPb+zQHip7D9LYtFSoVyYC6IoxLjofidTP3q2ckPLzcBZ72Iu3uz3xYSRofZZWVFQwiujK9JYCe2/ZEjMCK+35Xi04LhzoOadMTxjEaZG/+1wGiUIHY+lf2C8g8ePjxYc4elPDaymHWXlmUjEosZ+M64U5P6xW2/XEdixHfPDLLvXdRq2DD3N6n0i+Cen7Kyj31XiAPAzDLwjXsyU8pstIYM7GIQsKGtpauLDNDg1kwx7O23KRzDTaJX1M7NosSkHPUgS0LoUn81JxsHpR4qaw30MlnUe2cvwRJjq3GjCdz8PmmwwrUHfruRT+6d1brs1Q/0yCJo8vTZTaioYVq64zIVGZt+fxea24FY6yb/Ib/XgOEA10w3JjmHN6uize8CZfJC3ECEz3G6bBnG+w0z3pWu7ecKuNijXMNCRPS/RkLcw1+4XYWws9KI7kX40FBJBOeTclJNSbtvIGwP1zKtI3LOm4v9bwwJjymDCkmb3D5Wxfwb5m/eNjviMMuwj/Czh++hcsyS1gR6QJMnDjmLNi6YP0Kyz1m/293IZANoZuV11u2xXh8lZQXgQAZR6YJ4Z0H/XQnkNnwAFiC/qOPmLNLFWNQ81FHk4Bz+2F+eEX4Ag==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(6916009)(54906003)(64756008)(8676002)(83380400001)(66476007)(33656002)(6506007)(9686003)(66556008)(66446008)(4326008)(76116006)(5660300002)(66946007)(316002)(26005)(7416002)(55016003)(8936002)(122000001)(508600001)(7696005)(71200400001)(86362001)(38070700005)(52536014)(38100700002)(2906002)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5U1xgDASmzrK/UPqp4aNjul5sl7WNAlm4mJVYz8mCBgXIc69Rn3vgu6XRJhz?=
 =?us-ascii?Q?iH2tK9QkN7NVkeT/zTOwXnJ836XFapjKYUPSU85w/7NfOm1rZn48j6SVVISZ?=
 =?us-ascii?Q?YRdu/nrJi1UJd52ylhigxY4f0msWNaTFrWtYbWnmYWh6RKNauoDEwLo8t0WO?=
 =?us-ascii?Q?EVlfSjTT8F5bV1WweFMNM5cVqffTViaB+eB/dqQHSsTzmXjHWXy5Hy98vZ3F?=
 =?us-ascii?Q?zCr+BM3VNHt4Ja2SorU/FgCuqtfrPY33Nc2OFl90JQQwOjGwBD7g3vO9x7oN?=
 =?us-ascii?Q?dZagoNGk+J+F4NXkKShbAhn1VFhwYSbSIKM71kmSPZwpKhOGVuq0Nr1bS5+X?=
 =?us-ascii?Q?I+ksTBFqNQjENTcEJby2y1jHcMG2x3mn/+3IDxJK7pNxd+2lIifMrnX8pre2?=
 =?us-ascii?Q?uwL1IN6aEUrL0ZYwvy5MFaj9Wp9XdvWnwt4iiKsWsvoAchFoB/2CV/NK27Vo?=
 =?us-ascii?Q?10HbH/yk2Y6j7qhtz8Yy2SZDBQ+EwGP1Ff+dxR9g7wpaMXhTzEQH889nuHHl?=
 =?us-ascii?Q?4wIBjIW8SBhhUx5Z3/77wewxNh40i1mSRzayXQTIGefJ/7TzI3D9bRho7ROp?=
 =?us-ascii?Q?X7BdP3eDa6EIDoAxsx1iEBRDhmxlCMVPWv4SIYRgPnDVkqCUjSJMKZ7T8xKb?=
 =?us-ascii?Q?1of1o8t4DmjtTmp0t8SgoLVP2XB/d7q0MKec0JXSEcOccmKkv1rMorPZiuBN?=
 =?us-ascii?Q?zeVos1Bq0ud+UPhT07pOpQvxCFbPTb/r3KUpi3FdZnzRrqIIOOb5MyUMBxWF?=
 =?us-ascii?Q?411DZA1SfMAzuiCz7Be8ZToqn861zG0BnRvJVc1OYUChbjfO4vRp1xIp32uj?=
 =?us-ascii?Q?YHClaObXhMhHGNHAucnWS1s+GB8Wd160/lCPhCuhkP64QYhLoAfIOMX0Qw9M?=
 =?us-ascii?Q?yoJB/bpIaqoANJzq13FcMTU/rhadd7baTe3anKO2RPnq1lIYzDL0gaEaQ/wP?=
 =?us-ascii?Q?v2uQNEf3LjzsksILHumekmYP2LRbUrw0Is+OjE/nHtZ1D2O487cg3b3Pz7hd?=
 =?us-ascii?Q?u2dS12CW5F1bda6SuiG67ajTPsdcxHoi1o1yhPo4ze56cIM/NOBdrhAZFpOt?=
 =?us-ascii?Q?ibu5r6jEvEk0/XAUK8D/YFyNReaipNVnEeJAsyufKTxxYM/ZXkYw9FG6H6ON?=
 =?us-ascii?Q?9n2tnRobBcxXU7RZN8zY1UmqAachpvhWKj1ZcldsV6QYmUd5X7UDNREwYTl0?=
 =?us-ascii?Q?yYlkXgiFYX67OOZguJ8EUY2A+pDEAtoUuKI3O1isEDozOwKpqtwpd+uWPEgB?=
 =?us-ascii?Q?CwRCuOtIweRKUj1Dawg12ZM10zHgIM5ZMPdUVT7Jj4Xd6/rWXvFEPPTx2LhC?=
 =?us-ascii?Q?HmhhPoewCHq3anS9llSE+IKcbJ+fteii8TUdJThIZG1OLN3QBz32poxbH+cM?=
 =?us-ascii?Q?zirO3omh3pxDR5h2X10b0yeLM8XK9XxLHOAENAUklADpMHq0g3YklCTcH8VQ?=
 =?us-ascii?Q?cm/uM88A+fRTtwR+k/wyEG3KURQ6bewJUU/oN1l8S6JK08APUsMJ6oeGCDnF?=
 =?us-ascii?Q?8/DFlKXw6TH0fvLWRsh/isDo4LHyszgl4TXWfZTBnBtNha79S/HjQIbk65no?=
 =?us-ascii?Q?tw5QkR2HUmKNOMAlO2+sbMCuvqgEM7ycuPs0hwoae7oH6JGi5GUmtGqYHgD0?=
 =?us-ascii?Q?YF250N+EwZTvXx7HKw6gEr9IzOvqSYMKpSTJmLdibogfsalfGIA5zdAMwoCN?=
 =?us-ascii?Q?06pRWErBk8RTXQOVQ0wDxe15YsLVhrjDJ1S/4NNxmMHy+1G93beW+d0tYFc8?=
 =?us-ascii?Q?XveZvj4tWfBFDS6hx3GbzqW8PxSr+0E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a70288e6-3c73-430c-32f1-08da26a49ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 10:16:03.9418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EnLGt5cX9gQeFvrZGIK9jVTMaF5dlwqDf+eG2i4TvHSSOTjcgblztnlZ+2VHY4Bb8Lpgy5gEfuKpea0+flcge5es0MBKVHUAfDTDThbFfAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0120

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Add the vdi part of the wave5 codec driver.
The wave5-vdi.h header defines common helper functions such as writing/read=
ing register and handling endianness.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/wave5-vdi.c | 260 ++++++++++++++++++++++++
 drivers/staging/media/wave5/wave5-vdi.h |  81 ++++++++
 2 files changed, 341 insertions(+)
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.h

diff --git a/drivers/staging/media/wave5/wave5-vdi.c b/drivers/staging/medi=
a/wave5/wave5-vdi.c
new file mode 100644
index 000000000000..bbde868de42e
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vdi.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave5 series multi-standard codec IP - low level access functions
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#include <linux/bug.h>
+#include "wave5-vdi.h"
+#include "wave5-vpu.h"
+#include "wave5-regdefine.h"
+#include <linux/delay.h>
+
+#define VDI_SRAM_BASE_ADDR 0x00
+
+#define VDI_SYSTEM_ENDIAN VDI_LITTLE_ENDIAN
+#define VDI_128BIT_BUS_SYSTEM_ENDIAN VDI_128BIT_LITTLE_ENDIAN
+
+static int wave5_vdi_allocate_common_memory(struct device *dev)
+{
+	int ret;
+	struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
+
+	if (!vpu_dev->common_mem.vaddr) {
+		vpu_dev->common_mem.size =3D SIZE_COMMON;
+		ret =3D wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->common_mem);
+		if (ret) {
+			dev_err(dev, "unable to allocate common buffer\n");
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "common_mem: daddr=3D%pad size=3D%zu vaddr=3D0x%p\n",
+		&vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
+			vpu_dev->common_mem.vaddr);
+
+	return 0;
+}
+
+int wave5_vdi_init(struct device *dev)
+{
+	struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
+	int i;
+	int ret;
+
+	ret =3D wave5_vdi_allocate_common_memory(dev);
+	if (ret < 0) {
+		dev_err(dev, "[VDI] fail to get vpu common buffer from driver\n");
+		return ret;
+	}
+
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		// if BIT processor is not running.
+		if (wave5_vdi_readl(vpu_dev, W5_VCPU_CUR_PC) =3D=3D 0) {
+			for (i =3D 0; i < 64; i++)
+				wave5_vdi_write_register(vpu_dev, (i * 4) + 0x100, 0x0);
+		}
+	} else {
+		WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->product_code);
+	}
+
+	dev_dbg(dev, "[VDI] success to init driver\n");
+
+	return 0;
+}
+
+int wave5_vdi_release(struct device *dev)
+{
+	struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
+
+	vpu_dev->vdb_register =3D NULL;
+	wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
+
+	return 0;
+}
+
+void wave5_vdi_write_register(struct vpu_device *vpu_dev, unsigned int add=
r, unsigned int data)
+{
+	writel(data, vpu_dev->vdb_register + addr);
+}
+
+unsigned int wave5_vdi_readl(struct vpu_device *vpu_dev, u32 addr)
+{
+	return readl(vpu_dev->vdb_register + addr);
+}
+
+int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+	if (!vb || !vb->vaddr) {
+		dev_err(vpu_dev->dev, "%s(): unable to clear unmapped buffer\n", __func_=
_);
+		return -EINVAL;
+	}
+
+	memset(vb->vaddr, 0, vb->size);
+	return vb->size;
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int le=
n, int endian);
+
+int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb,=
 size_t offset,
+			   u8 *data, int len, int endian)
+{
+	if (!vb || !vb->vaddr) {
+		dev_err(vpu_dev->dev, "%s(): unable to write to unmapped buffer\n", __fu=
nc__);
+		return -EINVAL;
+	}
+
+	if (offset > vb->size || len > vb->size || offset + len > vb->size) {
+		dev_err(vpu_dev->dev, "%s(): buffer too small\n", __func__);
+		return -ENOSPC;
+	}
+
+	wave5_swap_endian(vpu_dev, data, len, endian);
+	memcpy(vb->vaddr + offset, data, len);
+
+	return len;
+}
+
+int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_b=
uf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb->size) {
+		dev_err(vpu_dev->dev, "%s(): requested size=3D=3D0\n", __func__);
+		return -EINVAL;
+	}
+
+	vaddr =3D dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+	vb->vaddr =3D vaddr;
+	vb->daddr =3D daddr;
+
+	return 0;
+}
+
+void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf =
*vb)
+{
+	if (vb->size =3D=3D 0)
+		return;
+
+	if (!vb->vaddr)
+		dev_err(vpu_dev->dev, "%s(): requested free of unmapped buffer\n", __fun=
c__);
+	else
+		dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->daddr);
+
+	memset(vb, 0, sizeof(*vb));
+}
+
+int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endi=
an)
+{
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		switch (endian) {
+		case VDI_LITTLE_ENDIAN:
+			endian =3D 0x00;
+			break;
+		case VDI_BIG_ENDIAN:
+			endian =3D 0x0f;
+			break;
+		case VDI_32BIT_LITTLE_ENDIAN:
+			endian =3D 0x04;
+			break;
+		case VDI_32BIT_BIG_ENDIAN:
+			endian =3D 0x03;
+			break;
+		}
+	}
+
+	return (endian & 0x0f);
+}
+
+static void byte_swap(unsigned char *data, int len)
+{
+	u8 temp;
+	int i;
+
+	for (i =3D 0; i < len; i +=3D 2) {
+		temp =3D data[i];
+		data[i] =3D data[i + 1];
+		data[i + 1] =3D temp;
+	}
+}
+
+static void word_swap(unsigned char *data, int len)
+{
+	u16 temp;
+	u16 *ptr =3D (u16 *)data;
+	int i;
+	s32 size =3D len / sizeof(uint16_t);
+
+	for (i =3D 0; i < size; i +=3D 2) {
+		temp =3D ptr[i];
+		ptr[i] =3D ptr[i + 1];
+		ptr[i + 1] =3D temp;
+	}
+}
+
+static void dword_swap(unsigned char *data, int len)
+{
+	u32 temp;
+	u32 *ptr =3D (u32 *)data;
+	s32 size =3D len / sizeof(uint32_t);
+	int i;
+
+	for (i =3D 0; i < size; i +=3D 2) {
+		temp =3D ptr[i];
+		ptr[i] =3D ptr[i + 1];
+		ptr[i + 1] =3D temp;
+	}
+}
+
+static void lword_swap(unsigned char *data, int len)
+{
+	u64 temp;
+	u64 *ptr =3D (u64 *)data;
+	s32 size =3D len / sizeof(uint64_t);
+	int i;
+
+	for (i =3D 0; i < size; i +=3D 2) {
+		temp =3D ptr[i];
+		ptr[i] =3D ptr[i + 1];
+		ptr[i + 1] =3D temp;
+	}
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int le=
n, int endian)
+{
+	int changes;
+	int sys_endian;
+	bool byte_change, word_change, dword_change, lword_change;
+
+	if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+		sys_endian =3D VDI_128BIT_BUS_SYSTEM_ENDIAN;
+	} else {
+		dev_err(vpu_dev->dev, "unknown product id : %08x\n", vpu_dev->product_co=
de);
+		return;
+	}
+
+	endian =3D wave5_vdi_convert_endian(vpu_dev, endian);
+	sys_endian =3D wave5_vdi_convert_endian(vpu_dev, sys_endian);
+	if (endian =3D=3D sys_endian)
+		return;
+
+	changes =3D endian ^ sys_endian;
+	byte_change =3D changes & 0x01;
+	word_change =3D ((changes & 0x02) =3D=3D 0x02);
+	dword_change =3D ((changes & 0x04) =3D=3D 0x04);
+	lword_change =3D ((changes & 0x08) =3D=3D 0x08);
+
+	if (byte_change)
+		byte_swap(data, len);
+	if (word_change)
+		word_swap(data, len);
+	if (dword_change)
+		dword_swap(data, len);
+	if (lword_change)
+		lword_swap(data, len);
+}
+
diff --git a/drivers/staging/media/wave5/wave5-vdi.h b/drivers/staging/medi=
a/wave5/wave5-vdi.h
new file mode 100644
index 000000000000..f26cab7ac845
--- /dev/null
+++ b/drivers/staging/media/wave5/wave5-vdi.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave5 series multi-standard codec IP - low level access functions
+ *
+ * Copyright (C) 2021 CHIPS&MEDIA INC
+ */
+
+#ifndef _VDI_H_
+#define _VDI_H_
+
+#include "wave5-vpuconfig.h"
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+
+/************************************************************************/
+/* COMMON REGISTERS */
+/************************************************************************/
+#define VPU_PRODUCT_CODE_REGISTER 0x1044
+
+/* system register write */
+#define vpu_write_reg(VPU_INST, ADDR, DATA) wave5_vdi_write_register(VPU_I=
NST, ADDR, DATA)
+// system register read
+#define vpu_read_reg(CORE, ADDR) wave5_vdi_readl(CORE, ADDR)
+
+struct vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+	void *vaddr;
+};
+
+struct dma_vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+};
+
+enum endian_mode {
+	VDI_LITTLE_ENDIAN =3D 0, /* 64bit LE */
+	VDI_BIG_ENDIAN, /* 64bit BE */
+	VDI_32BIT_LITTLE_ENDIAN,
+	VDI_32BIT_BIG_ENDIAN,
+	/* WAVE PRODUCTS */
+	VDI_128BIT_LITTLE_ENDIAN =3D 16,
+	VDI_128BIT_LE_BYTE_SWAP,
+	VDI_128BIT_LE_WORD_SWAP,
+	VDI_128BIT_LE_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_SWAP,
+	VDI_128BIT_LE_DWORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_SWAP,
+	VDI_128BIT_BE_DWORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_SWAP,
+	VDI_128BIT_BE_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_WORD_SWAP,
+	VDI_128BIT_BE_BYTE_SWAP,
+	VDI_128BIT_BIG_ENDIAN =3D 31,
+	VDI_ENDIAN_MAX
+};
+
+#define VDI_128BIT_ENDIAN_MASK 0xf
+
+int wave5_vdi_init(struct device *dev);
+int wave5_vdi_release(struct device *dev);	//this function may be called o=
nly at system off.
+
+/**
+ * @brief make clock stable before changing clock frequency
+ * @detail before invoking vdi_set_clock_freg caller MUST invoke vdi_ready=
_change_clock
+ *		function.
+ * after changing clock frequency caller also invoke wave5_vdi_done_change=
_clock() function.
+ * @return 0 failure
+ * 1 success
+ */
+int wave5_vdi_ready_change_clock(unsigned long core_idx);
+int wave5_vdi_set_change_clock(unsigned long core_idx, unsigned long clock=
_mask);
+int wave5_vdi_done_change_clock(unsigned long core_idx);
+int wave5_vdi_buffer_sync(struct device *dev, struct vpu_buf *vb, int dir)=
;
+
+#endif //#ifndef _VDI_H_
+
--=20
2.30.2

