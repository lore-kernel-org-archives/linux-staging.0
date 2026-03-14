Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970834A78F
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773515248; cv=none; b=d7H9uME1rOi558vWY0rYIYPPTp1PTGZdCjhNN+zxAwYNhFMgGMf+0MiYsMOni5JCcOltWScvO7iN1SedOe3TjOVPpBvRtnIj0x8/V8xzuNkftx4rxlt26qzCX///x4Ola/UklILDlwn2BMgjYbCy96WmHqMN6pn9sNcRQFTf1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773515248; c=relaxed/simple;
	bh=mEd2+Dl0J47YZNKTRD75E1d7FPsIxANJ38A2IS9+fsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ik9+IDOw91Je0/5Fe6kXJE/y9NxXpw9f8/m26U2efM5DOsqDW1XpLXpUcOpBxFOKDNmvR+iecjOnFwYe6UJAz5OLXftXKm65rju2dmLPg/a8yJ+HVj4enlJ99iJeejdRuXxZL42oLk59iD1ZXmdFx5v/v9BoERTgc5vnU+c3oP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/6C/J6y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/6C/J6y"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2611335f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 12:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773515245; x=1774120045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mGpXZANM0Z79REPuZzUp0edBo/PaIuRh0ARZQkzC14=;
        b=j/6C/J6yELTY4B1by/2D6ec/mtixMtu39nAPW/INvNGICKClaXARTFyxlFqn+yZvA7
         pe+E30to40i83Qpmrkb6mWeVZHuSVS5EeInSwlsX3U6P0CA0JHxZ5L4zE3z08DBWXUHG
         8QUD4lsvIM7dK+LXv7BGl0bTDbdFHWTwA3cWdh6+SrZI71SgvnDq8UkYdzGJNO27TCOO
         RVJNE5K3LSuPC+lByh7hZAQta5N3zJicCoIiv3Jxc9rVikF6t7ZZSAfO3SmqorspRg9C
         yEXixqiByQuwWlvYcc32vLrtw+dn7khq1Etbj+4wLXJGO5NxOhhw7nykJmaaoWHpEK61
         HinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773515245; x=1774120045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mGpXZANM0Z79REPuZzUp0edBo/PaIuRh0ARZQkzC14=;
        b=JLAUVdh2q6Bh/IuFXCETQhx5DELpKy65NABu+IrQeNxemgma7puMeKSOYAfiEe4aR+
         8J1esr+ekf6UM0Oc5pPa1n4Whn1ASR+taBJ2vnsx64FE8TLEDXHfw/QxV3cfb5ZACcon
         d/8+h4mczXntZQZYrfDdJ5BCHUGsRGW+n3FU1OgZfpW92a72LjvvW8sD8rKBgCLJlQVy
         e+K6YgL71D9OYv57Z/f0i9rFelLzFm32MeOkNEWkQEkgNzYZSJ31wbOficeRxy52aKXA
         LqkMOsOS351YmqrK2+Hc6+S73Qxx2sqIm6bzHzoAC8t7+1wNg3tBbuTKovizTE/NZoro
         w4zw==
X-Forwarded-Encrypted: i=1; AJvYcCXpPZMFFTWFrcbeSbm7D4xn2MJoosQ/O32oc310ocxRA/FrcXyUPVOAXGG4Wu9Y4JWPpEIiditpPVPYNYnJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz0I6ebY/7yaYfx6EjI8YOfYJlG8OPXCzJZ4I2daFnwS68P4zH
	OfABAJQg7yX6W1oidYL6HpbGKrJ+0PIBwi2DHu0BDQKfQgzBqKe0uiDh
X-Gm-Gg: ATEYQzxd217yQ4UhkRZ7tpmjphxoTPNS6AIYU5vPmsrEYTOh/wSc13crr2iS2l5MIxP
	bEtbLXHO/QvGGK35AkAwlclIx9noyWvEJOWOyvnueyjyTvM+vTj81FXY8I0ahcahc3TKTn/xEbC
	Y5iXxGXbKU5ttYFlY0wGL3jb/2K2zQ3l6udhoLZN7fSC3O6DZIMoM/17eXROKku2hydsWcsdsbz
	Kfz075N48/C38IGocBKP2f0Lrbmp6IyQ4aexW7pfS+jlyaDxF7S1bf2aklPajrq/Pqy0igDkduP
	b3QZVGMCr08KggXSBhqkr4gETmobJ1BhKmq3Bkl8Gu3LuwFAZDH3sj+q2MePMJD3qkjCbI6cvDk
	R22dO8cbufA+tc8oFHAApuzz/VZ00jR1J0EBOcx1Vb2HTueH1oVF/71fVCHmMaFZtJJEtAhGQIl
	kPYRsecUoEbirdOwAK2a0W8lE4JApKFskaX/bELR1gZ1WsA6WRAarTN2pUXsf52ew7mQeTAM06E
	e3934XB6CIp
X-Received: by 2002:a05:6000:2404:b0:437:745f:a6b8 with SMTP id ffacd0b85a97d-43a04d7cc52mr13749173f8f.9.1773515244912;
        Sat, 14 Mar 2026 12:07:24 -0700 (PDT)
Received: from localhost.localdomain (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22e9ddsm26322109f8f.37.2026.03.14.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 12:07:24 -0700 (PDT)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace rtl8192c_recv.h with rtl8723b_recv.h
Date: Sun, 15 Mar 2026 00:07:04 +0500
Message-ID: <20260314190704.11945-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the used definitions into rtl8723b_recv.h and delete
rtl8192c_recv.h.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 .../staging/rtl8723bs/include/rtl8192c_recv.h | 37 -------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h | 21 ++++++++++-
 2 files changed, 20 insertions(+), 38 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/rtl8192c_recv.h

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
deleted file mode 100644
index e2e9aa03ffdf..000000000000
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef _RTL8192C_RECV_H_
-#define _RTL8192C_RECV_H_
-
-#define MAX_RECVBUF_SZ (10240)
-
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
-/*  Rx smooth factor */
-#define	Rx_Smooth_Factor (20)
-
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
-#endif
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index 783f64de0aec..e05f4975b6ca 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -7,7 +7,26 @@
 #ifndef __RTL8723B_RECV_H__
 #define __RTL8723B_RECV_H__
 
-#include <rtl8192c_recv.h>
+#define MAX_RECVBUF_SZ (10240)
+#define	Rx_Smooth_Factor (20)
+
+struct phy_stat {
+	unsigned int phydw0;
+
+	unsigned int phydw1;
+
+	unsigned int phydw2;
+
+	unsigned int phydw3;
+
+	unsigned int phydw4;
+
+	unsigned int phydw5;
+
+	unsigned int phydw6;
+
+	unsigned int phydw7;
+};
 
 struct rxreport_8723b {
 	/* DWORD 0 */
-- 
2.43.0

