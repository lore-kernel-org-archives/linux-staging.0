Received: from esa.hc4959-67.iphmx.com (esa.hc4959-67.iphmx.com [216.71.153.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA353033EA
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776970052; cv=fail; b=SHcc7EA6lfCXFc7PQARbwARTHjsnJoew5tF8hPLzhvZOSvF5PlAJbjpxNbyPrRqTKzhB4Ey/xxkR3j67d3ruPGadZZ7AVbejIwNhBFuWBVJJtPRC62i3lkT8Uc0xXftf9p5FTUXm08uPPFfpLCv4XXfukXbM3+ayE+DPkvRxoOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776970052; c=relaxed/simple;
	bh=1lmFyQjnSLUrr9ROvR51RwCa67C27F9oVuo5ZqVfTBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gxfys61iq6Yw/JmVGaVV8alDmBibdgSjiZdm09ORueR3CCAfFHyj7dg2KraGS4JyYHgy1Sc/lf/Ths/EDzk2ttOY8y9U/3Igxy8V4OGQsUAcrxxm3jYDBn473ZwShT7T8ugpU5TELZuhP7urPURUsHG4sqJEsKqRMP7RK5m/neo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com; spf=pass smtp.mailfrom=seagate.com; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=diPOua0D; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=hX1XNajs; arc=fail smtp.client-ip=216.71.153.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seagate.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="diPOua0D";
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="hX1XNajs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
  t=1776970051; x=1808506051;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y93pSLYZHlF9mASAxp/yzKptSC+SikTPvD+o+8GquDE=;
  b=diPOua0DJauuaEGou4YTVsuphYXxUPYZf4l/8Ckuh3FGueeezEoitidr
   4tr1LH+hSzV4Kgs4vAOQU8OOzim8r2MqAHAshSw3oxE9CH/QlA8YNgbyR
   ng4rKyDzQw8YEaFl4qVbW8n7ky+jsWGa3HdI539hyHNx/ccnHD6V6CbMp
   c=;
X-CSE-ConnectionGUID: 3Z/X89F5Qnixc6JkIoyCMQ==
X-CSE-MsgGUID: 5Gjq5JEDTrO1D38Q3VANBg==
Received: from mail-ch4pr07cu00102.outbound.protection.outlook.com (HELO CH4PR07CU001.outbound.protection.outlook.com) ([40.93.20.98])
  by ob1.hc4959-67.iphmx.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 11:46:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liBFqLvr9wMLDV8Xci2CVkof/nhW52geDSjpw0feE2hMjGDc+g++dvjJT/+7Z9F4Q+uXGe4XzRRWf+fkxLUYvvEydI+7xFLl6bBFELliLVZhLgiS/72zxLJTaUYbfKzX+94d60MdXS8psK4R3N/NgbGHGZRmjmkEn3+9+DKO/uTxHoyEoOZc3lFapbGNzXeype72oMhPgdGhK6Mlji5uE4VZVU59jro5DSfCXaoGwOIrxtY4sxX8j/nrTeDJfx60wOEntJxRPpWqQJb4Yerewp8Nsmn4BXitlEKQH5nvfwREamAsBaGTMZs8YCUYO3NRiG1vG2Et1wEjvGC/ypA6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y93pSLYZHlF9mASAxp/yzKptSC+SikTPvD+o+8GquDE=;
 b=rni57RWW+x3CyjDf7raxkG5su2No+z5HuH8vCYNM+F74Cr9hWFCpvacUvPbQ9AbYwAddo/hdtUsqTLZClGLgrhIASxMd26jOHPvsPDf0Az4hurDpHZ0E5ti0iqtyVcDEaqPUtLg9eLWZtZX+UzE8omPopwA3n7uGTVfAfEIwSAWLMgX48pGkpZSVBYza5hIOxjCFEcCz/QJzuQk4VCtWW1DbLTPRn+ztFsqFFukkGhFtam+hzzZ34gwKMjf+xE4NXUVMzFvahuOFpuptmL8h856kIg2hOr9TDECjCASc99q6vl8sMo3p9K/HOE4to0qmgasM77LVbmJFKPmomuQpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 134.204.222.52) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=seagate.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=seagate.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y93pSLYZHlF9mASAxp/yzKptSC+SikTPvD+o+8GquDE=;
 b=hX1XNajsK1r+6ZapZqGXq8L5tDls6c9OO7Vu94+2aCdqRhQEyoZ72rkc0r1RN2i+9XcA8kuxumAmiyKpmNf/YC24uRWZ+0JVj6azY0TnvEi85f+14zH7j96w/f1IKKicZCMQbDDjsLVFSkDgVbSMbFBr6FMdb2ZxyF85BdRgxvc=
Received: from CYZPR17CA0019.namprd17.prod.outlook.com (2603:10b6:930:8c::20)
 by DS0PR20MB5080.namprd20.prod.outlook.com (2603:10b6:8:d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Thu, 23 Apr
 2026 18:46:17 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:8c:cafe::8e) by CYZPR17CA0019.outlook.office365.com
 (2603:10b6:930:8c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 18:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 134.204.222.52) smtp.mailfrom=seagate.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from lcopzesaa001.seagate.com (134.204.222.52) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 18:46:17 +0000
X-CSE-ConnectionGUID: EqbcUR4DSTSflBoG5a1l1A==
X-CSE-MsgGUID: zUKOFVHrSluFdBmduZe8qA==
Received: from lcopiesaa01a.seagate.com ([10.230.120.56])
  by lcopzesaa001.seagate.com with ESMTP; 23 Apr 2026 11:50:04 -0700
X-CSE-ConnectionGUID: V9fGJ8IwQOKEPZVXY7UWAw==
X-CSE-MsgGUID: nmCnqCmvTO2VoZ0vwNBBpA==
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="737398"
STX-Internal-Secure-Mailhost: TRUE
Received: from nick-desk-ubuntu24.colo.seagate.com ([10.230.88.139])
  by lcopiesaa01a.seagate.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 11:46:16 -0700
From: Nick Spooner <nicholas.spooner@seagate.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nick Spooner <nicholas.spooner@seagate.com>
Subject: [PATCH] staging: atomisp: Use str_on_off() to fix Coccinelle warning
Date: Thu, 23 Apr 2026 12:46:12 -0600
Message-ID: <20260423184612.3199324-1-nicholas.spooner@seagate.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DS0PR20MB5080:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10bcfb52-8432-4a45-a1a4-08dea1689a7b
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rj600xgBTMR8YOQNz7jdcDmEQjM+kpMAG14SG7/7SyV5WUTwCd1ZCES9xhU0X2siZiWQSrgIGXwquBpxE6PTX3Q0VgDBDq56p4ZtMKhf9NdqpISsxzK2NCa5eVVbs5xmlD5H72eo2CLJMyzNThxnAgRi3zSgsi5Bf+ha7Kt32gegXjtbfv+ives/U8DBsqeEfNDdTCv/GVbQrgmCML+0uSvUWadiAKZf65uk7qPb0WokNP964AIAcS+8SsYa2E9EU25Kp8y4Dj4r2QBNljEmMoO3VHJMhIJ8v/UEFyTbiIQ0PArOOVpc7vimd9ZVmPWNebCZmQcagbzxlIHbQ90f/GavDzjq+ADgOexroJa6o863ZWyrnhwORJlaLi84OnH8YuH56suBz6w6ZMesq8mIsfkSYm1Y4CCExq8rOsGFzmUgQ5r8NMG0yrW+wcuRL+okfKzaG4gcuHaN17k68AzMLNp9bf6Id2Z+xejfP1cMYyRfRtpyUZTGmvuVvrjkP2yhptc/cFfQBUziYUL25GMobatToU46h8FAXU93ne1Rr8iN8H9rXWhOW1MH6RKMfUrnRtQ1m+Ehh9tYl1+Ir2amn5wbaqann81zREbr953CjmwjaI5J+3W7BhtnMCHJRZxJJqLzJhgVXoad+J67e5uiQD0xnmDI+bot09xJVyp+G1FoJyYHhlMa1KVZ79hNNKEvstEEA1J40NyY36tthR/VEmvIY28ac5xHyU08r9fy9amjH3Wrng2Lp0lY4mOvuxYxcP1JYjUn0TI1EVIgN9W7ow==
X-Forefront-Antispam-Report:
	CIP:134.204.222.52;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:lcopzesaa001.seagate.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4ObCjH332wS+AJ7Zcx2ZlQluyEEOdbYBoQmSe6crNhnvMgxboyJ3Y4fPsa46EARYA556EPJvILupTsdHywNGA/8yfge2sJXFX6gELdsFpJXmnNLVCtS4VLlfuwb1S12QBafaXShhSZI/GPif9KiTDwG1SMTxi/22NJTvz//ArP84wWi8ib/2v+ytYwIE8t/zmZhjNCID5+Eh3OuDo/L5xL8T4qoPvRMsNgTM3Y7KSsIg6ASeKllKCK19c6cO4d5myeYoaoCxEL9Qa4fKFRb2M2wxcPeMlY98ZmHwQFSsGuimlp4M/QeCnXa7pwfeCzFUfBWRKal5aIifbpvp7o8OPmuuHwR/lEUy1mPROV9cZKG8tIOY2cGNK+kZIgCc/KG/m34KMeZY3gbfQDtk900uZUkfoZ2c31vURNsWHUt9NIhdfRqcoUXG4VAYXjzchQhE
X-Exchange-RoutingPolicyChecked:
	R+/2O/iDHJNF8JUlhvXSadi/WCuLjLkdd6Dt3A48UEiV2Fs9EvY018Iuv3HM2U8najOB2jpuvZqjsnKmMYg5vzr/7e0RYCpJ/Ac5+B2kSrSwqBsNYm1EKJYi5Wwmeozwm4wsQ5fvzDsdsAycwutW//mMgII6ySmf4GmyN5M4EJOkRtz7oz5l8TRBoR+ds+A/46ZvTrgHw/m4deOh1YvYOJ/UAJ4/D872+JWvsAV8saPSw6IkHJg5hEPhDmOXyPsfkXx/1DdZ+U7yAyiWnJusY3jVpRbOkfI5SYuVu/TOKjkPE8lHd2AhQsgNbLYoEyvprunhRVg6Ne4gh2/pLiupUg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ympU1pAo228nURVeD4DiGMIPJYQC95Ed/yLSvtlSGiaZT+NgaczPzzHrO8zXWMf/15fBFzIoAVBGmNkd6ERHPNAD0wBNjgoKplabgZGOHq2efqKhvIJarQX8y2UAQaBS2wbSsB/8/Rbfgs0TD0WU1moEAm5fPfWJAyZSYpIQjxoty1NpENXO8vwK/lgScnUxladnvwtkZoKGUYwpsEwCXmWrGZU4zaLSoVFsg42jDug+bkudwKaKL8uIOuzQ/bnGohwCwhTOm5SiGPwWi997+52kuefn618pEHMl0OhQiZP8ijcB1h+kgmbbMDLBy7Ya6AHaJGUWxLBJIRhjRv14619g3rWkuavvXd08xGYCIAnsTVup8Ldk/VNj6nvk6jCoQMVvx2+KxxvqIJYh/6RGU5v2apqogbNBKaWlexhgdZBcKZwSylwmX3UgfY32B8tCod2NK9s72QzH9TKUJVKjOCmYOoVuKnEIQ5diFIwC/b0XhI64yDPTq6i9JAvaMDTaksCNKRRXBQM3FRZyuSlaBz03hravhxbsYJxkBS4D6vcBWVxBn5IvdepF8RJkDi6ij8toFiWCRuuKXw6Tp1d/quMBtCIdEuulEZAKNSjTG+lMUEnPrrxVdCdvKhqRr5TE
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 18:46:17.1552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bcfb52-8432-4a45-a1a4-08dea1689a7b
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe;Ip=[134.204.222.52];Helo=[lcopzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5080

Fixes the following Coccinelle warning reported by string_choices.cocci:

	opportunity for str_on_off(on)

Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..322eca4a3755 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
-- 
2.53.0

