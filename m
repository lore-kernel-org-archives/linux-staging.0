Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D79FBF5
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 19:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/hAsUWT"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-352a22e1471so16303005ab.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Oct 2023 12:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696791728; x=1697396528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VyZXwoc1Z5JSgbPuetTHjH+Q4MbZFY0gbDiCVVsdfs=;
        b=g/hAsUWTVsnaRczETW3hdL5lC8JrVy485gQLZxkB9oBvE/SDAdGgk2SdONAXwGOae8
         j+Cw0NuyKbcMLBUiE1057PfcgSuvIA23zntEXXQQlvOsF1Wp2vRDsrd4zZwvaKiW2YRs
         ZmAUYLQq0gyjd1B5z8ga7lt2dT7Ba7Ts8fPkaqsKFSvxkpxHjVp3zmXg++g8ISznMiAv
         VSr+HhBnTOqfYa/FvKjZ569/86DGjfFZ8d+pi1oWdqZBl2YSMAoUNuQo564ld2So6nSU
         oXUFkTaa5ipzEW9+ozPMnev/gHiUq5PMjiFFZMv4pm0dl3Ipuuo9rptFzWFdu8ujSCT0
         quBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696791728; x=1697396528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VyZXwoc1Z5JSgbPuetTHjH+Q4MbZFY0gbDiCVVsdfs=;
        b=Naa2dLcMSLanGtNh2CYZkewGu6YxaBM3ROCy6RkhXgXDudj8WfsVt1QEP8eJkFuBjE
         8HzwXlOSkJyyikob0ngGH/0yBQB8VSwuRqLTxgzltglVMkNWkhXfKSEVSpnlalndtV9G
         oXuumrgEtqsVWL4ymKpgrFXoIpBCyEx9txG57YhNUOZcHVKlum1xglriV3pwXhZkVbUl
         VN2VlDswBYjfaiG1hQ7jW2yqkexBOPX1c7ti5ZmJmwVIvrVIZNAakudHBF3YVor2E95k
         Cg9OR8C4gKXZvKSM7FMT2mHV/1fDmtq77uGnOdDDCydS+PZCDbkXNp5hcCHWJp1DIR1F
         BvPQ==
X-Gm-Message-State: AOJu0YzAahFvUjA0p6hE/0E+I3DVPRTZkP8+3deHDwNF22Tzufmi35L+
	m+DOLo/OFUalpdqQ+F1hgPc=
X-Google-Smtp-Source: AGHT+IFiZnfIWGFdZUMjgc+6ypttacTXyr/llYiB8pNW+7NLeoU5A+rHw1xcX41tgLDWMntxUvo7rA==
X-Received: by 2002:a05:6e02:1354:b0:351:1311:c282 with SMTP id k20-20020a056e02135400b003511311c282mr12479417ilr.9.1696791728314;
        Sun, 08 Oct 2023 12:02:08 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id g12-20020a63be4c000000b00577e62e13c5sm6018165pgo.32.2023.10.08.12.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 12:02:07 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH v5 1/3] staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
Date: Mon,  9 Oct 2023 00:31:48 +0530
Message-Id: <13a233dff4d6daf728f75ab18b38ec9d0703764b.1696791459.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696791459.git.opensource206@gmail.com>
References: <cover.1696791459.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

array name "abyBBVGA" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
v1 -> v2 : 1.cover letter added
           2.patches sent as attachments in a single mail for review

v2 -> v3 : patches sending in a single mail intead of attachments

v3 -> v4 : version info updated in patchset subject

v4 -> v5 : sending all patches in a series

 drivers/staging/vt6655/baseband.c    | 38 ++++++++++++++--------------
 drivers/staging/vt6655/channel.c     |  4 +--
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c |  8 +++---
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0ae2ab3987c6..a19a75f5d761 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2016,10 +2016,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 			iowrite32(0x23, iobase + MAC_REG_ITRTMSET);
 			vt6655_mac_reg_bits_on(iobase, MAC_REG_PAPEDELAY, BIT(0));
 		}
-		priv->abyBBVGA[0] = 0x18;
-		priv->abyBBVGA[1] = 0x0A;
-		priv->abyBBVGA[2] = 0x0;
-		priv->abyBBVGA[3] = 0x0;
+		priv->bbvga[0] = 0x18;
+		priv->bbvga[1] = 0x0A;
+		priv->bbvga[2] = 0x0;
+		priv->bbvga[3] = 0x0;
 		priv->dbm_threshold[0] = -70;
 		priv->dbm_threshold[1] = -50;
 		priv->dbm_threshold[2] = 0;
@@ -2034,10 +2034,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 			result &= bb_write_embedded(priv,
 				vt3253b0_agc[ii][0], vt3253b0_agc[ii][1]);
 
-		priv->abyBBVGA[0] = 0x1C;
-		priv->abyBBVGA[1] = 0x10;
-		priv->abyBBVGA[2] = 0x0;
-		priv->abyBBVGA[3] = 0x0;
+		priv->bbvga[0] = 0x1C;
+		priv->bbvga[1] = 0x10;
+		priv->bbvga[2] = 0x0;
+		priv->bbvga[3] = 0x0;
 		priv->dbm_threshold[0] = -70;
 		priv->dbm_threshold[1] = -48;
 		priv->dbm_threshold[2] = 0;
