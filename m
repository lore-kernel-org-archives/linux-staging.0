Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2D6D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r6so24381254wrt.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtmhvsJdqPkMnYsMNIGvFebAayQbkSbM/W6IHwQOHRM=;
        b=D//tp1t7I07p30xyDJtaCwWTfFhCnoz6eGUHcgbbrcVjDhFy0RbdZwGQhVJ4BK7QmU
         wNgQeIwaZWvczpZygOBQndq5PsRWTZHEWa9ecEBzO+/zQaGBbhVbQA1uDSibrsgYTZAk
         unWmhOi9S8y+mACnD/HidVGLidjSe4CDdxVEVyV/7zJteofz6EFxySEnEa++h+ONtuEr
         FEheQUCXGHIieE1cIpUANNMi/2lkJkFS8NlM/YNpN01QU3wZcee2zVMB4dg6xuZS+ss8
         3MDIuVQvRzqE2AsJ54t20/s54C2IkibTF3DcPZbZMAzwymOvtPQv50cSme87gvchg4pX
         dXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtmhvsJdqPkMnYsMNIGvFebAayQbkSbM/W6IHwQOHRM=;
        b=bTRZzqOpPeWuX7/iHO/gof6Ej2lSftnRAQ4oT4KuU/UkGtqDxKN5h0KgXvYS72+yQV
         NO1ZzoAv3KCd4g+Qfm2itrynR2IvBjOOqX5/8X6gFax9qdgZ42CSYubMDNQw2jJOO5Qt
         x0Kl5jSgkkPvLPrfCPbxtYbwaDOnzDIktDqUbSyo7EqmLwJjzGGXY30/OmD5QuFo+wHv
         FKRJe8lQ+ZFbRPTUWV0kAFBuQ8HsAfmRUtDoEW6Qz7u++nDJYSDEEoN4CA9Cl8FiYUGu
         Ir//yrNyGi9gpvzz/iEaNni7kSe2IsyRKsF+DUjFPYo8aUkPB8S3fBOQiMOSgUxkW4RX
         rCmg==
X-Gm-Message-State: AOAM533LXDFz4wKgkOFhAmNEUYL/0lIWZibPvhrY/ifQrmKFAvaW+Tr/
	Vz4korFPmDlc3qxXevL0LXM=
X-Google-Smtp-Source: ABdhPJxWHojxzpe6W7WAKA8B2ZmPNG6xjUzgLRa6cxY937YZnyWiTf7ZCgUc3pmXijeyH3FXso9nlw==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr18678593wru.44.1629129583576;
        Mon, 16 Aug 2021 08:59:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 20/23] staging: r8188eu: clean up spacing style issues in core/rtw_debug.c
Date: Mon, 16 Aug 2021 17:58:15 +0200
Message-Id: <20210816155818.24005-21-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up spacing style issues in core/rtw_debug.c reported by checkpatch.

CHECK: spaces preferred around that '%' (ctx:VxV)
WARNING: space prohibited before semicolon

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_debug.c | 42 ++++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
index 771f62452498..2ee64cef73f7 100644
--- a/drivers/staging/r8188eu/core/rtw_debug.c
+++ b/drivers/staging/r8188eu/core/rtw_debug.c
@@ -309,10 +309,10 @@ int proc_get_mac_reg_dump1(char *page, char **start,
 	len += snprintf(page + len, count - len, "\n======= MAC REG =======\n");
 
 	for (i = 0x0; i < 0x300; i += 4) {
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", rtw_read32(padapter, i));
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 
@@ -332,10 +332,10 @@ int proc_get_mac_reg_dump2(char *page, char **start,
 	len += snprintf(page + len, count - len, "\n======= MAC REG =======\n");
 	memset(page, 0, count);
 	for (i = 0x300; i < 0x600; i += 4) {
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", rtw_read32(padapter, i));
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 
@@ -355,10 +355,10 @@ int proc_get_mac_reg_dump3(char *page, char **start,
 	len += snprintf(page + len, count - len, "\n======= MAC REG =======\n");
 
 	for (i = 0x600; i < 0x800; i += 4) {
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", rtw_read32(padapter, i));
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 
@@ -377,10 +377,10 @@ int proc_get_bb_reg_dump1(char *page, char **start,
 
 	len += snprintf(page + len, count - len, "\n======= BB REG =======\n");
 	for (i = 0x800; i < 0xB00; i += 4) {
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", rtw_read32(padapter, i));
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 	*eof = 1;
@@ -398,10 +398,10 @@ int proc_get_bb_reg_dump2(char *page, char **start,
 
 	len += snprintf(page + len, count - len, "\n======= BB REG =======\n");
 	for (i = 0xB00; i < 0xE00; i += 4) {
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", rtw_read32(padapter, i));
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 	*eof = 1;
@@ -419,10 +419,10 @@ int proc_get_bb_reg_dump3(char *page, char **start,
 
 	len += snprintf(page + len, count - len, "\n======= BB REG =======\n");
 	for (i = 0xE00; i < 0x1000; i += 4) {
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", rtw_read32(padapter, i));
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 	*eof = 1;
@@ -444,10 +444,10 @@ int proc_get_rf_reg_dump1(char *page, char **start,
 	len += snprintf(page + len, count - len, "\nRF_Path(%x)\n", path);
 	for (i = 0; i < 0xC0; i++) {
 		value = rtw_hal_read_rfreg(padapter, path, i, 0xffffffff);
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x ", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", value);
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 	*eof = 1;
@@ -469,10 +469,10 @@ int proc_get_rf_reg_dump2(char *page, char **start,
 	len += snprintf(page + len, count - len, "\nRF_Path(%x)\n", path);
 	for (i = 0xC0; i < 0x100; i++) {
 		value = rtw_hal_read_rfreg(padapter, path, i, 0xffffffff);
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x ", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", value);
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 	*eof = 1;
@@ -494,10 +494,10 @@ int proc_get_rf_reg_dump3(char *page, char **start,
 	len += snprintf(page + len, count - len, "\nRF_Path(%x)\n", path);
 	for (i = 0; i < 0xC0; i++) {
 		value = rtw_hal_read_rfreg(padapter, path, i, 0xffffffff);
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x ", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", value);
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 
@@ -520,10 +520,10 @@ int proc_get_rf_reg_dump4(char *page, char **start,
 	len += snprintf(page + len, count - len, "\nRF_Path(%x)\n", path);
 	for (i = 0xC0; i < 0x100; i++) {
 		value = rtw_hal_read_rfreg(padapter, path, i, 0xffffffff);
-		if (j%4 == 1)
+		if (j % 4 == 1)
 			len += snprintf(page + len, count - len, "0x%02x ", i);
 		len += snprintf(page + len, count - len, " 0x%08x ", value);
-		if ((j++)%4 == 0)
+		if ((j++) % 4 == 0)
 			len += snprintf(page + len, count - len, "\n");
 	}
 	*eof = 1;
@@ -801,7 +801,7 @@ int proc_set_rssi_disp(struct file *file, const char __user *buffer,
 
 		if (enable) {
 			DBG_88E("Turn On Rx RSSI Display Function\n");
-			padapter->bRxRSSIDisplay = enable ;
+			padapter->bRxRSSIDisplay = enable;
 		} else {
 			DBG_88E("Turn Off Rx RSSI Display Function\n");
 			padapter->bRxRSSIDisplay = 0;
-- 
2.32.0

