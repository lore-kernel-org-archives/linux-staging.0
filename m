Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9315B1
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 02:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMnMUQ3u"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-578d0dcd4e1so2187218a12.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Oct 2023 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696731071; x=1697335871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMmONcUMFN4joLAp8VT5Tk17MJvLEuHX0aR8+7SHQug=;
        b=gMnMUQ3u/7I4OBpCgWIQEMnavPqTDAs+G/8YZGNaQNPl8W2faIRkNWE53kvfLB0Ozf
         OnS2MdD4cGJthB9RciUMANtsGUcipzJwzv2QeaMxvNg29Bc5RwP0SY+cKtJ3x3GoyDNL
         FVA4mARHKM49l9DfWOgioOFY13W4sjVv5I1V8laDew4CrNtPfjj33vSUV1tFsGUqdsoB
         b1uUNpMZHmrQld5haX3RKRQIwyrWqpqw1rSVWQILyljHkfvrxDHwgVnsbAlP+JkY2N1T
         B5gOIXlK9MLrhV59iZJdVJVI1RkU7WS0IpNuxq6TO3KdLReyNYF0JbgjLG/3R78AYb/b
         KRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696731071; x=1697335871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMmONcUMFN4joLAp8VT5Tk17MJvLEuHX0aR8+7SHQug=;
        b=EJKoFbQYpJcvN5+U+X8CNQ0tcMRlKpY1fPEQccrT0Fs9bkGi2LBTBa+nMBpvxyghM4
         y2vDLVGBtZnBxnFTfKpvaC5ArGUY+HVLaeJtrSwA7AaWhXTlg+1txbZGZrFK/lGalptA
         tu0v9pQsgO7hg0/yaroQIBh5ePqV8OC0Ld5KMusNHT1ro/3k8X2OK/xKaLX7LrbSvQ4s
         2B7E19Ga8ICp5VbBrYDMtLDgEly6TsMDYctpfCinTB+xEnqpp0igX/cCD59XoanzTDMN
         YnVJk1cmPlx2LYtNQEGKfnny5wQ6B+grriE5qUpYFoSK1PPFuknvs1PB/SeytS591bGo
         QoxA==
X-Gm-Message-State: AOJu0Yz5ukdtbR+vu3wykDSGIpApf29jS1Jlkzeg2cE5A1APscnVw3lt
	RFRB8w/tqwbx//N1FS6reJw=
X-Google-Smtp-Source: AGHT+IFVSspzJysZzMi916TtZsurVieoPKwbuXkG9h35Bm6v6jwhQU9NTHHGki2bkAj3zr/4pmSjFA==
X-Received: by 2002:a05:6a00:124a:b0:690:ce30:47e5 with SMTP id u10-20020a056a00124a00b00690ce3047e5mr12206836pfi.6.1696731071139;
        Sat, 07 Oct 2023 19:11:11 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id x8-20020aa784c8000000b00690fdeb5c0dsm3746125pfn.2.2023.10.07.19.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 19:11:10 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Pavan Bobba <pavanbobba206@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH
Date: Sun,  8 Oct 2023 07:40:53 +0530
Message-Id: <6894dff7cc5a780627e0335e8f5cdc8b353eea53.1696729776.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696729776.git.opensource206@gmail.com>
References: <cover.1696729776.git.opensource206@gmail.com>
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

