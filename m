Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7733FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id lc21so15112747ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iEzDdyzAFFu2bR5f0c3Tr73sdtBpa1SXUiajkJlqtqo=;
        b=oCWD0EZgpZb9yKwmJ1UUF0XlvAGzOB1JuDgS7TQQhnpabqYDVjlc3NdLtxxd6piV7Y
         MJ9SaHUymGC0j28N5Bc5pZVV10d78+MH4xlHy/FLb+5HRvGlSsS9Zajvv+ld7vNtUk/I
         0YyMd32dkyu2rIWKHvQcG+V+Y+spieJ8XViDhystR46ddhEmeMSTtZm80wv8nwqWF6qp
         6WUj+scaVSiXFvGEkTSBx+MQlmLP7qW2ShVH1nF/TJU3KRV92X7qo04Wl2FJuSgqMIRs
         +R46Kp9voWgyHJ7ZksM7IdBDBdwG/UZHaRbFmUHSd7lN/yL4mJ8pkLTNJqYh+OBPzN3Q
         Xddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEzDdyzAFFu2bR5f0c3Tr73sdtBpa1SXUiajkJlqtqo=;
        b=Bh3xK7YfJ1zMYsX91C68k4asJ7pM1bWxaSIMK03y6xpTtRgeAo6lKtVz1vzqJ1P9Nj
         GVgL7N6qBSAHXwlfhLlNQzyBxUqU045j6zqLrx4OpukXNpvbIvegh5hc2LwOMRH7GSwt
         jFkK6uDdNs4W4Q7dCbIELdsrcvMYCIyjv+gzHme+pFBK+uDiDrERn5wQDlyoDfROAxTu
         1lGPB1cTxai44yji//B5FNV8zGcs+Wk3NsBKgYpwsOCI1kCon2gpIqEXFp4KiVH6tYvK
         HDbb81pnfYIVJiCC3QPxZsTa/DzGEDMrkCjpfBMpVQelD1r+pT6pBWJY5m+vdBCCBWBD
         jlAQ==
X-Gm-Message-State: AOAM531QjpiL6gqniXu6q9YN0kblNeEm0CT4HMzhwZ7vPCGZrGCHrhRR
	B9cgJlwTmFxKNKVglPojOgs=
X-Google-Smtp-Source: ABdhPJzuJhjGgKsfpbj3ZkO6bF3+sAZRqiAjhDYHmUhchpk6bJUezSmR6azKOw2EAxW9Zb70vuA64A==
X-Received: by 2002:a17:906:fb19:: with SMTP id lz25mr15122371ejb.162.1630954985392;
        Mon, 06 Sep 2021 12:03:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 27/40] staging: r8188eu: remove empty comments
Date: Mon,  6 Sep 2021 21:02:10 +0200
Message-Id: <20210906190223.11396-28-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty comments.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index bae9a32ec27e..9196a7925940 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -25,10 +25,9 @@ u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 /*------------------------Define local variable------------------------------*/
 
-/*  */
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
-/*  */
+
 static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
 					   u16 Offset,
 					   u8 *Value)
@@ -364,14 +363,14 @@ u8 rtw_efuse_access(struct adapter *padapter, u8 write, u16 start_addr, u16 cnts
 
 	return res;
 }
-/*  */
+
 u16 efuse_GetMaxSize(struct adapter *padapter)
 {
 	u16 max_size;
 	rtl8188e_EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, (void *)&max_size, false);
 	return max_size;
 }
-/*  */
+
 u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
 {
 	rtl8188e_EfusePowerSwitch(padapter, false, true);
@@ -380,7 +379,7 @@ u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
 
 	return _SUCCESS;
 }
-/*  */
+
 u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u16 mapLen = 0;
@@ -416,7 +415,7 @@ u8 rtw_BT_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 
 	return _SUCCESS;
 }
-/*  */
+
 u8 rtw_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u8 offset, word_en;
@@ -508,7 +507,6 @@ u8 rtw_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 	return ret;
 }
 
-/*  */
 u8 rtw_BT_efuse_map_write(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u8 offset, word_en;
-- 
2.33.0

