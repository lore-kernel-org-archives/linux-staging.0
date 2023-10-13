Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407765695;
	Fri, 13 Oct 2023 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K140uhdV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27d1aee5aa1so1287487a91.0;
        Thu, 12 Oct 2023 22:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697174116; x=1697778916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKjEcIigmoEinaPG1JriR5J2v44jnRnKiYDnkmhOFmI=;
        b=K140uhdViI7v++FLgHyiuMUIe+NmzdDu2dwq1gnii8cKXJH0AmnTM1zcyuTR6gyz+r
         gGVgY2HddctECFI54dhAjQIz6YIRz/LexQdI7gaodNhmWUHxyNFXpBC3+NUB9f0jkqFD
         tFNzWHuIn3Np5nIxHQw6zp2a0gX566F2mLUeJZl9ntnPXHgTBQaVEXEavEhM+p54BAPw
         YXedYnwsro/kYYDQwzfdlgQxD0sTWa/Mswjsffud2FZis9gBzrtoAqD57hdrqqt65YW6
         vYLbAM4ebjErF9yjDQPgkqtzqK/GcLUBHNqYl/wftI0y+9p0A89Z75u6jvCs9QfjgpOO
         n1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697174116; x=1697778916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKjEcIigmoEinaPG1JriR5J2v44jnRnKiYDnkmhOFmI=;
        b=hBFv/yGpONZIEsoVitifnyUHBvrkpyYgHlhPFA7GUwROF5MbSK4C9q0Zj15hDtoaag
         yOGxz7Fc/V23mHALe7ikJNrK7OhvoEjJi1aoyf/k+/0V7mAHB1yWfrE/0RZ4uz578NXK
         rS53dYp+ETnXOj31gjMRd84WmCf2kzlAcnSmeMEW1ejZCRGHCG6ojOzWbCZ70HwQWx45
         Pc/1r1SI4R9qr/4szsuugTLuybmXoahUMvGiYM0BJL4SnyDR6GxBifKyc6ksiI/MU3Qh
         dd2wLSZj9dIfUCeBesx0D40194F47JhD+h1SEOYAnLMPO15v6POlid/nxwwZ8PNrtEoC
         SCuw==
X-Gm-Message-State: AOJu0Yynj7Fdev6UL9R3Fgp5LwUHt/Ovu4FwNSfKshp0kOjGW/yrPNEO
	KX/BAT0g5S5Wl/Hb6vSxgSA=
X-Google-Smtp-Source: AGHT+IFIHVjDl5w8kCEUBtP2Sx7CTrSrJc97kJKWwdh4nhqH433WOlxPmQnOji0VmPUs6XFnCFSY9w==
X-Received: by 2002:a17:90b:3758:b0:27d:306d:71cb with SMTP id ne24-20020a17090b375800b0027d306d71cbmr2752325pjb.10.1697174116459;
        Thu, 12 Oct 2023 22:15:16 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id gp14-20020a17090adf0e00b00276cb03a0e9sm2697459pjb.46.2023.10.12.22.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 22:15:15 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tty: gdm724x: Fix coding style checkpatch warnings
Date: Thu, 12 Oct 2023 22:14:58 -0700
Message-ID: <20231013051502.9578-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank line after declaration & match alignment with open parenthesis.
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..0c61eaff6122 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
@@ -271,8 +272,8 @@ int register_lte_tty_driver(void)
 	int ret;
 
 	for (i = 0; i < TTY_MAX_COUNT; i++) {
-		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
-				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
+					      TTY_DRIVER_DYNAMIC_DEV);
 		if (IS_ERR(tty_driver))
 			return PTR_ERR(tty_driver);
 
-- 
2.42.0

