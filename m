Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210712B7C;
	Sat, 21 Oct 2023 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbQRL1GP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4084de32db5so17519365e9.0;
        Sat, 21 Oct 2023 16:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697929970; x=1698534770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgihYbweOv461mq7krCIfGB4Er0uLAixEkR4tcljzVg=;
        b=LbQRL1GP7X2Dcm8jHL+YrgDMbSgPE+0UnQ7DIeT/rRkJKVQ8FIHm6yudzy4EzTCWNk
         8TZCl2NsPWYnjJzVhk+GcSaa3g9ZRL5WR8HF1ySM870YZmYtozu4CutQMSQrCnk82Vy1
         1WqY3fxwDgOC2JoSqmTaUJysppgzySKKcisr7a1WQGwd4TjiHHYYrkWB9PtSpQhNECau
         Mn2WUyYBaSkuTZURwKuYSOW0+D7m6zOrF2kc5+iz+I1tLrUJ0PMJ5Etu4wECFR3Y0z66
         s/z7MFf7em/4vqI6BA1yJPh66ZBgZ3m7dqcmylaHnfl++KRHjBzgqW/HIgg6ptdLr+qI
         CV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697929970; x=1698534770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgihYbweOv461mq7krCIfGB4Er0uLAixEkR4tcljzVg=;
        b=LVPsbjDnZ3zxm5kFdunEapOCO8ariIR1+hBoIARm5U4qD8ufykXUV6256os7/skOt5
         0KJQM4t3o9iIMWfrzW49M/7p1PrL86hEtyp25YGi3gbjdaS9GqjZ6y8z4ZJ2QDYQHKdq
         jnjbvVGFUOb1e5T7jfLdYd1YLPAogGHCHglKnNJ5FwhJosj6ZZ/xQAVgqre8WJ3EptHC
         TBNAav4a8ts5PbEszcshT+aOQ9Orn/BIpYa7vYkmz1r/EVnkm5VNXlLKVKjc8zSKQ0NW
         fDOtYa1U6EOURrmnQF+6KiqPoh/47C6Jos8UEVBLtCGDSPuE/IBcGKfJ2V6OTYd0H5gd
         UI4A==
X-Gm-Message-State: AOJu0YxYlPhGSUUKfVslOsMeSzE8O9djvpbZ852Esnfws/NW8CIJ0DJe
	KovHwMBAZm1HzRErt1n3pDs=
X-Google-Smtp-Source: AGHT+IF4yQPxDHy4u8fqqIQ6nGdZZ81GvcnTqBDt2CrhddFLnIFOB5WS+xWsqX4tsoiJEyQmEmgW5g==
X-Received: by 2002:a05:600c:1396:b0:404:7659:ba39 with SMTP id u22-20020a05600c139600b004047659ba39mr4016012wmf.16.1697929969850;
        Sat, 21 Oct 2023 16:12:49 -0700 (PDT)
Received: from gilbert-PC ([105.113.89.119])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d6987000000b003232380ffd7sm4511073wru.102.2023.10.21.16.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 16:12:49 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 3/5] staging: vt6655: Rename variable bySIFS
Date: Sun, 22 Oct 2023 00:12:29 +0100
Message-Id: <f75f308f187fa9a9e14bf25db006131e2dcda43b.1697927812.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697927812.git.gilbertadikankwu@gmail.com>
References: <cover.1697927812.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove byte Type encoding "by" from variable name and replace camelcase
with snakecase

Fix checkpatch.pl error:
	CHECK: Avoid CamelCase: <bySIFS>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/card.c   | 16 ++++++++--------
 drivers/staging/vt6655/device.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index b5a87837995f..48e571badfb1 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -186,7 +186,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 {
 	unsigned char cw_max_min = 0;
 	unsigned char slot = 0;
-	unsigned char bySIFS = 0;
+	unsigned char sifs = 0;
 	unsigned char byDIFS = 0;
 	int i;
 
@@ -195,20 +195,20 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11A);
 		bb_write_embedded(priv, 0x88, 0x03);
 		slot = C_SLOT_SHORT;
-		bySIFS = C_SIFS_A;
+		sifs = C_SIFS_A;
 		byDIFS = C_SIFS_A + 2 * C_SLOT_SHORT;
 		cw_max_min = 0xA4;
 	} else if (bb_type == BB_TYPE_11B) {
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11B);
 		bb_write_embedded(priv, 0x88, 0x02);
 		slot = C_SLOT_LONG;
-		bySIFS = C_SIFS_BG;
+		sifs = C_SIFS_BG;
 		byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
 		cw_max_min = 0xA5;
 	} else { /* PK_TYPE_11GA & PK_TYPE_11GB */
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11G);
 		bb_write_embedded(priv, 0x88, 0x08);
-		bySIFS = C_SIFS_BG;
+		sifs = C_SIFS_BG;
 
 		if (priv->short_slot_time) {
 			slot = C_SLOT_SHORT;
@@ -233,7 +233,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		 * bcs TX_PE will reserve 3 us hardware's processing
 		 * time here is 2 us.
 		 */
-		bySIFS -= 3;
+		sifs -= 3;
 		byDIFS -= 3;
 		/*
 		 * TX_PE will reserve 3 us for MAX2829 A mode only, it is for
@@ -242,9 +242,9 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		 */
 	}
 
-	if (priv->bySIFS != bySIFS) {
-		priv->bySIFS = bySIFS;
-		iowrite8(priv->bySIFS, priv->port_offset + MAC_REG_SIFS);
+	if (priv->sifs != sifs) {
+		priv->sifs = sifs;
+		iowrite8(priv->sifs, priv->port_offset + MAC_REG_SIFS);
 	}
 	if (priv->byDIFS != byDIFS) {
 		priv->byDIFS = byDIFS;
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index a63a8ddb7ff1..e6669c5f0b8b 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -181,7 +181,7 @@ struct vnt_private {
 	unsigned int	uCwMin;   /* Current CwMin */
 	unsigned int	uCwMax;   /* CwMax is fixed on 1023. */
 	/* PHY parameter */
-	unsigned char bySIFS;
+	unsigned char sifs;
 	unsigned char byDIFS;
 	unsigned char byEIFS;
 	unsigned char slot;
-- 
2.34.1

