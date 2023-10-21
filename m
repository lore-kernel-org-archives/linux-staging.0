Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E431D517;
	Sat, 21 Oct 2023 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UniW4O1R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso16819105e9.3;
        Sat, 21 Oct 2023 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697929973; x=1698534773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaXhciQDtI63AcB9SDgDuqcYaairo+slB91oIneRn5o=;
        b=UniW4O1Rk2IBFnr3fhx3k8uQmQqsm7+wqtT13gjInSWyDyn+fKh6A227Fhe31gYygk
         GLX8GwTNGdvgIA7w43J4J5wZSz9w4yjwqTktr2avRVyRDRCQbP5LV4k3p2akUckQTWeK
         Cbi8OzoMZxXD9h03vt0/rFhlMuuUKRD0MlFdmoJMq8z1LRQ6RdlBn8y3l6llPuko00E2
         rgnSQ9nWFOW2c100I8eEmBXa4idjqn4C35lsMEVq7FkNXTs64cVfCIE9ADM6r7BOQHKT
         Hejdgxd3sdyhaNx6FH24J7m2DmpeBeaG1JVod5JIJV0L/1/PEE5UTGD46mER9NzL6ZHA
         w/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697929973; x=1698534773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaXhciQDtI63AcB9SDgDuqcYaairo+slB91oIneRn5o=;
        b=Z1jCmRdcIxBjoOd5UFW9f/kxPDb778596JxrQGMOwHpdqvMcEt5AQ5L5ydLEWxmqTB
         mYwwnvwzPI10NXdlt46weL9Y8BQUZxLrsNsKVTjX+K8XruyIii0tsAuJQ59warGlqyGD
         wbFQlTgs+lJEBwciacylGsaGu/nGLIWdabkK9iT1W9U5DKhiNP/YmDHcl7MCyue2BL4C
         PTM1555ZZKMDxxRTtthSdR6+IhNlFzNbVPt+hOBzR2puKyGCK277n+HJLlTAJJnCkg4O
         mD18Ek0r2xdoBiYLPPDuTmtJIO0h5jYtLRdD2mlfa3bPB3J03e8/Bga++LZnuCppM333
         3vdA==
X-Gm-Message-State: AOJu0YzCSgCr2ngnziVoF6vd5lSaz29AKphFKjRceVwuVNZgG7MIuu34
	fmrwGIw6dTKwIOw4exjBKB8=
X-Google-Smtp-Source: AGHT+IE/j4x916pVyFkELwANRSWr6IFipb3aUbvMqTQ6Ci/25Qe3Yqq8DqkvkPJcBIyJrzdpu7dRMQ==
X-Received: by 2002:a05:600c:4fcb:b0:405:34e4:14e3 with SMTP id o11-20020a05600c4fcb00b0040534e414e3mr4167364wmq.3.1697929973438;
        Sat, 21 Oct 2023 16:12:53 -0700 (PDT)
Received: from gilbert-PC ([105.113.89.119])
        by smtp.gmail.com with ESMTPSA id ay10-20020a05600c1e0a00b00405442edc69sm7758919wmb.14.2023.10.21.16.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 16:12:53 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 4/5] staging: vt6655: Rename variable byDIFS
Date: Sun, 22 Oct 2023 00:12:30 +0100
Message-Id: <f10775da0decdbbec33d38236cdf89bcd8ab591e.1697927812.git.gilbertadikankwu@gmail.com>
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
	CHECK: Avoid CamelCase: <byDIFS>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/card.c   | 18 +++++++++---------
 drivers/staging/vt6655/device.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 48e571badfb1..9c8648ea96be 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -187,7 +187,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 	unsigned char cw_max_min = 0;
 	unsigned char slot = 0;
 	unsigned char sifs = 0;
-	unsigned char byDIFS = 0;
+	unsigned char difs = 0;
 	int i;
 
 	/* Set SIFS, DIFS, EIFS, SlotTime, CwMin */
@@ -196,14 +196,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		bb_write_embedded(priv, 0x88, 0x03);
 		slot = C_SLOT_SHORT;
 		sifs = C_SIFS_A;
-		byDIFS = C_SIFS_A + 2 * C_SLOT_SHORT;
+		difs = C_SIFS_A + 2 * C_SLOT_SHORT;
 		cw_max_min = 0xA4;
 	} else if (bb_type == BB_TYPE_11B) {
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11B);
 		bb_write_embedded(priv, 0x88, 0x02);
 		slot = C_SLOT_LONG;
 		sifs = C_SIFS_BG;
-		byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
+		difs = C_SIFS_BG + 2 * C_SLOT_LONG;
 		cw_max_min = 0xA5;
 	} else { /* PK_TYPE_11GA & PK_TYPE_11GB */
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11G);
@@ -212,10 +212,10 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 
 		if (priv->short_slot_time) {
 			slot = C_SLOT_SHORT;
-			byDIFS = C_SIFS_BG + 2 * C_SLOT_SHORT;
+			difs = C_SIFS_BG + 2 * C_SLOT_SHORT;
 		} else {
 			slot = C_SLOT_LONG;
-			byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
+			difs = C_SIFS_BG + 2 * C_SLOT_LONG;
 		}
 
 		cw_max_min = 0xa4;
@@ -234,7 +234,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		 * time here is 2 us.
 		 */
 		sifs -= 3;
-		byDIFS -= 3;
+		difs -= 3;
 		/*
 		 * TX_PE will reserve 3 us for MAX2829 A mode only, it is for
 		 * better TX throughput; MAC will need 2 us to process, so the
@@ -246,9 +246,9 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		priv->sifs = sifs;
 		iowrite8(priv->sifs, priv->port_offset + MAC_REG_SIFS);
 	}
-	if (priv->byDIFS != byDIFS) {
-		priv->byDIFS = byDIFS;
-		iowrite8(priv->byDIFS, priv->port_offset + MAC_REG_DIFS);
+	if (priv->difs != difs) {
+		priv->difs = difs;
+		iowrite8(priv->difs, priv->port_offset + MAC_REG_DIFS);
 	}
 	if (priv->byEIFS != C_EIFS) {
 		priv->byEIFS = C_EIFS;
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index e6669c5f0b8b..264bb056c80c 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -182,7 +182,7 @@ struct vnt_private {
 	unsigned int	uCwMax;   /* CwMax is fixed on 1023. */
 	/* PHY parameter */
 	unsigned char sifs;
-	unsigned char byDIFS;
+	unsigned char difs;
 	unsigned char byEIFS;
 	unsigned char slot;
 	unsigned char cw_max_min;
-- 
2.34.1

