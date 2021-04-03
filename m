Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7135F
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 18:09:04 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id u20so8630936lja.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+zl2y4WcU4R0W3ITuE2QJIZQ00fTmDL+l8JpHXE4Pss=;
        b=Ef4g5JV8ccGUQyQlk37yDwtMcWa7IICkX5aS3i5PlzDbvJwpzuRFqDQ5siaBKuyi9W
         dveov30OlZGym6TCbh7yi8zp3gSVLpfV6QzL5zBZpwZaSB2nwszwCnyv/UVIsKhIu3mP
         ch6Abac6Ir0239SFunFsDOhDBxKEHjB7RRTcMEXvphtPmSBL/fwuHBoRo9fk6PdkXM0h
         ef2+OBKWNCaKjKuOQVBgurIOHfHw2YLKqLDxnlGIz82HmcmiGTeKL0fGF4PCta1Cvy3c
         aY7KnSc06aUg0Q0+HH9m+KrtEpxTfEPo2adSud/KzaMenzb1gsD7N3jPGqI5L36suWtK
         NX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+zl2y4WcU4R0W3ITuE2QJIZQ00fTmDL+l8JpHXE4Pss=;
        b=WxWP4w/VVpirGrm/3pbNNSiQOFAU4uKmfsWQHM3F8Rx1895pUMmRQFoZYZZbXyDc/k
         rM57QJ3E/YNuRHc1IHKthMBTv3rTwudSPuTq4Xrq38+4GNqnH1rL3daLzcVgMl4i5WkW
         9E+W1UpDUl8hEDGQGIU///1nBWaSWjDLIIPGwYlfbuVFoIk/zPKFWeRX71eFvoqYwe/p
         vAuuhacjqx17w2PhfI1AkTbL1goeiCgLLYiClHtLkqYJ8TtRf8+hOZzRQ+Om1fB++vP5
         NB9NDoCiyCk5O82qkF/58YGS+BCM4xdS8grKs8e62UyrAbrMkn56YvgWu+mKtv3GoHrN
         qV7g==
X-Gm-Message-State: AOAM530A0eytASVVCeyjm/Iewj6x/YvPQt9LnQozo4Em068RJy+RvIx3
	pJdwl+UXHa3xWOzBCawnFaM=
X-Google-Smtp-Source: ABdhPJwYgsFnK5tSAVhVtZgSGw+9HqINO1123L1juHBNuCIbsR/nJPfcyQ60/A7PJj2KmK0esZX2qA==
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr11506253ljp.252.1617473342760;
        Sat, 03 Apr 2021 11:09:02 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id h62sm1201544lfd.234.2021.04.03.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:02 -0700 (PDT)
Date: Sun, 4 Apr 2021 00:09:01 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 3/7] staging: media: zoran: Rename 'DispMode' to 'disp_mode'
Message-ID: <0e31f8ef345b5972ea3f16ea29f962286ebab3e8.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>

Rename variable 'DispMode' to 'disp_mode' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 6764b51fc595..8891f11f6276 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -292,7 +292,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 {
 	const struct tvnorm *tvn;
 	unsigned int h_start, h_end, v_start, v_end;
-	unsigned int DispMode;
+	unsigned int disp_mode;
 	unsigned int VidWinWid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
 	unsigned int wa, We, ha, He;
@@ -341,8 +341,8 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	btwrite(reg, ZR36057_VFEHCR);
 
 	/* Vertical */
-	DispMode = !(video_height > BUZ_MAX_HEIGHT / 2);
-	VidWinHt = DispMode ? video_height : video_height / 2;
+	disp_mode = !(video_height > BUZ_MAX_HEIGHT / 2);
+	VidWinHt = disp_mode ? video_height : video_height / 2;
 	Y = DIV_ROUND_UP(VidWinHt * 64 * 2, tvn->ha);
 	He = (VidWinHt * 64) / Y;
 	ver_dcm = 64 - Y;
@@ -362,7 +362,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	reg = 0;
 	reg |= (hor_dcm << ZR36057_VFESPFR_HOR_DCM);
 	reg |= (ver_dcm << ZR36057_VFESPFR_VER_DCM);
-	reg |= (DispMode << ZR36057_VFESPFR_DISP_MODE);
+	reg |= (disp_mode << ZR36057_VFESPFR_DISP_MODE);
 	/* RJ: I don't know, why the following has to be the opposite
 	 * of the corresponding ZR36060 setting, but only this way
 	 * we get the correct colors when uncompressing to the screen  */
-- 
2.25.1

