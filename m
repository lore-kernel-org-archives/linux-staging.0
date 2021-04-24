Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCD71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:38 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id p6so44010127wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zuLarW/DVl6DwK0Y58hVKAVu2th5zfZnIaCNSJUZPc0=;
        b=e6ZKJwnLY4gzBIzPuaVFA528n/+CRTX1v2c8sZ0W9hYqI/6vJXa5EhEYi1bi8130S7
         wUXf3le7ANi+gVI8jHO7eQci3PyAUtDsIR3Tvyc8Mt8Jci6loL10gd7BtIlQ9qtKhcmE
         egdl1e6yIh0Nc1g5/87FysV+ko/m4Pb23URnC9+UPdTcGXILxClolcfWQPalWxde979V
         gVzSlUO00ExouwSSfKV8SbpFNrnt1kDn2lyXz6OWAq8BmL4me83iD3kxM7eTgr5LVJbO
         cS6wYHHjv09DwId10STfDZc8vdcPahT4hDfIrFUgsnx23FitM0lsSgJSx2x/yK8LypZ/
         /GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zuLarW/DVl6DwK0Y58hVKAVu2th5zfZnIaCNSJUZPc0=;
        b=SM2E+MLZtLBQW/wmlGbvZOeyvfw17iW1ISoJX3yVCBjCGvTwB5AnLwCGHa/u+Iy3Kr
         W7ezuc49bG8TdyS4Evfr+2XQRyi18+1wZcYcgvmn0jXDaZk7fkAlCz7zuU4HqlvlACje
         o5vcP+YZl2H53IG3UJKBTOh6xRmRypqMwMfMcD0UFP20aDc2y4tf2H+OW89GYnasZDa4
         k4A1QgDYmAAoe4Ltc6gYoAuT6fuJq59YRFiAmKZnqXAbZ4Wx2AEFv7D0dLi/uwN5XFOH
         96Me996ggU5SWccr3KtoWdm8672isnaOg0751ETIxvS3IsvyKktZzvlaCE7+AFb7cMd4
         o/aw==
X-Gm-Message-State: AOAM533hDm0rghW+jRMHIWE0UHpL9N/+Dng5ubUm7paOP/GFNvVyhFUm
	uE1g1iE31gDmuh3ZKjopCq+rXexhsLTa0g==
X-Google-Smtp-Source: ABdhPJzPYUEwm/BNOUR+v3uYYdJxDosIVAe2ZQo2OinO2HQimsqaCenwoGCm3ThXk3xWoKt/TfaMaw==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr9793184wrp.368.1619254957221;
        Sat, 24 Apr 2021 02:02:37 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id z17sm12115834wro.1.2021.04.24.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/50] staging: rtl8723bs: remove unused log function
Date: Sat, 24 Apr 2021 11:01:44 +0200
Message-Id: <397a4082fa2a49c67ac7d6869284334d3fa7bea6.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused sd_f0_reg_dump() function.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 17 -----------------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  2 --
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 79fd968bb147..0ee0190c09d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -14,23 +14,6 @@ u32 GlobalDebugLevel = _drv_err_;
 
 #include <rtw_version.h>
 
-void sd_f0_reg_dump(void *sel, struct adapter *adapter)
-{
-	int i;
-
-	for (i = 0x0; i <= 0xff; i++) {
-		if (i%16 == 0)
-			netdev_dbg(adapter->pnetdev, "0x%02x ", i);
-
-		DBG_871X_SEL(sel, "%02x ", rtw_sd_f0_read8(adapter, i));
-
-		if (i%16 == 15)
-			DBG_871X_SEL(sel, "\n");
-		else if (i%8 == 7)
-			DBG_871X_SEL(sel, "\t");
-	}
-}
-
 void mac_reg_dump(void *sel, struct adapter *adapter)
 {
 	int i, j = 1;
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 23f4cb4711d4..ed75db1b16f8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -169,8 +169,6 @@
 
 #endif /* defined(_dbgdump) */
 
-void sd_f0_reg_dump(void *sel, struct adapter *adapter);
-
 void mac_reg_dump(void *sel, struct adapter *adapter);
 void bb_reg_dump(void *sel, struct adapter *adapter);
 void rf_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

