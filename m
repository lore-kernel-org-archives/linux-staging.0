Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0B5F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:05:10 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 32so4094040pgm.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NwKF2Id58T0+Q4X2V9aN9037qk0PD32MTro/1e/Ds88=;
        b=ZLXpn/oZ49bMlmklfTI2k7sZhQ+0C9OeZ7VXB+Hywup9pWjxk5oRbgO8TE1cpoXC8C
         +PRsUv6OLr73zUTDgV/s/2KA51K0qJ97XZmtkNtZWSyR/HLsii8rLG+YF8Rs1vvwdwSC
         UgUjQHeCCAwU35QikQCNYIVc05SPPIrrvKCW9CHBVAk1i74czU7Agj8+73b5aRqmP/Kb
         M9ndBgKXOklbs5T5PYSqansXI8FoIy4FnVb78PHHKz/zUk5FpQQRT/OAktsr8Jxq9at8
         iWCFAf36ESjbFMIDmHO88JJuySpmwkFHIGCCLpjLjq6CfebDTL9yrBTy8fUmMWpDa/TV
         WQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NwKF2Id58T0+Q4X2V9aN9037qk0PD32MTro/1e/Ds88=;
        b=k/JunJ6jXlACcnWQ2HIpsU7ecmivQ/SmrMFGOh9Bymw5LuEYhlUlOgayJ77EHrjdcr
         QdGouSFXURWrsmy8Ceb7nQGDGHFlJtyUPo4Yz9aBTXS6sSKX54IDPDcGhcxGMIL1pxJq
         s+zaSBS3zbeY0iCYqp/X14KAILXbD+FD0FzRQzGcOrcx8GmaGFap4DpQg6BFhjMGj+fz
         BORZnowXWvvT6YorxdLfuFIZEG/uVfP16W+T8S6x/YzAq1ZtttEHXgmqXEMFHK8Mqjm9
         ZSEr4vlyNQveriq7qlfPH1MBoND40lqTPQl3LV7Gq+1r/1A7MC0mA4Boh+XuV8AstsGX
         9MsQ==
X-Gm-Message-State: AOAM533UZJClJ18OumK9+3xRy68ySZQu9amWkiDb+zqenox9MoYyAUQ1
	1z0UmqS4JVw8E4kVG0BEAYM=
X-Google-Smtp-Source: ABdhPJzwYrWPBCp71W6OTSt/+NtkvOrHJVunRMdCWyg0J4RMLKpEsesX58sJxFEsq5BjNvX4Ogxlrw==
X-Received: by 2002:a63:4842:: with SMTP id x2mr708260pgk.229.1616745909929;
        Fri, 26 Mar 2021 01:05:09 -0700 (PDT)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id d8sm8661064pfq.27.2021.03.26.01.05.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Mar 2021 01:05:09 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org,
	zhangxuezhi1@yulong.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix a typo
Date: Fri, 26 Mar 2021 16:05:15 +0800
Message-Id: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

From: "Carlis" <zhangxuezhi1@yulong.com>

Change 'tft' to 'TFT'

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4f362da..44e7acb 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -775,7 +775,7 @@ void fbtft_framebuffer_release(struct fb_info *info)
 EXPORT_SYMBOL(fbtft_framebuffer_release);
 
 /**
- *	fbtft_register_framebuffer - registers a tft frame buffer device
+ *	fbtft_register_framebuffer - registers a TFT frame buffer device
  *	@fb_info: frame buffer info structure
  *
  *  Sets SPI driverdata if needed
@@ -873,7 +873,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 EXPORT_SYMBOL(fbtft_register_framebuffer);
 
 /**
- *	fbtft_unregister_framebuffer - releases a tft frame buffer device
+ *	fbtft_unregister_framebuffer - releases a TFT frame buffer device
  *	@fb_info: frame buffer info structure
  *
  *  Frees SPI driverdata if needed
-- 
1.9.1

