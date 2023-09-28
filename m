Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41C4CFC4
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 15:11:08 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c61bde0b4bso74498805ad.3
        for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913867; x=1696518667; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbnPHj6dfD4POVO9hdle6v6s7g3Ty0sBecHZs7nG93U=;
        b=N7MwYqEGMmoO5SlBW8nSwCmZ0wkN8V7UjG4FeM5Ri42QtFySeegQkhSKbEsEHtqRr2
         R5pEYokoXFJAWr8qTiR1X7QyQdkSN8Jqzjgy8WPuXTCIvFGGlLMEqZEgu5DJBuF89l+D
         9sq1wu2IheJNh+FPBXsmQc5m0dzKdSelklI8Bc5PNgoQFEFpVaqMRXqjRLhpDI17tsSR
         OUlqMOgMz7A8hWk2I5qCGiw2/26b+HKrHironKALa60WSTrpgQ/6y+ZEyl51v6MOAhUu
         OP7WlCWuKq7YFl1bcdC7lxFrw3qAe0sD/ZqAzvFVQmnxIHXI9HHnk+EZD9jQDuZvuGG8
         o0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913867; x=1696518667;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbnPHj6dfD4POVO9hdle6v6s7g3Ty0sBecHZs7nG93U=;
        b=CXVTN+GPgHb1FBLMpqJHDmSFs1k4z2cG/2e+7ZMCgO222emw4eZ4AGOuewS8dvMl2/
         nTijYrRHjk+wq54j+zl/N38zAQKwJF8vYqYymBRfu0R9v/xNOc/EZYjk4VuHLCD20DQ1
         9nrwkw9uenST0oHhABxs5BrvUio/pp3nQDBOUmMCGPcpkWnsLKlcHN/TvV+3VPaMR7rf
         aRAXTKOou1ywraugumynxPRx4OwWjNUnKDdZWztii1wAqVvMcGTmIkKuRMeDYerQ0Rzs
         vGaeARrS5ktUAuV7qHaWitjZ/78Q3Hr95uVOgocf6yGHYXF1NSaG8aL8glMXBrudghF1
         0Jtw==
X-Gm-Message-State: AOJu0YzFE1jeLjfyYVNODVkVMMgj+uVMqvrrKMsWsNGAhRsgZawJLitW
	vShaCYnLrbkc3J/f5W8DFVKEt4jpWII=
X-Google-Smtp-Source: AGHT+IEs4QhgG0H92IolHpdmhyl40mNKQzhUZ2Szyn4G4vNJW6lSOZns0f8c4L8n5KHTG9Gwm5+9yw==
X-Received: by 2002:a17:902:c3cd:b0:1c6:7ba:3a9a with SMTP id j13-20020a170902c3cd00b001c607ba3a9amr1492806plj.14.1695913867539;
        Thu, 28 Sep 2023 08:11:07 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.35.36])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c20c00b001c72f51b84asm2207951pll.52.2023.09.28.08.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:11:07 -0700 (PDT)
Date: Thu, 28 Sep 2023 20:40:54 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: vt6655: Type encoding info dropped from
 variable name "byBBVGANew"
Message-ID: <ZRWXfqKOIXb7JqJD@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

variable name "byBBVGANew" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 9ae7171d02ee..68bfadacfa7c 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -248,7 +248,7 @@ struct vnt_private {
 	/* For Update BaseBand VGA Gain Offset */
 	bool bUpdateBBVGA;
 	unsigned int	uBBVGADiffCount;
-	unsigned char byBBVGANew;
+	unsigned char bbvga_new;
 	unsigned char bbvga_current;
 	unsigned char bbvga[BB_VGA_LEVEL];
 	long                    dbm_threshold[BB_VGA_LEVEL];
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6990129ceb10..b08fcf7e6edc 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -425,7 +425,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	if (priv->bUpdateBBVGA) {
 		priv->bbvga_current = priv->bbvga[0];
-		priv->byBBVGANew = priv->bbvga_current;
+		priv->bbvga_new = priv->bbvga_current;
 		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
@@ -1053,12 +1053,12 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 
 	for (i = 0; i < BB_VGA_LEVEL; i++) {
 		if (dbm < priv->dbm_threshold[i]) {
-			priv->byBBVGANew = priv->bbvga[i];
+			priv->bbvga_new = priv->bbvga[i];
 			break;
 		}
 	}
 
-	if (priv->byBBVGANew == priv->bbvga_current) {
+	if (priv->bbvga_new == priv->bbvga_current) {
 		priv->uBBVGADiffCount = 1;
 		return;
 	}
@@ -1067,11 +1067,11 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 
 	if (priv->uBBVGADiffCount == 1) {
 		/* first VGA diff gain */
-		bb_set_vga_gain_offset(priv, priv->byBBVGANew);
+		bb_set_vga_gain_offset(priv, priv->bbvga_new);
 
 		dev_dbg(&priv->pcid->dev,
 			"First RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
-			(int)dbm, priv->byBBVGANew,
+			(int)dbm, priv->bbvga_new,
 			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 	}
@@ -1079,11 +1079,11 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 	if (priv->uBBVGADiffCount >= BB_VGA_CHANGE_THRESHOLD) {
 		dev_dbg(&priv->pcid->dev,
 			"RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
-			(int)dbm, priv->byBBVGANew,
+			(int)dbm, priv->bbvga_new,
 			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 
-		bb_set_vga_gain_offset(priv, priv->byBBVGANew);
+		bb_set_vga_gain_offset(priv, priv->bbvga_new);
 	}
 }
 
-- 
2.34.1

