Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90B335C1BF
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 19:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947598; cv=none; b=JFhQZoC/jCBOL0rOowJkF4Zq9uFhfcoD4u/TttqHOPWkMq+SM43f3S0W57i5z6rE572WlKFmlqFE90VuRa0MpyRs3PKPXKX5NSd97R5AjL4+dSv3MOgzpVqi6P2uMlmfNpQmZp2jVHNswayJtlyAf04VdL5L878/i9FLyJMw+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947598; c=relaxed/simple;
	bh=lv5Xv/85bNDiKbjkKI/HhUaW5UmNE4syAkD6pWkHeFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mV9P2qhEsdOSvplK4fPuNhW4QdkuPygVgCpvSxUyD64HX9joMuoF6uX1LOX8E3+UVdHSRf55KZUv3uWI7NhYjclf9Ly3c+Z/khWFeJqAq8hYfhnPfaOAPosDgqwY64o99l6ux5/wQv21IB1OP/NRX+qGc/JIKt0Vf7konwcqSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OljUJswy; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OljUJswy"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-356337f058aso640560a91.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773947597; x=1774552397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDb9mUds8vYh0FCRtY+ebDLgyM8o2TAv6Y9zp4khNXs=;
        b=OljUJswyIrEqqM5l1Uha3A88iSVfMHrPhPkiQFwP7jli6Vt+5/bDApMGy9Wnlf+OIF
         x4K4vl1N9MYcZMD/Q+kPU0AhPxSsMTTzKX/ggKnO0Ir9vUpPebThKPnNrexbc6ygwc/T
         YMyZntgbPjFo6DhazZrk95JzS4znZiRYibtn3zwaYlTphcvO0OpS36mKv0U906axEzBP
         vBJ02GZ8FkVUov+g+xlzVO+DyGEt5hhrgJxyi6WglKzwclg/gxF27tOzhbLrQW+qm5ts
         Wu52CLFjOZisBtBYZ78NLorK3speTP/Lj6KG5ZiGJfyRtBX2H4guh/pl2pLVpqZloVb8
         u3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947597; x=1774552397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDb9mUds8vYh0FCRtY+ebDLgyM8o2TAv6Y9zp4khNXs=;
        b=Ow6RY20Lb36/1jyquMrXkXOaPjdlLjNFqWDC98Lvz/KkVOS+egs9Zhc5QrBEhuzn2x
         gtyvFA9tOXDlIF4iPiqproY2iG/SQuQB+2l+Goxx7CzS8hxIcrqVPS5BficO8/iCZAf8
         zCLR951KKsfb6WQVkypYCJ63aAvhn/J1h4UeDz8SAk3iMqQSsVXzRNY1zMn/HS7Pqv8l
         hvF8do2eorjL35ej3DdDv6vSXYFgSUZ4oH4xwX4DJAP5L75KHkY7BPqibKRY8nznhDUY
         d6SQE8eq+zHMZluvCMTCZSUMWCEMEwDZ+T49GNKdvXzpPmRPQPos/QXQz0Uukfim9zHq
         sn7Q==
X-Gm-Message-State: AOJu0YxmcBCKwRGk8T+bTdrRQJ5lEUluEco1bAOyKVLpEL3/5g6wIQE5
	02iZnLzka7WvJ0pyRAFbApW9LgWgXvfSDGP/tZY3h4irorlZR6H/OVQ7
