Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D844BDD8
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 15:08:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c0ecb9a075so97986105ad.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 08:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913722; x=1696518522; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXHgrXhZFzgapXNvMU3dUuHbHovI6TQ/QGyf0MdOP1Q=;
        b=WbrHO8hlmO0AttP+uw0PSYXgXHg5etQ0sAzgbRHLnRxGb0mvrxNtOx0UuVPGodrY3P
         /k5B54mCM5dh+oygG2TMqARh4Oxz5vldRzWfRHkBRLJLQPdVui4hoQrQ2F8R9SUgOP4e
         qGkUYSSl3o7sI8yGIX8qQBscCCtRMJaPoS2MyNS3J7/i+gKe4si2E2alXHrHO0fzFwvN
         ka/czVje7sV7P34/QFh7S7iO9gokq2KbviWN5GLj+CCcbZugfAtpQPprLHVONHDPjV3V
         sl16dXb7NG8acdL1lFsDizzVhCwZSCbYVlCcXgtAa4dl/gu/TAnVAN1vNpoPXQ8bvKQq
         Fefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913722; x=1696518522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXHgrXhZFzgapXNvMU3dUuHbHovI6TQ/QGyf0MdOP1Q=;
        b=A0dcdiGUjUu6urWt6X+TqpaODV1k5KytUoSEw0dYTXbHgQy48XdI2ZlrNjizMQ/kc2
         lcVJZ33WljSM7G8ZqRmwgRwFvGqExUtdgiFASeMKCV2i60MaZXA0m+2GkRkGjSyVznaY
         TNevYlfYDbPUPin+fwmEM26JbiUs1p+pptIZKmLB8tWT9Y2F2WrkkiHH7rOTCnsEakRZ
         7QkSe/P8AueqEK/uPB4X2DL78hk/3XofrCH6OsQFBjqZXlLTKTpcT258548lQ67gPing
         U1LnsRwvnDptpejL3eHIBx6hJkeEWSRj7it9arGfuSAXxUQCwCb6HMndLVjIaiYHTIBp
         onWA==
X-Gm-Message-State: AOJu0YzbZfNdvSf04pGnUuky5sjCODUNnQGatwx0Y7n26SeSBpZIxt1n
	FMzJpIG4Uo/eBOuVqGuuIhL9gseKsaA=
X-Google-Smtp-Source: AGHT+IGTrLPoZxQnFaD16/+hGHXFCMtzur34myZLq9ycrFLepJfpvftjlc1qgF+Xaxi8IlETg6paOA==
X-Received: by 2002:a17:902:da8d:b0:1c0:d7a9:1c48 with SMTP id j13-20020a170902da8d00b001c0d7a91c48mr1748762plx.49.1695913722397;
        Thu, 28 Sep 2023 08:08:42 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.35.36])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902744a00b001c61e628e98sm7997041plt.175.2023.09.28.08.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:08:42 -0700 (PDT)
Date: Thu, 28 Sep 2023 20:38:29 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: vt6655: Type encoding info dropped from
 variable name "byBBVGACurrent"
Message-ID: <ZRWW7SWDP9WFWxCO@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

variable name "byBBVGACurrent" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c    |  2 +-
 drivers/staging/vt6655/channel.c     |  6 +++---
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c | 10 +++++-----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index a19a75f5d761..7d47b266b87e 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2146,7 +2146,7 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
 	else
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
-	priv->byBBVGACurrent = by_data;
+	priv->bbvga_current = by_data;
 	bb_write_embedded(priv, 0x0A, by_bb_rx_conf); /* CR10 */
 }
 
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index e20701815db9..6ac7d470c041 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -87,10 +87,10 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 
 	/* Set VGA to max sensitivity */
 	if (priv->bUpdateBBVGA &&
-	    priv->byBBVGACurrent != priv->bbvga[0]) {
-		priv->byBBVGACurrent = priv->bbvga[0];
+	    priv->bbvga_current != priv->bbvga[0]) {
+		priv->bbvga_current = priv->bbvga[0];
 
-		bb_set_vga_gain_offset(priv, priv->byBBVGACurrent);
+		bb_set_vga_gain_offset(priv, priv->bbvga_current);
 	}
 
 	/* clear NAV */
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index b662c74a2dc7..9ae7171d02ee 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -249,7 +249,7 @@ struct vnt_private {
 	bool bUpdateBBVGA;
 	unsigned int	uBBVGADiffCount;
 	unsigned char byBBVGANew;
-	unsigned char byBBVGACurrent;
+	unsigned char bbvga_current;
 	unsigned char bbvga[BB_VGA_LEVEL];
 	long                    dbm_threshold[BB_VGA_LEVEL];
 
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 385848df8848..6990129ceb10 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -424,8 +424,8 @@ static void device_init_registers(struct vnt_private *priv)
 	bb_vt3253_init(priv);
 
 	if (priv->bUpdateBBVGA) {
-		priv->byBBVGACurrent = priv->bbvga[0];
-		priv->byBBVGANew = priv->byBBVGACurrent;
+		priv->bbvga_current = priv->bbvga[0];
+		priv->byBBVGANew = priv->bbvga_current;
 		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
@@ -1058,7 +1058,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 		}
 	}
 
-	if (priv->byBBVGANew == priv->byBBVGACurrent) {
+	if (priv->byBBVGANew == priv->bbvga_current) {
 		priv->uBBVGADiffCount = 1;
 		return;
 	}
@@ -1072,7 +1072,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 		dev_dbg(&priv->pcid->dev,
 			"First RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
 			(int)dbm, priv->byBBVGANew,
-			priv->byBBVGACurrent,
+			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 	}
 
@@ -1080,7 +1080,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 		dev_dbg(&priv->pcid->dev,
 			"RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
 			(int)dbm, priv->byBBVGANew,
-			priv->byBBVGACurrent,
+			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 
 		bb_set_vga_gain_offset(priv, priv->byBBVGANew);
-- 
2.34.1

