Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFEE33291F
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 23:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580356; cv=none; b=WVxSiiavYuDUbql42YWg/cjsdlxpZ6yzydojgHNOnqvUnnrI44ytoprhdPPApm4VZ/rRLMG1nuV5dlaIkkT7z1c5QYK4BhyfrlECPCl48zRhL9e6t0+HDkTyxBd6jb0RoCC8KDQZdHJQF23kkwIrtkXsaQd18Gi0Z3+sSMacmZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580356; c=relaxed/simple;
	bh=Pa8F7PZEbktd8+dTv1wrWSTv+ufyPg9PDeh0s5sqG0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tUH0DVtO3lkiqatRWpMzEHLXHKhXSFeDshGY4Ci0r1cOKmnPpDFPyDvvktez90n1H/v8kU6z5hhMm7cmD3BSxQD9LR2Tc8Ck56I+SR3vrMS0Bn0k8LWiCltPqYyx2wsloI0z/wPa23W2LtJkLZ4NpKjnkufQkUk3ZKi3AB4ObEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uqt8o6MB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uqt8o6MB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-480706554beso67916115e9.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 15:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772580354; x=1773185154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+Bz/MzrKKLJpBKItUCSkeFF5VnFb+6x6e0SzQdfs0Y=;
        b=Uqt8o6MBICIV/A2I91FTrtAJ0osVEh705d8zcwgKDOMd3ZkIAyyzLQnx+3QWtTVTyG
         WyUXjqFR9SImgaFK73cDFCZbnejPATHbpyMTs9xvn3kG6N/Ae+nnczImJrJnSksdLajF
         sytycqoxbAcFF+ZCRmg0BgKLHUXjYoxOoc+eizTz4wnSIp220BoOYVk0fDMNrc/Hxi15
         eFbZ6+htw6m5k9RG2Aw6aqrbXu6W/XcBwvn1vL0ZNW/lg1CnH1mCQGbyPvE71M2tX6BV
         z3OD3e/Mo+lEQ2IyK8GltsLImxfMPKrF9RFwPBuJ58ognJFfRn8sWi1jfgf7fidEhk5k
         8V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772580354; x=1773185154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+Bz/MzrKKLJpBKItUCSkeFF5VnFb+6x6e0SzQdfs0Y=;
        b=vJpL57UoThRWUsfOAt7ukrqAuOtOOIIAXD6A3rbs8CDNZmyf8nh+CXycA/DLalTGPi
         uWc2AJ/0Bc+J7g+0hPDIMyCUTUiChsutqbeUZdvsCrkpwDx3gsjEKfEpAAjT7aagy7PB
         Dg6hGmSneNGIF41R0sA3WsEJCj43ENZj7B0B/DVs0v5PFyCaRpUPlhSvqS3O2eueya8a
         jsesroMioReR/PVsxuZCS41GqBzgWgXeL5qa9nm3G7R6msd6tBnOUx3l9sJwkxmtgkw5
         pFfwXfBVRBPyrB297bktJNC6OrHJrSq/F4ThRE6BzZEuGpxqSnk39ksYhj12urYp1zjP
         Z//w==
X-Forwarded-Encrypted: i=1; AJvYcCUcPdxiJttweeLDyzP3FY1yU4DZiwoCIk9ID++heXczEj4fY+8Ni1QiYt1pukaFl3eB8Q7gaJ2sND+k1Xre@lists.linux.dev
X-Gm-Message-State: AOJu0YxMtrxDiQgT54mUz5h1SHyLRkB6Vn7kxIJbqEoou4wHMhwxXMkq
	5e0HCRxkA0lswhxtTgKEr/ZjTvBkSfkM2A7haF57w3Nzlyujm4dWHYfm
