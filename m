Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA970
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 11:40:24 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so4833496pji.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=M4xX2WWfEqm7PGNI70AcSFeFug982FHKb8Dt0b/QqpQ=;
        b=vSPUmZpmgYYgSkQNzGePiVkKAonQ6CSFAsAIqewjEWD2/5cYOPYSu/TYwYBaiys5N4
         1O9MgUNs11EfINvx5nlt2nODwsba9ow5TPW0At8E+pmJvg/VqagcB5X6DXFdQe7Fi0/N
         T3EGOWO3SnShUixUDlgLU65CEwka8aDhSmooz812PueEg9EMd9nUhkzYnAMLhDcwkBV+
         m4gzV+zTSZzWB1zk8VRvrMnIXFy440Ccbg0XLxSwj3CEq6HFP1Kp0WGVCKVdrQ0BBZj+
         hcNz4OucUSws3F/aGP3hrPcwShgGhsGgAnxeEaqAFB9Cil1ZIQRLY1uKyQPzoK79A2ph
         pWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=M4xX2WWfEqm7PGNI70AcSFeFug982FHKb8Dt0b/QqpQ=;
        b=a3v7/r692FW6yT7VZSQfP2sKTUc9/xTAFurmSVLVglsbQxxTa//1ZwTQRWGFTa6pGL
         fgIK+Y4QwsIP7mPmp2+2PXdtxJyVHuCA3xgHshop4tIWz4uPTg4rrCjro8hIHs80NGE6
         kVLFWYb8GrJZNb3eMHwRE7BXRQ+qIRSjJa5DpxyHvSOfdNxo4E+moPbotZID7gq3c0Jl
         +7lPtKV5+0Q4jzJjQMqRaqHtEiP2ChARnymmQNuxFEQsVaQidZRKFw8t+SaJLEZtT3Nv
         PLy0aofSH0e/CN8A8FKTW7eGFFXzC+WGVFOdBQ3kb2MtI0z21u0ZHpVfxUPIdCWANyjj
         Nvmw==
X-Gm-Message-State: AOAM533PZmT8QoxYLaFcUOUkAi/go02+puFO3r61586dXFwq6HmSEdWJ
	adVCDEToTfOCNa3wz+lru8Q=
X-Google-Smtp-Source: ABdhPJwAVbX2Y/sOadYxvegw/IWh+DXCxN78WniKOnFyUpKbrR5bSRAfnvOhochMc31hJCXxFerTxQ==
X-Received: by 2002:a17:902:db05:b029:e9:ab78:51fd with SMTP id m5-20020a170902db05b02900e9ab7851fdmr3319055plx.22.1617968424384;
        Fri, 09 Apr 2021 04:40:24 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id x22sm2108568pfa.24.2021.04.09.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:40:24 -0700 (PDT)
Date: Fri, 9 Apr 2021 17:10:17 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: zoran: remove and move statement in next
 line with '*'
Message-ID: <YHA9IdZVRr4kbVJ0@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed and moved statement in line in long(multi-line) comments and
added '*' before it to meet linux kernel coding style for long (multi-line) comments

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v2:- made style changes in code according to linux kernel
coding style for long comments.

drivers/staging/media/zoran/zr36050.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 703064009c6b..b89afa239b0c 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -24,7 +24,8 @@
 /* codec io API */
 #include "videocodec.h"
 
-/* it doesn't make sense to have more than 20 or so,
+/*
+ * it doesn't make sense to have more than 20 or so,
  * just to prevent some unwanted loops
  */
 #define MAX_CODECS 20
@@ -311,7 +312,8 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
 /* ------------------------------------------------------------------------- */
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio
+/*
+ * SOF (start of frame) segment depends on width, height and sampling ratio
  *			 of each color component
  */
 
@@ -343,7 +345,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 
 /* ------------------------------------------------------------------------- */
 
-/* SOS (start of scan) segment depends on the used scan components
+/*
+ * SOS (start of scan) segment depends on the used scan components
  *			of each color component
  */
 
@@ -432,7 +435,8 @@ static void zr36050_init(struct zr36050 *ptr)
 		sum += zr36050_set_sos(ptr);
 		sum += zr36050_set_dri(ptr);
 
-		/* setup the fixed jpeg tables - maybe variable, though -
+		/*
+		 * setup the fixed jpeg tables - maybe variable, though -
 		 * (see table init section above)
 		 */
 		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
@@ -551,8 +555,9 @@ static void zr36050_init(struct zr36050 *ptr)
  * =========================================================================
  */
 
-/* set compression/expansion mode and launches codec -
- *  this should be the last call from the master before starting processing
+/*
+ * set compression/expansion mode and launches codec -
+ * this should be the last call from the master before starting processing
  */
 
 static int zr36050_set_mode(struct videocodec *codec, int mode)
@@ -581,7 +586,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation, cap->quality);
-	/* if () return -EINVAL;
+	/*
+	 * if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
 	 * we allow invalid startx/y and norm for now ...
 	 */
@@ -603,7 +609,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 
 	ptr->real_code_vol = size >> 3; /* in bytes */
 
-	/* Set max_block_vol here (previously in zr36050_init, moved
+	/*
+	 * Set max_block_vol here (previously in zr36050_init, moved
 	 * here for consistency with zr36060 code
 	 */
 	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
@@ -661,7 +668,8 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 		if (size != sizeof(int))
 			return -EFAULT;
 		ptr->total_code_vol = *ival;
-		/* (Kieran Morrissey)
+		/*
+		 * (Kieran Morrissey)
 		 * code copied from zr36060.c to ensure proper bitrate
 		 */
 		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
-- 
2.30.2

