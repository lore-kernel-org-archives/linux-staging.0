Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E982FB2
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 16:25:59 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s17so39825983edd.8
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=doJVy0cq4BLRkopPldgH5fW9iudLJB7gkjMw95czSyE=;
        b=iodbVOxYZRwBrZffAdWwBqiNsRhJRzeBOLsGUB2lv73Gv/zJg5f++xWYYl+FVT3Om2
         D/URzkqm4nJeggJ1GUv/ch7VG4Fu0Sjq2W+F+E6PTheftyYjJ41tg/ISNS0HCGn0/ko/
         6qT1lH/6QeUYDhhRIHCczGOKFp9IbsupsIn/+x+PkeWWr1pm9RnP5+Fg7Q5TH9BmNg0J
         bpEr11LB0Gkx2JqdWUoiLtJYRUK0zsrk3hS0z3JhlCW80Df52HH/MTYSyoJ/RssaNyg1
         +0oauTk/IhDwM67gdr0BktLf0x5569sKGaEfTwmk3FlfMs/AlrHSlM+sV5WS34fLhhnO
         hrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=doJVy0cq4BLRkopPldgH5fW9iudLJB7gkjMw95czSyE=;
        b=MyHg+EuB51T03wn9FPPAw8t4Z4PAnbCDZ66ZXXMl1PZfEHPAqMvaPKW5zs8GqUyPDq
         UVCvTQAMg1EERcF5P/ev79jD/ZFYQdIQ8IEv0003FcJD235tO0mMMaKO9woZ0hxJdJmS
         jNUA+95OyTg6rZ5F9Jtk43J9LDhGG4/VR278wc4J+GgWpV8gboTQIogf/8Ef3A/9vkLV
         XrkJzaOPrIScPuWwk+zYgXk4JOLUkxbn23FGn4YWjH/dxHgv54xC8wsc6P5Kt473dXkA
         ccKudApdothmubuC92L536rGY8liQHksGB0h+ivRS5qaS77rwICjRyyfgPw+0kgEChon
         0PFQ==
X-Gm-Message-State: AOAM530dP4DlP0OPv/OdxXcskauuJgVKFuukeMVGI801ZcAnQVueU2v9
	cCAuhxzJ6EHFyeyRPg/FVQ4=
X-Google-Smtp-Source: ABdhPJyAjWhzWpDJV4neCQKv3fea6PqPKLnPLchVolRRDocZC8k1vjmFlCOdRW/uQFrSKVkXvJi7lw==
X-Received: by 2002:a50:e18f:: with SMTP id k15mr12620322edl.45.1632673558358;
        Sun, 26 Sep 2021 09:25:58 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id z18sm8983208edq.29.2021.09.26.09.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 09:25:58 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] staging: vt6655: fix camelcase in ldBmThreshold
Date: Sun, 26 Sep 2021 18:25:19 +0200
Message-Id: <20210926162527.21462-3-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210926162527.21462-1-tomm.merciai@gmail.com>
References: <20210926162527.21462-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camel case variable ldBmThreshold with snake case
variable ld_bm_threshold.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v4:
 - Make the commit body message more clearer.

Changes since v3:
 - Fix patch changelog.

Changes since v2:
 - Add patch changelog.

Changes since v1:
 - Make the commit message more clearer.

 drivers/staging/vt6655/baseband.c    | 48 ++++++++++++++--------------
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c |  2 +-
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 170c4056946f..55bddbda50cd 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2021,10 +2021,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x0A;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -50;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->ld_bm_threshold[0] = -70;
+		priv->ld_bm_threshold[1] = -50;
+		priv->ld_bm_threshold[2] = 0;
+		priv->ld_bm_threshold[3] = 0;
 	} else if ((by_rf_type == RF_AIROHA) || (by_rf_type == RF_AL2230S)) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_AIROHA2230; ii++)
 			result &= bb_write_embedded(priv,
@@ -2039,10 +2039,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x10;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -48;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->ld_bm_threshold[0] = -70;
+		priv->ld_bm_threshold[1] = -48;
+		priv->ld_bm_threshold[2] = 0;
+		priv->ld_bm_threshold[3] = 0;
 	} else if (by_rf_type == RF_UW2451) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_UW2451; ii++)
 			result &= bb_write_embedded(priv,
@@ -2061,10 +2061,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x0A;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -60;
-		priv->ldBmThreshold[1] = -50;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->ld_bm_threshold[0] = -60;
+		priv->ld_bm_threshold[1] = -50;
+		priv->ld_bm_threshold[2] = 0;
+		priv->ld_bm_threshold[3] = 0;
 	} else if (by_rf_type == RF_UW2452) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_UW2451; ii++)
 			result &= bb_write_embedded(priv,
@@ -2107,10 +2107,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x0A;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -60;
-		priv->ldBmThreshold[1] = -50;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->ld_bm_threshold[0] = -60;
+		priv->ld_bm_threshold[1] = -50;
+		priv->ld_bm_threshold[2] = 0;
+		priv->ld_bm_threshold[3] = 0;
 		/* }} RobertYu */
 
 	} else if (by_rf_type == RF_VT3226) {
@@ -2127,10 +2127,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x10;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -48;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->ld_bm_threshold[0] = -70;
+		priv->ld_bm_threshold[1] = -48;
+		priv->ld_bm_threshold[2] = 0;
+		priv->ld_bm_threshold[3] = 0;
 		/* Fix VT3226 DFC system timing issue */
 		MACvSetRFLE_LatchBase(iobase);
 		/* {{ RobertYu: 20050104 */
@@ -2161,10 +2161,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x10;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -48;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->ld_bm_threshold[0] = -70;
+		priv->ld_bm_threshold[1] = -48;
+		priv->ld_bm_threshold[2] = 0;
+		priv->ld_bm_threshold[3] = 0;
 		/* }} RobertYu */
 	} else {
 		/* No VGA Table now */
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 63aa62e483c8..876472862520 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -253,7 +253,7 @@ struct vnt_private {
 	unsigned char byBBVGANew;
 	unsigned char byBBVGACurrent;
 	unsigned char abyBBVGA[BB_VGA_LEVEL];
-	long                    ldBmThreshold[BB_VGA_LEVEL];
+	long                    ld_bm_threshold[BB_VGA_LEVEL];
 
 	unsigned char byBBPreEDRSSI;
 	unsigned char byBBPreEDIndex;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 8ae0fbfd134f..c4384b232c33 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -986,7 +986,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 	RFvRSSITodBm(priv, (u8)priv->uCurrRSSI, &dbm);
 
 	for (i = 0; i < BB_VGA_LEVEL; i++) {
-		if (dbm < priv->ldBmThreshold[i]) {
+		if (dbm < priv->ld_bm_threshold[i]) {
 			priv->byBBVGANew = priv->abyBBVGA[i];
 			break;
 		}
-- 
2.25.1