X-Gm-Gg: ATEYQzy9iQEXpPEMcrZZ38IgMNHIhBHug8aWU98vQhVbWLn0A6znnpU7u8jipTNy6IJ
	wzFdUlMEY7gqyQIeE1rbo8YriuOj5GrW6ebSUv4wCM4JJ2X23Efuadxw0otBJlwUwLcbMdarvSj
	zBDSsg88uVU6IJsoOIV5o/rFhxjy9Taf4T97ZCAfD1nMnqyjRABg+8n5qHIx/z2oT/QDp7k7Zba
	E0WHDlAqN8tpkkmut3WISt/Nz1vuhqhd3UMW26XfkPAdkkcTl/uZkmGln/+WHpmSsNBW6hpqRw0
	9giueBJg+1IFaYU+k/elqSaCMXqmJcZhMbTrSm1K42C+kJjDwLQKws3aIDyVnIUi776hxgU+L7s
	l64ocUBa3NxfJ4R9tBLLHWwlCWMVefpsDx6fDmoGNsSguNo5bamCXe57kiBs43jyJ7vjMZZoDnO
	BzCd2BXHfuCYSVV64/4FddcIj2Pwpx/HIcQ1/vYlEqv+WaxkpvOjrNh/2Z0MUf8tdxGlmCiSODf
	WOJtL4surFuAr8FyM0=
X-Received: by 2002:a17:90a:d44d:b0:35b:a7be:ae43 with SMTP id 98e67ed59e1d1-35bd2bb6857mr238865a91.9.1773947596888;
        Thu, 19 Mar 2026 12:13:16 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc610c1efsm3379921a91.14.2026.03.19.12.13.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 12:13:16 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep(1) with fsleep()
Date: Fri, 20 Mar 2026 03:13:09 +0800
Message-ID: <20260319191309.64198-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep(1) is not suitable for short delays due to scheduler
granularity.

Use fsleep(USEC_PER_MSEC) instead, which provides a more
appropriate delay for 1 ms sleeps.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      | 5 +++--
 drivers/staging/rtl8723bs/hal/hal_btcoex.c        | 3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 5 +++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c       | 3 ++-
 6 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..5751584b0f18 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -4,6 +4,7 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include <linux/delay.h>
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
@@ -414,7 +415,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		fsleep(USEC_PER_MSEC);
 	}
 
 	return err;
@@ -567,7 +568,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		fsleep(USEC_PER_MSEC);
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..596a775329d9 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 
+#include <linux/delay.h>
 #include <hal_data.h>
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
@@ -98,7 +99,7 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 		if (utime > timeout)
 			break;
 
-		msleep(1);
+		fsleep(USEC_PER_MSEC);
 	} while (1);
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..8159ad278a6b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 
+#include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <drv_types.h>
@@ -28,7 +29,7 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 			if (tmp & 0x01)
 				break;
 			rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
-			msleep(1);
+			fsleep(USEC_PER_MSEC);
 		} while (count++ < 100);
 
 		/*  8051 reset */
@@ -1157,7 +1158,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 		if (passing_time > 1000)
 			break;
 
-		msleep(1);
+		fsleep(USEC_PER_MSEC);
 	} while (1);
 
 	return ret;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 7fac1c2ba8e0..14a14eeaf9d2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 
+#include <linux/delay.h>
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
 
@@ -391,7 +392,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	rtw_write8(Adapter, REG_RF_CTRL, RF_EN|RF_RSTB|RF_SDMRSTB);
 
-	msleep(1);
+	fsleep(USEC_PER_MSEC);
 
 	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index f50726d2ed0c..bb6d6d7544b7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 
+#include <linux/delay.h>
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
 
@@ -23,7 +24,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 		HalQueryTxOQTBufferStatus8723BSdio(padapter);
 
 		if ((++n % 60) == 0) {
-			msleep(1);
+			fsleep(USEC_PER_MSEC);
 			/* yield(); */
 		}
 	}
@@ -386,7 +387,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 		/* here sleep 1ms will cause big TP loss of TX */
 		/* from 50+ to 40+ */
 		if (padapter->registrypriv.wifi_spec)
-			msleep(1);
+			fsleep(USEC_PER_MSEC);
 		else
 			yield();
 		goto next;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..895c47e987c4 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -4,6 +4,7 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include <linux/delay.h>
 #include <drv_types.h>
 #include <hal_data.h>
 #include <rtl8723b_xmit.h>
@@ -1091,7 +1092,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
-		msleep(1);
+		fsleep(USEC_PER_MSEC);
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
-- 
2.39.5

