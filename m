Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE77C
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 11:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY7zfd12n8KiME5ikVelNTCZYWEP550vk6gNNUXZjePDMRvG044JWnckIAd3tIvp4YC1lxk3fp8A2+GTYAi9eeB3fn7d+rZsYJ7qN7dmVfJ6I+ichB+6EA/5xxHduFJdZVTq6OLst5osEj5LouFcidqSCBJMfZv6bt+hq5guzgAIaokpuwq40JlscTL71ohz+XA+AHgCDrTFCxtvMQBozxF5gneZIrPw5kEPfuZrrQ52s8m0UGkm/rTjyMi1boprdP88xJz9GkWEh5lKD+zYuj+ZJORTq9LYOh9xuDXQDDCOCaYWmdQXeeOeH+x5PRLXOttiXcEa/AXaIWq7V50qgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxcAw16w8qa4YER8wizYqGMo4Z1VusCf7kXJH159FrY=;
 b=L+U6pWp6Kdd4UE0GsT/J3PKdtPgJNx7AxDn7E54yAJR9g0C0P+alhc9/7fj6S64LxybEUuMgXV5tkWRNWhWtEM14ixCIqGVWvm5NbZ9VyVfuUXHqjDSz2HvX+U+YYlT9nu2f3UBn0Wui9HqPBQEnT7V/YYcczzNh+7YHsCJA1HLImZolFYpwxfZy7wLMUx12is8k59zS0q7fR6aPk+csLNOXK85EphtGibdkvb3C0T8DFMOVG7xUya+TvJp2P0fJ7uOr0Vl/jBPt2NCbDfc6Tj6qroz0xwuZNP4bIpyNYdya30UYin8yOgCplhMhHHZn8PIn+evpyAjJMr4iniJ5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sap.com; dmarc=pass action=none header.from=sap.com; dkim=pass
 header.d=sap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxcAw16w8qa4YER8wizYqGMo4Z1VusCf7kXJH159FrY=;
 b=A7EvMTIghocS6ZJWbXqQQdBMAO1feKeAX0T6PBClK4mRgwJFyDDtcKAb2S4jhfWtacCHcplcgFSd3mbBaA2PpZPZ2CFN/rcDeQi+aboxMr7DfKEElMK6qiugzlH6f5OXjITgBvF8OwV/R9Pxyp2tdxLJqvnb6mhKdRteNJ6RQH1x6vG/yOMdBc7BL043S3Tjs/dnFbPBZhVYUIY4YTsOZ1PQmEEPW9jCnb95o3nVu25YEpcTHFk2gtcd5Bz4hQWItkZ/6W4hNj80ZAgFqbYFplI8RGDpHsKeqjEgu/ThQb95wUm9k9Oj8Fm3Y75Qzkox7M7koDEttFP6thHvLTv9TQ==
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com (2603:10a6:102:1c5::10)
 by DB6PR0201MB2454.eurprd02.prod.outlook.com (2603:10a6:4:34::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Sun, 24 Apr
 2022 11:44:33 +0000
Received: from PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6]) by PAXPR02MB7310.eurprd02.prod.outlook.com
 ([fe80::e53e:603a:5c35:72b6%3]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 11:44:33 +0000
From: "Czerwacki, Eial" <eial.czerwacki@sap.com>
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
CC: SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: [RFC V2] drivers/virt/vSMP: new driver
Thread-Topic: [RFC V2] drivers/virt/vSMP: new driver
Thread-Index: AQHYV8TvbsysO1IV902JKnQurGWPjA==
Date: Sun, 24 Apr 2022 11:44:33 +0000
Message-ID:
 <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 4ccb58c6-3251-7fc3-6664-ce88905f21a5
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sap.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d45ec83-17a2-49bc-40f5-08da25e7cd2b
x-ms-traffictypediagnostic: DB6PR0201MB2454:EE_
x-microsoft-antispam-prvs:
 <DB6PR0201MB24542148E9DE4E6E943F530F81F99@DB6PR0201MB2454.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 a8AhL6OAxhqc5VS4OE68NVBUywWG2ip+E71gF/tft4ClVj8Fx0Ix0mCdkFEAFrcmylL1suJSQJZ2Dcykldc5psaKeuHgegdpFa+2+FWwl3qrTmCFhVOtbpQaq9rG/tAGHxNHxSwNZH4FE5IdGPMhHs5Ev6SPuLerbIaSOVlD3bQhbX0K3ZJaE/kEXkGBtnvzYA5aNoRH/+HN+4hpwrHv8ldTYxBRubky05nkarNQBuxgsqxW1GnwCWcYYDQpoA+54QfKw43KN+wM1Kaov/gonwUROFdwAfXKYbrgFg5Ha+UdGMn/wGbvcVZb2FBVrCGNQwNcfPWXs5TbqCWlC1HXA1EowNW65sARRO8LoNYJJPsAkUEZzXExsNSu2XpNRU9nEpULr1r0SIup7lFFfGMvREAkdCobKxWoPPfuAr1fvWXx7acXf1UGD7Cbbo732bv+TCrsbLad0y1C+K9Yq7huVlJY6+AuxNqWda8ZAXjsFdJ/b7DXga01rGhwMdGtEl/tzIDHzTf/ujOeUaOTtEDz0sQSilxbyjbfGW3rZzOEmOy5oZL+5+LzBWGC/iEnWBZjYA3YEaUT6Yx6HpX8IEo3yLZmX7bc0lEoYesHHAwIb7a766hJ5gWJD+udIMZ7PnPJFnf3vtCj5qGFXJRi2i/igf+cKYT/bqvLUEQnldkpnZ0Ch5NpOjuvXdN9RnqhZpQOQWFtEVUJ3pycfuFTZl107w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7310.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(186003)(122000001)(2906002)(33656002)(83380400001)(30864003)(8936002)(66476007)(52536014)(508600001)(66946007)(66556008)(38070700005)(5660300002)(38100700002)(71200400001)(66446008)(6916009)(76116006)(7696005)(316002)(4326008)(9686003)(86362001)(91956017)(8676002)(82960400001)(26005)(64756008)(6506007)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nzeuRHZ7GL/bPusmDIjMe2gysU25UY4gk0zcH+tgxLMbfvUs0QxR8iTZOR?=
 =?iso-8859-1?Q?Uu7yjLBeUbSc8MDWfjyjiyM+wUzlyM/L7rh6eboMnyGFePiP8c6Jku9oHt?=
 =?iso-8859-1?Q?pHZ1hVW1mQzTVtuY8NNGuRzS3WKDEH4vi40Jz3TV8Xcq9DIvLZhFWirW9h?=
 =?iso-8859-1?Q?wa8noomm5Yklk4ehG0E8jp4LsLtKPavDPI+QMdzmQZndWBeJBCm8Gklo6V?=
 =?iso-8859-1?Q?/ejVYeGqj4fl8fqUy1jFgbcyH4fhk4xL26TCC9Iv6kO7ZgjvPwM4EbUVlY?=
 =?iso-8859-1?Q?cOvAiqZPxrVnqctJq5ZfiF6nXrYVrote5OtTK1i5t+ta1Lq6zyuGfl2v7r?=
 =?iso-8859-1?Q?r6I2Yup+fWY7hfRxoFofWHhUmORYiXMCmJkWmIBmmOhT3S/gl5Mqt8XKSZ?=
 =?iso-8859-1?Q?BWbYc2qMBDH6ZmPcVppin6UhiyPWa4Ewbu//vOdEwTpFpF7DQs+24R7cWO?=
 =?iso-8859-1?Q?5dEdZwZnvOW+o2mrFt72XrvIqOlzzm0Q+IWy8/4KO6lWJ0O3SJY7QsGUXU?=
 =?iso-8859-1?Q?7ghh9RZJnJVXPTuMH1sx0a+2Ih8bdQLtJXAY+pZUCbJtPR5ByyP9NUub5y?=
 =?iso-8859-1?Q?UvPOAT4PWo5JczKXs/U/4oVH3uXZDEV2sS6dUGo+Ubk9fjPVB88cN/tGfG?=
 =?iso-8859-1?Q?a+w+EMMQ4/XtDBhlX1b/c55wknSX1V93IoXpGy5UNCz0LCV/7yDv8SM9gl?=
 =?iso-8859-1?Q?wPXMO2Z4579tpWZyyGj1KWzxN+U8jlSrIo0/11vX30oQz4pD0INCFBJ7tU?=
 =?iso-8859-1?Q?HOLzx733fpunFE/1TvTnMjmRuWA+RwcWPkJRBBpkcZQbDt92hudpkXv0y0?=
 =?iso-8859-1?Q?HGKbN0w8YH1UmpH9rYiK0O+7yJKTKUMTCfgICQNGMS4uYQ0FLkA15nmJwF?=
 =?iso-8859-1?Q?RqIHhUDk25/yWNy49MoeqFaW9rn2aepjPKZRrvDOlR5HSQZJLmHHyjy+ol?=
 =?iso-8859-1?Q?JwzN3cqXpQLIM81pIdBtKsVWR8F/cEgw/vV67UOWRX+ffAnZOc8tX94A5N?=
 =?iso-8859-1?Q?CShrMvgUQG9D177anQbpuC183SRk5bSJ76cUJ+gYGNKJPm3AAqIPaoNOjg?=
 =?iso-8859-1?Q?W/+lnDPryql1FsxrLS6Qxx4YwldCVP1+haYziWiDn8cK1LOEbJfPf9JLZ+?=
 =?iso-8859-1?Q?cTKtQTNJW/YN6yI5AMC54odPsMSaf2rKyHuMXtVVoaM1OSHhlUNXk7TNsP?=
 =?iso-8859-1?Q?PdjhrY+IR2pHcTm/XG9qjjTV5sjH8nSCLXgkhmQiMWwItEmdYa5mZrQua5?=
 =?iso-8859-1?Q?J9NHdMfCT0et04SvSxIWf+cDsEiOO5YyNlgUrc6DTIIQH4uolECp3NHVy1?=
 =?iso-8859-1?Q?Qe45MAPrWurrxYgn/mRkzioEcNIIvlMK2kExCFMz8ZBnd9Cn3anOJzCvhZ?=
 =?iso-8859-1?Q?TFDpXLTt+aWe02K7EGXukUi/R1uapVRtHb//AqNQ34SiU0tGuovsTTsZt0?=
 =?iso-8859-1?Q?TVQUCZ0h5aXKGaixg0j+ADztkHCmHGs3UyuSsbpjmIxSVTbSZ+7Lo7AHxq?=
 =?iso-8859-1?Q?ouXAL4oEcDEIGEjaHV9T1nhv9GE7fEhZcInT41wq0ckh9FWfn9Hn5Uszwi?=
 =?iso-8859-1?Q?LEnqsMUTdcyapj8qCMGJGt5brcPz0uclk1rK1dMv6grC8pcMFlq6YIuEsD?=
 =?iso-8859-1?Q?3AS6PGDdAyYu9aeEjR3LFASyoN/u+NzjQgP11690hWI5mSr/Km2k80EG70?=
 =?iso-8859-1?Q?52H71MLY2szvVNGiHzyOc1JD4xpyjr66Y1VOmy7Nv8HHpI/0ijhxNfyxNQ?=
 =?iso-8859-1?Q?NTWhVTZ7nNMsdOVo+fiEompbihA1TaiHSGX+Zu0Dr08cDYhUfSnBcc67b2?=
 =?iso-8859-1?Q?51dHHzkQIQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d45ec83-17a2-49bc-40f5-08da25e7cd2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 11:44:33.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 42f7676c-f455-423c-82f6-dc2d99791af7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BAp30MRC5oEHQS4gROe6xxx4T220iizMOtRRg0nQuG0V3oHXLsxfoMpxd+5WGbKHjVf+qAKXX31dnm7q5mntkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2454

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
=0A=
v1 -> v2:=0A=
	- fix multiple rejects pointed out by Greg KH=0A=
	- fix multiple rejects pointed out by Dan Carpenter=0A=
	- fix multiple rejects pointed out by Randy Dunlap=0A=
---=0A=
 .../ABI/stable/sysfs-driver-vsmp_common_info  |   5 +=0A=
 .../ABI/stable/sysfs-driver-vsmp_logs         |   5 +=0A=
 drivers/virt/vsmp/Kconfig                     |  14 +=0A=
 drivers/virt/vsmp/Makefile                    |   7 +=0A=
 drivers/virt/vsmp/api.c                       | 416 ++++++++++++++++++=0A=
 drivers/virt/vsmp/api.h                       |  61 +++=0A=
 drivers/virt/vsmp/common/Kconfig              |  11 +=0A=
 drivers/virt/vsmp/common/Makefile             |   7 +=0A=
 drivers/virt/vsmp/common/common.c             |  66 +++=0A=
 drivers/virt/vsmp/common/common.h             |  27 ++=0A=
 drivers/virt/vsmp/common/version.c            | 117 +++++=0A=
 drivers/virt/vsmp/logs/Kconfig                |  10 +=0A=
 drivers/virt/vsmp/logs/Makefile               |   7 +=0A=
 drivers/virt/vsmp/logs/active_logs.c          | 121 +++++=0A=
 drivers/virt/vsmp/registers.h                 |  16 +=0A=
 15 files changed, 890 insertions(+)=0A=
 create mode 100644 Documentation/ABI/stable/sysfs-driver-vsmp_common_info=
=0A=
 create mode 100644 Documentation/ABI/stable/sysfs-driver-vsmp_logs=0A=
 create mode 100644 drivers/virt/vsmp/Kconfig=0A=
 create mode 100644 drivers/virt/vsmp/Makefile=0A=
 create mode 100644 drivers/virt/vsmp/api.c=0A=
 create mode 100644 drivers/virt/vsmp/api.h=0A=
 create mode 100644 drivers/virt/vsmp/common/Kconfig=0A=
 create mode 100644 drivers/virt/vsmp/common/Makefile=0A=
 create mode 100644 drivers/virt/vsmp/common/common.c=0A=
 create mode 100644 drivers/virt/vsmp/common/common.h=0A=
 create mode 100644 drivers/virt/vsmp/common/version.c=0A=
 create mode 100644 drivers/virt/vsmp/logs/Kconfig=0A=
 create mode 100644 drivers/virt/vsmp/logs/Makefile=0A=
 create mode 100644 drivers/virt/vsmp/logs/active_logs.c=0A=
 create mode 100644 drivers/virt/vsmp/registers.h=0A=
=0A=
diff --git a/Documentation/ABI/stable/sysfs-driver-vsmp_common_info b/Docum=
entation/ABI/stable/sysfs-driver-vsmp_common_info=0A=
new file mode 100644=0A=
index 000000000000..a8a6afe417f3=0A=
--- /dev/null=0A=
+++ b/Documentation/ABI/stable/sysfs-driver-vsmp_common_info=0A=
@@ -0,0 +1,5 @@=0A=
+What:           /sys/hypervisor/vsmp/version=0A=
+Date:           Apr 2022=0A=
+Contact:        Eial Czerwacki <eial.czerwacki@sap.com>=0A=
+		linux-vsmp@sap.com=0A=
+Description:    Shows the full version of the vSMP hypervisor=0A=
diff --git a/Documentation/ABI/stable/sysfs-driver-vsmp_logs b/Documentatio=
n/ABI/stable/sysfs-driver-vsmp_logs=0A=
new file mode 100644=0A=
index 000000000000..a863898f5356=0A=
--- /dev/null=0A=
+++ b/Documentation/ABI/stable/sysfs-driver-vsmp_logs=0A=
@@ -0,0 +1,5 @@=0A=
+What:           /sys/hypervisor/vsmp/logs=0A=
+Date:           Apr 2022=0A=
+Contact:        Eial Czerwacki <eial.czerwacki@sap.com>=0A=
+		linux-vsmp@sap.com=0A=
+Description:    Dumps the logs of the current session from the vSMP hyperv=
isor=0A=
diff --git a/drivers/virt/vsmp/Kconfig b/drivers/virt/vsmp/Kconfig=0A=
new file mode 100644=0A=
index 000000000000..e75879435769=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/Kconfig=0A=
@@ -0,0 +1,14 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+menuconfig VSMP=0A=
+	tristate "vSMP Guest Support"=0A=
+	depends on SYS_HYPERVISOR && X86_64 && PCI=0A=
+	help=0A=
+	  Support for vSMP Guest Driver.=0A=
+=0A=
+	  This driver allows information gathering of data from the vSMP hypervis=
or when=0A=
+	  running on top of a vSMP-based hypervisor.=0A=
+=0A=
+	  If unsure, say no.=0A=
+=0A=
+source "drivers/virt/vsmp/common/Kconfig"=0A=
+source "drivers/virt/vsmp/logs/Kconfig"=0A=
diff --git a/drivers/virt/vsmp/Makefile b/drivers/virt/vsmp/Makefile=0A=
new file mode 100644=0A=
index 000000000000..88625cd3707d=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/Makefile=0A=
@@ -0,0 +1,7 @@=0A=
+# SPDX-License-Identifier: GPL-2.0=0A=
+#=0A=
+# Makefile for vSMP Guest drivers.=0A=
+#=0A=
+=0A=
+obj-$(CONFIG_VSMP)	+=3D vsmp.o common/ logs/=0A=
+vsmp-y			:=3D api.o=0A=
diff --git a/drivers/virt/vsmp/api.c b/drivers/virt/vsmp/api.c=0A=
new file mode 100644=0A=
index 000000000000..57c345eaaa0c=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/api.c=0A=
@@ -0,0 +1,416 @@=0A=
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
+#define DEVICE_NAME "vsmp"=0A=
+#define DRIVER_LICENSE "GPL v2"=0A=
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
+static unsigned int vsmp_bus;=0A=
+static unsigned short vsmp_dev =3D 0x1f;=0A=
+static unsigned char vsmp_func;=0A=
+static bool vsmp_bdf_static =3D false;=0A=
+static char *vsmp_ctrl_pci_addr =3D "";=0A=
+module_param(vsmp_ctrl_pci_addr, charp, 0660);=0A=
+=0A=
+/* defines */=0A=
+// copied from arch/x86/pci/direct.c=0A=
+#define PCI_CONF1_ADDRESS(bus, devfn, reg) (0x80000000 | ((reg & 0xF00) <<=
 16) | (bus << 16) \=0A=
