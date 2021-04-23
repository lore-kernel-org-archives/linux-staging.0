Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405A070
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c15so39763895wro.13
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zuLarW/DVl6DwK0Y58hVKAVu2th5zfZnIaCNSJUZPc0=;
        b=WSIFdjcpcTC5uXwaIzV/hAdZmJCGigXNV0Qyo1mLXvgQDRx0cz1hQ5wUcCpgef6mvu
         EF0h1F+MLOfH2y9/+8Opo1O4BN78stJU6ATMyXR150Z/8O1tPKyuK5Hm9pvZPg86HR2N
         QC6iTeCNewWthvuVwW27FrurxLJ//M9jSpy0FPraGTR4TES0+KrtCz5Q31CUoWKL+3LA
         rluMM98T597E66O84L+CHwuG4o75zMTYidOHb0/tZH/eEFp1dTchBLNKJTdzsTEeLQI/
         vHQaamyiClM8J4bmoeb6n4dMSbJd9pM4lZ2xsOFkeW/R5ikJLGzuq13CssD9futfhq7a
         EX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zuLarW/DVl6DwK0Y58hVKAVu2th5zfZnIaCNSJUZPc0=;
        b=GeEXqHSoiNR3oKX3Q0uVV4HR1LdAgYYEHp4PqFWcd5XAJtDpv1lkrD8XBmkCO2eXi6
         jtGcNAreyEXHxIeFNsPWEMGIucnyDTwSBKD8o6WPQuUvhMXtPtlS3ZkIkmv4WEuarHFj
         ndsgSwR4svy3aH5a+on2HE47oJodZRFX28OH58GaBIdzNydzjBsFLtibgVJNvpvuwY/0
         DKdJglq2z3itku0620z8DAAbCgNy3+PjF1OIx44dW7Dd6WhiPeym+V55qQmAONQFJuLo
         JIjpP7cOjyb2HLTEqfW9U9Umv/ox5mIVuuuk3TkU+Y70jY9HW6RcrCIU8nBR7YXrtSC7
         V6zg==
X-Gm-Message-State: AOAM533FRSYw8pyii5fKpB04TriDEi2yiwpPqm077+jESWlu0PDAIoxk
	QYfwEVAs9p4c3D9x8tM/DCU=
X-Google-Smtp-Source: ABdhPJwULsfljnk+PkDpEXfvvZJ7PyihSMatlJGM5U51itZGZ3ubZHS8VzSwcssbs1bFgaq7v36/0A==
X-Received: by 2002:a05:6000:22d:: with SMTP id l13mr5350233wrz.26.1619189923865;
        Fri, 23 Apr 2021 07:58:43 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id f6sm8014024wmf.28.2021.04.23.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/49] staging: rtl8723bs: remove unused log function
Date: Fri, 23 Apr 2021 16:57:52 +0200
Message-Id: <397a4082fa2a49c67ac7d6869284334d3fa7bea6.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
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

