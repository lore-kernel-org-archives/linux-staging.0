Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524623B23
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 18:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvKtIcskmmzhBMI4R901P80TRbEbvm6klSs9Y6wzKD1LOr1y3cVU/gsyiALo/6bQ8FlgcHIJubQEpVvy5UZE4X4vnB/P5O0i8s0qE27v05j2JoMce+zjg8x1WbAeBzF2bksfd9Yu408KDO4yc+UHgf9KzxKOW946MkBeIdFxQdhHa0s7V5j1UrN03g5IViAFgjUlb6XcmuStXDSWhTJ2fSY3RZvBI1TLFgXDPk/uJpOnfb4gUIbxQ1hIe7HtvtyUJobifqGdAoT0Hvymv+zisd/3dpI3Aaohs3XyhkaAA6bnx37HuXQndSE6EhfaXDtX42YFS5DyVjdwhxOMGEq9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QhK4uCsAxGx1xP5VXlhY16N8tOeI06QmwZTJ5tGVAc=;
 b=EtcgJef/76fFsBtotoVw7Sozdo5sYgD7vH98gMx6af7DDBedOWAT8B5M8Z+A+sGPYHNs6sl8aMCJLR022JoZAM/135rSF/lVzlg0I36VZ5uU7eqS0bQYXtU5y7DR8PCkGvc7LTV5e5pdT94Yi1TL3rm2FTy+suu6653FkFg8QTqoxygXAh+IqgF4pPZZp7tXIgilRmQHgDdDnqwhOOyAjkG+ze2JqQKODuWx4K8ZMFtmv1cfUUhVF0tZ97r212Pz5dhDzE2skddss+PwtACtK5M+KDnnNJqF8R/9fbLzR1tmRZSDlIC5Ztt29s7MkwhDKWFqIoywmSF46+vPTsCR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QhK4uCsAxGx1xP5VXlhY16N8tOeI06QmwZTJ5tGVAc=;
 b=pT/G5AwpSuJfy0wv3TJU8f4d/1QJJCFDXOYDON7+W72G6QNFruGq5TTV4MfC9DZkpzbBJv/p6n6gTKHimtrgiMVhlelxmrhcx4B7RC8EAQSkl0v5ipsMGDVcrNfxcPmzf/2G0Rben6xGLZKQjRW+doOVRsdPRnzGE0RortqnNst8opeqIoMWc2MHmGPqo7gDe6Rm9i0OKpeOOxHJdXdLyXS8J6bZCzB58mb6oi47S/r3w7Z1s6eZl4Za9HpHO2V7nfcPrtfYEKliGGLec9sn8/kIpojHJFvXzkzdqivxAi/e+PYLv/cGZFg1GnZNyxsL/QPu6oxST6u1uab/7Ic1DA==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by AM0PR02MB4563.eurprd02.prod.outlook.com (2603:10a6:208:ec::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 18:13:04 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::a4d0:f2e7:68e1:bf71%7]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 18:13:04 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
