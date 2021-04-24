Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ABC71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:41 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e7so41701879wrs.11
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUd9HxcHs367PrWd2VzT9ubkbPclmdBjBx4thm1/S1c=;
        b=pkG+Rf41rwJAQxzswPmXC3dUL8UELUIWMtuNNLzFagmTGP5nDxKR94ceazoRN/buhT
         ycS8AuGWboBOcPDEVXQcKkQarFszrt6qH5iUjaxwZuYuKO6oFtdSKcXIjEz38kdgIl85
         HrAZ8ZvYHN4Rx5SLJOEBzfSuS/LqbK8IzV/pX3aGhG486+2GZ61PMGfW/MsK4BoNUexu
         9H485AiGEKre3VuTe28tY8AnaW1nBbpt3PY9aSI56UsElncGPeeGWU2aGIWDbpOHxFDB
         +/hrMJanNUZrDLcCDYzV9bRWArSnREGxhBC5PVYghsGyvQ+s7w5ZZOIQikGXX/AfiYTB
         VkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUd9HxcHs367PrWd2VzT9ubkbPclmdBjBx4thm1/S1c=;
        b=tKp+urfWh7biMi9rBXWJ3kXMSAxAjJWxw6rtLvK1YeK7LtFsCh67nzCgbdFMx916uF
         v9y0pChPUQ3GmOsAmUs5+j87iT2RoXoTlBsB+MGG8FMsFf6vDU3g9PLUGpwET0Im3s3l
         IB/6Ouv0hdlM6ub6v2xmqeU/0N5vSslTemRb1NqoZnczdKklVSrhT6bANuwZ0a3HBZkw
         bJQoPXIyQ0fwakoAjWDoDe3Hi2mGrsBvbFfdjp4h6WGRNMtoB4rdbfNsgaZvSPopNYzS
         xteushUxSFzm6ognixUjzPTHv8fx1tHulntvCoIDInaEyy5TeGx2k+ILAOz+Xz5WP7PA
         rsPw==
X-Gm-Message-State: AOAM530SILBbafHLPvsl3Auf9w5inBmSqvVofueEcyW8NznDOA4Xh2/B
	MbLq4KukxzxWQmb4uQHOzPg=
X-Google-Smtp-Source: ABdhPJygfG0NALyHPu0gj5S3qg5ZlRtmrfGyoRLWw7vzEkSLOX0/0WVwUs7N5+oZrV5IPGlENrxQUw==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id i7mr9924685wry.9.1619254960622;
        Sat, 24 Apr 2021 02:02:40 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id u8sm11211038wrp.66.2021.04.24.02.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/50] staging: rtl8723bs: add two functions to improve register dump in core/rtw_debug.c
Date: Sat, 24 Apr 2021 11:01:46 +0200
Message-Id: <0f3300e6b07f811c0d3fc9c6dd46e5270dfb7a54.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Beautify register dump by adding two functions printing
four register values per line. This is necessary after
old macro replacement with netdev_dbg(), the former
wrapped a raw printk, the latter
prints lots of driver information overhead per line
for each call. So avoid this noisy behaviour by dumping
four values on each line.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c | 63 ++++++++++++----------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index a43fa38cae62..0e13a226e9be 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -14,41 +14,54 @@ u32 GlobalDebugLevel = _drv_err_;
 
 #include <rtw_version.h>
 
+static void dump_4_regs(struct adapter *adapter, int offset)
+{
+	u32 reg[4];
+	int i;
+
+	for (i = 0; i < 4; i++)
+		reg[i] = rtw_read32(adapter, offset + i);
+
+	netdev_dbg(adapter->pnetdev, "0x%03x 0x%08x 0x%08x 0x%08x 0x%08x\n",
+		   i, reg[0], reg[1], reg[2], reg[3]);
+}
+
 void mac_reg_dump(void *sel, struct adapter *adapter)
 {
-	int i, j = 1;
+	int i;
 
 	netdev_dbg(adapter->pnetdev, "======= MAC REG =======\n");
 
-	for (i = 0x0; i < 0x800; i += 4) {
-		if (j%4 == 1)
-			netdev_dbg(adapter->pnetdev, "0x%03x", i);
-		netdev_dbg(adapter->pnetdev, " 0x%08x ",
-			   rtw_read32(adapter, i));
-		if ((j++)%4 == 0)
-			netdev_dbg(adapter->pnetdev, "\n");
-	}
+	for (i = 0x0; i < 0x800; i += 4)
+		dump_4_regs(adapter, i);
 }
 
 void bb_reg_dump(void *sel, struct adapter *adapter)
 {
-	int i, j = 1;
+	int i;
 
 	netdev_dbg(adapter->pnetdev, "======= BB REG =======\n");
-	for (i = 0x800; i < 0x1000 ; i += 4) {
-		if (j%4 == 1)
-			netdev_dbg(adapter->pnetdev, "0x%03x", i);
-		netdev_dbg(adapter->pnetdev, " 0x%08x ",
-			   rtw_read32(adapter, i));
-		if ((j++)%4 == 0)
-			netdev_dbg(adapter->pnetdev, "\n");
-	}
+
+	for (i = 0x800; i < 0x1000 ; i += 4)
+		dump_4_regs(adapter, i);
+}
+
+static void dump_4_rf_regs(struct adapter *adapter, int path, int offset)
+{
+	u8 reg[4];
+	int i;
+
+	for (i = 0; i < 4; i++)
+		reg[i] = rtw_hal_read_rfreg(adapter, path, offset + i,
+					    0xffffffff);
+
+	netdev_dbg(adapter->pnetdev, "0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n",
+		   i, reg[0], reg[1], reg[2], reg[3]);
 }
 
 void rf_reg_dump(void *sel, struct adapter *adapter)
 {
-	int i, j = 1, path;
-	u32 value;
+	int i, path;
 	u8 rf_type = 0;
 	u8 path_nums = 0;
 
@@ -62,13 +75,7 @@ void rf_reg_dump(void *sel, struct adapter *adapter)
 
 	for (path = 0; path < path_nums; path++) {
 		netdev_dbg(adapter->pnetdev, "RF_Path(%x)\n", path);
-		for (i = 0; i < 0x100; i++) {
-			value = rtw_hal_read_rfreg(adapter, path, i, 0xffffffff);
-			if (j%4 == 1)
-				netdev_dbg(adapter->pnetdev, "0x%02x ", i);
-			netdev_dbg(adapter->pnetdev, " 0x%08x ", value);
-			if ((j++)%4 == 0)
-				netdev_dbg(adapter->pnetdev, "\n");
-		}
+		for (i = 0; i < 0x100; i++)
+			dump_4_rf_regs(adapter, path, i);
 	}
 }
-- 
2.20.1

