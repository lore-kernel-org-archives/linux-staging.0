Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638B70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 12:55:39 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id w11so863983ply.6
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bD7BmJLsMFKPJi26Vt4AcHwe8h+Gi9tyJ2So5fUgWQg=;
        b=PBEzo7+X1jjaDjoT3sILVgIkuqHSGdjHybEj7ugJj1stn7nVD9ZjNdIzhw27oj9PKj
         Fl8f1ZyIlCxaAWvLdbnyU2OUClBKnKnSdpWVPrZaDIPsFL+BFXGgBX1e8Aiu7GR1COka
         gm7zDpYF0Wbv7eAvf65i3fUpKVY0ldy/5N7arDvwH9gZMjw8Oh3nQiI0x8/QbqNSZHrB
         1TLs+10jsNDzoBkowEJIDeZKosA2d2f0zSnC5FcujIoEX8KVpWz+MBB/J4jr883ziy/0
         L8nvqiSsgYK/3Cn6DBu5DAhalefbp60+jyL2hBEp8b5a3dKozwPqCgv34JEDFdNMIrNH
         XG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bD7BmJLsMFKPJi26Vt4AcHwe8h+Gi9tyJ2So5fUgWQg=;
        b=VRetdxkoag+zkgb3HacMivYPgXvW0CBPx1vzQIpDBJSL1aqB4W1o8HMmwagDW9/h0d
         +r9k0eBgwGd8doQjiJ6YhN/D/UiU8YCNrvpA6gfYOfClci/iiZQ0zsbJZ2JD4yzN7qV0
         aYPos5xO+pED98BMg3fR1L+NaaspeFGZkttQ8chhc4SpBTMF6gzf5nKjLnn04M1rmR17
         j80QIWF0OuvHlso/1GIigj8wog4QJsFWAUykmrVcdqPy5+Z1UKorg3xL+DT5gs3mmVD7
         bXlwPKOmh3A7VayD5GOKXAwdrZyum95kubPq4yr/3Nxd7XvyCvMAIuXa/nkW6nYV7H52
         iUdA==
X-Gm-Message-State: AOAM533W9hM2mSI0zVoGzLz68wsh3C+R94GEcOXFWPJ9fnl/V0GOuaC+
	ODttiBFiqe/56F3C6uTp2YU=
X-Google-Smtp-Source: ABdhPJyBJT+jB/6VmowdbHzWRJITwo+Vt9TueqySl4LbJbSV6+tKmwR9e21rR/tQvLODSxDkupaGow==
X-Received: by 2002:a17:90a:8a8b:: with SMTP id x11mr13657566pjn.151.1616763338813;
        Fri, 26 Mar 2021 05:55:38 -0700 (PDT)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id l190sm9164110pfl.73.2021.03.26.05.55.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Mar 2021 05:55:38 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org,
	zhangxuezhi1@yulong.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: fbtft: fix a typo
Date: Fri, 26 Mar 2021 20:55:51 +0800
Message-Id: <1616763351-7433-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Change 'tft' to 'TFT'

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
v2: use full name.
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

