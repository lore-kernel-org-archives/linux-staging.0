Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03C7B
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 21:54:16 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id kt23so40488536ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifr2udJQaykytNB8WSuWQEM/D/tWuwVDxhVVtYTxuG8=;
        b=WHSj1s3RA0vwjR99/GJ4uAjcFD8u1uXQuvv7saw5RYWmUgG46nLc7CyDa08YDbqYgq
         AiAI0cpKPA+D/InnucH5k3hJ3Azx/IzCVIc4zLpY7WUcV9AATllpBSps+JDcacQCBcTa
         eiCVG6GXxj2G73byshAFtbVg9+oxs37rjEZlfPOH44ejSE8xBR5+wvCFsFGRYDQK8H2Y
         8c0MyFV63Zn9EZ0acrNn6hGS9nMsth6PtAJzXrdPfh6GItbkc/12+2dtLVreenpPt0Mp
         NnQGcRgD4zvf0RRaIgYMzU2mrftJqewg/pTf9+0Sh2eCXTLreM0iZWO0HTb9o0BWvxuk
         sA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ifr2udJQaykytNB8WSuWQEM/D/tWuwVDxhVVtYTxuG8=;
        b=F+wiVpHGjfWt+UM/Cq8u8EyL8aGm4mSkS4s8LVJnxq1OWhiKvkIjnPuK6q7LX7f3jz
         rmJbRS8m0QPiXa1XcxaWIcNGbvMVs4PYnhQA1zhgeXtnlfs5ASumZOmPpnVeVRm3obM3
         ZhAlPvEkUC7voj/fcSNapWryJtqxntQUqVJL2VAhDHaBjdrRKnaaLzek1Yd1tXk7pOcN
         kLoRKMC1lh7lBrkKA/s7kLl2YUwWTbxQ3M4hle+qXqYU7GyJey6YpJIkeodUsDEHUa4r
         SsrKFwa/LeL6g+lNaIg7Zk1AoXKis6Z5rOEY6WoaKZTYajHSLImCaqI+n0tcZLSj+ZKl
         e2OA==
X-Gm-Message-State: ACrzQf0FArGmELF8fUmcoqzmm+GzGu+414C9WKUFiv7c1WfXh6HI01ve
	cihl+RtfNs7kY0XE16b/nYE=
X-Google-Smtp-Source: AMsMyM50IGdCSOamunZKGC5uD89LokM+MpbjYBTKKc038M5wHgwEvNmfkzJyGeY/kDyRtuqZEaO/vA==
X-Received: by 2002:a17:906:4917:b0:7ad:f9d6:9435 with SMTP id b23-20020a170906491700b007adf9d69435mr2270312ejq.238.1667339654824;
        Tue, 01 Nov 2022 14:54:14 -0700 (PDT)
Received: from ZBook.localdomain (86-90-194-80.fixed.kpn.net. [86.90.194.80])
        by smtp.gmail.com with ESMTPSA id cq11-20020a056402220b00b00458478a4295sm692684edb.9.2022.11.01.14.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 14:54:14 -0700 (PDT)
From: Jerom van der Sar <jerom.vandersar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jerom van der Sar <jerom.vandersar@gmail.com>
Subject: [PATCH v2] staging: rtl8192e: space formatting fixes in rtl_cam.c
Date: Tue,  1 Nov 2022 22:52:47 +0100
Message-Id: <20221101215246.4442-1-jerom.vandersar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7d001a49-4e45-fda2-15fe-b05f2c340eaa@gmail.com>
References: <7d001a49-4e45-fda2-15fe-b05f2c340eaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a few coding style issues in rtl_cam.c such as double blank lines
and lack of spaces around binary operators. Some other warnings still
remain. These issues were found by scripts/checkpatch.pl.

This patch helps clean up the rtl8192e driver in staging, making it
easier to read and maintain.

Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>.
---
Changes in v2:
  - Reverted some formatting fixes to make the diff easier to review.

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 41faeb4b9b9b..d5aaf24a0ddb 100644
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
@@ -104,10 +103,9 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 	else
 		usConfig |= BIT15 | (KeyType<<2) | KeyIndex;
 
-
 	for (i = 0; i < CAM_CONTENT_COUNT; i++) {
 		TargetCommand  = i + CAM_CONTENT_COUNT * EntryNo;
-		TargetCommand |= BIT31|BIT16;
+		TargetCommand |= BIT31 | BIT16;
 
 		if (i == 0) {
 			TargetContent = (u32)(*(MacAddr+0)) << 16 |
@@ -152,7 +150,6 @@ void rtl92e_cam_restore(struct net_device *dev)
 
 	if ((priv->rtllib->pairwise_key_type == KEY_TYPE_WEP40) ||
 	    (priv->rtllib->pairwise_key_type == KEY_TYPE_WEP104)) {
-
 		for (EntryId = 0; EntryId < 4; EntryId++) {
 			MacAddr = CAM_CONST_ADDR[EntryId];
 			if (priv->rtllib->swcamtable[EntryId].bused) {
-- 
2.34.1