+	   | (devfn << 8) | (reg & 0xFC))=0A=
+=0A=
+/* global vars */=0A=
+void __iomem *cfg_addr;=0A=
+static struct kobject *vsmp_sysfs_kobj;=0A=
+static struct pci_dev *vsmp_dev_obj;=0A=
+=0A=
+static const struct pci_device_id vsmp_pci_tbl[] =3D {=0A=
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
+/*=0A=
+ * parses the pci address of a given address where the vSMP=0A=
+ * pci device is found=0A=
+ */=0A=
+static void parse_vsmp_ctrl_pci_addr(void)=0A=
+{=0A=
+	unsigned int bus;=0A=
+	unsigned short dev;=0A=
+	unsigned char func;=0A=
+=0A=
+	if (!strlen(vsmp_ctrl_pci_addr))=0A=
+		return;=0A=
+=0A=
+	if (sscanf(vsmp_ctrl_pci_addr, "%04x:%02hx.%1hhx", &bus, &dev, &func) < 3=
)=0A=
+		return;=0A=
+=0A=
+	vsmp_bus =3D bus;=0A=
+	vsmp_dev =3D dev;=0A=
+	vsmp_func =3D func;=0A=
+	vsmp_bdf_static =3D true;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * queries as specific device in order to determine if it is a vSMP PCI de=
vice=0A=
+ */=0A=
+static void query_pci_bus_for_vsmp_directly(void)=0A=
+					    =0A=
+{=0A=
+	unsigned int devfn =3D PCI_DEVFN(vsmp_dev, vsmp_func);=0A=
+	printk(KERN_INFO=0A=
+	       "vSMP pci controller not found in devices tree, trying directly at=
 %x:%x.%x...\n",=0A=
+	       vsmp_bus, vsmp_dev, vsmp_func);=0A=
+=0A=
+	outl(PCI_CONF1_ADDRESS(vsmp_bus, devfn, PCI_BASE_ADDRESS_0), 0xcf8);=0A=
+	mapped_bars[0].start =3D inl(0xcfc);=0A=
+=0A=
+	// define a knwon value which might be enough and backwars compataible=0A=
+	mapped_bars[0].len =3D 0x100000;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * scan all the devices on the system in order to locate the=0A=
+ * vSMP PCI device for a given dev end func is provided=0A=
+ */=0A=
+static void scan_pci_devs_list_for_static_vsmp(unsigned int static_devfn)=
=0A=
+{=0A=
+	struct pci_dev *pdev =3D NULL;=0A=
+=0A=
+	for_each_pci_dev(pdev) {=0A=
+		if ((pdev->bus->number =3D=3D vsmp_bus) &&=0A=
+		    (pdev->devfn =3D=3D static_devfn)) {=0A=
+			vsmp_dev_obj =3D pdev;=0A=
+			break;=0A=
+		}=0A=
+	}=0A=
+}=0A=
+=0A=
+/*=0A=
+ * open the cfg address space of the vSDP device=0A=
+ */=0A=
+static int open_cfg_addr(struct pci_dev *pdev)=0A=
+{=0A=
+	unsigned int static_devfn =3D PCI_DEVFN(vsmp_dev, vsmp_func);=0A=
+	int i;=0A=
+=0A=
+	if (vsmp_bdf_static) {=0A=
+		scan_pci_devs_list_for_static_vsmp(static_devfn);=0A=
+		if (!vsmp_dev_obj) {=0A=
+			printk(KERN_INFO "vSMP pci controller not found, exiting.\n");=0A=
+			return -ENODEV;=0A=
+		}=0A=
+	} else=0A=
+		vsmp_dev_obj =3D pdev;=0A=
+=0A=
+	for (i =3D 0; i < ARRAY_SIZE(mapped_bars); i++) {=0A=
+		mapped_bars[i].start =3D pci_resource_start(vsmp_dev_obj, i);=0A=
+		mapped_bars[i].len =3D pci_resource_len(vsmp_dev_obj, i);=0A=
+	}=0A=
+=0A=
+	if (!mapped_bars[0].start)=0A=
+		query_pci_bus_for_vsmp_directly();=0A=
+=0A=
+	if (!mapped_bars[0].len) {=0A=
+		printk(KERN_INFO "vSMP pci controller not found, exiting.\n");=0A=
+		return -EINVAL;=0A=
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
+		return -ENODEV;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* exported functions */=0A=
+=0A=
+/*=0A=
+ * read a value from a specific register in the vSMP's device config space=
=0A=
+ */=0A=
+u64 vsmp_read_reg_from_cfg(u64 reg, enum reg_size_type type)=0A=
+{=0A=
+	u64 ret_val;=0A=
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
+		ret_val =3D (u64) -EINVAL;=0A=
+	}=0A=
+=0A=
+	dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%llx from reg 0x%llx of %d bits\n=
",=0A=
+		__func__, ret_val, reg, (type + 1) * 8);=0A=
+	return ret_val;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);=0A=
+=0A=
+/*=0A=
+ * write a value to a specific register in the vSMP's device config space=
=0A=
+ */=0A=
+void vsmp_write_reg_to_cfg(u64 reg, u64 value,=0A=
+			   enum reg_size_type type)=0A=
+{=0A=
+	switch (type) {=0A=
+	case VSMP_CTL_REG_SIZE_8BIT:=0A=
+		writeb((u8) value, cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_16BIT:=0A=
+		writew((u16) value, cfg_addr + reg);=0A=
+		break;=0A=
+=0A=
+	case VSMP_CTL_REG_SIZE_32BIT:=0A=
+		writel((u32) value, cfg_addr + reg);=0A=
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
+	dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%llx to reg 0x%llx of %u bits\n"=
,=0A=
+		__func__, value, reg, (type + 1) * 8);=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);=0A=
+=0A=
+static ssize_t read_buff_from_bar_in_bytes(char *out, u8 __iomem *buff, ss=
ize_t len)=0A=
+{=0A=
+	u32 i;=0A=
+=0A=
+	for (i =3D 0; i < len; i++) {=0A=
+		out[i] =3D ioread8(&buff[i]);=0A=
+		if (!out[i])=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	return i;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * read a buffer from a specific offset in a specific bar, maxed to a pred=
efined len size-wise from the vSMP device=0A=
+ */=0A=
+ssize_t vsmp_read_buff_from_bar(u8 bar, u32 offset,=0A=
+			        char *out, ssize_t len,=0A=
+			        bool halt_on_null)=0A=
+{=0A=
+	u8 __iomem *buff;=0A=
+=0A=
+	BUG_ON(!mapped_bars[bar].start);=0A=
+	BUG_ON(ARRAY_SIZE(mapped_bars) <=3D bar);=0A=
+	BUG_ON((offset + len) > mapped_bars[bar].len);=0A=
+=0A=
+	buff =3D ioremap(mapped_bars[bar].start + offset, len);=0A=
+	if (!buff)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	if (halt_on_null)=0A=
+		read_buff_from_bar_in_bytes(out, buff, len);=0A=
+	else=0A=
+		memcpy_fromio(out, buff, len);=0A=
+=0A=
+	iounmap(buff);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_read_buff_from_bar);=0A=
+=0A=
+/*=0A=
+ * register the vSMP sysfs object for user space interaction=0A=
+ */=0A=
+int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr)=0A=
+{=0A=
+	int error =3D -EINVAL;=0A=
+=0A=
+	if (vsmp_sysfs_kobj && bin_attr) {=0A=
+		error =3D sysfs_create_bin_file(vsmp_sysfs_kobj, bin_attr);=0A=
+		if (error)=0A=
+			printk(KERN_CRIT "%s returned error %d\n", __func__,=0A=
+			       error);=0A=
+	}=0A=
+=0A=
+	return error;=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_register_sysfs_group);=0A=
+=0A=
+/*=0A=
+ * deregister the vSMP sysfs object for user space interaction=0A=
+ */=0A=
+void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr)=0A=
+{=0A=
+	if (vsmp_sysfs_kobj && bin_attr)=0A=
+		sysfs_remove_bin_file(vsmp_sysfs_kobj, bin_attr);=0A=
+}=0A=
+EXPORT_SYMBOL_GPL(vsmp_deregister_sysfs_group);=0A=
+=0A=
+/*=0A=
+ * generic function to read from the bar=0A=
+ */=0A=
+ssize_t vsmp_generic_buff_read(struct fw_ops *op, u8 bar, u64 reg,=0A=
+			       char *buf, loff_t off, ssize_t count)=0A=
+{=0A=
+	ssize_t ret_val =3D 0;=0A=
+=0A=
+	if (op->buff_offset >=3D op->hwi_block_size) {	// perform H/W op=0A=
+		vsmp_reset_op(op);=0A=
+=0A=
+		ret_val =3D vsmp_read_buff_from_bar(bar, reg, op->buff, op->hwi_block_si=
ze, false);=0A=
+		if (ret_val) {=0A=
+			printk(KERN_ERR "%s operation failed\n",=0A=
+			       (op->action =3D=3D FW_READ) ? "read" : "write");=0A=
+		}=0A=
+		op->buff_offset =3D 0;=0A=
+	}=0A=
+=0A=
+	if (ret_val)=0A=
+		return ret_val;=0A=
+=0A=
+	return memory_read_from_buffer(buf, count, &op->buff_offset, op->buff, op=
->hwi_block_size);;=0A=
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
+		 enum vsmp_fw_action action)=0A=
+{=0A=
+	op->hwi_block_size =3D max_size;=0A=
+	op->action =3D action;=0A=
+	op->buff_offset =3D op->hwi_block_size;=0A=
+=0A=
+	op->buff =3D kzalloc(op->hwi_block_size, GFP_KERNEL);=0A=
+	if (!op->buff)=0A=
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
+/*=0A=
+ * init the module=0A=
+ */=0A=
+static int vsmp_pci_probe(struct pci_dev *pci, const struct pci_device_id =
*id)=0A=
+{=0A=
+	int ret_val;=0A=
+=0A=
+	parse_vsmp_ctrl_pci_addr();=0A=
+=0A=
+	ret_val =3D open_cfg_addr(pci);=0A=
+	if (ret_val) {=0A=
+		printk(KERN_ERR "failed to open cfg addr for vSMP pci controller at %x:%=
x.%x, exiting.\n",=0A=
+		       vsmp_bus, vsmp_dev, vsmp_func);=0A=
+		return ret_val;=0A=
+	}=0A=
+=0A=
+	vsmp_sysfs_kobj =3D kobject_create_and_add("vsmp", hypervisor_kobj);=0A=
+	if (!vsmp_sysfs_kobj) {=0A=
+		printk(KERN_ERR "failed to create sysfs entry for vSMP pci controller at=
 %x:%x.%x, exiting.\n",=0A=
+		       vsmp_bus, vsmp_dev, vsmp_func);=0A=
+		return -ENODEV;=0A=
+	}=0A=
+=0A=
+	printk(KERN_INFO "%s [%02x:%02x.%x] up and running\n",=0A=
+	       DRIVER_DESC, vsmp_bus, vsmp_dev, vsmp_func);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * cleanup after the module upon exit=0A=
+ */=0A=
+static void vsmp_pci_remove(struct pci_dev *pci)=0A=
+{=0A=
+	if (cfg_addr)=0A=
+		iounmap(cfg_addr);=0A=
+=0A=
+	if (vsmp_sysfs_kobj)=0A=
+		kobject_put(vsmp_sysfs_kobj);=0A=
+}=0A=
+=0A=
+static struct pci_driver vsmp_pci_driver =3D {=0A=
+	.name		=3D DEVICE_NAME,=0A=
+	.id_table	=3D vsmp_pci_tbl,=0A=
+	.probe		=3D vsmp_pci_probe,=0A=
+	.remove		=3D vsmp_pci_remove,=0A=
+};=0A=
+=0A=
+module_pci_driver(vsmp_pci_driver);=0A=
diff --git a/drivers/virt/vsmp/api.h b/drivers/virt/vsmp/api.h=0A=
new file mode 100644=0A=
index 000000000000..4f5377cc9f72=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/api.h=0A=
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
+#define vsmp_read_reg8_from_cfg(_reg_) ((u6) vsmp_read_reg_from_cfg((_reg_=
), VSMP_CTL_REG_SIZE_8BIT))=0A=
+#define vsmp_read_reg16_from_cfg(_reg_) ((u16) vsmp_read_reg_from_cfg((_re=
g_), VSMP_CTL_REG_SIZE_16BIT))=0A=
+#define vsmp_read_reg32_from_cfg(_reg_) ((u32) vsmp_read_reg_from_cfg((_re=
g_), VSMP_CTL_REG_SIZE_32BIT))=0A=
+#define vsmp_read_reg64_from_cfg(_reg_) ((u64) vsmp_read_reg_from_cfg((_re=
g_), VSMP_CTL_REG_SIZE_64BIT))=0A=
+#define vsmp_write_reg8_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_)=
,(_val_), VSMP_CTL_REG_SIZE_8BIT)=0A=
+#define vsmp_write_reg16_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_=
), (_val_), VSMP_CTL_REG_SIZE_16BIT)=0A=
+#define vsmp_write_reg32_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_=
), (_val_), VSMP_CTL_REG_SIZE_32BIT)=0A=
+#define vsmp_write_reg64_to_cfg(_reg_, _val_) vsmp_write_reg_to_cfg((_reg_=
), (_val_), VSMP_CTL_REG_SIZE_64BIT)=0A=
+=0A=
+u64 vsmp_read_reg_from_cfg(u64 reg, enum reg_size_type type);=0A=
+void vsmp_write_reg_to_cfg(u64 reg, u64 value,=0A=
+			   enum reg_size_type type);=0A=
+ssize_t vsmp_read_buff_from_bar(u8 bar, u32 offset,=0A=
+				     char *out, ssize_t len,=0A=
+				     bool halt_on_null);=0A=
+int vsmp_register_sysfs_group(const struct bin_attribute *bin_attr);=0A=
+void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr);=0A=
+=0A=
+ssize_t vsmp_generic_buff_read(struct fw_ops *op, u8 bar, u64 reg,=0A=
+			       char *buf, loff_t off, ssize_t count);=0A=
+void vsmp_reset_op(struct fw_ops *op);=0A=
+int vsmp_init_op(struct fw_ops *op, ssize_t max_size,=0A=
+		 enum vsmp_fw_action action);=0A=
+void vsmp_release_op(struct fw_ops *op);=0A=
+bool vsmp_op_buffer_depleted(struct fw_ops *op);=0A=
+=0A=
+#endif // VSMP_API_H=0A=
diff --git a/drivers/virt/vsmp/common/Kconfig b/drivers/virt/vsmp/common/Kc=
onfig=0A=
new file mode 100644=0A=
index 000000000000..5da4665acd38=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/common/Kconfig=0A=
@@ -0,0 +1,11 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+config VSMP_COMMON=0A=
+	tristate "vSMP Guest driver common Support"=0A=
+	depends on VSMP=0A=
+	help=0A=
+	  Select this feature in order to be able to retreive generic data from t=
he vSMP=0A=
+	  hypervisor.=0A=
+	  Currently only version is supported.=0A=
+	  The data can be found under /sys/hypervisor/vsmp=0A=
+=0A=
+	  If unsure, say N.=0A=
diff --git a/drivers/virt/vsmp/common/Makefile b/drivers/virt/vsmp/common/M=
akefile=0A=
new file mode 100644=0A=
index 000000000000..9db2f2389f8c=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/common/Makefile=0A=
@@ -0,0 +1,7 @@=0A=
+# SPDX-License-Identifier: GPL-2.0=0A=
+#=0A=
+# Makefile for vSMP Guest common feature.=0A=
+#=0A=
+=0A=
+obj-$(CONFIG_VSMP_COMMON)	+=3D vsmp_common_info.o =0A=
+vsmp_common_info-y		+=3D common.o version.o=0A=
diff --git a/drivers/virt/vsmp/common/common.c b/drivers/virt/vsmp/common/c=
ommon.c=0A=
new file mode 100644=0A=
index 000000000000..4d88948b3029=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/common/common.c=0A=
@@ -0,0 +1,66 @@=0A=
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
+#define DRIVER_LICENSE "GPL v2"=0A=
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
+/*=0A=
+ * init the common module=0A=
+ */=0A=
+static int __init vsmp_common_info_init(void)=0A=
+{=0A=
+	int ret_val =3D -0, i;=0A=
+=0A=
+	for (i =3D 0; (i < ARRAY_SIZE(cbs_arr) && !ret_val); i++) {=0A=
+		ret_val =3D cbs_arr[i].reg_cb();=0A=
+		if (ret_val) {=0A=
+			printk(KERN_ERR "failed to init sysfs entry %d (%d), exiting.\n",=0A=
+			       i, ret_val);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+=0A=
+/*=0A=
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
diff --git a/drivers/virt/vsmp/common/common.h b/drivers/virt/vsmp/common/c=
ommon.h=0A=
new file mode 100644=0A=
index 000000000000..08a096628c95=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/common/common.h=0A=
@@ -0,0 +1,27 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * vSMP common header=0A=
+ * Copyright (C) 2022 SAP.=0A=
+ */=0A=
+=0A=
+#ifndef VSMP_COMMON_H=0A=
+#define VSMP_COMMON_H=0A=
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
+#endif // !VSMP_COMMON_H=0A=
diff --git a/drivers/virt/vsmp/common/version.c b/drivers/virt/vsmp/common/=
version.c=0A=
new file mode 100644=0A=
index 000000000000..9af47085fd1c=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/common/version.c=0A=
@@ -0,0 +1,117 @@=0A=
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
+/*=0A=
+ * this is the maximal possible length of the version which is a text stri=
ng=0A=
+ * the real len is usually much smaller, thus the driver uses this once to=
 read=0A=
+ * the version string and record it's actual len.=0A=
+ * from that point and on, the actual len will be used in each call.=0A=
+ */=0A=
+#define VERSION_MAX_LEN (1 << 19)=0A=
+=0A=
+static struct fw_ops op;=0A=
+=0A=
+static ssize_t version_read(struct file *filp, struct kobject *kobj,=0A=
+			    struct bin_attribute *bin_attr,=0A=
+			    char *buf, loff_t off, size_t count)=0A=
+{=0A=
+	s64 reg_val =3D vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);=0A=
+	ssize_t ret_val;=0A=
+=0A=
+	if (reg_val < 0) {=0A=
+		printk(KERN_ERR "failed to value of reg 0x%x\n", VSMP_VERSION_REG);=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	ret_val =3D vsmp_generic_buff_read(&op, 0, reg_val, buf, off, count);=0A=
+	if (ret_val < 0) {=0A=
+		printk(KERN_ERR "failed to read version (%ld)\n", ret_val);=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	buf[ret_val++] =3D '\n';=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+=0A=
+struct bin_attribute version_raw_attr =3D __BIN_ATTR(version, FILE_PREM, v=
ersion_read, NULL, VERSION_MAX_LEN);=0A=
+=0A=
+/*=0A=
+ * retreive str in order to determine the proper length.=0A=
+ * this is the best way to maintain backwards compatibility with all=0A=
+ * vSMP versions.=0A=
+ */=0A=
+static ssize_t get_version_len(void)=0A=
+{=0A=
+	ssize_t ret_val =3D 0;=0A=
+	u64 reg_val;=0A=
+	char *version_str =3D kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_NOWARN)=
;=0A=
+=0A=
+	if (!version_str) {=0A=
+		printk(KERN_ERR "failed to allocate buffer\n");=0A=
+		return -ENOMEM;=0A=
+	}=0A=
+=0A=
+	reg_val =3D vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);=0A=
+	if (reg_val < 0) {=0A=
+		printk(KERN_ERR "failed to value of reg 0x%x\n", VSMP_VERSION_REG);=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	memset(version_str, 0, VERSION_MAX_LEN);=0A=
+	ret_val =3D vsmp_read_buff_from_bar(0, reg_val, version_str, VERSION_MAX_=
LEN, true);=0A=
+	if (ret_val) {=0A=
+		kfree(version_str);=0A=
+		printk(KERN_ERR "failed to read buffer from bar\n");=0A=
+		return ret_val;=0A=
+	}=0A=
+	kfree(version_str);=0A=
+=0A=
+	return strlen(version_str);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * register the version sysfs entry=0A=
+ */=0A=
+int sysfs_register_version_cb(void)=0A=
+{=0A=
+	ssize_t len =3D get_version_len();=0A=
+	int ret_val;=0A=
+=0A=
+	if (len < 1) {=0A=
+		printk(KERN_ERR "failed to init vSMP version module\n");=0A=
+		return len;=0A=
+	}=0A=
+	version_raw_attr.size =3D len;=0A=
+=0A=
+	if (vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {=0A=
+		printk(KERN_ERR "failed to init vSMP version op\n");=0A=
+		return -ENODEV;=0A=
+	}=0A=
+=0A=
+	ret_val =3D vsmp_register_sysfs_group(&version_raw_attr);=0A=
+	if (ret_val) {=0A=
+		printk(KERN_ERR "failed to init vSMP version support\n");=0A=
+		vsmp_release_op(&op);=0A=
+	}=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * deregister the version sysfs entry=0A=
+ */=0A=
+void sysfs_deregister_version_cb(void)=0A=
+{=0A=
+	vsmp_deregister_sysfs_group(&version_raw_attr);=0A=
+	vsmp_release_op(&op);=0A=
+}=0A=
diff --git a/drivers/virt/vsmp/logs/Kconfig b/drivers/virt/vsmp/logs/Kconfi=
g=0A=
new file mode 100644=0A=
index 000000000000..02949c351b86=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/logs/Kconfig=0A=
@@ -0,0 +1,10 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+config VSMP_LOGS=0A=
+	tristate "vSMP Guest driver logs Support"=0A=
+	depends on VSMP=0A=
+	help=0A=
+	  Select this feature in order to be able to retreive logs from the vSMP=
=0A=
+	  hypervisor.=0A=
+	  The data can be found under /sys/hypervisor/logs=0A=
+=0A=
+	  If unsure, say N.=0A=
diff --git a/drivers/virt/vsmp/logs/Makefile b/drivers/virt/vsmp/logs/Makef=
ile=0A=
new file mode 100644=0A=
index 000000000000..8170cf639b92=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/logs/Makefile=0A=
@@ -0,0 +1,7 @@=0A=
+# SPDX-License-Identifier: GPL-2.0=0A=
+#=0A=
+# Makefile for vSMP Guest common feature.=0A=
+#=0A=
+=0A=
+obj-$(CONFIG_VSMP_LOGS)	+=3D vsmp_logs.o =0A=
+vsmp_logs-y		+=3D active_logs.o=0A=
diff --git a/drivers/virt/vsmp/logs/active_logs.c b/drivers/virt/vsmp/logs/=
active_logs.c=0A=
new file mode 100644=0A=
index 000000000000..0b8e9b60fb9b=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/logs/active_logs.c=0A=
@@ -0,0 +1,121 @@=0A=
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
+#define DRIVER_LICENSE "GPL v2"=0A=
+#define DRIVER_AUTHOR "Eial Czerwacki <eial.czerwacki@sap.com>"=0A=
+#define DRIVER_DESC "vSMP active logs driver"=0A=
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
+static unsigned active_log_start;=0A=
+DEFINE_MUTEX(active_log_mutex);=0A=
+=0A=
+/* module functions */=0A=
+static ssize_t active_log_read(struct file *filp, struct kobject *kobj,=0A=
+			       struct bin_attribute *bin_attr,=0A=
+			       char *buf, loff_t off, size_t count)=0A=
+{=0A=
+	ssize_t ret_val =3D 0;=0A=
+=0A=
+	if (!op.in_progress) {=0A=
+		ret_val =3D mutex_lock_interruptible(&active_log_mutex);=0A=
+		if (ret_val) {=0A=
+			printk(KERN_ERR=0A=
+			       "error in atemmpt to lock mutex (%lx)\n",=0A=
+			       ret_val);=0A=
+			return 0;=0A=
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
+			mutex_unlock(&active_log_mutex);=0A=
+			return ret_val;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	ret_val =3D vsmp_generic_buff_read(&op, 1, active_log_start, buf, off, co=
unt);=0A=
+	if (ret_val < 0) {=0A=
+		printk(KERN_ERR "error reading from buffer\n");=0A=
+		mutex_unlock(&active_log_mutex);=0A=
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
+static struct bin_attribute active_log_raw_attr =3D __BIN_ATTR(log, FILE_P=
REM, active_log_read, NULL, 0);=0A=
+=0A=
+/*=0A=
+ * init the log module=0A=
+ */=0A=
+static int __init vsmp_active_logs_init(void)=0A=
+{=0A=
+	int ret_val;=0A=
+=0A=
+	if (!vsmp_init_op(&op, vsmp_read_reg32_from_cfg(VSMP_LOGS_LEN_REG),=0A=
+							 FW_READ)) {=0A=
+		printk(KERN_ERR "failed to init vSMP log op\n");=0A=
+		return -ENODEV;=0A=
+	}=0A=
+=0A=
+	active_log_start =3D vsmp_read_reg32_from_cfg(VSMP_LOGS_START_REG);=0A=
+	mutex_init(&active_log_mutex);=0A=
+=0A=
+	ret_val =3D vsmp_register_sysfs_group(&active_log_raw_attr);=0A=
+	if (ret_val) {=0A=
+		printk(KERN_ERR "failed to init vSMP active logs support\n");=0A=
+		vsmp_release_op(&op);=0A=
+	}=0A=
+=0A=
+	return ret_val;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * cleanup after the module=0A=
+ */=0A=
+static void __exit vsmp_active_logs_exit(void)=0A=
+{=0A=
+	vsmp_deregister_sysfs_group(&active_log_raw_attr);=0A=
+	vsmp_release_op(&op);=0A=
+}=0A=
+=0A=
+module_init(vsmp_active_logs_init);=0A=
+module_exit(vsmp_active_logs_exit);=0A=
diff --git a/drivers/virt/vsmp/registers.h b/drivers/virt/vsmp/registers.h=
=0A=
new file mode 100644=0A=
index 000000000000..6cb75dfcccc6=0A=
--- /dev/null=0A=
+++ b/drivers/virt/vsmp/registers.h=0A=
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
