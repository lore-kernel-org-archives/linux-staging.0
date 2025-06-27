Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022125.outbound.protection.outlook.com [52.101.66.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32016CA6F
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052991; cv=fail; b=UZHD6bFZrSmK0vHZBJ2AbbxNCr6hjxR7eAekoxn7qltkheNUL/1PAzUP5nUH3n6b9a1GGOIYtPwKUo28Pt1z2FrXtWqt1puVU5C6MGVRm1cw0+MkInkKi3xYXIyiuCHfIK+Ni0Sh7tlGtVIvFVHMfxABTQIMiwZnjFN7bf0xrOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052991; c=relaxed/simple;
	bh=HvWVHXXjN1F64+YacFwfHg3KwRc/Zd8qXpNxqwKGzzk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FEXFhUdLuY6J7Z6RVl4wW72I7jdoDYtMuhmZoYmpO9UxwoR0bShj4Wh5KatRmRF+i4Ih95s+tJnDAYQ+RbU9uHxyvsMb4/dWkO+xINYbMpmHetyd1rVlWilGjl4eyLznLGeWHb3pzDEq5Nx+ZcRALnz1hU3zpGhQHQXeyNEXaUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo; spf=pass smtp.mailfrom=sesame.org.jo; dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b=SxtqOLJ5; arc=fail smtp.client-ip=52.101.66.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b="SxtqOLJ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR8Lzv2KKj2PMIAimWTwmLyhCkzyn8SxbzFJoHzM4Vjo+gATO0rfDCyyzpOkf0y8ZczvvoZnKkkLrkSraOFG1n6x20eez7XkC9IVHrYI/NjR1ugEd2i7JpH1VSmJFfu+SQ/ZdAVYv2yOavL/EAZG6hBY0Q08yY3hD9g8lB8IpBTkVmUqZuCOne5c0NHLBn3BtXiyrO8HkkrGsoeAbixIVZsx+4kHVbz7LTI5YalyMffoWJNKLbs9c8gMaGgftbzKnZNbSZ+3/W0xDnZJFNX8119yvxavN7n/BGu9uNpScQJJCSvZpPqiiKAdSqBG8NLRCbTPtVcwV0ZEi5iuIw3TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgZAwqWDakGrornFTk6XKwUteN61VEw6SWRRvSD+XwU=;
 b=JlYUL+HRoIsQl7IuenrrFZEtHC52t3LHROEC0Hml7qZqTsiYW84d2tq9PJFHuPthQH5P95Pd5WU00WfqmzhXNv8G0WR43W8D5LIPlOgU/+sM+qke7k6VsDr/qMCVyM5F/wGAoqAYtqLSyu9a2D3/o5n+zvjz9893xzZ8NxJ2a0Y+lww9pco714M2wEFjDFPRaUi9tfiFhjkg7mIMChlXyHiel2H3QZz1/zw7qInz7EtkgMw449JihyoL3F44JItSoT7oN5dyasfMMzKWaC7YPG/lsx1yQxjAhsz6M2fUHk9XyGmqpf6gzwRnhxvzwEfPASM0voaEUdaDU/lkpvkB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 80.90.171.68) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=sesame.org.jo;
 dmarc=bestguesspass action=none header.from=sesame.org.jo; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sesame.org.jo;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgZAwqWDakGrornFTk6XKwUteN61VEw6SWRRvSD+XwU=;
 b=SxtqOLJ59RLMaAdCL+7n32wYfm3JNvvRXHwBt6LT/wBX/c7fxzRFMYxj5PKwfop9F8TfuWug0Q5dqwZbcNkFbY0h7SIVT4OZ/y5gJAqU/WA2inEBbJUhGeQJ5Lu/k1wq/+38p3DI9HtFsUp2RQYmT+A33AGQ3aLXy+4ZZYPTPxo=
Received: from CWLP123CA0247.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19e::9)
 by AM9PR08MB6274.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 27 Jun
 2025 19:36:27 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:400:19e:cafe::d2) by CWLP123CA0247.outlook.office365.com
 (2603:10a6:400:19e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.24 via Frontend Transport; Fri,
 27 Jun 2025 19:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 80.90.171.68)
 smtp.mailfrom=sesame.org.jo; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=sesame.org.jo;
