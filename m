Received: from esa.hc4959-67.iphmx.com (esa.hc4959-67.iphmx.com [139.138.35.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D61E0B9C
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.138.35.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973669; cv=fail; b=aBNQT9lbOAlzsNSKhC4nVef8sltc2lQpYatpcbOB9OZkOFCrjVFckxpZAyDCiGYVgVyn/si0Z+FezLXy58gw7PO1kioOOUek9UgPNhAsNcHwYu2tbFVR/EGqWcJBF0jzczik/rpCYZKDNTktt6Y9IQV0GInvibR35HI3KdIgFfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973669; c=relaxed/simple;
	bh=IjFxFnaLjOKsDSUOcGaDN6r5PXmhqhza7GnyvEhCjW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hyxPIC1WB/MfL4aa0EtszxS+y3LnWlOcauvH4YAQhs9kxe7FxwUIuTvVafdNH4vOId/MSyOz1rCDCzSPw/vedgEqJyftfdxZB01/lt8Y6JDlDuQSeaeT087uCxU+ZNwqyfK9/0bm6v0x7pjbrB8qLb6FQFQiw1yjYNC9phSJYPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com; spf=pass smtp.mailfrom=seagate.com; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=kSyxbWKe; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=iRhToZYb; arc=fail smtp.client-ip=139.138.35.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seagate.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="kSyxbWKe";
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="iRhToZYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
  t=1776973668; x=1808509668;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tTCFrlTKACkxm/RZ1ByxWrACgSApsM0syp2Zjhk+MIk=;
  b=kSyxbWKeGr/on70dAfL6b9MMbfZrYO5z9Bf76HLfcWGZQQ9K+dhUXvP3
   1MCjDJPwW5FlyJtjQppzfCZ2w81jE/yKxkSK7zIUvwMTHfnyik8xx8l91
   WuHNtEepCf9X0Ha+DTVZEC6NmTYS8pASCywqYO6Tj5XI5bd5tx6ePZHu3
   g=;
X-CSE-ConnectionGUID: z7punkE4TM6e1B1nQpxAjw==
X-CSE-MsgGUID: xLDXAt+AQFmqUhvhL6CIjA==
Received: from mail-cy3pr08cu00105.outbound.protection.outlook.com (HELO CY3PR08CU001.outbound.protection.outlook.com) ([40.93.6.109])
  by ob1.hc4959-67.iphmx.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 12:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evqWxdgQxVwU6dpWIAroqFHY9vzlOLVMkTjQVXlqrmqkAH5zxK6kzib+kUoS0BVJirsnpATo0XqrANBcGzT9zHVjPaaMQZH1UjV/hPx7dbZPY7LrJxcLJrq3K84wTV20wrFqhz9efkLDpf4wdpm1ucCweVgeivaaexd8+fPzEKNNKDnHP60ofVYf1BN69Zb34fMDt2UJU2zHQ/hOw35KJ1+k73uCqRbjxJ6JIdMD/BwzT7BrEVyVv908aaY1c5B8Rw2WROqWgUkYBSHhP0k1w/8pB5vV26IKE0jFAVgKk7MUpz71L/kQZbUsUdO8/9AzZqQX8eargerOrZi16c906A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTCFrlTKACkxm/RZ1ByxWrACgSApsM0syp2Zjhk+MIk=;
 b=Do0JnOz80qi6SjWgF/WLxafmUltVnbW9k4bXHG4UVH9Tl2ztB4D4Ruv7GJigfJjjHcHHyik2uYsWH1vxka3SbnZgsutjIBiaPGyNA96hOi81Ju7wYXACvAlvx5jEV39G/b/d6QO2I5JiDIrMSW5ICVVBOyEQJBza2PGLP3cCBpJODcPtkD52ahRIxIca610LzqdBRTXYs/Td64/26ivOpKzIJ6WYl8e383RW3Gyl1r+STHLIA0sdNug/IMLiU/lToQ24Ld6jSo3llhTNpNAkCT62Xu0sfK8elxyBgD3l1xWtiHcfP3AoLhL6xCafqXdy7+3VhUU3Z8bPyLz/anDHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 134.204.222.52) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=seagate.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=seagate.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTCFrlTKACkxm/RZ1ByxWrACgSApsM0syp2Zjhk+MIk=;
 b=iRhToZYbjMA+l1e1HrtHTIO/20LVcTWar5Zpo6txgwPNRKDYvf5Etc9NGFX/ESrFrh6ZO5Pw/b7Pjtb6W4aILJgLDWz3Hnz8RSQXjXJtZmxZy9hICD2fvYHN4NgVxgAm7zHT1zz7ehWx7gtOM/WvCINVBQTFftcQa1YxsrvMZZ8=
Received: from PH7PR13CA0004.namprd13.prod.outlook.com (2603:10b6:510:174::25)
 by CH9PR20MB7787.namprd20.prod.outlook.com (2603:10b6:610:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 19:47:43 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::d) by PH7PR13CA0004.outlook.office365.com
 (2603:10b6:510:174::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 19:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 134.204.222.52) smtp.mailfrom=seagate.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from lcopzesaa001.seagate.com (134.204.222.52) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 19:47:41 +0000
X-CSE-ConnectionGUID: NlWRsm1MSJaaBw/5+rMSgw==
X-CSE-MsgGUID: 81pd+bYkRIWA3mlCtIGj/Q==
Received: from lcopiesaa01a.seagate.com ([10.230.120.56])
  by lcopzesaa001.seagate.com with ESMTP; 23 Apr 2026 12:51:29 -0700
X-CSE-ConnectionGUID: PXJRirQxTSqCApNjQ9nIfA==
X-CSE-MsgGUID: jxnz/+3qSr+mQLyKGroODQ==
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="737434"
STX-Internal-Secure-Mailhost: TRUE
Received: from nick-desk-ubuntu24.colo.seagate.com ([10.230.88.139])
  by lcopiesaa01a.seagate.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 12:47:40 -0700
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
Subject: [PATCH v2] staging: media: atomisp: Use str_on_off() to fix Coccinelle warning
Date: Thu, 23 Apr 2026 13:47:27 -0600
Message-ID: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CH9PR20MB7787:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 441b600f-dfad-4515-7fe8-08dea1712ea7
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HdnwNtGCus4OGg5HAAcWgA1xYAPCaQ0M1KNLpNmGGkxH3KU9fLIWEAUVg5MdiDr2ssKTMTPoZAH+BCwCTEe6sR+MXAGlyvtpwXvbXO21FF8Uv2txlCchTpjsZFxh2NEceoM8E4Mmoyaw69GsicaHXH3IJXQUOo4KMGbTr3r8tElKilrhRFqxHjy4qfjSZsEtXqDjpyADASHBBh9ii5WfcABH2yX7wBR5+QoDqW5S8CX/lfXglD070rjSC1Sg7jySkXUHK0JwHsPAmIZ2/BtlY85ZTjM7yryiw4zQZit2Tf1rX8qRuGW+LxkfhyVm9W39nOl0TfJbW+j5WwOqN5iU+avy4TxbiBgqExVhC020GPvp3D61jc3oZRrY6KfiKlhWNBru7Vh7sYzCVjFEpd7epj6wOyB4/AHHkfr5tx2koV/VVYbmjj6w+EiGamIlxX0Np2W0Uj+4UzSrZ7Xwrn3pj29BAgHffn+e8PxgkXYG0pdN+gm2FFan0ZT654zflS4PO7IX5hJ/yQg3tDkSF51LSGz0/YiQubRkVZvBexgM/+RqSY0Uf9z+pgudgcHHyEg/VfOnmiAuuAGMC9TGIUbZCEJq16AiMRVR4ai0xfOUKwxhDMWfxwA5/RKpQhKk2/Z/3esHK7PmaBhk98msy4IdEHlJ4dkSyv6QTfIta0UodJRIz6xH6CZoG5REwzKpg0bDZ88n6Wn8JNm6Cz5TJMG+OF71e5Z9d61sWaWiKhxToFjapLmy5CoPVnPLc/60dhLLnscOLj2IZ7Ny2nZu8GN32g==
X-Forefront-Antispam-Report:
	CIP:134.204.222.52;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:lcopzesaa001.seagate.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R0NdpyNQYqOUmIdOU4dAIRAK5l2Edwv+YVC8k60BFWJ5SlpegIpnQ+jB4iWw/lxbk7tET3KTrDSG8CsrYbT1g+u3vWR/FhwCiMY+Z+erh6X9n915G8HgCK7nkEdQOjChQOyBrNUldQZY+CA4t3hDlDC5XrgSnPhcI3Ne0mmdhzAe3yCfgFygbMnzWoUIHngzZt1o/XHtHgwIf5ikEFC9pIWLDQhWhDrugo8nJ/1JkTgHRGlbsize55WRMwaWOgss4b1C4Ise3mm/oa1c0vMi6CpbxgfxzCVjmtcSNMsdPOrVoTFcH9e9hEjgU/TBNU5XrO5863PUM+Z6TUByUTHod6ZITLGucBcH6C/CHZ6P8DhKwlvZKkKkHGT0IXZe+INXKHsvTKE1caFwmLPXlAdPZAHfiCYWoD7iIbRUKTe+BdDT6UMuFB0AnS8GfWd18e1j
X-Exchange-RoutingPolicyChecked:
	vsmi+5DW5XuMQZ0mC1nQlDddV+nEcPOo1B4IBLHs3l3rv2VGGSPJZEv7ROfsWf4LFoz470IuPliAnGE5bl2PhbzDQGqgCrbCCyIVvQM5mx3Xr2xdsRZJswJDK1Wt32Y0bSOPiMTMeifQsQU/YBKSfmdzTIAxYJsfuoJwyFRcA6d8fKkHGwAghOurlZj3vx6ghlOKZPRBmcW4zTHHiM4t0zyqSA/lIEltaZozV68kzNGDXE8mi9NFDB4/e/6cWpLjQwsuz7mL9rZOg51tQT3kRxFwlYLvk2Us8U04zQd0vuAz6Bnw5XTwCzNcpjLsFLvI0053Whk/zE0sYT0j7Hwwxg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z7zK+KLkvjV86pJfQDCnlL9Jj2Vg9sdl84X67d9l6+yj4KoZ/6yUUlhwhHictceZF4ZCjHv2+KALs1aNY2H2qOh6mHFUBtpxg/UEnzru3WyJmU/vd39Pq/tC8Ls07lx3tjkClxmXoUwpUJ3OixfggY2PViiliMhgwp3u/RDgzusq6lGdE+Cr9E8t68d8Lxf1IyrK7nVsM3XLXbUj5LW9XkJvv22fiYEONEkNsM7FqgRmTyTRjR/dexjfC9C+sEh62qm3jMhCneCKttTcN0qLN8LwLzOwIsxul7KVQU/KwgW3p1htEWvHiFIVEGol8LPFFrAsMGM62cwCgc0aBpmtXN/+5RMtXmjtB675j2iL2b51S/0ns54fi0fWZ2VaAGNyPofddZPsJXzgvy25GQmnW54eQlYJErK5JBggq4A73TTdQtu7S8Fodfd35OC2pX0dR57SpYBzmQ2EZYEPEXwgMQLq3Z5ZgBCpWKYughupc20QEAblB5FYco3oVKe8+WMYSYvaoIKe0rSbT8qrpipMHa84wyZB+Fk+vNx8Lr5uarcosg/0mO1BK2GPOJDy0uFRF+NmVCkVZmEMzh6CVZh0EvFbicUfX0dEu3kmMKKYAQgt4W+rk7jzZ+pcO+02gPzD
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 19:47:41.7302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441b600f-dfad-4515-7fe8-08dea1712ea7
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe;Ip=[134.204.222.52];Helo=[lcopzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR20MB7787

Fixes the following Coccinelle warning reported by string_choices.cocci:

	opportunity for str_on_off(on)

Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
---
Changes in v2:
  - Include "media" in the subject line.

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

