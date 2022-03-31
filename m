Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290100.outbound.protection.outlook.com [40.107.129.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A527F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 09:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIxdVdgpYOomqif1wgynfZPjpvJ81e9d5O98mzoAkQrGTximl1+oMZlP2uthBCBTguucRZ2yWpaZdiSEVqTckaSPVOvWIFh0vubDJmRiVv4zZPbFUHu42/isqkMk2kecfEswI+JdMCrO/nsY9ppZ5Tzi8Mz8LT/g3WYtd5KXmZGgoEilnh4Yw0aCUAtYby8QNr5U3+G0tiO8Tr738hhwWSp5pA3C9kckWLRMlF/YQYJEpY/P2XNLhrSLgcHGmLUlCII815lyzGhGdGoKK8mYOaRHe1jBOGTDipRWQaIpq9YDNh14Mr4MBgjmiQgV/Y4CPRIixZUEUFxpfXEPHziYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhEq5qOdOCo/SJFyE/MJzu3GWWddooxZ2+DUVGsdexM=;
 b=FpyvzydaoPKZSMDf0C3wJMb4NQvINkidKFEUFvFh5gNrHtCoSjdJGc/RvkT9Py1cvtehhwlbuN+yxn/hNUIdNbpoOChkxLJzzulAsvnpnUJJHiBvW3IVlrdPz9ZXOgM9vdjUA/QJM/ccbIa8M1dyLnAMJWb5iOjZBKRAKfqvoP2ez0F9zCWHLXQbNtnJIQ6fuPvn4aC3ft0HcmS+rBN/nURuSsvMsVrPiQM6T2iKQz/u4UTa7Ulc3PsQD09TMdMBmECYEbpSuend9dfb/gNaVS7pcFo9t1mfT0u7VMEse8BiVKEPa9EZQ/xpcCAt+a4ndmXozPY/CAr8SvRhOMT+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhEq5qOdOCo/SJFyE/MJzu3GWWddooxZ2+DUVGsdexM=;
 b=dEwCjHsb3UZyKU+EjGni9rM+EUcJMSSu+mUZ6OXXz3hB5lWN+GYgTNLxk0vHv8Yl/mobGY5aB9OhypWfiYZILJcLXx7AVnEhytwy3rMvjYzSQrFp1sBsf536OIMH2FYCgn3S6SkktTg/FXS6/R2lS0JYkSyEzIc9/Onpr/a/m1w=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0897.KORP216.PROD.OUTLOOK.COM (2603:1096:300:20::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19; Thu, 31 Mar 2022 09:55:08 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3%7]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 09:55:08 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open
 list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list
	<linux-kernel@vger.kernel.org>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "kernel@collabora.com" <kernel@collabora.com>,
	"dafna3@gmail.com" <dafna3@gmail.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>, "kiril.bicevski@collabora.com"
	<kiril.bicevski@collabora.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>, Scott Woo
	<scott.woo@chipsnmedia.com>, "olivier.crete@collabora.com"
	<olivier.crete@collabora.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel@0x0f.com" <daniel@0x0f.com>
Subject: [PATCH v6 2/6] staging: media: wave5: Add the vdi layer
Thread-Topic: [PATCH v6 2/6] staging: media: wave5: Add the vdi layer
Thread-Index: AdhE2kjjiamVHFeZSDW5f5Ya+8Y+EgACi/4A
Date: Thu, 31 Mar 2022 09:55:08 +0000
Message-ID:
 <SL2P216MB1246F2D27D2B57B0E5AA0534FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References:
 <SL2P216MB1246E4D2F467545D1466FAC1FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB1246E4D2F467545D1466FAC1FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a6b1a2a-739e-4ef9-f2eb-08da12fc8a4d
x-ms-traffictypediagnostic: PS2P216MB0897:EE_
x-microsoft-antispam-prvs:
 <PS2P216MB0897ECBA95097AC1C5F10E31FBE19@PS2P216MB0897.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xjc7mgGpVR74nHzLQ7JWuoedhjI9sjYHlwF6UPDdcoS4pdsizEMajGmFDDk17AsflObknjuy0NqAj+c6yURViXa6LaEqN+mF46UfVW1qEkonLhihVzkmSIhftIveWsbCsBV/oSWKPpynGLxsA5P+U1czjiGpuTdPP9b6L3a+vjMvpxG3SChq3Yvdtai0GSBV+pou1KHfe/XzyWv+wvKOLA8Lfp1qM7Am2oQ1vDOeJmaI8ZqhAvCpkZqXLkhJJc3q4PxwnKnyfzCCJoezqE5SSHV3sdLzh6cn7lN2Gx5UNm04waJV6jenbol2qim+qVhMgUOxnO64jM+lGf1RySFrR5b2ef4IgwkZ2bhirmYj5b5dczT+aPMu3bSwtzQu2UxXP2OaafIMOWjGfKoyzT/zCUozJZTNn7FfUkkiIrtnPfghwG8bth7q6qpXN5R4PFjV4uZnxhzWFRNLUyQgzK0fXJLGDGhe7qKX8mVZFbQL1iEl8DVFI7ZkmI5ZPGCe9T2a4Oy46mELkK78pmUZ+X0iMto4riaV0O1uTyMzfA3lbeNbn7yYNwPZwuLwJ0LMDlhK1fF3lr5AXuwqv5sekZ7JQcYRNWJ1jRu7onpTq31RjhAgOSTSNQ7mv8uYBYwBzwx23c2AMtd0SyGuYcfBonydh1jvETG7qDoe4Yfgx45ZaSOpQPaAXXCFmpU83N2tGGybVacpJEEiq9vDFNKge6rFaA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(396003)(136003)(346002)(39840400004)(376002)(2906002)(508600001)(76116006)(86362001)(38100700002)(55016003)(71200400001)(33656002)(66476007)(7696005)(83380400001)(6506007)(5660300002)(316002)(8676002)(122000001)(66446008)(54906003)(66556008)(2940100002)(8936002)(64756008)(7416002)(38070700005)(186003)(66946007)(44832011)(52536014)(9686003)(6916009)(26005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?acj9UTF3gu/mpaWGgs99zKOz9jeytUje4/rY9XC/iloCupCanYlhHqEGOOcT?=
 =?us-ascii?Q?KNy9XGxiHjeWj00SLrPr9kpPfDysbNzQavcC4KscuabgVLV/LtFwwsWfmU4H?=
 =?us-ascii?Q?LniQ/imIc7ewzXK2XoHPznK5KQqpPvhNHXxbRprTw/zzPV46WYYIA1PyJeDh?=
 =?us-ascii?Q?y5fE4SCBT15MUFbb/p+TzxbmX10YSb9+8ikQ8nIYszCRyhAua62CAjkmsBSQ?=
 =?us-ascii?Q?2mhtHyYuf15LomYuU1B/6ZsB6zdKMdVWl0Hxs3OAsK3igF1Xu2RS/5aW3304?=
 =?us-ascii?Q?jJHQLVDIOSYDJ5E5UnbKEwU3+qQpSeJKCEBxv3UJ9DlY4Spn+tJKKAdNjshq?=
 =?us-ascii?Q?7YoybC/L23L1Kx17eYRirZjknlCWMRihtNVe58puRxK0d/JpE27qaA33dHJK?=
 =?us-ascii?Q?qgDDN7jdGN6LJDKJn20mt4ryTFTLpdD1qqwuAbjKG+XhuhiBab/rkPk1DX4j?=
 =?us-ascii?Q?hw8yhmcXKBr4PWoL8AKwHnn0H8VA+JlLNnZak/cwguECFg9ZtsP8Z2o27XMb?=
 =?us-ascii?Q?pbybI/ZueTv2N6hgjTFm9Ofot4Xf1CZk+x4PGVJlLNRCrjMNXdD2cPzY64uk?=
 =?us-ascii?Q?IzTBX2hOZcm9NwULFolKwvyTcIjx/EY8mgSV5TyklXZHllIBh/uF07M1IcXa?=
 =?us-ascii?Q?6KBvFDX5KvJ2mFdJtvAzFIuL5CD9pdRVgw+60tIQLx+EPyq1JpfWrNhNCb5X?=
 =?us-ascii?Q?zDSl7lINqP39/feC6sR3tChx1V8MELpern7QxWDV6CR0UPoBZJsLH5MANBuT?=
 =?us-ascii?Q?GpkmlHwJu+J7dTwlTpRAgUSgvhGXcPpTtoatwlF5HJSyCxTx0gEUwQEGP+Te?=
 =?us-ascii?Q?zPPzkhVPpLoTWrM6mLN/SBW1AAmKN8U6njtWyonZMuv8dziXFxXL+kvvcPKU?=
 =?us-ascii?Q?zfcYvSM/CQDb7YN3FfMnkpAnXg6fOzDdzxQH9ErPxEFhtxe1FhK3Fb4cF9uw?=
 =?us-ascii?Q?ouNwtxefjAxsa01Fkif0o37MTgEIzJWIHgh+FiOY89yqP+Ofc4jfh2IaeK4R?=
 =?us-ascii?Q?Z6HLllxNPRl48UqGdy19ydPOM0Z/UlEREwA50TTLiEfc+jdP9If28JpNUnQ8?=
 =?us-ascii?Q?HXDdikBqi6/OnkVGveU5nKJqd6bPsxfTYUYp5zFg5kfMsGhut9E7A9CiNKgU?=
 =?us-ascii?Q?+I6mX3+IwzqbvUs3Aw8wnpMYXuVWL0W5MnurCWux0V5zrPEt0ZqQJCPf05E8?=
 =?us-ascii?Q?IqSjHeaKjI+wluqr8DWkDFHaHELLy24AXrVO/fCiaOj6tE3mMoSyHQsiczfA?=
 =?us-ascii?Q?5n+9/XB/RCRucuN5KOo+ghBgP0nPFb7oXtl+4Ev8IwVjq7eiaUI/jBEv1SRP?=
 =?us-ascii?Q?6Wz4DqabetcSs/euBBIVWwtjINmP8mXJffPhbNrIDcDt6Vu69huKO79MNdkB?=
 =?us-ascii?Q?ZTuVQlWm/FnTimJl4qtXw4ZIA17dSIzyfssJcPf5GP+NYVjlf9S067KYBySr?=
 =?us-ascii?Q?HWJ0dSl7WuvYdt+N0JMFpDlha6ui9UC7OM8c0k+gmMRqbqCbRk4sWUN7bTz3?=
 =?us-ascii?Q?MPL+T5ZMdyhfCfjUeo2/xTliSAW1kyjIR79bBSKcMfcZYC6i00D1yKfNMv+1?=
 =?us-ascii?Q?n5x1Rj0V2+EVuiPMjC1S7FZt+5oQMHiYjiko3DNptVydL0xtNTNe3F/wzr8O?=
 =?us-ascii?Q?mGNRSOZAggZDp18ZmaCceTNtjd5eykadtieDe4z8THcxqgwG32D+5iiLa+LJ?=
 =?us-ascii?Q?Jgz5QAPnxVs0nlH/7gtS1F2COM8EjmHNmtlzNsPOEv+yIVmEuTTYAkloAs50?=
 =?us-ascii?Q?NXnPuv9tv2+JyNUpdV0CYgLkjF4zwMc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6b1a2a-739e-4ef9-f2eb-08da12fc8a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 09:55:08.6988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjooZt18j+L+42LTePr59VLvjKUY2bH7Ny5BAaHWOnLuz1jG1Gxkn2BkIalROOg2v75KEptLZIGmLRIGdRqjYHVNKyCY7DOWjFed1VyqiXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0897

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Add the vdi part of the wave5 codec driver.
The wave5-vdi.h header defines common helper functions
such as writing/reading register and handling endianness.

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
+       int ret;
+       struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
+
+       if (!vpu_dev->common_mem.vaddr) {
+               vpu_dev->common_mem.size =3D SIZE_COMMON;
+               ret =3D wave5_vdi_allocate_dma_memory(vpu_dev, &vpu_dev->co=
mmon_mem);
+               if (ret) {
+                       dev_err(dev, "unable to allocate common buffer\n");
+                       return ret;
+               }
+       }
+
+       dev_dbg(dev, "common_mem: daddr=3D%pad size=3D%zu vaddr=3D0x%p\n",
+               &vpu_dev->common_mem.daddr, vpu_dev->common_mem.size,
+                       vpu_dev->common_mem.vaddr);
+
+       return 0;
+}
+
+int wave5_vdi_init(struct device *dev)
+{
+       struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
+       int i;
+       int ret;
+
+       ret =3D wave5_vdi_allocate_common_memory(dev);
+       if (ret < 0) {
+               dev_err(dev, "[VDI] fail to get vpu common buffer from driv=
er\n");
+               return ret;
+       }
+
+       if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+               // if BIT processor is not running.
+               if (wave5_vdi_readl(vpu_dev, W5_VCPU_CUR_PC) =3D=3D 0) {
+                       for (i =3D 0; i < 64; i++)
+                               wave5_vdi_write_register(vpu_dev, (i * 4) +=
 0x100, 0x0);
+               }
+       } else {
+               WARN_ONCE(1, "unsupported product code 0x%x\n", vpu_dev->pr=
oduct_code);
+       }
+
+       dev_dbg(dev, "[VDI] success to init driver\n");
+
+       return 0;
+}
+
+int wave5_vdi_release(struct device *dev)
+{
+       struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
+
+       vpu_dev->vdb_register =3D NULL;
+       wave5_vdi_free_dma_memory(vpu_dev, &vpu_dev->common_mem);
+
+       return 0;
+}
+
+void wave5_vdi_write_register(struct vpu_device *vpu_dev, unsigned int add=
r, unsigned int data)
+{
+       writel(data, vpu_dev->vdb_register + addr);
+}
+
+unsigned int wave5_vdi_readl(struct vpu_device *vpu_dev, u32 addr)
+{
+       return readl(vpu_dev->vdb_register + addr);
+}
+
+int wave5_vdi_clear_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb)
+{
+       if (!vb || !vb->vaddr) {
+               dev_err(vpu_dev->dev, "%s(): unable to clear unmapped buffe=
r\n", __func__);
+               return -EINVAL;
+       }
+
+       memset(vb->vaddr, 0, vb->size);
+       return vb->size;
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int le=
n, int endian);
+
+int wave5_vdi_write_memory(struct vpu_device *vpu_dev, struct vpu_buf *vb,=
 size_t offset,
+                          u8 *data, int len, int endian)
+{
+       if (!vb || !vb->vaddr) {
+               dev_err(vpu_dev->dev, "%s(): unable to write to unmapped bu=
ffer\n", __func__);
+               return -EINVAL;
+       }
+
+       if (offset > vb->size || len > vb->size || offset + len > vb->size)=
 {
+               dev_err(vpu_dev->dev, "%s(): buffer too small\n", __func__)=
;
+               return -ENOSPC;
+       }
+
+       wave5_swap_endian(vpu_dev, data, len, endian);
+       memcpy(vb->vaddr + offset, data, len);
+
+       return len;
+}
+
+int wave5_vdi_allocate_dma_memory(struct vpu_device *vpu_dev, struct vpu_b=
uf *vb)
+{
+       void *vaddr;
+       dma_addr_t daddr;
+
+       if (!vb->size) {
+               dev_err(vpu_dev->dev, "%s(): requested size=3D=3D0\n", __fu=
nc__);
+               return -EINVAL;
+       }
+
+       vaddr =3D dma_alloc_coherent(vpu_dev->dev, vb->size, &daddr, GFP_KE=
RNEL);
+       if (!vaddr)
+               return -ENOMEM;
+       vb->vaddr =3D vaddr;
+       vb->daddr =3D daddr;
+
+       return 0;
+}
+
+void wave5_vdi_free_dma_memory(struct vpu_device *vpu_dev, struct vpu_buf =
*vb)
+{
+       if (vb->size =3D=3D 0)
+               return;
+
+       if (!vb->vaddr)
+               dev_err(vpu_dev->dev, "%s(): requested free of unmapped buf=
fer\n", __func__);
+       else
+               dma_free_coherent(vpu_dev->dev, vb->size, vb->vaddr, vb->da=
ddr);
+
+       memset(vb, 0, sizeof(*vb));
+}
+
+int wave5_vdi_convert_endian(struct vpu_device *vpu_dev, unsigned int endi=
an)
+{
+       if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+               switch (endian) {
+               case VDI_LITTLE_ENDIAN:
+                       endian =3D 0x00;
+                       break;
+               case VDI_BIG_ENDIAN:
+                       endian =3D 0x0f;
+                       break;
+               case VDI_32BIT_LITTLE_ENDIAN:
+                       endian =3D 0x04;
+                       break;
+               case VDI_32BIT_BIG_ENDIAN:
+                       endian =3D 0x03;
+                       break;
+               }
+       }
+
+       return (endian & 0x0f);
+}
+
+static void byte_swap(unsigned char *data, int len)
+{
+       u8 temp;
+       int i;
+
+       for (i =3D 0; i < len; i +=3D 2) {
+               temp =3D data[i];
+               data[i] =3D data[i + 1];
+               data[i + 1] =3D temp;
+       }
+}
+
+static void word_swap(unsigned char *data, int len)
+{
+       u16 temp;
+       u16 *ptr =3D (u16 *)data;
+       int i;
+       s32 size =3D len / sizeof(uint16_t);
+
+       for (i =3D 0; i < size; i +=3D 2) {
+               temp =3D ptr[i];
+               ptr[i] =3D ptr[i + 1];
+               ptr[i + 1] =3D temp;
+       }
+}
+
+static void dword_swap(unsigned char *data, int len)
+{
+       u32 temp;
+       u32 *ptr =3D (u32 *)data;
+       s32 size =3D len / sizeof(uint32_t);
+       int i;
+
+       for (i =3D 0; i < size; i +=3D 2) {
+               temp =3D ptr[i];
+               ptr[i] =3D ptr[i + 1];
+               ptr[i + 1] =3D temp;
+       }
+}
+
+static void lword_swap(unsigned char *data, int len)
+{
+       u64 temp;
+       u64 *ptr =3D (u64 *)data;
+       s32 size =3D len / sizeof(uint64_t);
+       int i;
+
+       for (i =3D 0; i < size; i +=3D 2) {
+               temp =3D ptr[i];
+               ptr[i] =3D ptr[i + 1];
+               ptr[i + 1] =3D temp;
+       }
+}
+
+static void wave5_swap_endian(struct vpu_device *vpu_dev, u8 *data, int le=
n, int endian)
+{
+       int changes;
+       int sys_endian;
+       bool byte_change, word_change, dword_change, lword_change;
+
+       if (PRODUCT_CODE_W_SERIES(vpu_dev->product_code)) {
+               sys_endian =3D VDI_128BIT_BUS_SYSTEM_ENDIAN;
+       } else {
+               dev_err(vpu_dev->dev, "unknown product id : %08x\n", vpu_de=
v->product_code);
+               return;
+       }
+
+       endian =3D wave5_vdi_convert_endian(vpu_dev, endian);
+       sys_endian =3D wave5_vdi_convert_endian(vpu_dev, sys_endian);
+       if (endian =3D=3D sys_endian)
+               return;
+
+       changes =3D endian ^ sys_endian;
+       byte_change =3D changes & 0x01;
+       word_change =3D ((changes & 0x02) =3D=3D 0x02);
+       dword_change =3D ((changes & 0x04) =3D=3D 0x04);
+       lword_change =3D ((changes & 0x08) =3D=3D 0x08);
+
+       if (byte_change)
+               byte_swap(data, len);
+       if (word_change)
+               word_swap(data, len);
+       if (dword_change)
+               dword_swap(data, len);
+       if (lword_change)
+               lword_swap(data, len);
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
+       size_t size;
+       dma_addr_t daddr;
+       void *vaddr;
+};
+
+struct dma_vpu_buf {
+       size_t size;
+       dma_addr_t daddr;
+};
+
+enum endian_mode {
+       VDI_LITTLE_ENDIAN =3D 0, /* 64bit LE */
+       VDI_BIG_ENDIAN, /* 64bit BE */
+       VDI_32BIT_LITTLE_ENDIAN,
+       VDI_32BIT_BIG_ENDIAN,
+       /* WAVE PRODUCTS */
+       VDI_128BIT_LITTLE_ENDIAN =3D 16,
+       VDI_128BIT_LE_BYTE_SWAP,
+       VDI_128BIT_LE_WORD_SWAP,
+       VDI_128BIT_LE_WORD_BYTE_SWAP,
+       VDI_128BIT_LE_DWORD_SWAP,
+       VDI_128BIT_LE_DWORD_BYTE_SWAP,
+       VDI_128BIT_LE_DWORD_WORD_SWAP,
+       VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
+       VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
+       VDI_128BIT_BE_DWORD_WORD_SWAP,
+       VDI_128BIT_BE_DWORD_BYTE_SWAP,
+       VDI_128BIT_BE_DWORD_SWAP,
+       VDI_128BIT_BE_WORD_BYTE_SWAP,
+       VDI_128BIT_BE_WORD_SWAP,
+       VDI_128BIT_BE_BYTE_SWAP,
+       VDI_128BIT_BIG_ENDIAN =3D 31,
+       VDI_ENDIAN_MAX
+};
+
+#define VDI_128BIT_ENDIAN_MASK 0xf
+
+int wave5_vdi_init(struct device *dev);
+int wave5_vdi_release(struct device *dev);     //this function may be call=
ed only at system off.
+
+/**
+ * @brief make clock stable before changing clock frequency
+ * @detail before invoking vdi_set_clock_freg caller MUST invoke vdi_ready=
_change_clock
+ *             function.
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
--
2.30.2

[C&M]
IMPORTANT NOTICE

The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in some unexpected situation, please immediately notify the=
 sender by replying email and then delete this message and any attachments.=
 If you are not the intended recipient, you are hereby notified that any us=
e, distribution, copying, or storage of this message or its attachments is =
strictly prohibited.
