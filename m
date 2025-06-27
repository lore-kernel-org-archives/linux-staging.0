Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022135.outbound.protection.outlook.com [52.101.71.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACB1F09A5
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046686; cv=fail; b=j8TQE23FLaDGcWMFb45aUfBNGHvthUx7g37eg29W7CNAyzCd7mCBzRSWpcUQDxza9kiHZ/1rPFnrdO1STtxCwOIlygWNkRdh9OqdLFDHCJfkfOJ2pM3GYO7ChnH3qRNy8g7MOYWfXohmEUaYs0rwTTvan938ae8IdmEIkS7vQsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046686; c=relaxed/simple;
	bh=B5LbD6sfzcRd4pwEStTdKe6tMaI8Dnjp9K7t1Ggr1w8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=izz9wbVR/6y10vT7/C/x7JNJOY0GUMH0MC273js1PrDpWVsKDxFh2UApjN9WzYw3wg5oYjjdPlp1TEpCBYE/C2hAdq2iO53hvzaaAwIplmbek4fpVU+Xm0NL6IxEiasvyqZrF/dHF4nQ+q3ARTgNFKhsNddTh/ABZ2u/mMSeMWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo; spf=pass smtp.mailfrom=sesame.org.jo; dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b=ZyBUfD7D; arc=fail smtp.client-ip=52.101.71.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b="ZyBUfD7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu4uvtOGdXMdukzJx1ggXSsQrft+zD2OtoiU8+U1L0RqMpPJkA2ossl7v7p3v035yIPEsgbj46mad0g326J2dxED28XCkXmR6b09W2dBLyNj22AdgkJpUewVw2DGRjeRkn9Jf0zef5i7XqsvHApcpIQQoSTivjvR8nLmHdn4IwtxAWXsdXgVr4uI/2v3Sq2MrEqRtyD2j70LrBWr+f8D4BtxeHHbUd270HZulpuYVP4kWOg4Kjkobs3i6yx9R/PW9Nq0qczIuWYP7O406Vn3VE1z1ZwUkywHE9HzF0qtQkdQjgpiqiOna523fyEjtNQv4SePgrNXLRGHZ8MgwFdDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KESVAxK5UpgNFFfS1dic0yDQrcUFcwdvtxMXpBfymMU=;
 b=iHGhsoHz7vEyjc49BRs3WOZWV19GiBobsvErbyKS1juEwrtFYbnUZByVl0QgkQnykSxKZQX6nsOVuqPVtMX+7w7XhyepWFZmO4b8jO8UJ1Ru4oHKSWD7c0WYJrFKx+cnSc5gb39hev3Qq2vudbKYCtYxaMKKG5oRu+CTV4QaIlBXqITXTmTi0+3CaLhAWBAzsgAl3tvBPPoDF7D1Q16DnLLEVkbpd9kWvkwVF8P/mtJmkgCKa7B6npIiguh46DmD9ktbMsU2cdV0C0cwx4tvteJ0nHmbWRUUKjWGo9TXoU/UOKUyJgOKTCPivg8HUkziGQv1lrGgSQLMedPjMat6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 80.90.171.68) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=sesame.org.jo;
 dmarc=bestguesspass action=none header.from=sesame.org.jo; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sesame.org.jo;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KESVAxK5UpgNFFfS1dic0yDQrcUFcwdvtxMXpBfymMU=;
 b=ZyBUfD7DnKpifSaVymAxFmGcf2wTeM/JpddADrL9agFSzeAlViHmvpb+Vvow7yyTQ+Sv8Hp+tm+qw88aN4aAqOmpQjOPwF9bWZdk/QtIpwo7jtvnOK92nMYDxJlUY2vfGuIZ2HGCXME8wEo8J5WNmLOJn7Z8qHlbY/6ag9HmYpM=
Received: from PA7P264CA0232.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:372::19)
 by DB9PR08MB7397.eurprd08.prod.outlook.com (2603:10a6:10:36c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 27 Jun
 2025 17:51:21 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:102:372:cafe::e4) by PA7P264CA0232.outlook.office365.com
 (2603:10a6:102:372::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
 27 Jun 2025 17:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 80.90.171.68)
 smtp.mailfrom=sesame.org.jo; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=sesame.org.jo;
