Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91672690EC
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583328; cv=none; b=VSGraszsSe2BXG5qB1x4o0VFm4U8QFbQnLq6vwgECCckci/QrCjxJiDhM19aoR8ot6/+5fo6Dm59o9/aUmP1BdXtdXk8WT6Pr+F8VexH184u61wRRDZrkGOC2q2Q/P1sH0cb42taoJEZw9YeZA83aPkK6awDUNrKunK+7p/pFUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583328; c=relaxed/simple;
	bh=BL6Z+voIGwIsWhm0phq/D/idBdSZPnz70jbcM7ux3Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovq44CqPGufZi8VOTXUSGz2PCElIDIQaeQVrSPc2dRRaxY9A9/BwcSiMcsW4AGsstWNXndk5uQU/RKiXsxcAneB7a7368Q5vc/KuOV8MyUkK/ZH7BTRP1YDt+qTtzZQy8MB2keyOxjoCBOt7vbWbfxMBwyfI+lDqGN5iCNCXi70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djKNNPK5; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djKNNPK5"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-652f220595fso1971334d50.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583327; x=1777188127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpLv4VorG3e/PvLK4DsPMVMbON3sIU3dLMmtkXlGlps=;
        b=djKNNPK5pGs53+K5pCbDinQ9mIA8ii1/kNJUbs+1sRZOdqxlk3VEteVh61o9g+FQAw
         SpT1eB9OyfGnudInb7fCI7DqoQvd3vqgsjcI0hjpSlMSJ3Uc+EuO6Wf5OIuFG2sheIvL
         ZHWQPkIrsrtkeGLr7DOi/yI2TufGWE26HFjtMtiKTUEyz5d0CP/Km1HUkNZR7a5JuiZP
         bsASFG8kVftQHUSPfLYlcnmUhdjafD81NrxRb62g5hK42xovIDvF4D5GgPqzGVIdEekR
         e7hNI7Mkw8B4SGq02THKrcmkCJP1h74b3NeMUHz0wVwDsRB94q+Ld1OvDaXlmDmmgYqb
         UU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583327; x=1777188127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpLv4VorG3e/PvLK4DsPMVMbON3sIU3dLMmtkXlGlps=;
        b=cTKa1SWGtpneaM3u+iU1+DxcbFOZY+fwfLjyv8D14zNo51CK+X6+Y8RzdKTnLSSZ4Q
         Y8hFU0VFTXgkh9ekNm9yt70ziN5MYT7VvfRBvYqlAX8i2suW66yAFQmaiiGB5iCOoDqi
         V746WaSva9rnwmbrD3p5xo7BHGGHiXgE0yANWD1KRHyTBnWqTHyeLQto9+LNRGoZkIOp
         rKTow3bj7m6RnGPWCIJOkZH71XL4y4pW9i7Km0UzpMg2f1KB5I6KzenbomolhD583p31
         V1faL6+r59mD7/fxJLdsEkyudpXG/HoYT7V46GHuItoqtw2ceDBIluu4qI5Z1XD3pVH7
         4swA==
X-Gm-Message-State: AOJu0YwplzAQCDH9vAdMmsfXGrjbbdlr/1HK7TwsY+sjvhHP/8vcYkCl
	GSYCi6ayRaW1Uv8ePRK39/C26F9iAYcA1qMzQbdeHN9OvxUVAHAmbEdV
X-Gm-Gg: AeBDieuf4C31b8YaI334iJYg83fkdeEauRcboBDONRN/xNqO/etQ2VomXPmeFu2GdQ8
	xjImEc7OIBs6dUVLtMhjMc0E2mkEUWqB5Zy4yMUj1sp/G9YT5fDhdpGM8zBAmiUtjt3v6EgbGcb
	Vnua2DVQ5ik6wPJzZKOjpvyUQIuXqq0sNbBdzVHMkH7Hz5ps5vMMQARNyIkqqrRKuQIr1BmqtqH
	WAww02rjX9pAYiaC997i/MvKOjDzo6MFMKQNK8IQYPlLEh3XzjZimFAaiLSql9t/MCUgPx4T24t
	6hWX2OdAt7aqVZNfNVIPQ7aQx1pJ7jguuUYI6MNNKYwAyEoXwij0DgZuKQGzJf1HCTA4kxcf0dL
	jCk90WQkNTDztmzy5jewtKW6iXRSPu8rw9UKJ4ivQDGNEIhR1K6vakOfJJ5+Xwmy0KJ4I/R2EiU
	JyIFNGKq2uDOCYZ35TYeT9PUlHEoKEOJBKKdA=
X-Received: by 2002:a05:690e:b48:b0:651:d1e1:5d70 with SMTP id 956f58d0204a3-65310a754c9mr8901049d50.54.1776583326588;
        Sun, 19 Apr 2026 00:22:06 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:05 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 05/11] staging: rtl8723bs: remove wrapper rtw_hal_free_data()
Date: Sun, 19 Apr 2026 10:19:31 +0300
Message-ID: <20260419072034.19824-6-nikolayof23@gmail.com>
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

Remove unnecessary wrapper and call rtw_hal_data_deinit() function
directly to simplify code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 6 ------
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 2 +-
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1322713fec6c..43b9bf9712c8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -7,12 +7,6 @@
 #include <drv_types.h>
 #include <hal_data.h>
 
-void rtw_hal_free_data(struct adapter *padapter)
-{
-	/* free HAL Data */
-	rtw_hal_data_deinit(padapter);
-}
-
 void rtw_hal_dm_init(struct adapter *padapter)
 {
 	rtl8723b_init_dm_priv(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index f46989ce9e3b..e7cfb255f8f6 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -181,8 +181,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-void rtw_hal_free_data(struct adapter *padapter);
-
 void rtw_hal_dm_init(struct adapter *padapter);
 
 uint rtw_hal_init(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 0685ed17a39f..bd42795fb1a2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -734,7 +734,7 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 
 	/* kfree((void *)padapter); */
 
-	rtw_hal_free_data(padapter);
+	rtw_hal_data_deinit(padapter);
 
 	/* free the old_pnetdev */
 	if (padapter->rereg_nd_name_priv.old_pnetdev) {
-- 
2.53.0

