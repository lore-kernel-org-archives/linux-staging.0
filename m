Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D84316199
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 02:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785723545; cv=none; b=G32GC/QNDrIHX0D6xNvpv9O7kLKf49GgEqmltNZqcXtCR7mZ57GN5j/u+PoMn38Vp+koavpBPEuBEkapDvpJ40rZs6wX4UyO7Nq1AaQvkr8PgmVMmWmaITbygNZUsU3H3rWSYx2s7uCaHPscSzFiGS2ydPH9vayH3BdCRFfB6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785723545; c=relaxed/simple;
	bh=iESi4iCCkTTt9OwbmlB9dC74SB5v5pJTXr4JYM9D/40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPPDGHj4JDvhcEF9Qdv6Gxw5b3t3XN5LjRDm6JPYAUO2icpg6Emjt4K+DiduiJmbOPTyepIe/yb9UczFaOaINJBRQ9COTUh5Yzzklq6CvOYKJFiojZ/+KDgljnKsP1HM8JJhECeakG3kCEuZNphxU4jthn69GHOY3oQxnjCUKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXuD9wjM; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXuD9wjM"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf9466412fso2476151e0c.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 19:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785723542; x=1786328342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=keSmNns1zJBJ/ItsSp0VGQC44KolZzBEV15FLHoEMtk=;
        b=YXuD9wjMcIuc/0TPLf++3quvRBxGx4/S172xQsQlGEVfT94dBX2Rej02UuPToo9COh
         Am4lQsvF5QLpbq6Ec3FCq32+hSS6VvjBu7XLjRpBT9keI3Gt6w9dXQHRk2JOi4Is2Ydw
         p6CFZtkwNnLV12RT4HsclVAk0C0EJj83y/bWd6nk3SFoKJaqKzbQ8MMhBaahZP0CFc+i
         A/iLBJizWJlQB9RtKyxv6Ow+WrC0eLSFAT2iPOVHDOIafo7gyW477QrH506iXN6POyCv
         +ia/upzD8vo53ID1LydlSCCvcepIoEuBbVSkU1OopBnorfPrk769clwOZDtU/xR14KO9
         Z8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785723542; x=1786328342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keSmNns1zJBJ/ItsSp0VGQC44KolZzBEV15FLHoEMtk=;
        b=h0hxSaE1CUh0Gh5a2L9DbOLL4QXl/ZX92kNya0cyfr0/VUMacTcUjB843JJql555vv
         eswDycRf5fDcG22E8cyHGyjy9eRE7UHM/ezXd4iu5+134/c3S89Ff1FLCaFU5Tic9SjT
         hN4qhWInK2JUz14hrqGFu6lgBTbvUoKOONEhXc/YT8O8AtjE0obLrhLYJrrtKYdXo9Y/
         Cbtgud7DUjPgnGREi9dWR2E53GsUmq/xV37KncCVZBldufRh+OlOh/UBnI6LESHtT6zW
         WSoJDGqRrFoFjLY6KFc7s8JNPwPcyFL+lk8izpXQQm3oAV43DNogKfmBnlF3dtUkNUGV
         gzrg==
X-Forwarded-Encrypted: i=1; AHgh+RpycuCDDQwhD4+mdLfcxYPMtab1Q019njZk+mlYhWcFs9uY8INBnoP3soJSqohxGsk33rdhrkhjmyHEjbTd@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6MxhtrLJlTkJUpfIsJUaVG/Hvzhh3S/3C3Us5jIUBGAtvv7dA
	KbgRo8UEpU7ZcRDJNEbOlh196pmRSB7pcsbRtfjX4gi4ToICtKDoAum0
X-Gm-Gg: AR+sD1276bgunuYTGaEylrMp/UuFUl3uHxd6TuFrjVC9Pscr3oPopRg0j3529HmsAjz
	SLJGwx5PcqZrc0PLeiPXVJJw2G1lKZX3MFXJ7norIVNlCIGAgdH0SvhvPCyTDY4FsS+t7eV36Hm
	s1pfLbwnezNioVWTHO1kE5gMsE8AZzAU5QLdOjSIiOirdW04wAN3AQOTmNGpzwSah7NO7E2hHf1
	r7oWXl45PP4ChgP0jLvEEb1lPn+2kDGiZmiCUPYWf/03D1ie0/fm1KX2xLG4ens0GdzWY8Q6oXr
	r9xgTra+ncnPQX5yhPV0yzzz/j6+1QwMycsnGd1xnBpcNJMuTLMEhSe8/rdcMZmoBdR7OWWZj0Y
	DenCvy7mQTMfTq1GXxWTxIXagIuhJpPsxif5Ac3ICDX0fGXgcqqFgGXPitvq+gQ52OcIQ13mnkp
	HhzSsF3yIkMVCbSobKdc2zzqLgWUpZNsFAYWiNk77jj6J2PuQ6Lq7onZPDWgAVRkowMJ6/EG0lP
	tPI6xKT+jVKcRYOOC8jxj8MeYZ0orrGwtsccOVPy0tR9cpljw==
X-Received: by 2002:a05:6122:4694:b0:5c3:5f0e:d1da with SMTP id 71dfb90a1353d-5c38786037cmr2610705e0c.14.1785723541814;
        Sun, 02 Aug 2026 19:19:01 -0700 (PDT)
Received: from NoahDesktop.tailef97f4.ts.net ([66.231.155.87])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37ede14basm7104579e0c.15.2026.08.02.19.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:19:00 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH] staging: greybus: uart: Add comments for lock definitions
Date: Sun,  2 Aug 2026 22:18:57 -0400
Message-ID: <20260803021857.989-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Add comments to spinlock and mutex fields explaining what they
 protect, as required by kernel coding style for lock definitions.

Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
---
 drivers/staging/greybus/uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..46f38428c5cc 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock; /* Protects read operations */
+	spinlock_t write_lock; /* Protects write operations */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex; /* Protects port configuration */
 	u8 ctrlin;	/* input control lines */
 	u8 ctrlout;	/* output control lines */
 	struct gb_uart_set_line_coding_request line_coding;
-- 
2.43.0

