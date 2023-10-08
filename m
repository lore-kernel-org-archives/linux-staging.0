Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6815B1
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 02:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aktYs68S"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3514bf96fd2so13667385ab.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Oct 2023 19:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696731080; x=1697335880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbnPHj6dfD4POVO9hdle6v6s7g3Ty0sBecHZs7nG93U=;
        b=aktYs68S54MaQ9DfPVPSXdDTLx4kt5z32FoLIOPWatflrgYte7/lM8eQAPG0vptaZY
         tBmjPOKEkxPcObzgVHql4CZN79EGEumhaSGFd0CnuVmcyXwLfBmsngVODrWxvtFkmF90
         Vm1H7bXSYc9rByg63WgmxgnAIrw8W8sCBBdD7Hm8/Ti1jxj89OAL+CBbyfnTMS8Bnb27
         niGdePgfhLGnXhushsALu6+MIyXADE7TTweN19bZko5Tto8pHeCwz6+xdcbghukZpOhg
         UEzhc5sOqmdyHOhpK0qeL2slnAlaN3Qqlwt4m/7ASfm7CWjEiBxsuCvFsSBPNzfCdDL1
         pEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696731080; x=1697335880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbnPHj6dfD4POVO9hdle6v6s7g3Ty0sBecHZs7nG93U=;
        b=ArKeIr5urojRZJqodCP1KNNdt9ZaDDyRYvL7TTNXc+IwY3fimTEMzlbuxcVzdwq7Mg
         JtVzB67o7CUaSnB33tJ2wVk/ZPWttRXWgf0IzZ9lggu1XZHjIq5x+Am2hyA/xtVmQcl/
         GdIR5egccfNbXD30MkNwVj3dl05tofpBUTeegm0cLDQYTGEP+IOY/9CjCXO2M03xnfLU
         w7pi1aezzrYSdIJAMp0zfZ1Vs9gZRjF7f6cdEj75jSZhP+KZb77Qo1juHhLd3XMMhvWy
         DuEvGMIjdoXlxN+cKIBfTFIMASnNAhPeNuZKmrtx8XgWYpGqGCoNZngmk1TCe3ITSVhC
         8tyg==
X-Gm-Message-State: AOJu0YyCvXZGgVmvxZzMYJ8demlnT0D6kURHYeqPGIWLjpVa0BZnv8di
	ePBsnbMGdWAd16xiVw4NAX2qELadyOU=
X-Google-Smtp-Source: AGHT+IF1fg42gRk2D/9js+L+MQbF1lgNaOSnLSGB8BsY+P6pBsEo1vzpDZjud13AIAAqame94hYmgA==
X-Received: by 2002:a05:6e02:12e3:b0:34d:ff6c:3e22 with SMTP id l3-20020a056e0212e300b0034dff6c3e22mr16419973iln.20.1696731079799;
        Sat, 07 Oct 2023 19:11:19 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id x8-20020aa784c8000000b00690fdeb5c0dsm3746125pfn.2.2023.10.07.19.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 19:11:19 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Pavan Bobba <pavanbobba206@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH
Date: Sun,  8 Oct 2023 07:40:55 +0530
Message-Id: <e7dc405ffa8050eb8693086204c902a723392a62.1696729776.git.opensource206@gmail.com>
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

