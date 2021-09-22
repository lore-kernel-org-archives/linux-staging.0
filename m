Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C272
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 22:36:11 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id bx4so15997299edb.4
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=djhccSj2zuwrw0KRuY/CdOVwYrmV8VfWXeYGdC/ylR0=;
        b=jcvvN0d0O5zrrrD4YYBQUrEY+d76nIb7a1TjlJH+u0FpiYah61xgNl3Yc6cGCBsssz
         pyuSC2CsZ2Ggb8/uI5Zn0aHQjIl9JBU0YMxy0mRLAS++LDmOL4ZzDCIdPqN0OH3ICyx5
         M1fUIVd7u9xrbzQm0JAwyfNfznIMqTnyS35edlge69aLqRFIyj+Vxg0l1Rm85mGCbZVh
         qfInvNWxZ+iHB3Cn4+HJqnwOXVcXxZQCfeezDrzLINZfmxVpCAAdP/tVadn7Y22T8QT5
         IUblamnZn+6EgOK7WVAeB7GaVo+jbNImqn/9bEep+94hNqD+GYr/CkheIxGm1bxE71Yg
         xgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=djhccSj2zuwrw0KRuY/CdOVwYrmV8VfWXeYGdC/ylR0=;
        b=MSk/1rhhys42vjjyjoo2RhkTMSUCrD1uKu4ez2b/C4fNsphtH7qjSzkddQZfQqLVL9
         NedIyw9bKe79wrLBgrLjnAyZAY4UMFW6iiqmuxEany9AChs9DhGRbJu49HPgsUdQeovk
         OwAMgOXYCeE0dd4Ks7ZWwZIs1fm1OaFtaImwNk+ehZoQuP8tEqIbHHLd3yzXr7GLNVsM
         AybOW4Rtud3BkvS38X73xaHQlfSCWPJkuwm7exthm0e4ksvbLF1Hhpq3LMbNxAiT0Hfp
         5klBpMpQfYx1QsJDQ0vu6JIjqm06yPWNoBUgqps1w2mZU/DKIdz/pChNfHhgrNfBBUNZ
         6q7g==
X-Gm-Message-State: AOAM5334WLfvfmO5bdQ+8hstDPb64l9K2fDEwgT1WpT2yU80xwqIH6Ag
	NdsJEI6nk7jLXuuALuaj7iQ=
X-Google-Smtp-Source: ABdhPJx1mlwGET+HoscEHH9+yYLOlxxQEmJ9zWYIV9Amj1AWFTU5y6QHU4Oe5jYb3UljXCfxLHGSjA==
X-Received: by 2002:a50:bae6:: with SMTP id x93mr1987579ede.232.1632350170187;
        Wed, 22 Sep 2021 15:36:10 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id bj21sm1686168ejb.42.2021.09.22.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:36:09 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: Replace camel case variable name
Date: Thu, 23 Sep 2021 00:35:59 +0200
Message-Id: <20210922223605.639953-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Work in progress: replace camel case variables

bShortSlotTime -> b_short_slot_time

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/baseband.c    | 4 ++--
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index ff596bdcee8d..cf7f292f1c8d 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2200,7 +2200,7 @@ bb_set_short_slot_time(struct vnt_private *priv)
 
 	bb_read_embedded(priv, 0x0A, &by_bb_rx_conf); /* CR10 */
 
-	if (priv->bShortSlotTime)
+	if (priv->b_short_slot_time)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
 	else
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
@@ -2223,7 +2223,7 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data)
 	/* patch for 3253B0 Baseband with Cardbus module */
 	if (by_data == priv->abyBBVGA[0])
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
-	else if (priv->bShortSlotTime)
+	else if (priv->b_short_slot_time)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
 	else
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 9bec1cd036be..b562d09b1ba2 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -258,7 +258,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		bb_write_embedded(priv, 0x88, 0x08);
 		bySIFS = C_SIFS_BG;
 
-		if (priv->bShortSlotTime) {
+		if (priv->b_short_slot_time) {
 			bySlot = C_SLOT_SHORT;
 			byDIFS = C_SIFS_BG + 2 * C_SLOT_SHORT;
 		} else {
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 3d8e28c45287..08c011074193 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -215,7 +215,7 @@ struct vnt_private {
 
 	bool bEncryptionEnable;
 	bool bLongHeader;
-	bool bShortSlotTime;
+	bool b_short_slot_time;
 	bool bProtectMode;
 	bool bNonERPPresent;
 	bool bBarkerPreambleMd;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 1b214546bf65..e88ba1319cfb 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1440,9 +1440,9 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		if (conf->use_short_slot)
-			priv->bShortSlotTime = true;
+			priv->b_short_slot_time = true;
 		else
-			priv->bShortSlotTime = false;
+			priv->b_short_slot_time = false;
 
 		CARDbSetPhyParameter(priv, priv->byBBType);
 		bb_set_vga_gain_offset(priv, priv->abyBBVGA[0]);
-- 
2.25.1