CC: SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: [RFC] staging/vSMP: new driver
Thread-Topic: [RFC] staging/vSMP: new driver
Thread-Index: AQHYOWFVtbFVL/RlCkqxQt1YlxgURA==
Date: Wed, 16 Mar 2022 18:13:04 +0000
Message-ID:
 <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: e4acc606-bcc5-abeb-0c64-fe90eafa2202
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7087dfd5-c7e8-4b7c-3b52-08da07789d78
x-ms-traffictypediagnostic: AM0PR02MB4563:EE_
x-microsoft-antispam-prvs:
 <AM0PR02MB4563D0580A981E016682416281119@AM0PR02MB4563.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dV8+Tl+BqYMz3KXx1sJai23rvtPhqDsg0TrQIKS34o8TBnMiWMDq29mY3m7VbR/B9+NVBA8F08EKEAIR/lvOCpuKiR4zqqRxqAjAnKCiXWTujjxr/v9c+nw7QNUmvzPMF4+srdWNjv+L63gq7pgTK/cmA4O3T1vjLfnHgs68hE5o9M1SAgO9WRRENmHfnT5N9IHIF5s6mwq2gyZfwS3W4miIs9yrWRyXVZwyRMJ9krUufG2Q984y/2KJ2ItsIXpK3hNvxmAn+dQS4ir8Yu7d3xvYmWsE6E6k+PMhPO1USdzwmXL+KdzBtFQqtCN9Pdaf4vTJoeKIMMTLdtVI/x9WHqYsPHdKB0xxW0Uh9yA2pyZw2w8561W/N1LfaObCRLNm/gZ7seexqwr6GM0VYqPtN+0g1bL22txS/WxIq6yOd8TWAI44ppJ/A1aZMzNmatyp+KtJ9Hl2rsj/SeO/yPcCDOUUsOp+WOcbK/kBTx8FrgVBSdkXYbXMN5HqzWxxnq06wid6SuKvp7khtltyAMOvTKRC52gkk01nCyTC8Rfkoj08L/fLocmH9XNmI8YB4n82r3la3MAo7HHaGSeR27jheQofDeF05MtC24sebgeroi7gcz3zMG38gPvlctFeD6P8Kp1Dvj/JsUC0FRpj/Ph2lSqQh6ZcV+OLnRVbIPNI72VQYrACa9sGqY60GLCZFjmNlFLamP70rQj3z86KpnKzQQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(316002)(82960400001)(30864003)(122000001)(5660300002)(38070700005)(6916009)(71200400001)(38100700002)(83380400001)(508600001)(86362001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(91956017)(76116006)(33656002)(52536014)(8936002)(26005)(186003)(7696005)(6506007)(9686003)(2906002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rTfS7P9Sbzt8FgWNhNqAC4mbH47ja9ripIL1Rs4ric+9JEUzLDVVF0I+ko?=
 =?iso-8859-1?Q?T225purbdPLa6BiLHjW6lcyGDKFsQUxrMyiIqx6+JbbA8FWVDlzZYT2VCA?=
 =?iso-8859-1?Q?nbhklRPvbcQwaRICLtTxyuL3zsONbuGE+QhkzvnYYse/cCWcukrbToCuX2?=
 =?iso-8859-1?Q?Xie/BsZeCWGIPo8t2lTLTCa82s/QqMffstQqpFvoSUhwjp8Bt6x3C7HQXl?=
 =?iso-8859-1?Q?igE/fN5rRkkqr3B/m8sHoDIK7bhHPcjjy3NMhuooxS1rP8oy1F9kxc/yut?=
 =?iso-8859-1?Q?5rzKGp4Qf4TFsIakJcPhCfJoVSSkUO6/0/DV2xoD/UBMxIQzEe4PYFRiE/?=
 =?iso-8859-1?Q?D86y0rEnHP7hZtklpKgejDy5PCPnZl/I1CPUhlSjZgLxFctAeXiXq1wsZF?=
 =?iso-8859-1?Q?OsHGsFkgZ5bNLcsQyxMztrDlqEftO8Sw9BGK0NPNmKiUlj8hRpRH5ry8yJ?=
 =?iso-8859-1?Q?npT0IN7gaIzG2z5jHHR7Z7cCK91kjWGPMOSRQeVX9LJRP17mpDIihThYl6?=
 =?iso-8859-1?Q?K6+nDKJ3ZJhUzaIMCqdU7HomfiVDfF+DYqJ9cflWB6L1CTNixaswlcmUqv?=
 =?iso-8859-1?Q?5Wuu/LQJ3g+qO8YhCY5R9OPIJS7/4Ly0Za/mhtfrbkokqaoDK2djbS0bHf?=
 =?iso-8859-1?Q?vW04fHi7UwJfm3EcYFhsc/tpGQOuan9vJO3in4BZxdDXJMkK62Z+RyB6RX?=
 =?iso-8859-1?Q?YsaW8ZIleHnLce2eCWMl/e7nPEapH2bfb/4EekbVC7FoOl8+34lvMRp6qr?=
 =?iso-8859-1?Q?g7F+1HX0wtmkiRdKa3NX/FEIS3UYQUpI7AApM+ewqqZRfCQLOD4wsW1FfS?=
 =?iso-8859-1?Q?updekGlE4yupmFB9gCMqa/KVgmfRJd9LHzW0hprcd3hbP991Uhrkzcb2YC?=
 =?iso-8859-1?Q?8DVAiBKS76fTq7bUkyliggwWzivy1tZ+/HZKfZR4lJ0HcYqxy1rWYKnlyK?=
 =?iso-8859-1?Q?rvoufhsMV4r1qdM/I7z0T+5o2UjmqgKVFZXTOSknEzjSbt7kLOoWozJOSz?=
 =?iso-8859-1?Q?VsijdjIpfilaFd8oiyGY+a3n8c8R+EtjP95Go1eJfL1C1NBhwtpI7IClwl?=
 =?iso-8859-1?Q?ir7P0d7KU8b2QG/2PZU4E69lwfloeH8+5aJQz6AwUXbAA250SWPOQuh7tw?=
 =?iso-8859-1?Q?TcF8yhgri24SPK+rVAh/AE2gYeFUuaopIGMr21Udxid7WZ4EW3NEPqEuQe?=
 =?iso-8859-1?Q?DILNGrO6ZpmoRoeQNzN7FTSxsoEGCB9GoxrzfKTlBPTJ5suXuKczFdO8ME?=
 =?iso-8859-1?Q?MDaXe/EFIldkel0MeTubMj36D5vYxsFz7GZGy0zsLq0PpkHq3YIgvnvtTL?=
 =?iso-8859-1?Q?4vy9gRGVhFNYe/ju1LkWwBwPPRoJfyZG1Av6G6tTKHL0VzWXd0Wngromhs?=
 =?iso-8859-1?Q?MHjEB+SNC5pQJWHttc+NkHiwkXc9kVtYib5cGBx9fUst8VNI/Ye9RhEw7o?=
 =?iso-8859-1?Q?S3ZE9dkqAmMpf3IkYwE2nHUpSfPIupSgkMgbXTeti/3Kr/gqMbYEMjYB49?=
 =?iso-8859-1?Q?YNWQaG13i8bvQwqGIcBU3Z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7087dfd5-c7e8-4b7c-3b52-08da07789d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 18:13:04.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ol6u6Bhtt5WDDsVOYClIMqZxTpPKI0onEBVVUgPdebbXihkt0+3xXih3RAGnaPl8qNvGSZY99PhE7tWF+5Oq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4563

Introducing the vSMP guest driver which allows interaction with the vSMP co=
ntrol device when=0A=
running a Linux OS atop of the vSMP hypervisor.=0A=
vSMP is a resource aggregation hypervisor from SAP.=0A=
=0A=
the driver comprises of 3 modules, vsmp which includes all the api needed t=
o interact with the=0A=
control driver, vsmp_logs which allows reading logs from the hypervisor and=
 vsmp_common_info which=0A=
allows reading generic information the hypervisor exposes, currently only t=
he version is exposed.=0A=
=0A=
Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>=0A=
---=0A=
 MAINTAINERS                             |   6 +=0A=
 drivers/staging/Kconfig                 |   2 +=0A=
 drivers/staging/Makefile                |   1 +=0A=
 drivers/staging/vsmp/Kconfig            |  14 +=0A=
 drivers/staging/vsmp/Makefile           |   7 +=0A=
 drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++=0A=
 drivers/staging/vsmp/api.h              |  61 ++++=0A=
 drivers/staging/vsmp/common/Kconfig     |  11 +=0A=
 drivers/staging/vsmp/common/Makefile    |   7 +=0A=
 drivers/staging/vsmp/common/common.c    |  64 ++++=0A=
 drivers/staging/vsmp/common/common.h    |  27 ++=0A=
 drivers/staging/vsmp/common/version.c   |  85 +++++=0A=
 drivers/staging/vsmp/logs/Kconfig       |  10 +=0A=
 drivers/staging/vsmp/logs/Makefile      |   7 +=0A=
 drivers/staging/vsmp/logs/active_logs.c | 112 +++++++=0A=
 drivers/staging/vsmp/registers.h        |  16 +=0A=
 16 files changed, 832 insertions(+)=0A=
 create mode 100644 drivers/staging/vsmp/Kconfig=0A=
 create mode 100644 drivers/staging/vsmp/Makefile=0A=
 create mode 100644 drivers/staging/vsmp/api.c=0A=
 create mode 100644 drivers/staging/vsmp/api.h=0A=
 create mode 100644 drivers/staging/vsmp/common/Kconfig=0A=
 create mode 100644 drivers/staging/vsmp/common/Makefile=0A=
 create mode 100644 drivers/staging/vsmp/common/common.c=0A=
 create mode 100644 drivers/staging/vsmp/common/common.h=0A=
 create mode 100644 drivers/staging/vsmp/common/version.c=0A=
 create mode 100644 drivers/staging/vsmp/logs/Kconfig=0A=
 create mode 100644 drivers/staging/vsmp/logs/Makefile=0A=
 create mode 100644 drivers/staging/vsmp/logs/active_logs.c=0A=
 create mode 100644 drivers/staging/vsmp/registers.h=0A=
=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index 68f21d46614c..2fc61b4d13e5 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -18381,6 +18381,12 @@ F:	Documentation/core-api/printk-formats.rst=0A=
 F:	lib/test_printf.c=0A=
 F:	lib/vsprintf.c=0A=
 =0A=
+VSMP GUEST DRIVER=0A=
+M:     Eial Czerwacki <eial.czerwacki@sap.com>=0A=
+M:     linux-vsmp@sap.com=0A=
+S:     Maintained=0A=
+F:     drivers/staging/vsmp-guest =0A=
+=0A=
 VT1211 HARDWARE MONITOR DRIVER=0A=
 M:	Juerg Haefliger <juergh@gmail.com>=0A=
 L:	linux-hwmon@vger.kernel.org=0A=
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig=0A=
index 4ec5528f89fa..f61778bccb0b 100644=0A=
--- a/drivers/staging/Kconfig=0A=
+++ b/drivers/staging/Kconfig=0A=
@@ -114,6 +114,8 @@ source "drivers/staging/axis-fifo/Kconfig"=0A=
 =0A=
 source "drivers/staging/fieldbus/Kconfig"=0A=
 =0A=
+source "drivers/staging/vsmp/Kconfig"=0A=
+=0A=
 source "drivers/staging/kpc2000/Kconfig"=0A=
 =0A=
 source "drivers/staging/qlge/Kconfig"=0A=
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile=0A=
index 4d34198151b3..726e704ba8bc 100644=0A=
--- a/drivers/staging/Makefile=0A=
+++ b/drivers/staging/Makefile=0A=
@@ -47,6 +47,7 @@ obj-$(CONFIG_SOC_MT7621)	+=3D mt7621-dts/=0A=
 obj-$(CONFIG_STAGING_GASKET_FRAMEWORK)	+=3D gasket/=0A=
 obj-$(CONFIG_XIL_AXIS_FIFO)	+=3D axis-fifo/=0A=
 obj-$(CONFIG_FIELDBUS_DEV)     +=3D fieldbus/=0A=
+obj-$(CONFIG_VSMP)       +=3D vsmp/=0A=
 obj-$(CONFIG_KPC2000)		+=3D kpc2000/=0A=
 obj-$(CONFIG_QLGE)		+=3D qlge/=0A=
 obj-$(CONFIG_WFX)		+=3D wfx/=0A=
diff --git a/drivers/staging/vsmp/Kconfig b/drivers/staging/vsmp/Kconfig=0A=
new file mode 100644=0A=
index 000000000000..c57cfcb55033=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/Kconfig=0A=
@@ -0,0 +1,14 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+menuconfig VSMP=0A=
+	tristate "vSMP Guest Support"=0A=
+	depends on SYS_HYPERVISOR && X86_64 && PCI=0A=
+	help=0A=
+	  Support for vSMP Guest Driver.=0A=
+=0A=
+	  this drivers allows information gathering of data from the vSMP hypervi=
sor when=0A=
+	  running ontop of a vSMP based VM.=0A=
+=0A=
+	  If unsure, say no.=0A=
+=0A=
+source "drivers/staging/vsmp/common/Kconfig"=0A=
+source "drivers/staging/vsmp/logs/Kconfig"=0A=
diff --git a/drivers/staging/vsmp/Makefile b/drivers/staging/vsmp/Makefile=
=0A=
new file mode 100644=0A=
index 000000000000..88625cd3707d=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/Makefile=0A=
@@ -0,0 +1,7 @@=0A=
+# SPDX-License-Identifier: GPL-2.0=0A=
+#=0A=
+# Makefile for vSMP Guest drivers.=0A=
+#=0A=
+=0A=
+obj-$(CONFIG_VSMP)	+=3D vsmp.o common/ logs/=0A=
+vsmp-y			:=3D api.o=0A=
diff --git a/drivers/staging/vsmp/api.c b/drivers/staging/vsmp/api.c=0A=
new file mode 100644=0A=
index 000000000000..b0d4b5a990d4=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/api.c=0A=
@@ -0,0 +1,402 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP api=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#include <linux/init.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/moduleparam.h>=0A=
+#include <linux/pci_regs.h>=0A=
+#include <linux/pci.h>=0A=
+#include <linux/kobject.h>=0A=
+#include <linux/kernel.h>=0A=
+=0A=
+#include <asm/io.h>=0A=
+=0A=
+#include "api.h"=0A=
+=0A=
+#define DRIVER_LICENSE "GPL"=0A=
+#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
+#define DRIVER_DESC "vSMP api driver"=0A=
+#define DRIVER_VERSION "0.1"=0A=
+=0A=
+#define PCI_DEVICE_ID_SAP_FLX_VSMP_CTL 0x1011=0A=
+#define VSMP_CTL_MAX_PCI_BARS 2=0A=
+=0A=
+/* modules info */=0A=
+MODULE_LICENSE(DRIVER_LICENSE);=0A=
+MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
+MODULE_DESCRIPTION(DRIVER_DESC);=0A=
+MODULE_VERSION(DRIVER_VERSION);=0A=
+=0A=
+static unsigned int vsmp_bus =3D 0;=0A=
+static unsigned short vsmp_dev =3D 0x1f;=0A=
+static unsigned char vsmp_func =3D 0;=0A=
+static bool vsmp_bdf_static =3D false;=0A=
+static char *vsmp_ctrl_pci_addr =3D "";=0A=
+module_param(vsmp_ctrl_pci_addr, charp, 0660);=0A=
+=0A=
+/* defines */=0A=
+// copied from arch/x86/pci/direct.c=0A=
+#define PCI_CONF1_ADDRESS(bus, devfn, reg) \=0A=
+	   (0x80000000 | ((reg & 0xF00) << 16) | (bus << 16) \=0A=
+	   | (devfn << 8) | (reg & 0xFC))=0A=
+=0A=
+/* global vars */=0A=
+void __iomem *cfg_addr =3D NULL;=0A=
+static struct kobject *vsmp_sysfs_kobj;=0A=
+static struct pci_dev *vsmp_dev_obj =3D NULL;=0A=
+=0A=
+static const struct pci_device_id pci_tbl[] =3D {=0A=
+	{ PCI_VDEVICE(SCALEMP, PCI_DEVICE_ID_SAP_FLX_VSMP_CTL), 0, },=0A=
+	{ 0, },			/* terminate list */=0A=
+};=0A=
+=0A=
+static struct {=0A=
+	uint64_t start;=0A=
+	uint64_t len;=0A=
+} mapped_bars[VSMP_CTL_MAX_PCI_BARS] =3D { 0 };=0A=
+=0A=
+/* internal functions */=0A=
+=0A=
+/**=0A=
+ * parses the pci address of a given address where the vSMP=0A=
+ * pci device is found=0A=
+ */=0A=
+static void parse_vsmp_ctrl_pci_addr(void)=0A=
+{=0A=
+	if (strlen(vsmp_ctrl_pci_addr)) {=0A=
+		unsigned int bus;=0A=
+		unsigned short dev;=0A=
+		unsigned char func;=0A=
+=0A=
+		if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev,=0A=
+			   &func) =3D=3D 3) {=0A=
+			vsmp_bus =3D bus;=0A=
+			vsmp_dev =3D dev;=0A=
+			vsmp_func =3D func;=0A=
+			vsmp_bdf_static =3D true;=0A=
+		}=0A=
+	}=0A=
+}=0A=
+=0A=
+/**=0A=
+ * queries as specfic device in order to determine if it is a vSMP pci dev=
ice=0A=
+ */=0A=
+static void query_pci_bus_for_vsmp_directly(unsigned int default_bus,=0A=
+					    unsigned int devfn)=0A=
+{=0A=
+	printk(KERN_INFO=0A=
+	       "vSMP pci controller not found in devices tree, trying directly at=
 %x:%x.%x...\n",=0A=
+	       vsmp_bus, vsmp_dev, vsmp_func);=0A=
+=0A=
+	outl(PCI_CONF1_ADDRESS(vsmp_bus, devfn, PCI_BASE_ADDRESS_0), 0xcf8);=0A=
+	mapped_bars[0].start =3D inl(0xcfc);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * scan all the devices on the system in order to locate the=0A=
+ * vSMP pic device for a given dev end func is provided=0A=
+ */=0A=
+static void scan_pci_devs_list_for_vsmp(unsigned int devfn)=0A=
+{=0A=
+	int found, i;=0A=
+	struct pci_dev *pdev =3D NULL;=0A=
+	const struct pci_device_id *ent;=0A=
+=0A=
+	for_each_pci_dev(pdev) {=0A=
+		if (devfn !=3D -1) {=0A=
+			if ((pdev->bus->number =3D=3D vsmp_bus) &&=0A=
+			    (devfn =3D=3D pdev->devfn)) {=0A=
+				found =3D 1;=0A=
+				break;=0A=
+			}=0A=
+		} else {=0A=
+			ent =3D pci_match_id(pci_tbl, pdev);=0A=
+			if (ent) {=0A=
+				found =3D 1;=0A=
+				vsmp_bus =3D pdev->bus->number;=0A=
+				vsmp_dev =3D PCI_SLOT(pdev->devfn);=0A=
+				vsmp_func =3D PCI_FUNC(pdev->devfn);=0A=
+				break;=0A=
+			}=0A=
+		}=0A=
+	}=0A=
+=0A=
+	for (i =3D 0; (i < ARRAY_SIZE(mapped_bars)) && found; i++) {=0A=
+		mapped_bars[i].start =3D pci_resource_start(pdev, i);=0A=
+		mapped_bars[i].len =3D pci_resource_len(pdev, i);=0A=
+	}=0A=
+	vsmp_dev_obj =3D pdev;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * open the cfg address space of the vSDP device=0A=
+ */=0A=
+static int open_cfg_addr(void)=0A=
+{=0A=
+	unsigned int devfn =3D (vsmp_bdf_static) ? PCI_DEVFN(vsmp_dev, vsmp_func)=
=0A=
+						: -1;=0A=
+=0A=
+	scan_pci_devs_list_for_vsmp(devfn);=0A=
+	if (!mapped_bars[0].start)=0A=
+		query_pci_bus_for_vsmp_directly(0, devfn);=0A=
+=0A=
+	if (!mapped_bars[0].len) {=0A=
+		printk(KERN_INFO "vSMP pci controller not found, exiting.\n");=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	printk(KERN_INFO "mapping bar 0: [0x%llx,0x%llx]\n",=0A=
+	       mapped_bars[0].start, mapped_bars[0].start + mapped_bars[0].len);=
=0A=
+	cfg_addr =3D ioremap(mapped_bars[0].start, mapped_bars[0].len);=0A=
+=0A=
+	if (!cfg_addr) {=0A=
+		printk(KERN_ERR=0A=
+		       "failed to map vSMP pci controller at %x:%x.%x, exiting.\n",=0A=
+		       vsmp_bus, vsmp_dev, vsmp_func);=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* exported functions */=0A=
+=0A=
+/**=0A=
+ * read a value from a specfic register in the vSMP's device config space=
=0A=
+ */=0A=
+unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_type =
type)=0A=
+{=0A=
+	unsigned long ret_val;=0A=
+=0A=
+	switch (type) {=0A=
+	case VSMP_CTL_REG_SIZE_8BIT:=0A=
+		ret_val =3D readb(cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_16BIT:=0A=
+		ret_val =3D readw(cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_32BIT:=0A=
+		ret_val =3D readl(cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_64BIT:=0A=
+		ret_val =3D readq(cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	default:=0A=
+		printk(KERN_ERR "unsupported reg size type %d.\n", type);=0A=
+		ret_val =3D (unsigned long)(-1);=0A=
+	}=0A=
+=0A=
+	dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%lx from reg 0x%x of %d bits\n",=
=0A=
+		__func__, ret_val, reg, (type + 1) * 8);=0A=
+	return ret_val;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);=0A=
+=0A=
+/**=0A=
+ * write a value to a specfic register in the vSMP's device config space=
=0A=
+ */=0A=
+void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,=0A=
+			   enum reg_size_type type)=0A=
+{=0A=
+	switch (type) {=0A=
+	case VSMP_CTL_REG_SIZE_8BIT:=0A=
+		writeb((unsigned char)value, cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_16BIT:=0A=
+		writew((unsigned short)value, cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_32BIT:=0A=
+		writel((unsigned int)value, cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_64BIT:=0A=
+		writeq(value, cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	default:=0A=
+		printk(KERN_ERR "unsupported reg size type %d.\n", type);=0A=
+	}=0A=
+=0A=
+	dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%x to reg 0x%x of %u bits\n",=0A=
+		__func__, reg, reg, (type + 1) * 8);=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);=0A=
+=0A=
+/**=0A=
+ * reag a buffer from a specific offset in a specific bar, maxed to a pred=
efined len size-wise from the vSMP device=0A=
+ */=0A=
+unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int offset=
,=0A=
+				     char *out, unsigned int len,=0A=
+				     bool halt_on_null)=0A=
+{=0A=
+	unsigned char __iomem *buff;=0A=
+=0A=
+	BUG_ON(!mapped_bars[bar].start);=0A=
+	BUG_ON(ARRAY_SIZE(mapped_bars) <=3D bar);=0A=
+	BUG_ON((offset + len) > mapped_bars[bar].len);=0A=
+=0A=
+	buff =3D ioremap(mapped_bars[bar].start + offset, len);=0A=
+	if (!buff)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	if (halt_on_null) {=0A=
+		int i;=0A=
+		unsigned char c;=0A=
+=0A=
+		for (i =3D 0; i < len; i++) {=0A=
+			c =3D ioread8(&buff[i]);=0A=
+			if (!c)=0A=
+				break;=0A=
+			out[i] =3D c;=0A=
+		}=0A=
+	} else=0A=
+		memcpy_fromio(out, buff, len);=0A=
+=0A=
+	iounmap(buff);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_read_buff_from_bar);=0A=
+=0A=
+/**=0A=
+ * register the vSMP sysfs object for user space interaction=0A=
+ */=0A=
+int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr)=0A=
+{=0A=
+	int error =3D -1;=0A=
+=0A=
+	if (vsmp_sysfs_kobj && bin_attr) {=0A=
+		if ((error =3D sysfs_create_bin_file(vsmp_sysfs_kobj, bin_attr)))=0A=
+			printk(KERN_CRIT "%s returned error %d\n", __func__,=0A=
+			       error);=0A=
+	}=0A=
+=0A=
+	return error;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_register_sysfs_group);=0A=
+=0A=
+/**=0A=
+ * deergister the vSMP sysfs object for user space interaction=0A=
+ */=0A=
+void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr)=0A=
+{=0A=
+	if (vsmp_sysfs_kobj && bin_attr)=0A=
+		sysfs_remove_bin_file(vsmp_sysfs_kobj, bin_attr);=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_deregister_sysfs_group);=0A=
+=0A=
+/**=0A=
+ * generic function to read from the bar=0A=
+ */=0A=
+ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigned r=
eg,=0A=
+			       char *buf, loff_t off, size_t count)=0A=
+{=0A=
+	ssize_t ret_val =3D 0;=0A=
+=0A=
+	if (op->buff_offset >=3D op->hwi_block_size) {	// preform H/W op=0A=
+		vsmp_reset_op(op);=0A=
+=0A=
+		if ((ret_val =3D vsmp_read_buff_from_bar(bar, reg, op->buff,=0A=
+						       op->hwi_block_size, false))) {=0A=
+			printk(KERN_ERR "%s operation failed\n",=0A=
+			       (op->action =3D=3D FW_READ) ? "read" : "write");=0A=
+		}=0A=
+		op->buff_offset =3D 0;=0A=
+	}=0A=
+=0A=
+	if (!ret_val) {=0A=
+		ret_val =3D memory_read_from_buffer(buf, count, &op->buff_offset,=0A=
+						  op->buff, op->hwi_block_size);=0A=
+	}=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_generic_buff_read);=0A=
+=0A=
+void vsmp_reset_op(struct fw_ops *op)=0A=
+{=0A=
+	memset(op->buff, 0, op->hwi_block_size);=0A=
+	op->buff_offset =3D op->hwi_block_size;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_reset_op);=0A=
+=0A=
+int vsmp_init_op(struct fw_ops *op, ssize_t max_size,=0A=
+		  enum vsmp_fw_action action)=0A=
+{=0A=
+	op->hwi_block_size =3D max_size;=0A=
+	op->action =3D action;=0A=
+	op->buff_offset =3D op->hwi_block_size;=0A=
+=0A=
+	if (!(op->buff =3D kzalloc(op->hwi_block_size, GFP_KERNEL)))=0A=
+		return -ENOMEM;=0A=
+=0A=
+	vsmp_reset_op(op);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_init_op);=0A=
+=0A=
+void vsmp_release_op(struct fw_ops *op)=0A=
+{=0A=
+	BUG_ON(!op->buff);=0A=
+	kfree(op->buff);=0A=
+	memset(op, 0, sizeof(*op));=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_release_op);=0A=
+=0A=
+bool vsmp_op_buffer_depleted(struct fw_ops *op)=0A=
+{=0A=
+	return op->buff_offset >=3D op->hwi_block_size;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_op_buffer_depleted);=0A=
+=0A=
+/* module functions */=0A=
+=0A=
+/**=0A=
+ * init the module=0A=
+ */=0A=
+static int __init vsmp_api_init(void)=0A=
+{=0A=
+	int ret_val;=0A=
+=0A=
+	parse_vsmp_ctrl_pci_addr();=0A=
+=0A=
+	if (!(ret_val =3D open_cfg_addr())) {=0A=
+		printk(KERN_INFO "%s [%02x:%02x.%x] up and running\n",=0A=
+		       DRIVER_DESC, vsmp_bus, vsmp_dev, vsmp_func);=0A=
+=0A=
+		if (!(vsmp_sysfs_kobj =3D kobject_create_and_add("vsmp",=0A=
+								hypervisor_kobj))) {=0A=
+			printk(KERN_ERR=0A=
+			       "failed to create sysfs entry for vSMP pci controller at %x:%x.%=
x, exiting.\n",=0A=
+			       vsmp_bus, vsmp_dev, vsmp_func);=0A=
+			ret_val =3D -1;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * cleanup after the module upon exit=0A=
+ */=0A=
+static void __exit vsmp_api_exit(void)=0A=
+{=0A=
+	if (cfg_addr)=0A=
+		iounmap(cfg_addr);=0A=
+=0A=
+	if (vsmp_sysfs_kobj)=0A=
+		kobject_put(vsmp_sysfs_kobj);=0A=
+}=0A=
+=0A=
+module_init(vsmp_api_init);=0A=
+module_exit(vsmp_api_exit);=0A=
diff --git a/drivers/staging/vsmp/api.h b/drivers/staging/vsmp/api.h=0A=
new file mode 100644=0A=
index 000000000000..88d81b80bd81=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/api.h=0A=
@@ -0,0 +1,61 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP api header=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#ifndef VSMP_API_H=0A=
+#define VSMP_API_H=0A=
+=0A=
+#include <linux/sysfs.h>=0A=
+=0A=
+enum reg_size_type {=0A=
+	VSMP_CTL_REG_SIZE_8BIT =3D 0,=0A=
+	VSMP_CTL_REG_SIZE_16BIT,=0A=
+	VSMP_CTL_REG_SIZE_32BIT,=0A=
+	VSMP_CTL_REG_SIZE_64BIT=0A=
+};=0A=
+=0A=
+enum vsmp_fw_action {=0A=
+	FW_READ =3D 0,=0A=
+	FW_WRITE =3D 1=0A=
+};=0A=
+=0A=
+struct fw_ops {=0A=
+	enum vsmp_fw_action action;=0A=
+	ssize_t hwi_block_size;=0A=
+	unsigned char *buff;=0A=
+	loff_t buff_offset;=0A=
+	bool in_progress;=0A=
+};=0A=
+=0A=
+#define FILE_PREM (S_IRUSR | S_IRGRP | S_IROTH)=0A=
+=0A=
+#define VSMP_ATTR_RO(_name) static struct kobj_attribute _name##_attr =3D =
__ATTR_RO(_name)=0A=
+#define vsmp_read_reg8_from_cfg(_reg_) ((unsigned char) vsmp_read_reg_from=
_cfg((_reg_), VSMP_CTL_REG_SIZE_8BIT))=0A=
+#define vsmp_read_reg16_from_cfg(_reg_) ((unsigned short) vsmp_read_reg_fr=
om_cfg((_reg_), VSMP_CTL_REG_SIZE_16BIT))=0A=
+#define vsmp_read_reg32_from_cfg(_reg_) ((unsigned int) vsmp_read_reg_from=
_cfg((_reg_), VSMP_CTL_REG_SIZE_32BIT))=0A=
+#define vsmp_read_reg64_from_cfg(_reg_) ((unsigned long) vsmp_read_reg_fro=
m_cfg((_reg_), VSMP_CTL_REG_SIZE_64BIT))=0A=
+#define vsmp_write_reg8_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_)=
,(_val_), VSMP_CTL_REG_SIZE_8BIT)=0A=
+#define vsmp_write_reg16_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_=
), (_val_), VSMP_CTL_REG_SIZE_16BIT)=0A=
+#define vsmp_write_reg32_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_=
), (_val_), VSMP_CTL_REG_SIZE_32BIT)=0A=
+#define vsmp_write_reg64_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_=
), (_val_), VSMP_CTL_REG_SIZE_64BIT)=0A=
+=0A=
+unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_type =
type);=0A=
+void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,=0A=
+			   enum reg_size_type type);=0A=
+unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int offset=
,=0A=
+				     char *out, unsigned int len,=0A=
+				     bool halt_on_null);=0A=
+int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr);=0A=
+void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr);=0A=
+=0A=
+ssize_t vsmp_generic_buff_read(struct fw_ops *op, unsigned bar, unsigned r=
eg,=0A=
+			       char *buf, loff_t off, size_t count);=0A=
+void vsmp_reset_op(struct fw_ops *op);=0A=
+int vsmp_init_op(struct fw_ops *op, ssize_t max_size,=0A=
+		 enum vsmp_fw_action action);=0A=
+void vsmp_release_op(struct fw_ops *op);=0A=
+bool vsmp_op_buffer_depleted(struct fw_ops *op);=0A=
+=0A=
+#endif // VSMP_API_H=0A=
diff --git a/drivers/staging/vsmp/common/Kconfig b/drivers/staging/vsmp/com=
mon/Kconfig=0A=
new file mode 100644=0A=
index 000000000000..fe0cfeaca1bb=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/common/Kconfig=0A=
@@ -0,0 +1,11 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+config VSMP_COMMON=0A=
+	tristate "vSMP Guest driver common Support"=0A=
+	depends on VSMP=0A=
+	help=0A=
+	  select this feature in order to be able to retrive generic data from th=
e vSMP=0A=
+	  VM.=0A=
+	  currently old version is supported.=0A=
+	  the data can be found under /sys/hypervisor/vsmp=0A=
+=0A=
+	  If unsure, say N.=0A=
diff --git a/drivers/staging/vsmp/common/Makefile b/drivers/staging/vsmp/co=
mmon/Makefile=0A=
new file mode 100644=0A=
index 000000000000..e6f6aa1d73df=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/common/Makefile=0A=
@@ -0,0 +1,7 @@=0A=
+# SPDX-License-Identifier: GPL-2.0=0A=
+#=0A=
+# Makefile for vSMP Guest common feature.=0A=
+#=0A=
+=0A=
+obj-$(CONFIG_VSMP_COMMON)	+=3D common_info.o =0A=
+common_info-y		+=3D common.o version.o=0A=
diff --git a/drivers/staging/vsmp/common/common.c b/drivers/staging/vsmp/co=
mmon/common.c=0A=
new file mode 100644=0A=
index 000000000000..31e6551f2b7f=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/common/common.c=0A=
@@ -0,0 +1,64 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP common=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#include <linux/init.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/pci_regs.h>=0A=
+#include <linux/pci.h>=0A=
+#include <linux/kobject.h>=0A=
+#include <linux/kernel.h>=0A=
+=0A=
+#include <asm/io.h>=0A=
+=0A=
+#include "../api.h"=0A=
+#include "common.h"=0A=
+=0A=
+#define DRIVER_LICENSE "GPL"=0A=
+#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
+#define DRIVER_DESC "vSMP common info driver"=0A=
+#define DRIVER_VERSION "0.1"=0A=
+=0A=
+/* modules info */=0A=
+MODULE_LICENSE(DRIVER_LICENSE);=0A=
+MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
+MODULE_DESCRIPTION(DRIVER_DESC);=0A=
+MODULE_VERSION(DRIVER_VERSION);=0A=
+=0A=
+static struct sysfs_entry_cbs cbs_arr[] =3D {=0A=
+	create_entry(version),=0A=
+};=0A=
+=0A=
+/* module functions */=0A=
+=0A=
+/**=0A=
+ * init the common module=0A=
+ */=0A=
+static int __init vsmp_common_info_init(void)=0A=
+{=0A=
+	int ret_val =3D 0, i;=0A=
+=0A=
+	for (i =3D 0; (i < ARRAY_SIZE(cbs_arr) && !ret_val); i++) {=0A=
+		if ((ret_val =3D cbs_arr[i].reg_cb()))=0A=
+			printk(KERN_ERR "failed to init sysfs (%d), exiting.\n",=0A=
+			       ret_val);=0A=
+	}=0A=
+=0A=
+	return -1 * ret_val;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * cleanup after the module=0A=
+ */=0A=
+static void __exit vsmp_common_info_exit(void)=0A=
+{=0A=
+	int i;=0A=
+=0A=
+	for (i =3D 0; i < ARRAY_SIZE(cbs_arr); i++)=0A=
+		cbs_arr[i].dereg_cb();=0A=
+}=0A=
+=0A=
+module_init(vsmp_common_info_init);=0A=
+module_exit(vsmp_common_info_exit);=0A=
diff --git a/drivers/staging/vsmp/common/common.h b/drivers/staging/vsmp/co=
mmon/common.h=0A=
new file mode 100644=0A=
index 000000000000..08a096628c95=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/common/common.h=0A=
@@ -0,0 +1,27 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP common header=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#ifndef VSM_COMMON_H=0A=
+#define VSM_COMMON_H=0A=
+=0A=
+#define create_entry(_label_) \=0A=
+	{ \=0A=
+		.reg_cb =3D sysfs_register_ ## _label_ ## _cb, \=0A=
+		.dereg_cb =3D sysfs_deregister_ ## _label_ ## _cb, \=0A=
+	}=0A=
+=0A=
+typedef int (*sysfs_register_cb)(void);=0A=
+typedef void (*sysfs_deregister_cb)(void);=0A=
+=0A=
+struct sysfs_entry_cbs {=0A=
+	sysfs_register_cb reg_cb;=0A=
+	sysfs_deregister_cb dereg_cb;=0A=
+};=0A=
+=0A=
+int sysfs_register_version_cb(void);=0A=
+void sysfs_deregister_version_cb(void);=0A=
+=0A=
+#endif // !VSM_COMMON_H=0A=
diff --git a/drivers/staging/vsmp/common/version.c b/drivers/staging/vsmp/c=
ommon/version.c=0A=
new file mode 100644=0A=
index 000000000000..35b5a7785e9a=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/common/version.c=0A=
@@ -0,0 +1,85 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP version=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#include <linux/slab.h>=0A=
+#include <linux/kobject.h>=0A=
+=0A=
+#include "../api.h"=0A=
+#include "../registers.h"=0A=
+=0A=
+#define VERSION_MAX_LEN (1 << 19)=0A=
+=0A=
+static struct fw_ops op;=0A=
+=0A=
+static ssize_t version_read(struct file *filp, struct kobject *kobj,=0A=
+			    struct bin_attribute *bin_attr,=0A=
+			    char *buf, loff_t off, size_t count)=0A=
+{=0A=
+	ssize_t ret_val =3D vsmp_generic_buff_read(&op, 0,=0A=
+						 vsmp_read_reg32_from_cfg(VSMP_VERSION_REG),=0A=
+						 buf, off, count);=0A=
+=0A=
+	if ((ret_val !=3D -ENOMEM) && ((ret_val !=3D -EINVAL)))=0A=
+	    buf[ret_val++] =3D '\n';=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+=0A=
+struct bin_attribute version_raw_attr =3D __BIN_ATTR(version, FILE_PREM, v=
ersion_read, NULL, VERSION_MAX_LEN);=0A=
+=0A=
+/**=0A=
+ * retrive str in order to determine the proper length.=0A=
+ * this is the best way to maintain backwards compatibility with all=0A=
+ * vSMP versions.=0A=
+ */=0A=
+static int get_version_len(void)=0A=
+{=0A=
+	unsigned reg;=0A=
+	char *version_str =3D kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_NOWARN)=
;=0A=
+=0A=
+	if (!version_str)=0A=
+		return -1;=0A=
+=0A=
+	reg =3D vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);=0A=
+	memset(version_str, 0, VERSION_MAX_LEN);=0A=
+=0A=
+	if (vsmp_read_buff_from_bar(0, reg, version_str, VERSION_MAX_LEN, true)) =
{=0A=
+		printk(KERN_ERR "failed to read buffer from bar\n");=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	version_raw_attr.size =3D strlen(version_str);=0A=
+	kfree(version_str);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * register the version sysfs entry=0A=
+ */=0A=
+int sysfs_register_version_cb(void)=0A=
+{=0A=
+	if (get_version_len()) {=0A=
+		printk(KERN_ERR "failed to init vSMP version module\n");=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	if (!vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {=0A=
+		printk(KERN_ERR "failed to init vSMP version op\n");=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	return vsmp_register_sysfs_group(&version_raw_attr);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * deregister the version sysfs entry=0A=
+ */=0A=
+void sysfs_deregister_version_cb(void)=0A=
+{=0A=
+	vsmp_deregister_sysfs_group(&version_raw_attr);=0A=
+	vsmp_release_op(&op);=0A=
+}=0A=
diff --git a/drivers/staging/vsmp/logs/Kconfig b/drivers/staging/vsmp/logs/=
Kconfig=0A=
new file mode 100644=0A=
index 000000000000..d41491472bab=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/logs/Kconfig=0A=
@@ -0,0 +1,10 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+config VSMP_LOGS=0A=
+	tristate "vSMP Guest driver logs Support"=0A=
+	depends on VSMP=0A=
+	help=0A=
+	  select this feature in order to be able to retrive logs from the vSMP=
=0A=
+	  VM.=0A=
+	  the data can be found under /sys/hypervisor/logs=0A=
+=0A=
+	  If unsure, say N.=0A=
diff --git a/drivers/staging/vsmp/logs/Makefile b/drivers/staging/vsmp/logs=
/Makefile=0A=
new file mode 100644=0A=
index 000000000000..edc679803fe6=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/logs/Makefile=0A=
@@ -0,0 +1,7 @@=0A=
+# SPDX-License-Identifier: GPL-2.0=0A=
+#=0A=
+# Makefile for vSMP Guest common feature.=0A=
+#=0A=
+=0A=
+obj-$(CONFIG_VSMP_LOGS)	+=3D logs.o =0A=
+logs-y		+=3D active_logs.o=0A=
diff --git a/drivers/staging/vsmp/logs/active_logs.c b/drivers/staging/vsmp=
/logs/active_logs.c=0A=
new file mode 100644=0A=
index 000000000000..91492c72cc6f=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/logs/active_logs.c=0A=
@@ -0,0 +1,112 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP logs=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#include <linux/init.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/pci_regs.h>=0A=
+#include <linux/pci.h>=0A=
+#include <linux/kobject.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/mutex.h>=0A=
+=0A=
+#include <asm/io.h>=0A=
+=0A=
+#include "../api.h"=0A=
+#include "../registers.h"=0A=
+=0A=
+#define DRIVER_LICENSE "GPL"=0A=
+#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
+#define DRIVER_DESC "vSMP logs driver"=0A=
+#define DRIVER_VERSION "0.1"=0A=
+=0A=
+#define LOGS_MASK (1 << 0)=0A=
+=0A=
+/* modules info */=0A=
+MODULE_LICENSE(DRIVER_LICENSE);=0A=
+MODULE_AUTHOR(DRIVER_AUTHOR);=0A=
+MODULE_DESCRIPTION(DRIVER_DESC);=0A=
+MODULE_VERSION(DRIVER_VERSION);=0A=
+=0A=
+static struct fw_ops op;=0A=
+static unsigned log_start;=0A=
+DEFINE_MUTEX(log_mutex);=0A=
+=0A=
+/* module functions */=0A=
+static ssize_t log_read(struct file *filp, struct kobject *kobj,=0A=
+			struct bin_attribute *bin_attr,=0A=
+			char *buf, loff_t off, size_t count)=0A=
+{=0A=
+	ssize_t ret_val =3D 0;=0A=
+=0A=
+	if (!op.in_progress) {=0A=
+		if ((ret_val =3D mutex_lock_interruptible(&log_mutex))) {=0A=
+			printk(KERN_ERR=0A=
+			       "error in atemmpt to lock mutex (%lx)\n",=0A=
+			       ret_val);=0A=
+			return ret_val;=0A=
+		}=0A=
+=0A=
+		vsmp_write_reg16_to_cfg(VSMP_LOGS_CTRL_REG,=0A=
+					vsmp_read_reg16_from_cfg=0A=
+					(VSMP_LOGS_CTRL_REG) | LOGS_MASK);=0A=
+		op.in_progress =3D true;=0A=
+		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG, 0);=0A=
+	}=0A=
+=0A=
+	if (vsmp_op_buffer_depleted(&op)) {=0A=
+		if (!(vsmp_read_reg16_from_cfg(VSMP_LOGS_CTRL_REG) & LOGS_MASK)) {=0A=
+			vsmp_reset_op(&op);=0A=
+			op.in_progress =3D 0;=0A=
+			mutex_unlock(&log_mutex);=0A=
+			return ret_val;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	ret_val =3D vsmp_generic_buff_read(&op, 1, log_start, buf, off, count);=
=0A=
+	if (!ret_val || (ret_val =3D=3D -ENOMEM) || (ret_val =3D=3D -EINVAL)) {=
=0A=
+		printk(KERN_ERR "error reading from buffer\n");=0A=
+		mutex_unlock(&log_mutex);=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	if (vsmp_op_buffer_depleted(&op)) {=0A=
+		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG,=0A=
+					~0LL & ~(1LL << 0));=0A=
+	}=0A=
+=0A=
+	return count;=0A=
+}=0A=
+=0A=
+static struct bin_attribute log_raw_attr =3D __BIN_ATTR(log, FILE_PREM, lo=
g_read, NULL, 0);=0A=
+=0A=
+/**=0A=
+ * init the log module=0A=
+ */=0A=
+static int __init vsmp_logs_init(void)=0A=
+{=0A=
+	if (!vsmp_init_op(&op, vsmp_read_reg32_from_cfg(VSMP_LOGS_LEN_REG),=0A=
+							 FW_READ)) {=0A=
+		printk(KERN_ERR "failed to init vSMP log op\n");=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	log_start =3D vsmp_read_reg32_from_cfg(VSMP_LOGS_START_REG);=0A=
+	mutex_init(&log_mutex);=0A=
+=0A=
+	return vsmp_register_sysfs_group(&log_raw_attr);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * cleanup after the module=0A=
+ */=0A=
+static void __exit vsmp_logs_exit(void)=0A=
+{=0A=
+	vsmp_deregister_sysfs_group(&log_raw_attr);=0A=
+	vsmp_release_op(&op);=0A=
+}=0A=
+=0A=
+module_init(vsmp_logs_init);=0A=
+module_exit(vsmp_logs_exit);=0A=
diff --git a/drivers/staging/vsmp/registers.h b/drivers/staging/vsmp/regist=
ers.h=0A=
new file mode 100644=0A=
index 000000000000..6cb75dfcccc6=0A=
--- /dev/null=0A=
+++ b/drivers/staging/vsmp/registers.h=0A=
@@ -0,0 +1,16 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP offsets=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#ifndef VSMP_REGSITERS_H=0A=
+#define VSMP_REGSITERS_H=0A=
+=0A=
+#define VSMP_LOGS_CTRL_REG 0x22=0A=
+#define VSMP_LOGS_START_REG 0x30=0A=
+#define VSMP_LOGS_LEN_REG 0x34=0A=
+#define VSMP_LOGS_STATUS_REG 0x38=0A=
+#define VSMP_VERSION_REG 0x0c=0A=
+=0A=
+#endif // VSMP_REGSITERS_H=0A=
-- =0A=
2.25.1=0A=
=0A=
