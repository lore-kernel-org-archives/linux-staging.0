Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9AB1E8320
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583319; cv=none; b=YJwa2TL7SHtq2/sa/saKg8hQMGYOQZly3HaD86Blvr2bfXvwYUdj1pK/lu5otJnEp2Fdf79dTZZM/xbzMIETNl13COw28RjcqV7pIyoKLKMHcE7c+2f4rxlEx/0fjD1wm/E39xL+i2ZxIsWjfGPWR+fbPktDPYJEmgH6/p0Nm0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583319; c=relaxed/simple;
	bh=B0ezuM4ds/NItHrVpDvquy4wlWSPG5HlbAuxKmabKRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7QvB1dfc7j3ZkvzNj0WjphPvi0Me8LxzZqcf5HCGUbSzyP/HJd7JqOfc1jSKGyQRYw02T08IZyBXo6Q3TMhjYUPeNpX1JUDzoC1sMnkL3grjlrrV+4+LVQnTQmQkFX3LzVdpRHrUu92f8Q6NBsHi57GHRiqsVvwVb5RxfUVGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBNqg2+B; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBNqg2+B"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6530287803cso1923831d50.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583317; x=1777188117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zkO13+9OE8LkZlosvxoP0Y3BI/lgSC+HkngN8GVuo0=;
        b=hBNqg2+B0dcYzxwOxEMY3voa1n8nSKpir5hf+E4Wyq3AVzGk2bf4T0IkscGv/1R8MC
         nm0zFx6jb/ljJfKUHUShPL3DZlCnrh8PwL6AztWGFMs3MGFLMRIKhy0ieS82grYjttR/
         c9RC3rCyeeFx7Eko4OCEwfeihcJ7pjd7vp2kt45f0h7GcVGfyUPypsWRngrHxDXeDDgb
         0hZAsQiqUIaeWENrB16cLLekTu9H+3/AEWnQsBu1b1pWfb3fgIvlhlDE94CKH2mtgLkO
         GGc0DmLdTkEJc0S9CbbAFp5QyrSQFffQ903QeC+ptRMj5wn1vRpgVhDq/HSzW4H3pnro
         xoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583317; x=1777188117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2zkO13+9OE8LkZlosvxoP0Y3BI/lgSC+HkngN8GVuo0=;
        b=lhanN3iR7RVuJkDrfQHH8iRfbefcnANOfYJcelA3XSLpDZLPB7M9vaKyCEpmU8lPQb
         DLJItiAJ+G3vyEYw//5H6ifRlRa1fP3QwgkEz1Wcnooz0snzq2xsWUJae5wnr1d9/Xvn
         mJpzbza1mEY30CU4X5sZFASLFW+ziV9U6ExV/3QV/32AK2+uU9BVoCdzbzoYXNu0NcCU
         8kH9ATfzFISGIFFz9hhP2SpXOqvy9NhqxJanYl0GGBdgfo9+EZEOneTI8+GIIKfsRxXR
         C6e/WUsJ8QShYcQYteHQlRWFy0Hw8T3lqX1qrBghISLfRaGfy4q19M9RFUPDTwTUJLvj
         yvPw==
X-Gm-Message-State: AOJu0YwWWar2fsj4fd02dL+gGOmrXRYA/SwnzoW3VveV7fx8QR94QTIO
	XdR6s6/OSA5TE4URxoShMG8V6RhTWKo0AROJnXOzYQMKs9CcLUwseKfS
X-Gm-Gg: AeBDietuymOM/iTGHGaQ2Pu+t76gcwC9FC5O+ZsyCaUP/NAI+mZLiLfHI+5EScnNO7t
	PdKAUh1R8P8NgW33dP1NYow8rPIURc7uHyrRwJD9iNqT2qGHFB+xsATLzu+A9nX8CVfn4tyR5ob
	WDs2kbN9nggbtwDA0nlh4nbkL/hWVW2SSM+KccxBpw2Civl7jlYsNH2sj/zzZ2ecGBsVo8z382/
	ZNDm3swiomBUpHpkIgYdivG6bgcuwomhxXyNMjboC5XhUrcwvYsHLUPGy5cVwH7xLf7a/TVJGkW
	J1mPKz9ISHeAOorz90LcqUU06gER6aZnQZc0a5ysGhMphKGcsHD9c0D6vOqXJejDtqwfe104jCN
	cCge/K/fYxyfTGBqBVOauqGeweQ+bgXDWI/e7uYwzccM8CXL6vDZ1cF85qx7336wUGkD4Sl34ll
	S7HgCFCcEwJXh15D47PeZfbNo4ZiHydeHMKKc=
X-Received: by 2002:a05:690e:1341:b0:651:d736:8427 with SMTP id 956f58d0204a3-6531081063cmr8635766d50.17.1776583317571;
        Sun, 19 Apr 2026 00:21:57 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:21:56 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 04/11] staging: rtl8723bs: remove wrapper rtw_hal_def_value_init()
Date: Sun, 19 Apr 2026 10:19:30 +0300
Message-ID: <20260419072034.19824-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary wrapper and call rtl8723bs_init_default_value()
function directly to simplify code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 4 ++--
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index c3a238cb0b1e..1322713fec6c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -7,11 +7,6 @@
 #include <drv_types.h>
 #include <hal_data.h>
 
-void rtw_hal_def_value_init(struct adapter *padapter)
-{
-	rtl8723bs_init_default_value(padapter);
-}
-
 void rtw_hal_free_data(struct adapter *padapter)
 {
 	/* free HAL Data */
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 0d2f60ce29af..f46989ce9e3b 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -181,8 +181,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-void rtw_hal_def_value_init(struct adapter *padapter);
-
 void rtw_hal_free_data(struct adapter *padapter);
 
 void rtw_hal_dm_init(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..0685ed17a39f 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -550,7 +550,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	rtw_update_registrypriv_dev_network(padapter);
 
 	/* hal_priv */
-	rtw_hal_def_value_init(padapter);
+	rtl8723bs_init_default_value(padapter);
 
 	/* misc. */
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
@@ -609,7 +609,7 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
 	/* hal_priv */
-	rtw_hal_def_value_init(padapter);
+	rtl8723bs_init_default_value(padapter);
 
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-- 
2.53.0

