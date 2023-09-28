Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43C4BDD8
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 15:06:38 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c5c91bece9so105533615ad.3
        for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913598; x=1696518398; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMmONcUMFN4joLAp8VT5Tk17MJvLEuHX0aR8+7SHQug=;
        b=S90xvzR9NwGEqS5YU3dbv1/sx6EmNZ7x4YScWu9G4smWIrFrdd0a+Dh60ceSWW0Hay
         rHqRt0mQVfOMsQ5V3J8ZolwhgEXT21dkSqXlZLTw8GKfgWFPRlbPAq6TQl7spJqUGt6N
         sVla261PnKa/O4V816Vujjvz9zhiu7fOHSiWyNquOhC9qh6PomACvYJzDhHo6TU8mlMR
         QzwDFEUwrUhkuBvoRSohHcsjIqCwkuy8LduI0DAaq/2zu7JfccNi94XNOkPqS7cWuN10
         XnmQsXApHZU5TwgqZGDzKIYlsyz1EWSxRXgtS+Sd+OHayFPlp7ga0uuTcOyaUrVIKae7
         HZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913598; x=1696518398;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMmONcUMFN4joLAp8VT5Tk17MJvLEuHX0aR8+7SHQug=;
        b=jNaSNyl/98J4Q5lf0lNcfzYdety3I604EjghrEx9LqkpspHb1c1flvHSrTIwY/zpiX
         dbKPNzjUOLYlt6Ks+kURGiBCZUbxdO70zALnuhsqoPAs+Z80bQT+Su8Y3lmSIXYFsX/6
         6sIC3WdtkifA+B5D/qM6gZAeyAy3KwhpTmcKiCMCU/j5knss9DuP3oN2XVdoPa7o683B
         4sAzpuIrvyqyEhXgJTPBey7OrxnOZEOvmlazTsSawwCQ5vdNPIEouOa9fNjR7xmCIwdG
         KGvHb+t7zTAPTAvXvjCJpOIBW102HcWVjLUsUIpZt3L17YKYT6sLc1ZRtaADvJ2r3+Bo
         +LpA==
X-Gm-Message-State: AOJu0YxA91f6aTFUuPv+g1w6Ib3EAZFl3m+A3j37a6TFF42seAn4Q2hb
	8UfUQ3gOQWRjLpyKLXONoLI=
X-Google-Smtp-Source: AGHT+IHkEjOJGIaQvVEmHRX0s+yEapdbnL1d3hztN66qO74Mza4gPbZjEqQFg/+CUXIWqtHGMEqd5g==
X-Received: by 2002:a17:902:f80a:b0:1c0:cb4d:df7c with SMTP id ix10-20020a170902f80a00b001c0cb4ddf7cmr1420658plb.1.1695913598188;
        Thu, 28 Sep 2023 08:06:38 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.35.36])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709029a8800b001b9f032bb3dsm15074659plp.3.2023.09.28.08.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:06:37 -0700 (PDT)
Date: Thu, 28 Sep 2023 20:36:24 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: vt6655: Type encoding info dropped from array
 name "abyBBVGA"
Message-ID: <ZRWWcGiySdLbCM3z@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

array name "abyBBVGA" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
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

