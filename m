Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166A29E117
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743601; cv=none; b=XDBUxJcRH9fFZ/OF/aerVnO9BilKx5mygiBnlXo674UkT5IryuVWv2Cl+lAMgqVAohiUYSuZFioXJkv47IhxRQCFxztEVCV4ULNKhu1n3B6K4s32MZjEJL7uMEsjJO6RuP9xi9X7JycVj/Op9IKrT1wbV2kVkLkZd4l7WBuzrSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743601; c=relaxed/simple;
	bh=gKP7Hj4PgjLdlCElLMQoEHfgYE8vw4zIpqeIgVCFNzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWNBAdxM4GbjVgGU4gch4Le+jBhfeupiBtMJ5XVCOpwYvVUFG3u2DgTwHlpviuWSg1XXd31V0ivFqEN68idzSnZkgug9t5+I7lSft4RYQ+dotaITIBYW6hPisjL8hfb1KcNry4l2hVuysc8sBFqJJdk5I4Vnjag/MOA+L/KrDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLOsm4ir; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLOsm4ir"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so7277402f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743597; x=1762348397; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=;
        b=sLOsm4irSDf26DiKAGR5DbRU00s+96WnmUoD/lHFtIzCAqmrn+pBUV0zly5SnnHCU0
         HsYEaB322u6FbeWZAcfKzShTM6Fteqm1DpiRt/ud0+vthJCzUIbQu4aj+OTejdnzvQSW
         b/2PZDrvD2DnqYHZOAXfeEGmiamM6ck8K5m8eUtdqWGD9qX9vl2raDwUwj5lwtZfjNUh
         QV4vydHvy3y3ZhbrS+OZCipN5uEasKWjkyiTBtp5npjgHEvAWYEXR8q4axSN2d2jd1Jh
         sC27VMC9Im2snueo95YqMOzuGF2sNm27yYRR59+qx2L9ZcqlSaDR0fTbDcJedjFK8JAT
         E3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743597; x=1762348397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=;
        b=TpRm5xuPiYU3QwfOvVsYt7iWD6ooNV0N2arAMw/5lp3sUpmJ208fW+nXSa3dFu4V52
         /i2xOznahYsx3N1SiQRDdBivy3mjFWMXN6jAvKwZHhyU0Yo9WL2SuUdxGoLPBMBYgRLO
         2UR0ZjCZzNzwB0r6C20eyT01wsmi2PuTVzS2fGF0YdeAshk+vuHRs0gy3zBpbV9l69jL
         P3AmKZHzyc+dZuBvh94uDnU/fruJ3KJmZIuKVYGr7wyRXzSaKeXufj6m4BCeeNkkL5AZ
         TGr/QbRonZjIxOLs9O7ONT0j5yAbH5tCZd3IXbUGZRe2QAaOMsvmotwxx74uIn12EURF
         ik0w==
X-Forwarded-Encrypted: i=1; AJvYcCXYXJHTEeovq7v26d1FwqHFuCnmbzzJcLL1KI4u1GnYpCwvTQLgJzdiyeGfg1eTXrADw/qlFJ7dEeiLClzL@lists.linux.dev
X-Gm-Message-State: AOJu0YyEiDpFj9f5QzNad42f+hIyCfTLklB4xurBuQzGFj8BAj6j4iTC
	R0M1odsafbFELp8epcA/pgufZWljg6Jze8Dvk520KEKNJERIJB2aXyWvSF/sPZxcmEE=
X-Gm-Gg: ASbGnctszHeLvuPkYfjea4a6YZWggBmqJtCT2QUOxmASoEUvAO9eAG8vMjCrNPv1A75
	lBRy0SnYGzmhOUE0e67s4c/Vq8g9kDvXd8lPHOvk+d34EoHpGHMwbQDmwUin6p8TIf6THdidXGa
	Rw1NsR5KzHWnbo0EcAmg9K9z2U8PgeKUsS/KtacnjFduqlB6uUFtqYX8MEeGSyiu/9e4ciYeL88
	/YBJzCzrn6W5ypY4+auVEc7FsZgoZFxTdtH4WhhWGLTj1Czoz8rh+3sTkv6UMl/RaNIcbLG8LRr
	JCj70568p+efySobJWUD1PfrLkPAgRYOMSS9Ibx2cLBhJi9dStprp3hubVjZbm7byrmAMmzkha5
	1vcs0PXqpO2O2gib8dKmi/si/7N2Xb6hvqhdt7u/LvI/TkaAwkACY+yVv2sNVSkJAMGTOp+UNU2
	AVGgF1DrBhVZYME7Go
X-Google-Smtp-Source: AGHT+IHWVrau2m4RaNjTyO72rP9dhKVo76M6sAXBvO9VLZ1VFeKc3lw8F8BaYPpaPHfy3t8Vo31Ixw==
X-Received: by 2002:a05:6000:238a:b0:425:76e3:81c5 with SMTP id ffacd0b85a97d-429aef795fcmr2632000f8f.17.1761743597111;
        Wed, 29 Oct 2025 06:13:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df5c9sm26362401f8f.41.2025.10.29.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:13:16 -0700 (PDT)
Date: Wed, 29 Oct 2025 16:13:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <uajain@igalia.com>, Stefan Wahren <wahrenst@gmx.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vchiq_arm: delete unnecessary check
Message-ID: <aQIS6Q73Ss8xyJTD@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Both sides of this if else statement print exactly the same thing.
Delete the unnecessary if statement.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e2cac0898b8f..130be2f58342 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -4001,10 +4001,7 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
 		}
 		*s++ = '\0';
 
-		if (label && (*label != '\0'))
-			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
-		else
-			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
+		dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
 
 		addr += 16;
 		mem += 16;
-- 
2.51.0

