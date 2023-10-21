Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31C12B7C;
	Sat, 21 Oct 2023 23:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVsU5+LU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32db8924201so1405292f8f.1;
        Sat, 21 Oct 2023 16:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697929963; x=1698534763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhZlYF/jnKgWZIepjn1KYt9HmSq9ZfWEq3tbhcGSt/s=;
        b=fVsU5+LUsdltk75KRAZXdCPVpZogFQfG4qLXAKVausUDfciH0MOZDisACfFYaFSIKQ
         TVpTqeBisTWjbPm9vpy++E2WL7KpWEtzq6PpYkwJd7rvYMlxZIHBdCma3Dnv6cvVyE4J
         UW9wTcQZ7zl5MBuecnxtswBPioLBYBUXCEMpqAUy9XXJd0Br5pw5/msC7o5jlot/v+/9
         EwnqyaDTzZKiA/2zthDsP1VNw7YdxwZNGS6JGOd7tUjuHt9KQ4TBuvSkLLSHCaWUwoPR
         AYMmCOMGcP5x/AmEc3xS2zUTRlYLoQ1zSqqvPplcnbziWR0piX7YnUwGQ6dQaaJ9KuHD
         q7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697929963; x=1698534763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhZlYF/jnKgWZIepjn1KYt9HmSq9ZfWEq3tbhcGSt/s=;
        b=RAnGvg3EODG7v8Hvb6TQ4+QuMOQIVDwAWqynmBHh9w8JsBDonRfqPCbqM8VrFVEtLb
         k09k9+25VN3DqcL9iSbP1v6wUwO6N+eGSof8s2cErh+dGK/JLlntaUvSW48D+kGy7+TR
         mWN6jORiD/MrBHaN4hxFpICxAfQndoxL1flMChQNuvpZW7qP/1bWoUylIVyrMjykOd3g
         kwMDhq/Q3zUM2x0F2nxNIKOtyFAdg050eDuH14k0mxHk0NXul23wWlD7nDwtACXI3VT3
         LTaFx5QVZn6EQiia/oim2EM4W/pN9GyNtQhPmiy6f3RXBD1LvPPlqrHkzHPFzhIGLRgY
         OmjQ==
X-Gm-Message-State: AOJu0Yz5kgNBNe/VjUqsZEo8ffltz+t+9m4Vww81xuSd1Yt2CIR217R4
	N9FFAfErSWw9qhoJO6NBD3Q=
X-Google-Smtp-Source: AGHT+IEtkBK3neciFc03aUIrVOh+Ut2pheeqyddpfYeI8zbfLK+uF4rgtfVrgFu0Fw79p9G5On00xQ==
X-Received: by 2002:adf:fd90:0:b0:32d:8a32:3b2f with SMTP id d16-20020adffd90000000b0032d8a323b2fmr3722833wrr.16.1697929963123;
        Sat, 21 Oct 2023 16:12:43 -0700 (PDT)
Received: from gilbert-PC ([105.113.89.119])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d4ac7000000b0032dde679398sm4508262wrs.8.2023.10.21.16.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 16:12:42 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 1/5] staging: vt6655: Rename variable byCWMaxMin
Date: Sun, 22 Oct 2023 00:12:27 +0100
Message-Id: <ed8ff47e7ee3a03d8c8c3cc43b4773bb1eb01f16.1697927812.git.gilbertadikankwu@gmail.com>
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
	CHECK: Avoid CamelCase: <byCWMaxMin>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/card.c   | 16 ++++++++--------
 drivers/staging/vt6655/device.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index bec39c72d540..08e50311f7ba 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -184,7 +184,7 @@ static void s_vCalculateOFDMRParameter(unsigned char rate,
  */
 bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 {
-	unsigned char byCWMaxMin = 0;
+	unsigned char cw_max_min = 0;
 	unsigned char bySlot = 0;
 	unsigned char bySIFS = 0;
 	unsigned char byDIFS = 0;
@@ -197,14 +197,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		bySlot = C_SLOT_SHORT;
 		bySIFS = C_SIFS_A;
 		byDIFS = C_SIFS_A + 2 * C_SLOT_SHORT;
-		byCWMaxMin = 0xA4;
+		cw_max_min = 0xA4;
 	} else if (bb_type == BB_TYPE_11B) {
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11B);
 		bb_write_embedded(priv, 0x88, 0x02);
 		bySlot = C_SLOT_LONG;
 		bySIFS = C_SIFS_BG;
 		byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
-		byCWMaxMin = 0xA5;
+		cw_max_min = 0xA5;
 	} else { /* PK_TYPE_11GA & PK_TYPE_11GB */
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11G);
 		bb_write_embedded(priv, 0x88, 0x08);
@@ -218,11 +218,11 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
 		}
 
-		byCWMaxMin = 0xa4;
+		cw_max_min = 0xa4;
 
 		for (i = RATE_54M; i >= RATE_6M; i--) {
 			if (priv->basic_rates & ((u32)(0x1 << i))) {
-				byCWMaxMin |= 0x1;
+				cw_max_min |= 0x1;
 				break;
 			}
 		}
@@ -260,9 +260,9 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 
 		bb_set_short_slot_time(priv);
 	}
-	if (priv->byCWMaxMin != byCWMaxMin) {
-		priv->byCWMaxMin = byCWMaxMin;
-		iowrite8(priv->byCWMaxMin, priv->port_offset + MAC_REG_CWMAXMIN0);
+	if (priv->cw_max_min != cw_max_min) {
+		priv->cw_max_min = cw_max_min;
+		iowrite8(priv->cw_max_min, priv->port_offset + MAC_REG_CWMAXMIN0);
 	}
 
 	priv->byPacketType = CARDbyGetPktType(priv);
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 2b5f9bf6aa5d..8ff28e4e72a4 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -185,7 +185,7 @@ struct vnt_private {
 	unsigned char byDIFS;
 	unsigned char byEIFS;
 	unsigned char bySlot;
-	unsigned char byCWMaxMin;
+	unsigned char cw_max_min;
 
 	u8		byBBType; /* 0:11A, 1:11B, 2:11G */
 	u8		byPacketType; /*
-- 
2.34.1

