Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DC2EC54D
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605519; cv=none; b=Oa7xzdlqjN9OqznG7UZAoYLKHHhZ7BngEBGcN0nWwGpBAM3axPMG2vJVXmOS7yQz8BfmQYWYEuAt0H+DkBkNAuXWHkTr0L+YcnFmLg5/Ujq5P67cWtJOSPOiqKYTcfh0kWIKsaEvNueuDosWhvALiYRxn436mWdJRH99S3mrZJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605519; c=relaxed/simple;
	bh=rsHKKUqIFIU+jzfxFZDz7U4jp7ISiWCLS5lmLXmOoGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fh56b+IPOuqB8w/15k+bfELbjk6u+s7UO/Ea88b4bObe6iZ5LtsbBWwyPJ5nON/Xk3S2Q02Bu7McV6FcMOI9I3F248hJAf86l7PgPcDFTCPDnG7MDXl0HR6dsOq217IGP82JpGP0ajF9I+HfjhumD7V9vbVmUDGyHZCeeIzw+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpGbAHew; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpGbAHew"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8231061d234so5717042b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605517; x=1770210317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60aBumMe56xZXRD8vE8OZN2hvZkCH80+CQWsk/u8eek=;
        b=lpGbAHewUId4Xb2sZlqUH+Ba+wjZxnhybk6/LL1Rt+bEAMu8iX8YToDYpR23GIcv3o
         eMz37UT1ka+Uiz4rBLjvv1ULR44DtUyP8flKQ1u15tcEJcHV+EdabCzkRbisHdvW3lvc
         IZKMlb9DBq64Bz31Dl5WVwR8zWAdfyAu226k0rB0ZHZnaMOM4riB5cEP6Oioq0+joytP
         p2az5bLUSMjQtyJmFAlIqgxHw8bIVn5n8H31UKQWe1haL/CjmyDYJbPH6iq8hB5WZt9U
         cy8uyyD4W2dkrciKBKuPquhWm18KQpy2la6j0Roh28mXRsPVghnpR+jWP3guEpsWwtbz
         rwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605517; x=1770210317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60aBumMe56xZXRD8vE8OZN2hvZkCH80+CQWsk/u8eek=;
        b=dBJQGAZ0csOwAkfKkGqqkOnH7Fg9oPR0HYPmmd5m0phnrf2gRV8hO0QpcjBycdjUwe
         scQ+qXsqvRa8q1NDRFWBBgh7++OTTJX+ek+UxoWHVjdm/Y/sIS432P8KbywEhGk2/fmi
         G5hM9OoNnPJccWFhurs7De51VMdFX23HidKlu7ayWKJ/N+198bUVhkUWZSfeid8DJkNG
         ECY+hgDlmdxzwGFIYoH4RvScfQuyiNX8RV4Bcd4Bq7xsEGOeZhj6F+U32GWJbVmmMd2C
         rU6Wb6aaUxbbb5tfFUaQPno872J8Ko3VDDaPyn23Vf4HM75DJrWYzYH4VQLjAvH6dBro
         zRYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsepo/EBPEu9TtOxlN8EPbmNvfVtMRvEqo2zolyNZuV6fIItdazpcOEeLTN53FSTS0LYmrO59lgpfW9dGq@lists.linux.dev
X-Gm-Message-State: AOJu0YwEoe6hOauQ+N0+term+byz9K4oQ4YEn4Jv2kPkGxH5I2aC5/sV
	dyeDmiHs/qHXS9O5fXINxHMBRQDzqeRVlDr1dkLFXVw9wsHNEaTxMNrBnRYmuBLd
X-Gm-Gg: AZuq6aJ6hPl+sFP9s+3+eXQCULKKRBuQyjw79EEqA1r0HkaiNsRnVDghbsrh/nHUrD0
	bsh4aFZJIZapHQHoP6z4gbvgPPaMiRs2RdyocFwfoAuoxcUkNqBQtO6NvMTxsaFQ+a8yHvAo+wx
	N1B7ufVd6DMjcW1Git1h8D2lscrzEhmEfmw+tOfyawcSCgmMw0/beDL49mlPBv5pOUnQ+UrZjGq
	Lc8H7Jrv5OlfLSqEz9KBNFTG1enNP01ATlfG81Zi5EwQW6zcHvrZ7i9FHkyOExlDhApej4ipDhL
	8BUUkZRSDCPMmZB/8SZZluH/VDlXl8QFGfpbcCd3IuydoMBR1gNDpe6sGuWhb2y7/OnCrn7yRaL
	y/eWYDyy0vi4HlSgyqpYGfSFFwfgHNYxeMtF7VPzHFsEkX0i7mWg/er52oBgG0Ypjz7DPrElq9m
	Om2SHtRMXCZ/NQpHopq4MdYXSk6w==
X-Received: by 2002:a05:6a00:9506:b0:81f:ac80:499a with SMTP id d2e1a72fcca58-82369199b5amr4580614b3a.20.1769605517452;
        Wed, 28 Jan 2026 05:05:17 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c50fccsm2569978b3a.60.2026.01.28.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:05:17 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 22:05:03 +0900
Message-ID: <20260128130503.868466-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of marking the entire display as dirty, calculate
start_row and end_row based on off/len and mark only those rows.
This improves performance for partial framebuffer updates.

Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+
+	par->fbtftops.mkdirty(info, start_row, end_row);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0

