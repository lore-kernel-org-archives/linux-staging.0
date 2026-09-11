Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3990366057
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155669; cv=none; b=B4fvGI0kMasajL7lJCYXaDYlPeQhIWGJ+Bx6azbvcw1vKwapFCd7hk1b2/ijjBCABoYZ4XQqV8gFZepCZZUuXOULAnystRwMDmceK9w/bBtm+WI9TX7rwGRGz8DjFdlyZcol4U/ofmEWbvOYPssuTXk4lrtB8Vu1jM1CyvymtJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155669; c=relaxed/simple;
	bh=h3doNYN81HYJAIMWe1zq3neaBZc/6cNvVijbphLm4cM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jIfu4bjNM7lCatR7aezPBO2uckNVwKLoVNsvWLS3lEjGveD9ODY0F1p6NelBI8nFcvLOMSmu7lrHE8cdndkLD7/KXRMHonT3BzLwpB6yz3Sz2gVieTDrf4yI5VEl00hksaNuvkAZ0MTketApAkQ3ACq/n/di5h6lt9HNYim784M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX2oDBjK; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX2oDBjK"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so337454a12.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155656; x=1789760456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPWrsH94ODhlFAtLiFZY8Xiu7m/JhWFe/+j51xRiPo4=;
        b=DX2oDBjKjL5h6mWjYPr3LnUwbz79CIk5bRg2qyDAAf5CNlGOGYWMsHFnBm1S5UbVdb
         F3Lm184NyYrR9PSo9zBpuFZi+WN6EIz7wxbKBEUS0acAKQ2ATVaPI01yyLvFOlOXVpoG
         II3Ov/Rc4tyOKPLUTVBVuNhQLYtWQy6OSfa/iNkswswZV7/gjtVsf+epf7aLTz86p+a3
         1+osAU3ThW/DD7OvXt3RWrCBD95Jx/4X0/d0LPTDvbivNW2JLkMLhvRVfCmWpz1XL4b8
         Mese9zQtkxDAmJRMZ5TZ2uWtR74JTvy7ZozMwG2ZIQdfRdgFDE+9Yk+RPBdzPysLZV+E
         TUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155656; x=1789760456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPWrsH94ODhlFAtLiFZY8Xiu7m/JhWFe/+j51xRiPo4=;
        b=cV0YiJaOH/NFtjCx11o9Nme4eywzXTImeSQ6fDLfOd+BScEyE0jXLkIjgQ+36n2Hc1
         DMDhIzskT28RShk+AQxo+sasCffLDc2CNVc59qSiVQbNmIz463xfHcrAFjdn5nyDSzww
         qXyEcopEvLBM4vJcWDM9nn5HaGxYUsaBwFvQpQ/bMINJuO9u+S7ACAHP3r9OeNSwKFDB
         ME238xr6pxssVfO7YV983FQxmumXKdF97p7TTbpgwpNoZAMkKtOa5pheSMfc5RllC0V1
         ys/3lO3OPyjbkqu3zT4DBAiUvbL5sSBgBa4zS0fnMXBjuid5Xehr8DMCv30ZEe7rmGyq
         PlgQ==
X-Gm-Message-State: AFuF++koSXDYXeAeaXeuL1RDBVP5qHlvi3iyzL5YJParjMAkxCwyyJv+
	TFPafbea/LhzkBBEdqytv8yf45IovnU10bvEegni/MFzoj2zLS88+dnX4qctdw==
X-Gm-Gg: AYBFou34HYB1S0J4Sbxc3QkM4hoyXXK4MVDb63ZjsXPY2SwSES5a3aCF3wIULxYiz2q
	4VAGBocg05HvdgQE+H8NBaUADOx8a/nYYA80Ydzng/TA5DZUW9MfjmsWS+yCfM+UU/J2+zTvUyY
	c750loZ8oVU4Z0va8ztBfdlHmvYbu3a8NxIIvbOwR32zRDo1bUf2ZSYJsm8JjCraDxh32YtYHdU
	kZNB1oQiyVgkFeebreTRIyH5Je7fWT+erIo69Q+V2OAq8tLgQQn1Vtk73rgCt96wUz6+8QPBrDH
	/nvPHTPKdwEo5MepFVw6prKZkWkdE2/kUjcLOVozl2P7uOJZBJJWr3TvDS2DRx1zOWbjEk/PyX5
	2Ph7m/6S8b2WV+xHmA6DkeavDagBIxw6BdIa/UigkkWZWk1sf28ptU4vlyOxtp4J8dFcpVTQD6N
	kUNJFGIivhDDQYRKMSdRSVG0h46eYvSZjc7gYJ6+AqMLv5eRqWQDSZNQnrf5I0pnaVwuiyR3Nj3
	T965wLlbw0=
X-Received: by 2002:a05:6a20:7347:b0:3d3:adad:f171 with SMTP id adf61e73a8af0-3daed333c1amr9500704637.19.1789155656405;
        Fri, 11 Sep 2026 12:40:56 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm9532214eec.17.2026.09.11.12.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:40:55 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: cleanup comments in rtl8723b_rf6052.c
Date: Fri, 11 Sep 2026 12:40:51 -0700
Message-Id: <20260911194051.7195-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up a bunch of comments in this file which are not useful.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index e4f047b14827..162d3d0083c2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -11,12 +11,6 @@
  *
  * Note:	Provide RF 6052 series relative API.
  *
- * Function:
- *
- * Export:
- *
- * Abbrev:
- *
  * History:
  * Data			Who		Remark
  *
@@ -28,16 +22,6 @@
 
 #include <rtl8723b_hal.h>
 
-/*---------------------------Define Local Constant---------------------------*/
-/*---------------------------Define Local Constant---------------------------*/
-
-/*------------------------Define global variable-----------------------------*/
-/*------------------------Define global variable-----------------------------*/
-
-/*------------------------Define local variable------------------------------*/
-/*  2008/11/20 MH For Debug only, RF */
-/*------------------------Define local variable------------------------------*/
-
 /*-----------------------------------------------------------------------------
  * Function:    PHY_RF6052SetBandwidth()
  *
@@ -131,5 +115,3 @@ int PHY_RF6052_Config8723B(struct adapter *Adapter)
 	return phy_RF6052_Config_ParaFile(Adapter);
 
 }
-
-/* End of HalRf6052.c */
-- 
2.34.1