Received-SPF: Pass (protection.outlook.com: domain of sesame.org.jo designates
 80.90.171.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=80.90.171.68; helo=SESAME-SMTP.SESAME.LOCAL; pr=C
Received: from SESAME-SMTP.SESAME.LOCAL (80.90.171.68) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 19:36:26 +0000
Received: from mail.sesame.org.jo ([10.1.100.13]) by SESAME-SMTP.SESAME.LOCAL with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 27 Jun 2025 22:36:42 +0300
From: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Date: Fri, 27 Jun 2025 22:36:13 +0300
Message-ID: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2025 19:36:42.0037 (UTC) FILETIME=[CEEFE650:01DBE79A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000198:EE_|AM9PR08MB6274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8655a02b-087c-4ce8-4a40-08ddb5b1e887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|41320700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a/wv1m+g//kMUHktF+k+S13KLpyUsKBu8kkqO/BnJiKzMrN0MMglk7vt/W5y?=
 =?us-ascii?Q?hKqoG1byl/SpNx7Zc0+o/Tk4LxWYcvTlwFiIeFOi9dBwgfZDIC6tC0+VtsaQ?=
 =?us-ascii?Q?l0QnEo9/K48rcda97BrUUf+Z9/SiBFIT1XUK9aDRiK1j6nuAwMPDCEUZ+xwf?=
 =?us-ascii?Q?oJhMQnxgbM4SP4XwgcNbsgmwKxV2uQ/X9PLGhANaWfmZ6gAIRx6nvz0xayn1?=
 =?us-ascii?Q?ihKaqAPfmvO/a2zIFiXqLDY5b/yK2DhXY0rEHJ4ox0zhnMXavcSd/Tkglwuu?=
 =?us-ascii?Q?TYhFqp8O3nNCNUDUDwubDpnrVLnEObPqUJYfPInYROs2iOKRQO9RsdGDuwFP?=
 =?us-ascii?Q?YHhT4CL4wlLv5NwMQGjgdYhjfzJFcfkrQeiGzogSB/lAwh11ku+VT1+Q8xPT?=
 =?us-ascii?Q?sEqfZm37X11Ofm1VExiBgkPehCN4o3+VijVMr4KYPkcVrvLP514rjAjb2HPA?=
 =?us-ascii?Q?H/IMlQI0uspwsIYEHfdjBnBVc1VMRP8mliL6nlK+RQ9dyfdtEHh0558b75EL?=
 =?us-ascii?Q?7HoVl7jQaIgxQyOJR/6hqnMqr5UxJM8sb7/vxmdHog+EDxTOeMEotkExdUwZ?=
 =?us-ascii?Q?ceMgwXla0zNyS72QUVAwG+9IerEwTwwiVdlyfAkC3+B+Igq0dDYiLSKGnV5z?=
 =?us-ascii?Q?sCPO5LvQ3ham/oA37wzVSklUWj4svqm4IadQw7hG4TQDj7vxZ6CLhyDsBrf/?=
 =?us-ascii?Q?SV7+QfQ9F5r/e5aDt9pYC0liyp4ddVG4fC5Lr3/XGMahyr74Eg/jAbvnH1OW?=
 =?us-ascii?Q?jbf1k0TqZpigoPz/6u6DQVWC7jfBttmJqiR1LN7mHzzgt1LDSjVVQrHZYvhB?=
 =?us-ascii?Q?5fHVwvrpXOBwyw1xp8o5iGzqI5xU5hr8bR7c4l1Oqq84yhVqimSnQLSm6qrL?=
 =?us-ascii?Q?3GNJxXG/0o2n2TrDuZG+uEaBo9i5Kj9X40nYA3fwzm43tGVw+6uVWc8iZO2Q?=
 =?us-ascii?Q?EnbsTpBQBtLZuVjwngUNZzxyaVGtPUs/azpPJsl+MvZaIgKrAoaezq7sTJxW?=
 =?us-ascii?Q?n9MztxCLqFYN7njV9lq+g3fvq/qv5/DRmNUVxQuiS7zdUCELfl3rnxgqazsq?=
 =?us-ascii?Q?40xPkDhPVmlgKtJBFzPatjCaR2eG5z/QLNse+fXiXGF8m9JYFSycPKN/Tvvc?=
 =?us-ascii?Q?hWdi2Y5fuYTyIQsgsoil99n9kG2q5/fNTT6g+vKbDL2RXUD8FMnihPnqG59K?=
 =?us-ascii?Q?D03OqOADQdC/y/fvTNxThCMi2ijItPtpzVLqK8WM8Y3VHhmrL/cliPYLPw5N?=
 =?us-ascii?Q?zpVpeG0zdWSESxi8+YW1P2U2eGAUIZCZlO5pqUyMhCaxpGeGAQ3IaBWtV7xj?=
 =?us-ascii?Q?AcaaE6RhiibZ5TtME2PIyOoFssAVlP/4Vxw2YUUTEQ3IWOo/OU3VT8Cul+kR?=
 =?us-ascii?Q?veRuzthGV1g0NfsYtZFien5UyICbxNjR/+Pwdtbi4fe+uuLKdHITS+79zzfG?=
 =?us-ascii?Q?aphKmSdoxE/cnJTFrfpc/eUplhSVzqPXNGNZ0kqQiOQpNNORm+f31FsnVbkT?=
 =?us-ascii?Q?vB6VcQuCfI3fBIt5kpeZUAnBpa9RjNcJvaCw?=
X-Forefront-Antispam-Report:
	CIP:80.90.171.68;CTRY:JO;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SESAME-SMTP.SESAME.LOCAL;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(41320700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: sesame.org.jo
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 19:36:26.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8655a02b-087c-4ce8-4a40-08ddb5b1e887
X-MS-Exchange-CrossTenant-Id: 0788906c-6e04-423a-b37e-862cc7808738
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0788906c-6e04-423a-b37e-862cc7808738;Ip=[80.90.171.68];Helo=[SESAME-SMTP.SESAME.LOCAL]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6274

Ran checkpatch.pl on drivers/staging/gpib/, found the following:
 - gpio: gpib_bitbang.c: wrapped LINVAL macro w/ parenthesis.
 - hp_82341: hp_82341.c: Used comments instead of "#if 0"
 - tnt4882: tnt4882_gpib.c: Used comments instead of "#if 0"

Signed-off-by: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c    |  4 ++--
 drivers/staging/gpib/hp_82341/hp_82341.c    | 14 +++++++-------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 14 +++++++-------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 625fef24a0bf..45cf4571c58d 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -47,10 +47,10 @@
 			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
 	while (0)
 
-#define LINVAL gpiod_get_value(DAV),		\
+#define LINVAL (gpiod_get_value(DAV),		\
 		gpiod_get_value(NRFD),		\
 		gpiod_get_value(NDAC),		\
-		gpiod_get_value(SRQ)
+		gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"
 
 #include "gpibP.h"
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 1b0822b2a3b8..f641613e128b 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -805,14 +805,14 @@ static void hp_82341_detach(struct gpib_board *board)
 	hp_82341_free_private(board);
 }
 
-#if 0
 /* unused, will be needed when the driver is turned into a pnp_driver */
-static const struct pnp_device_id hp_82341_pnp_table[] = {
-	{.id = "HWP1411"},
-	{.id = ""}
-};
-MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
-#endif
+/*
+ * static const struct pnp_device_id hp_82341_pnp_table[] = {
+ *	{.id = "HWP1411"},
+ *	{.id = ""}
+ * };
+ * MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
+ */
 
 static int __init hp_82341_init_module(void)
 {
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index a17b69e34986..7d679604488e 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1369,14 +1369,14 @@ static struct pci_driver tnt4882_pci_driver = {
 	.probe = &tnt4882_pci_probe
 };
 
-#if 0
 /* unused, will be needed when the driver is turned into a pnp_driver */
-static const struct pnp_device_id tnt4882_pnp_table[] = {
-	{.id = "NICC601"},
-	{.id = ""}
-};
-MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
-#endif
+/*
+ * static const struct pnp_device_id tnt4882_pnp_table[] = {
+ *	{.id = "NICC601"},
+ *	{.id = ""}
+ * };
+ * MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
+ */
 
 #ifdef CONFIG_GPIB_PCMCIA
 static struct gpib_interface ni_pcmcia_interface;
-- 
2.43.0

