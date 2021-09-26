Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857F3FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 16:25:49 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ee50so58529587edb.13
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 09:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RB7zT2w+2jsgxtDevk0DcDuBHWKvGJ+DvrJnKkLfy/s=;
        b=FE84gj1UeD+xv641hgVbhACu1k/V4/yq9LeSwC0PLwl1FNRBLjFLy6ja34bv9v1RRr
         FJlOFATHh9nSnTz2EW8tZxTt7wRIblp+JP/Fn+wkYsJsKJd95HCS1wJrEfCZYHMymNnc
         JUpbnOm+fdmJfhjNUvxCjOEKRekiA2kVj63fhsxFPpMP2rudKJkbqTKp5AiY5ODfbPSP
         drwSInbjiNqz6wDChcDMan7RijXKNE3dJBnGyvh4RzKNcFfyXAnSBlFFnyNdkOnT5ixy
         YIwvCX75MaWkH4oWNU1KubyZOE+5vrfT/H2SVCdzxVIvmPCGQomE1TicXS3CAWK2rGnm
         wXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RB7zT2w+2jsgxtDevk0DcDuBHWKvGJ+DvrJnKkLfy/s=;
        b=IsM9My1T/RF3UlDEgqGy57W4aXhNd0QbFx2P0R6Pw3fTqPQWTuCd07XtZZRMc3g1Bw
         BtrkxeJ2Awc3ycJ3houUsZ05um9B2Q7rzsnlgEa1N1CW/j1id5ZDp7XOQx/bIZQkmcSA
         7XV10TGW1f0V9DiEJaHSUH2z1fgcMJ1X9Ge0A0epKBiap0NJkewZOxKVhDi5Ze6jv26w
         P8ywceclOuey9Cau4lb8OdoHGqjrA0M0yCZP9ufWxAHnIIiKBT5kncshVgcGfcPPkePT
         QCc/RO/rZwW3FRe7U0yVKWwiGNksDn0eaJFdl2Ll+/fpsYYZk3EovJpUtTIXKplrAOOo
         9EIg==
X-Gm-Message-State: AOAM532wJvtXB8wUQsfnD4Bum5jvtPx32gvRx7EQj3Qj/pgNIS4SAnCU
	BvFqBwDWjqqUpkdq/7BUL4E=
X-Google-Smtp-Source: ABdhPJwWDfCEyMMiQvOuxWfkiTysbvYh6w6GJKc7D2QylVwg1oK/ZfEbJKS1V7yXFcncYqFis1B6CA==
X-Received: by 2002:a50:e004:: with SMTP id e4mr16506053edl.246.1632673548256;
        Sun, 26 Sep 2021 09:25:48 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id z18sm8983208edq.29.2021.09.26.09.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 09:25:47 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Yujia Qiao <rapiz@foxmail.com>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] staging: vt6655: fix camelcase in bShortSlotTime
Date: Sun, 26 Sep 2021 18:25:18 +0200
Message-Id: <20210926162527.21462-2-tomm.merciai@gmail.com>
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

Replace camel case variable bShortSlotTime with snake case
variable b_short_slot_time.

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

 drivers/staging/vt6655/baseband.c    | 4 ++--
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index f73f3fad3e05..170c4056946f 100644
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
index 3ef3a6e0e6e1..7a08ea0c7692 100644
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
index 2af769174e33..63aa62e483c8 100644
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
index d40c2ac14928..8ae0fbfd134f 100644
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