Received-SPF: Pass (protection.outlook.com: domain of sesame.org.jo designates
 80.90.171.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=80.90.171.68; helo=SESAME-SMTP.SESAME.LOCAL; pr=C
Received: from SESAME-SMTP.SESAME.LOCAL (80.90.171.68) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.1 via Frontend Transport; Fri, 27 Jun 2025 17:51:20 +0000
Received: from sesame-smtp.sesame.local ([10.1.100.13]) by SESAME-SMTP.SESAME.LOCAL with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 27 Jun 2025 20:51:35 +0300
From: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>,
	linux-kernel@vger.kernel.org (open list),
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH] drivers: staging: iio: frequency: ad9832.h: Fixed TODO note.
Date: Fri, 27 Jun 2025 20:51:14 +0300
Message-ID: <20250627175114.548076-1-abdalla.ahmad@sesame.org.jo>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2025 17:51:35.0923 (UTC) FILETIME=[20334430:01DBE78C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|DB9PR08MB7397:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e41eee8-ec0d-4081-1163-08ddb5a339b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|41320700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NZuimv5HuvEoZYwZUtBT8Hkot79lUde3jMBAnUdMNJAVm974Qh1TWTc9iz5B?=
 =?us-ascii?Q?G+IWXtgJ9Wi4u/hB1gU0nuLu3JeSZnZ/tZdZ+K8n0e2D7zE2GLKgT9yJbEDD?=
 =?us-ascii?Q?GJ+gwd94ZsR+HSmecJHGqaaVc1ae486MCKQ0bKPDzznXSLu6Ds0oBwXRndbl?=
 =?us-ascii?Q?3RgJJNPlTEXbmlIFU39tq2r0b39vpVVy8pnGAhFfK4CQyCBu5/BxkOBl5EEo?=
 =?us-ascii?Q?3pQcin9Me45e+hwutCd041bV+NRQN2ZTvHQo6Px9ZzdoJs2UzHleG6Ou1WJr?=
 =?us-ascii?Q?FTEHLYMgyhMgk8OjqHSzijttyT/livlhzmuaLIPCx3U2bwpCPyPxS/uMcO7+?=
 =?us-ascii?Q?6Aayfvq1X2rBTcDqTHgfNLgZRYnPY81XyxY3GUtkaqE860QyE2Okl1DbI2n4?=
 =?us-ascii?Q?sXUa+LtK7ghx0Kh+lHk4ucRmtppoH1oeLsd/osdPDLkaz8Ynyg8x2dumVsDX?=
 =?us-ascii?Q?dQ5BdDfUkpwoG+VbPLLXKAUdSQ2mbvTzrVEUdwbcFf1yNGsHd3ivzT2v+KF2?=
 =?us-ascii?Q?//EhuEoVZhVPwVZeafOAm8fGgnxI3g+/xSwaXPl17t6ooQV0SAp8wsktHRLr?=
 =?us-ascii?Q?mDnrLtMT2G2oI13eBfkSMoZObHYQ5ihjFAw7Vh0SakamNmuPGAfzlJnfepE7?=
 =?us-ascii?Q?VDfMQnnIbZ/POYvaak/+/ODnSGbC5gDeIsJKcvomAoWmJtVa+c623bguJIbn?=
 =?us-ascii?Q?5wNkTnhqR6IRVhmT2CBit94ZqM1GwiayGcAREZj3Oyw8DK1HVIUz7UTlbHGx?=
 =?us-ascii?Q?xpQnxAIhqs9OpKOIfndQI8tAlZ188FBpjfH386pdHIp1UPSSu8dssXNVMTP3?=
 =?us-ascii?Q?yE8ZGV2JBzKyG3Ox74KtS4oPInOy48r3TvJkWIU7bE99r6HEdLodz3qzz2ET?=
 =?us-ascii?Q?w1Mdl+VOQxYGHbRbhE+2wOkS8K9xMz0tdZPM2APxRB2bAxIT7vTo79HA/V/v?=
 =?us-ascii?Q?5fferkwqHjUCmZSL2lZZfkfbcKzQaZwmPFDbmVzQEy3Txkl/19cWVgdG8YKq?=
 =?us-ascii?Q?YPEW479ryEYNdbbnM95uKEkWTkj3d3Afv1nOerdbX9Fj2kJpkbD6jMEiT82r?=
 =?us-ascii?Q?WwwsvsVTGAvZHI4FpQWePwP6TsLuh7ixz6bfFegrJTYimyk9NTe1L3W2pmfp?=
 =?us-ascii?Q?gPU/ex01EzOCIHZ60gickqOamynYUSPYvyvx5gEww5EFjl3ydV3nkgHIayqa?=
 =?us-ascii?Q?5sTVr45RwtopBNCL8rR4CCCcW3sm30nYA7KbSMo2SdTVJlbjJ89CicSQAerV?=
 =?us-ascii?Q?Z6QBElsB3o/Ye/au9jGGTFlO3amXMuwCi1Ir2kWaKiEQws0N8goI8vT4G8cr?=
 =?us-ascii?Q?MjrUDxOvq8INbt603ggfvvYrLZzmmI0Bc4PsAd4lrYJETutBGwiDblZPqqcQ?=
 =?us-ascii?Q?1Amr7rQnbaJlfIJFC1ftn97JmXyS4PXrWjd7om5+AOXOb7gS+aVnLhEK0m3i?=
 =?us-ascii?Q?VnkvtsVvytHPjAH8TVMoLQrOtqT9omgWF5cZkrIBk5QMyrB4QIfLN7etl6oP?=
 =?us-ascii?Q?wnTP/ax6w7X9m8M=3D?=
X-Forefront-Antispam-Report:
	CIP:80.90.171.68;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SESAME-SMTP.SESAME.LOCAL;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(41320700013)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: sesame.org.jo
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 17:51:20.4438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e41eee8-ec0d-4081-1163-08ddb5a339b2
X-MS-Exchange-CrossTenant-Id: 0788906c-6e04-423a-b37e-862cc7808738
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0788906c-6e04-423a-b37e-862cc7808738;Ip=[80.90.171.68];Helo=[SESAME-SMTP.SESAME.LOCAL]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7397

- drivers/staging/iio/frequency/ad9832.c: Changed .h file location
- drivers/staging/iio/frequency/ad9832.h: Removed struct definition
- include/linux/iio/dac/ad9832.h: Added header file according to the
  TODO note.

Signed-off-by: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
---
 drivers/staging/iio/frequency/ad9832.c |  3 +--
 drivers/staging/iio/frequency/ad9832.h | 23 ------------------
 include/linux/iio/dac/ad9832.h         | 33 ++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 25 deletions(-)
 create mode 100644 include/linux/iio/dac/ad9832.h

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 49388da5a684..4c7d618b2572 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -22,8 +22,7 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-
-#include "ad9832.h"
+#include <linux/iio/dac/ad9832.h>
 
 #include "dds.h"
 
diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
index d0d840edb8d2..a0819042a81e 100644
--- a/drivers/staging/iio/frequency/ad9832.h
+++ b/drivers/staging/iio/frequency/ad9832.h
@@ -7,27 +7,4 @@
 #ifndef IIO_DDS_AD9832_H_
 #define IIO_DDS_AD9832_H_
 
-/*
- * TODO: struct ad9832_platform_data needs to go into include/linux/iio
- */
-
-/**
- * struct ad9832_platform_data - platform specific information
- * @freq0:		power up freq0 tuning word in Hz
- * @freq1:		power up freq1 tuning word in Hz
- * @phase0:		power up phase0 value [0..4095] correlates with 0..2PI
- * @phase1:		power up phase1 value [0..4095] correlates with 0..2PI
- * @phase2:		power up phase2 value [0..4095] correlates with 0..2PI
- * @phase3:		power up phase3 value [0..4095] correlates with 0..2PI
- */
-
-struct ad9832_platform_data {
-	unsigned long		freq0;
-	unsigned long		freq1;
-	unsigned short		phase0;
-	unsigned short		phase1;
-	unsigned short		phase2;
-	unsigned short		phase3;
-};
-
 #endif /* IIO_DDS_AD9832_H_ */
diff --git a/include/linux/iio/dac/ad9832.h b/include/linux/iio/dac/ad9832.h
new file mode 100644
index 000000000000..8259a0b0f981
--- /dev/null
+++ b/include/linux/iio/dac/ad9832.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AD9832 SPI DDS driver
+ *
+ * Copyright 2011 Analog Devices Inc.
+ */
+#ifndef IIO_DDS_AD9832_H_
+#define IIO_DDS_AD9832_H_
+
+/*
+ * struct ad9832_platform_data moved from drivers/staging/iio/frequency/
+ */
+
+/**
+ * struct ad9832_platform_data - platform specific information
+ * @freq0:		power up freq0 tuning word in Hz
+ * @freq1:		power up freq1 tuning word in Hz
+ * @phase0:		power up phase0 value [0..4095] correlates with 0..2PI
+ * @phase1:		power up phase1 value [0..4095] correlates with 0..2PI
+ * @phase2:		power up phase2 value [0..4095] correlates with 0..2PI
+ * @phase3:		power up phase3 value [0..4095] correlates with 0..2PI
+ */
+
+struct ad9832_platform_data {
+	unsigned long		freq0;
+	unsigned long		freq1;
+	unsigned short		phase0;
+	unsigned short		phase1;
+	unsigned short		phase2;
+	unsigned short		phase3;
+};
+
+#endif /* IIO_DDS_AD9832_H_ */
-- 
2.43.0

