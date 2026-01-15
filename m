Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EFF33ADA4
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466429; cv=none; b=pqtIM8YkYIJfL02aRDcrDUsobHt/Ygj55Oj3VEuThs4gRIQWX1kMc9j/cgB66o5+Gpu4llMcVYoXYUblelFbgA0NQQ6s0/ABtJY+eqMAbPJHjGytqDrcXGw+9ytdMchLI/ksVXTi5/xUzdw++4itcKPjJD9GU870F1UIHBCYzNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466429; c=relaxed/simple;
	bh=0EgDX+r5PytoX9rVJtv3VrAnml+PdC7UzVBE2aqT0mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/HAzXOrINakqtmift8EVR04jHVBhEO6FdYUU5rdG3wSHtOZ5ovEjwZwEe7jiU7HJckrjksSChFr0PQT6jM4iV/G1YxzbsBHXTCSH4F0uYn2oGB3nMfMh4GXceXmcwEexyQb4SKN9RvP5hjs1QPif44mZ7cj8JLYMxU4MYjb0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3UnlUrv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3UnlUrv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a12ebe4b74so6939735ad.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466427; x=1769071227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipcJNOqF/EGIzTmaYen1uoPiKEHplQV3qlrZeOj+LXI=;
        b=X3UnlUrvPBaVw2c3iPCr/ZBq0p1M90ejZK+BxqW7ktAQisIkilvCNvNvfBPgs244/7
         fVNYIYWEDHFtiQnh/ryyYmGcC0mGu6fFPvkwkjEwcnHw8WQ7mkMDGED9VWwUBI1ua176
         M2VPhs4TJ4unp3wilPZD4yVakAulBCe7ify0bTpGoWMEGs7VxcBFI7Q/h7nA2LR37uVu
         xJEmimP83/MFHukG/cefytLulPfdj29U/OkhtcUoQg4O/HPCSyeb2YErmI0guAJfdWSl
         rRvt/j11SZu7EPF5jPVK3eGgCnfi/HQnnZ58zxsOXVxNrEEpKGptdiaOoN+eKYwxt/NG
         ZLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466427; x=1769071227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipcJNOqF/EGIzTmaYen1uoPiKEHplQV3qlrZeOj+LXI=;
        b=YoYl85/ipg6CooF0RpLl99rYPeEOaHOqBCZRrv5lgbliurjdu0n4ytSipDepZ1Bf+o
         pplTl5dRLUvEwlCFMvKJkljBBO2rJrVw1rWenJS7qFHDLR9TxGY7pwJex1nzepuXsMgL
         8MuddOfEyfVNjzxj/qBw2ns7fy/bp3TIdRlC4hOX+AAHvVILIedFr2E8C5u790ttocm7
         ZOWJKqJCq9W20CDam9mPyUr/P2mdRCcTEXXY8r16EidL+hC844o3IR8fi4/d0POgXfeP
         h+DsFEqAbOd+8OaCLGNrJzHWNuvTlsOOwsSxw6+bgiyVtR1g+zR3uq2D66wAxE+F0tmW
         ucRw==
X-Forwarded-Encrypted: i=1; AJvYcCUPrLVAAe/azrNAHpJefVk/eFe/KvocEEjVMdJ0FldI4lE6vru17W98oEPEbdQPQq4wxzB7GipG3eENewzN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/SSaa8OMqJA43ccmTcTqkud8I37f6W8toZh0EPwucftSU+8pj
	VPPXOHXFegeet7TxBXDQADNcljD7mP5Z1t3Lr6xcT8uYTfiupG6JSw9/3PjxI3pU
X-Gm-Gg: AY/fxX7T7cfUDliOtmpLtPXMTVgRYDDZACTBnmSYsWEd1tW4JvUDvQXGq9uPBp9JdZa
	9sZjSsU6o9wkbW7JlByG1O2m5BbWvbuUpu3sQREQdxywkyHYoHkHJ6B1dXYDvUfpWvD6PelK9bS
	PEYO2wreA/9uZjwtGWmZ/ZE5sXE8Z6Vb9z3OBRNsQKjdK9dDb86ASJMX+I8DUhOIAYhuZMFyMRx
	t750nHTor1NkJdoAr7SIK7obQQpwCSnQC8wVjbI8ftHYnRKq8mjRzviBKsfmyHPkjXLQPp14oTo
	t6Gv1+Ndf/YbqZCP68qi8ROUmAtOEN0/OSws6X0BSbCLg97S74QeUMb8B6dQMaDnYH8NVjj0FUg
	uGGrBO2YHUj88qiIuRJZqHkALnInxarC1WZLA0kB+gELwrEuryPueOJ5Hvmbqa54mTU7FY12zmZ
	3mqXzYzyraBk8vcyKkjHtvuMpfmxhcbu5GavfEk0aQkk6obGDVZA==
X-Received: by 2002:a17:902:ef44:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a599e34930mr57586385ad.37.1768466426977;
        Thu, 15 Jan 2026 00:40:26 -0800 (PST)
Received: from jeonwooyoung-HP-Laptop-15-fc0xxx.. ([121.125.189.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48be5sm248390095ad.30.2026.01.15.00.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:40:26 -0800 (PST)
From: WooYoung Jeon <chococookieman1@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WooYoung Jeon <chococookieman1@gmail.com>
Subject: [PATCH] staging: fbtft: replace udelay with usleep_range
Date: Thu, 15 Jan 2026 17:40:19 +0900
Message-ID: <20260115084019.28574-1-chococookieman1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the fb_ra8875 driver, udelay(100) is used for delay which
causes busy-waiting. Replacing it with usleep_range(100, 120)
allows the CPU to sleep during the delay, improving system
resource efficiency.

This change was suggested by checkpatch.pl.

Signed-off-by: WooYoung Jeon <chococookieman1@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..92c9e4e03 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 120);
 
 	if (len) {
 		buf = (u8 *)par->buf;
-- 
2.43.0

