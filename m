Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D908F76
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 22:52:53 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id q9so33158478ejd.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 15:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJIs643oAL5c/63LTolWUa5z+l7GDyqyf25JL0+db0E=;
        b=mBFIrX7TMv9ObbTZdo12IujkhmRytwBezp5HbgU1xl8eyQ7ss1XehZrk9Oc58S5xcp
         IuijQcvHRlMLRvTPbyd2+QX7iVyaecue/RyDvEry2UydgycpwAO1W5cyfxg9N/UM8vsN
         jlb+z5rmAnyVRtPzbT3mGLMzw417S/KO8wKEjwSbBjzSeDN7Wm/6BK+smBJ8h1K2aMK2
         MbzXMd3jNG5w+lh2sekm4NTNohB5X9shwYTvYEMLkpkXKddMKGm/Ir19zitmEmwa2UXF
         Sm9KfWkYejUwbqAKh1WSmp7u9iIG0uAPA8o5qlt3xf7ql7tTRt+QsMUqQC0nQnYVr0w/
         uEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJIs643oAL5c/63LTolWUa5z+l7GDyqyf25JL0+db0E=;
        b=jVIKJUciGk1k+bFjBLFy5AYjgwLaErjaM3+QIiKIU7CjXHZ9BX0teSFy5REARVZiT4
         B6v4heukYGP5ZjjzSo8HwVam5116pJwDqlSduDNDot3m7+XgY2+Wal509z23TBeog/k3
         lGHbEOE9SXEsjs0qL4J0P1wdkhXGtdikzSTk4GSOqzoDbbIgx++Fx2ip40gyKwBvlbxF
         +l3PdMIQVu0KcoM2vO2/PKOnZGOrusuJy/Cxlc4bAEB7KICGSvS5A/t/4G8ojXYMJggt
         BjwP/gWY3RmEudJwPWHpFVpR9dPI3ifXlGugLnOG8buqQt2ZYvLe0xBs9shHiXqqR2kr
         Hw9A==
X-Gm-Message-State: ACrzQf2/zoDnUpghjpbAclgOjHsCWHbsCS/JxL1udes0s/nGRwpvwCpi
	GXaPrEggO3im8tluhzvi914=
X-Google-Smtp-Source: AMsMyM7w8AzoadH2iGc6rbisb33dUQKpQylrnzfErOQ3aori+DoHmWVMutfUtFCxETGVgzKP5oMNSw==
X-Received: by 2002:a17:907:761b:b0:7a3:86dd:d330 with SMTP id jx27-20020a170907761b00b007a386ddd330mr15142348ejc.34.1667256771828;
        Mon, 31 Oct 2022 15:52:51 -0700 (PDT)
Received: from ZBook.localdomain (86-90-194-80.fixed.kpn.net. [86.90.194.80])
        by smtp.gmail.com with ESMTPSA id ux8-20020a170907cf8800b0078194737761sm3462098ejc.124.2022.10.31.15.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 15:52:51 -0700 (PDT)
From: Jerom van der Sar <jerom.vandersar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philip.g.hortmann@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jerom van der Sar <jerom.vandersar@gmail.com>
Subject: [PATCH] staging: rtl8192e: cleanup coding style issues with spacing
Date: Mon, 31 Oct 2022 23:51:55 +0100
Message-Id: <20221031225155.15678-1-jerom.vandersar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed several coding style issues in rtl_cam.c such as double blank lines
and lack of spaces around binary operators. It passes without trivial
warnings about spaces. Some other warnings still remain.

Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 25 +++++++++------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 41faeb4b9b9b..aeef735679db 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -17,7 +17,7 @@ void rtl92e_cam_reset(struct net_device *dev)
 {
 	u32 ulcommand = 0;
 
-	ulcommand |= BIT31|BIT30;
+	ulcommand |= BIT31 | BIT30;
 	rtl92e_writel(dev, RWCAM, ulcommand);
 }
 
@@ -40,7 +40,6 @@ void rtl92e_enable_hw_security_config(struct net_device *dev)
 		SECR_value |= SCR_TxUseDK;
 	}
 
-
 	ieee->hwsec_active = 1;
 	if ((ieee->pHTInfo->iot_action & HT_IOT_ACT_PURE_N_MODE) || !hwwep) {
 		ieee->hwsec_active = 0;
@@ -100,33 +99,32 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 	}
 
 	if (DefaultKey)
-		usConfig |= BIT15 | (KeyType<<2);
+		usConfig |= BIT15 | (KeyType << 2);
 	else
-		usConfig |= BIT15 | (KeyType<<2) | KeyIndex;
-
+		usConfig |= BIT15 | (KeyType << 2) | KeyIndex;
 
 	for (i = 0; i < CAM_CONTENT_COUNT; i++) {
 		TargetCommand  = i + CAM_CONTENT_COUNT * EntryNo;
-		TargetCommand |= BIT31|BIT16;
+		TargetCommand |= BIT31 | BIT16;
 
 		if (i == 0) {
-			TargetContent = (u32)(*(MacAddr+0)) << 16 |
-				(u32)(*(MacAddr+1)) << 24 |
+			TargetContent = (u32)(*(MacAddr + 0)) << 16 |
+				(u32)(*(MacAddr + 1)) << 24 |
 				(u32)usConfig;
 
 			rtl92e_writel(dev, WCAMI, TargetContent);
 			rtl92e_writel(dev, RWCAM, TargetCommand);
 		} else if (i == 1) {
-			TargetContent = (u32)(*(MacAddr+2)) |
-				(u32)(*(MacAddr+3)) <<  8 |
-				(u32)(*(MacAddr+4)) << 16 |
-				(u32)(*(MacAddr+5)) << 24;
+			TargetContent = (u32)(*(MacAddr + 2)) |
+				(u32)(*(MacAddr + 3)) <<  8 |
+				(u32)(*(MacAddr + 4)) << 16 |
+				(u32)(*(MacAddr + 5)) << 24;
 			rtl92e_writel(dev, WCAMI, TargetContent);
 			rtl92e_writel(dev, RWCAM, TargetCommand);
 		} else {
 			if (KeyContent != NULL) {
 				rtl92e_writel(dev, WCAMI,
-					      (u32)(*(KeyContent+i-2)));
+					      (u32)(*(KeyContent + i - 2)));
 				rtl92e_writel(dev, RWCAM, TargetCommand);
 				udelay(100);
 			}
@@ -152,7 +150,6 @@ void rtl92e_cam_restore(struct net_device *dev)
 
 	if ((priv->rtllib->pairwise_key_type == KEY_TYPE_WEP40) ||
 	    (priv->rtllib->pairwise_key_type == KEY_TYPE_WEP104)) {
-
 		for (EntryId = 0; EntryId < 4; EntryId++) {
 			MacAddr = CAM_CONST_ADDR[EntryId];
 			if (priv->rtllib->swcamtable[EntryId].bused) {
-- 
2.34.1