X-Gm-Gg: ATEYQzw3f8yacUbir39D0ku4cIm0Al0OCz/Wluso1mKEnsg2upH3axq8uyQdiy3wruC
	LG4KMi65t8xXfkmQ13TX7/4sG0s20AViEdEYwUf9rKaNuHwytELN2xGtP+S1V7u2CwQxwuOX0nA
	fuHdRYIDsFsS4gTXJIQSulsZUK6/D8trvj8MJaDZIoHTVpqdZKQ6hilo+LwksLwdScv4KrwmB/Y
	Ta0Q4IDEZ15CehIWu7RnbhyLXFJhnfa97sVqLQGey1+bskBq414dkmeARh1t/pfAuwPqC7Rb4es
	FgOBsyvB+mMZNpFneT0UV43YZnKU8GvqGoXD5U+5XVrmHJhUAak5aVt4ZRgYCP3zpbntGplM+iE
	EbYwd/iB8nDFXGZ7xurSFYIO34zklGJfuOAXS9SK7Px1TJlDfTxmemiNEupqIw8h3VVopxNwCIV
	PPLP/PfDzJvYhSOBUhzELwK8f+8D+yku+jZhaBzxJOUomc1fK+jw==
X-Received: by 2002:a05:600c:c84:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-4851985df94mr745515e9.15.1772580353491;
        Tue, 03 Mar 2026 15:25:53 -0800 (PST)
Received: from arch ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851335648esm68036615e9.5.2026.03.03.15.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:25:53 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH 1/8] staging: sm750fb: remove unused GPIO_MUX bit field definitions
Date: Wed,  4 Mar 2026 00:24:22 +0100
Message-ID: <20260303232434.1850583-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO_MUX_0 through GPIO_MUX_31 bit field macros defined in
ddk750_reg.h are not referenced anywhere in the driver. The register
address GPIO_MUX itself is still used by ddk750_swi2c.c. Remove the
unused bit definitions to reduce dead code as noted in the TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/sm750fb/ddk750_reg.h | 32 ----------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index fe412ead72e5..59ecbc0d48f7 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -76,38 +76,6 @@
 #define MISC_CTRL_EMBEDDED_LOCALMEM_OFF               BIT(0)
 
 #define GPIO_MUX                                      0x000008
-#define GPIO_MUX_31                                   BIT(31)
-#define GPIO_MUX_30                                   BIT(30)
-#define GPIO_MUX_29                                   BIT(29)
-#define GPIO_MUX_28                                   BIT(28)
-#define GPIO_MUX_27                                   BIT(27)
-#define GPIO_MUX_26                                   BIT(26)
-#define GPIO_MUX_25                                   BIT(25)
-#define GPIO_MUX_24                                   BIT(24)
-#define GPIO_MUX_23                                   BIT(23)
-#define GPIO_MUX_22                                   BIT(22)
-#define GPIO_MUX_21                                   BIT(21)
-#define GPIO_MUX_20                                   BIT(20)
-#define GPIO_MUX_19                                   BIT(19)
-#define GPIO_MUX_18                                   BIT(18)
-#define GPIO_MUX_17                                   BIT(17)
-#define GPIO_MUX_16                                   BIT(16)
-#define GPIO_MUX_15                                   BIT(15)
-#define GPIO_MUX_14                                   BIT(14)
-#define GPIO_MUX_13                                   BIT(13)
-#define GPIO_MUX_12                                   BIT(12)
-#define GPIO_MUX_11                                   BIT(11)
-#define GPIO_MUX_10                                   BIT(10)
-#define GPIO_MUX_9                                    BIT(9)
-#define GPIO_MUX_8                                    BIT(8)
-#define GPIO_MUX_7                                    BIT(7)
-#define GPIO_MUX_6                                    BIT(6)
-#define GPIO_MUX_5                                    BIT(5)
-#define GPIO_MUX_4                                    BIT(4)
-#define GPIO_MUX_3                                    BIT(3)
-#define GPIO_MUX_2                                    BIT(2)
-#define GPIO_MUX_1                                    BIT(1)
-#define GPIO_MUX_0                                    BIT(0)
 
 #define LOCALMEM_ARBITRATION                          0x00000C
 #define LOCALMEM_ARBITRATION_ROTATE                   BIT(28)
-- 
2.53.0

