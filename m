Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3A77B
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 22:29:32 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id kt23so40688044ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G74Wuy6JUbEZeguR9z8D5PigaA7SQEA2iQsub/0ykr4=;
        b=Wh/schGSPH2trCP5hnARhLA/9Na4tDKwK5YAadg5v8IoqogJ7WV1qKrcaEVjDOhax6
         mZ3rNlzr8APzJ28E6BJLyK3LglC94wCYp62W2KuWi6EhiJJE4ywYUex5rEGfP4LiKlyk
         Kn/esG2/3Pv7EVyy2+mnvTBF+F2V4nKAKklHu0GLrHAl6e9PqyVm6M/Jhp4vJZmXvaX6
         EsG6P8+V8W4HCgUgPeFa8+VMBIR+Ba48SzZrsGTRLhB295bEo+vLk7EkdWUaN+QnSafs
         zbTmtzklEQ2RrsI2lNEqQD74g1w9N8h0IBdU2Jsw726yz/T4S3plQmNOEVbmD/JRttHz
         n1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G74Wuy6JUbEZeguR9z8D5PigaA7SQEA2iQsub/0ykr4=;
        b=kQrYqWUnFrfGaX8OrAEISHOpsGBv0iQhlS0nSGo6fmeOVsB8aA1nFy5hqjzSa3AUuI
         QcKlfllXsD3VwC09wFU5XXcxtPVGQGecoYdxB0Mv0gQA5J3qZEAOWAlmEtUtldWuaz7s
         3zAfUaKLU5YP+6kw+LvcO+ZRqJ4VlTCEpUt/kXYL25bi9uX1xyG14UHd2oZm7WliMWc0
         YB297BrOghs51/5uy7UX4MNrjv5B4ypSjJYOSErJqzj+RPCBkOzUIWKTQXeETG5JtzOB
         /T/t7WmFIZjE7nSiLNFOrLWCelvCqqsOei3bnkHvdHHW0orhEI+qLSFkF03auP8wQEzc
         yI3A==
X-Gm-Message-State: ACrzQf3qBZbh/XfdfyiAVcvahQB7XKM9hAZFvMBCTSejA8qDR7E5KN8l
	ehJmkpYMyjGAkHo9bsjhxNU=
X-Google-Smtp-Source: AMsMyM4f8eMxJOLzvij00f87n2slJuioPe1icpzbqIX3dgqUzFUi38de5v2xR40Tzb4RnYudA6Ek7g==
X-Received: by 2002:a17:906:8477:b0:7ad:9ada:a6a4 with SMTP id hx23-20020a170906847700b007ad9adaa6a4mr20744760ejc.674.1667341770785;
        Tue, 01 Nov 2022 15:29:30 -0700 (PDT)
Received: from ZBook.localdomain (86-90-194-80.fixed.kpn.net. [86.90.194.80])
        by smtp.gmail.com with ESMTPSA id f15-20020a17090631cf00b007a03313a78esm4650773ejf.20.2022.11.01.15.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 15:29:30 -0700 (PDT)
From: Jerom van der Sar <jerom.vandersar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jerom van der Sar <jerom.vandersar@gmail.com>
Subject: [PATCH v3] staging: rtl8192e: space formatting fixes in rtl_cam.c
Date: Tue,  1 Nov 2022 23:29:00 +0100
Message-Id: <20221101222900.4681-1-jerom.vandersar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f391a7cd-e57a-0643-1ba1-c859bf2f83a6@gmail.com>
References: <f391a7cd-e57a-0643-1ba1-c859bf2f83a6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a few coding style issues in rtl_cam.c such as double blank lines
and lack of spaces around binary operators.Some other warnings still
remain. These issues were found by scripts/checkpatch.pl.

This patch helps clean up the rtl8192e driver in staging, making it
easier to read and maintain.

Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>
---
Changes in v3:
  - Fixed faulty dot at the end of the patch sign-off.

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

