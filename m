Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA172E7181
	for <linux-staging@lists.linux.dev>; Fri, 20 Jun 2025 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438480; cv=none; b=NoNWLcqiudRTduQeEXJaO0U7TW8smJuk+VIahsTMVDEdC0n5Oaxt287AqIaXvDADTrH/uHC1Eg8gkxop+Tq7WCaO2Y5N4/wHINFcOkNGJVIPq4ny831N7cWsTvRPGpvbCCpN1WolAR5QD9UKZjFjyzC9ZHgKld6+hxriC2LWSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438480; c=relaxed/simple;
	bh=s9nqYb57y/nutAilPgtn+5a6ISQWT7mmIgEn/sTWkNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCtEy66hsXeciqaeqiBm6b7UyLvv4qmQNBB0erO9VplxOvzIcXGKjEoN9VlcFathIJZiBo5eMyM1lTuy1HfpyhDJnxHPwW7GAYALtcS5nOJYkN/6lJgsisSSrsXuGsbaCHcjZ1XaXg2IxnLBK3QyzXxbfEMc1W7SiE0vBNqk/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU1gNVfi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU1gNVfi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23602481460so19098405ad.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Jun 2025 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750438478; x=1751043278; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5n8UMa9ZY2/Uq1XXfaQRztTpb/VKkz/BaxVAYOVSYU0=;
        b=HU1gNVfiwV9lGfIe/EndxoQim3WYzT880m4hpW/2JGBUhUamZS54t21AcY0cDxrHya
         8YhrMuL9vzhD5E3R/z38U+fmzE3y/rpz8KLSTNFc1taXIDCl4G+5/ptP43zXVcyjyuvy
         7ZSvSNgKBc/UPkiY4Qn+9rbQM+W8cGx7X9NKT3Gdmm03hjIW/fW+BRo64sHkGaJSccdT
         TV6zbM94/qkiXFIrZTo/qKJZWyXNbHhGTyKVY5i36TUVZejmglJG2DrWm43nVDmYIyGc
         c+myam2gI/joF0CwNm04cQWhWPbUG6RFKK0UTlvIbev6zRZG3El87p/L4Y7kC5QXBynC
         UbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438478; x=1751043278;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5n8UMa9ZY2/Uq1XXfaQRztTpb/VKkz/BaxVAYOVSYU0=;
        b=TCWfGPa5WFmBgAZ96sSlE2jJxe1SZwx9cSdcKYEa/w1sVbwSDXJH8zYeSVWQMNVMwZ
         5A98lTcikysC/0Itx363liZ7Uqjm0ezlmf9+qmKhdYG+8p7O9reA/id/ZxjKvUxDuVgB
         Jtm6fkGEDbooJEHq90krA4suGWUCafW0AjvrlVbA/4VBervUNE3wRU9sDiVwRLeBm1p+
         BpYNP0R+ckmpd/hoTJuaj1H8z61zHMh1ht/a9fFJ16jcjQZnqCy/GgOO77dPORCOU7U2
         uHCSZ2V+biH74rRUGJQKmlpgggL2TZwhZkSTvdrYmAUMgwm6PmA4WYziIZSJA0KNOpL1
         L//Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVU46Ypz5/hiZd2gJebgFHviBaYlG9RZy6Pszjt5xQKOMYtMljDKHDjB/SdC2j7OMPtxPeNU+iXdIZ9nyk@lists.linux.dev
X-Gm-Message-State: AOJu0YxVFPVBkYeu2q/gCC9ojJyCHlceAs+rwt9TiXHDxL9CDhh1ebMU
	d6xG7fpdgJYacPe9R4hcodCTmvWgD35D89DisW9PETtyixOCfNa/fZI4
X-Gm-Gg: ASbGncvIU3GlYot/vRL4MC62uOwOjkEuh/gGgUZfjdFTOjlQEcvncUDIGvEhbqxHjh9
	eJr28Ax+W7d+0qZPXhEFXHkO8L5784dlutaprtwTwh6fcEDL8t94KrZmgvHWVZjCF9tYEVWFpFZ
	SIHQJlrWftqW/uUX9B4uN/uSSxkBNmDYGw/ezgcZ2sLitk91VSaUM4dDgpH6hYf8WlGwwannUcG
	DVm7Kqz84ASyGsDuo3Tf9inBosljN8EIECxPrB/7Nz+gU+BMmZw7H3RyjecmYhY4p7Mi6vl5HJt
	Zf5670TrO4GLX8+2O4n5/ouTlsi+V9ZJESxCkDNrZRx8E1i7kSgcc9D0FQ==
X-Google-Smtp-Source: AGHT+IHaN1oW5Hlwn8COrjTD8w04UIf4nZDmAvGd+2JS44q7BflFiyYUhW37lDPvB8pB5dOo1nA6Ig==
X-Received: by 2002:a17:902:da8c:b0:225:abd2:5e4b with SMTP id d9443c01a7336-237d9841785mr59869815ad.16.1750438478311;
        Fri, 20 Jun 2025 09:54:38 -0700 (PDT)
Received: from zinc ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f5cfsm21727635ad.181.2025.06.20.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:54:37 -0700 (PDT)
Date: Sat, 21 Jun 2025 01:54:32 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kisub.choe.0x1@gmail.com
Subject: [PATCH v2] staging: sm750fb: remove function pointer proc_setBLANK
Message-ID: <aFWSSAcboBVi4ROh@zinc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Call a function based on sm750_dev->revid
instead of using this indirection

Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
---
Changes in v2:
  - removed the function pointer in accordance with the feedback
---
 drivers/staging/sm750fb/sm750.c | 10 +++++++---
 drivers/staging/sm750fb/sm750.h |  2 --
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca399c..b65a527314f1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -571,13 +571,19 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 
 static int lynxfb_ops_blank(int blank, struct fb_info *info)
 {
+	struct sm750_dev *sm750_dev;
 	struct lynxfb_par *par;
 	struct lynxfb_output *output;
 
 	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
-	return output->proc_setBLANK(output, blank);
+	sm750_dev = par->dev;
+
+	if (sm750_dev->revid == SM750LE_REVISION_ID)
+		return hw_sm750le_set_blank(output, blank);
+	else
+		return hw_sm750_set_blank(output, blank);
 }
 
 static int sm750fb_set_drv(struct lynxfb_par *par)
@@ -605,8 +611,6 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ypanstep = 1;
 	crtc->ywrapstep = 0;
 
-	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				    hw_sm750le_de_wait : hw_sm750_de_wait;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 9cf8b3d30aac..640bff625052 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -169,8 +169,6 @@ struct lynxfb_output {
 	 * output->channel ==> &crtc->channel
 	 */
 	void *priv;
-
-	int (*proc_setBLANK)(struct lynxfb_output *output, int blank);
 };
 
 struct lynxfb_par {
-- 
2.34.1

