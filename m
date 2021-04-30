Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77CC2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:54 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id n25so9411814edr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0VrDyabi3mV4M4fhUFp6n3KhHlZMOtcz1Nzpn72r40=;
        b=hdnxRlbsuzZqIwtskBrPu475JDPPw4kX6b7Qo7tOuH3L7FznOZ1O+Lj4s2XZMB2zQo
         mBmTu3CQvOSLy6CuIr8e6zghKbT5+CsdZ7WRp9IJzyj989Mz3jySZ1S6/uCw3fgECykk
         7mquGRgoukaRBo0mVpN3sSflv/NawmnkCTXLanJTJMVRZIjU/4dMkmjRlJkMMYIj7hD7
         XL95tzVxY7nmnSK2NWnlb/rlRoguZsG+WFZG0aewSvkpbegLDyp0lvZt5Xk2IWv5UZvK
         3w7N1SW/7h3PKyDU+0z/PgenNRIc0WayWp+mddZlKYZEf9kRVl+hjs4ELbqx0Y3wl74C
         YO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0VrDyabi3mV4M4fhUFp6n3KhHlZMOtcz1Nzpn72r40=;
        b=LxQK8PEQAJ5hA/7kaS5HnQsgDOLe+ZbkhUEgzOEjkhJnh4QQ/SCSLgGZ3WqOw/Tl/E
         s2XcPbkj/kPuCkn+jTr6M9QEkVahp1PJ4D4SUUXuwdgENMw8Bl97lz9o/+18eHu/DGj+
         4sSGEd6YHeujrloWmZ7EDH4ARk6e7WQ/Sy7vzs/0/RG2fN2DRdasMqVHCPNh+2uZuPvZ
         W+ZTr5nph/K+2DvUZ06m4L+BaDj3kNvoc1MPIsDUF9SSgb2n+rCv7rGvZIfLQeI1ieE4
         OnjDaD42htE1u2yOGw+5r466XgGRAp5A0ZzJVjxIJoqr3ZBWvcdtMHIpROE/DrafkP6C
         gyjg==
X-Gm-Message-State: AOAM533ARMdq8aBP9PxUwsO75jHB0gSM5JWeHS9BVFn7VDnIHbpJlKL2
	7VXW58LQjEqQj1mXc5dTH+Y=
X-Google-Smtp-Source: ABdhPJxnen2/Y1KaKLlGqB8dBopjyOcPovBAChb33XN207qqh5mT2cqHxCUGev6+fzwI5dE4x0t7qA==
X-Received: by 2002:aa7:d589:: with SMTP id r9mr4102869edq.286.1619768693427;
        Fri, 30 Apr 2021 00:44:53 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id x7sm1408238ejc.116.2021.04.30.00.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 29/43] staging: rtl8723bs: remove unsed hal_btcoex_SetDBG() function
Date: Fri, 30 Apr 2021 09:43:47 +0200
Message-Id: <6b21b37582c53cafe14eb15fa034b36b68954a2a.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused hal_btcoex_SetDBG() function definition and
prototype.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 12 ------------
 drivers/staging/rtl8723bs/include/hal_btcoex.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 30d763b48349..cac2d6077403 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1492,18 +1492,6 @@ void hal_btcoex_DisplayBtCoexInfo(struct adapter *padapter, u8 *pbuf, u32 bufsiz
 	DBG_BT_INFO_INIT(pinfo, NULL, 0);
 }
 
-void hal_btcoex_SetDBG(struct adapter *padapter, u32 *pDbgModule)
-{
-	u32 i;
-
-
-	if (!pDbgModule)
-		return;
-
-	for (i = 0; i < BTC_MSG_MAX; i++)
-		GLBtcDbgType[i] = pDbgModule[i];
-}
-
 u32 hal_btcoex_GetDBG(struct adapter *padapter, u8 *pStrBuf, u32 bufSize)
 {
 	s32 count;
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 3c03be210d87..9048499e756a 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -53,7 +53,6 @@ u8 hal_btcoex_LpsVal(struct adapter *);
 u32 hal_btcoex_GetRaMask(struct adapter *);
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen);
 void hal_btcoex_DisplayBtCoexInfo(struct adapter *, u8 *pbuf, u32 bufsize);
-void hal_btcoex_SetDBG(struct adapter *, u32 *pDbgModule);
 u32 hal_btcoex_GetDBG(struct adapter *, u8 *pStrBuf, u32 bufSize);
 
 #endif /*  !__HAL_BTCOEX_H__ */
-- 
2.20.1