@@ -2056,10 +2056,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		iowrite8(0x23, iobase + MAC_REG_ITRTMSET);
 		vt6655_mac_reg_bits_on(iobase, MAC_REG_PAPEDELAY, BIT(0));
 
-		priv->abyBBVGA[0] = 0x14;
-		priv->abyBBVGA[1] = 0x0A;
-		priv->abyBBVGA[2] = 0x0;
-		priv->abyBBVGA[3] = 0x0;
+		priv->bbvga[0] = 0x14;
+		priv->bbvga[1] = 0x0A;
+		priv->bbvga[2] = 0x0;
+		priv->bbvga[3] = 0x0;
 		priv->dbm_threshold[0] = -60;
 		priv->dbm_threshold[1] = -50;
 		priv->dbm_threshold[2] = 0;
@@ -2074,10 +2074,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 			result &= bb_write_embedded(priv,
 				vt3253b0_agc[ii][0], vt3253b0_agc[ii][1]);
 
-		priv->abyBBVGA[0] = 0x1C;
-		priv->abyBBVGA[1] = 0x10;
-		priv->abyBBVGA[2] = 0x0;
-		priv->abyBBVGA[3] = 0x0;
+		priv->bbvga[0] = 0x1C;
+		priv->bbvga[1] = 0x10;
+		priv->bbvga[2] = 0x0;
+		priv->bbvga[3] = 0x0;
 		priv->dbm_threshold[0] = -70;
 		priv->dbm_threshold[1] = -48;
 		priv->dbm_threshold[2] = 0;
@@ -2088,7 +2088,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 	} else {
 		/* No VGA Table now */
 		priv->bUpdateBBVGA = false;
-		priv->abyBBVGA[0] = 0x1C;
+		priv->bbvga[0] = 0x1C;
 	}
 
 	if (by_local_id > REV_ID_VT3253_A1) {
@@ -2126,7 +2126,7 @@ bb_set_short_slot_time(struct vnt_private *priv)
 
 	/* patch for 3253B0 Baseband with Cardbus module */
 	bb_read_embedded(priv, 0xE7, &by_bb_vga);
-	if (by_bb_vga == priv->abyBBVGA[0])
+	if (by_bb_vga == priv->bbvga[0])
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
 
 	bb_write_embedded(priv, 0x0A, by_bb_rx_conf); /* CR10 */
@@ -2140,7 +2140,7 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data)
 
 	bb_read_embedded(priv, 0x0A, &by_bb_rx_conf); /* CR10 */
 	/* patch for 3253B0 Baseband with Cardbus module */
-	if (by_data == priv->abyBBVGA[0])
+	if (by_data == priv->bbvga[0])
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
 	else if (priv->short_slot_time)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index e90e0b43505d..e20701815db9 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -87,8 +87,8 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 
 	/* Set VGA to max sensitivity */
 	if (priv->bUpdateBBVGA &&
-	    priv->byBBVGACurrent != priv->abyBBVGA[0]) {
-		priv->byBBVGACurrent = priv->abyBBVGA[0];
+	    priv->byBBVGACurrent != priv->bbvga[0]) {
+		priv->byBBVGACurrent = priv->bbvga[0];
 
 		bb_set_vga_gain_offset(priv, priv->byBBVGACurrent);
 	}
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 8c90539cc3d7..b662c74a2dc7 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -250,7 +250,7 @@ struct vnt_private {
 	unsigned int	uBBVGADiffCount;
 	unsigned char byBBVGANew;
 	unsigned char byBBVGACurrent;
-	unsigned char abyBBVGA[BB_VGA_LEVEL];
+	unsigned char bbvga[BB_VGA_LEVEL];
 	long                    dbm_threshold[BB_VGA_LEVEL];
 
 	unsigned char byBBPreEDRSSI;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index f76f482f4c06..385848df8848 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -424,9 +424,9 @@ static void device_init_registers(struct vnt_private *priv)
 	bb_vt3253_init(priv);
 
 	if (priv->bUpdateBBVGA) {
-		priv->byBBVGACurrent = priv->abyBBVGA[0];
+		priv->byBBVGACurrent = priv->bbvga[0];
 		priv->byBBVGANew = priv->byBBVGACurrent;
-		bb_set_vga_gain_offset(priv, priv->abyBBVGA[0]);
+		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
 	bb_set_rx_antenna_mode(priv, priv->byRxAntennaMode);
@@ -1053,7 +1053,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 
 	for (i = 0; i < BB_VGA_LEVEL; i++) {
 		if (dbm < priv->dbm_threshold[i]) {
-			priv->byBBVGANew = priv->abyBBVGA[i];
+			priv->byBBVGANew = priv->bbvga[i];
 			break;
 		}
 	}
@@ -1510,7 +1510,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 			priv->short_slot_time = false;
 
 		CARDbSetPhyParameter(priv, priv->byBBType);
-		bb_set_vga_gain_offset(priv, priv->abyBBVGA[0]);
+		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
 	if (changed & BSS_CHANGED_TXPOWER)
-- 
2.34.1

