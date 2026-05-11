Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6253431F2
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493724; cv=none; b=h1AzUUyEHI6ZqVwxmc3AQSojn3JCdDNrNpD+PatB8LdWL1XGhT9VBM4wAbxFps49B1vYYBGrklorePKhPJgI6xXn8r+37j5f3lBzzEqWflEJC9jTg8oYxOWOnyyjjKRWoIigYYjoszD8szLG64QeE3juNcAjlBl51Bg83x/CHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493724; c=relaxed/simple;
	bh=JNiYQmsYCBUUZDsrDAH1HR51mOfkmhfC5EqZAOv91Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G05YNCFkGMPa0/F7qlFdtp6qLJlMC+VfMr01cRXdflCYhD23Az3l+7n7spUBH7B3LoFHhf16CSST6mnrQ2w9SVEsNn0bdmBsJ79pXsbF7rcMmNE1ZM1q0dVoAeVbW8DFwnQbitH86oocyiawQYYv++MjRm5sYtHD+7rZ1vabwu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYOL1xjW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYOL1xjW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3664df32e91so2586157a91.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778493723; x=1779098523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BzYQbTh4CweYWONe7kp2YWa8+xOQ2qVZjBV6+S9phz8=;
        b=PYOL1xjWJl0KzGUl3uF77nNkXEfAMc02A9GerrSzj68jl+rnF4xB30UNTyPyOBGwog
         1VHK6CWn6uRoqHZFwLHq/dxB44wJwnQ2Z/uHgal/ffXHofk7wZjcy85aj2xa3WmPae5p
         r0LAn0tnYGOFfD4fJrUxPiamFgqB/UTiCeBF7mqyZDgsFWSHMZJDanzGiYOd5KKOvHTu
         Zh1U4RN+7GrVX3kesgM0knh2uzsARXhYJ1+DWIcG3nwENMYFZrdR1+t2CQBHbk7yAlDI
         691OXTa3K1ZY/sDRtaHhWW0eoycGP+aOBlyrwTsNhLPq8YDcdDcAfrBKRVUSdxApxLax
         R+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493723; x=1779098523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzYQbTh4CweYWONe7kp2YWa8+xOQ2qVZjBV6+S9phz8=;
        b=aUC6L3tyLPIXgx/d3lidcSS+FhdS5fWyxrb6GgILOz7frX0GOIhxrwf+1Csm3Ldcht
         yM/EqbzwJ0nACM0Mf7PRlrD5dYYP3iyWMy03I58vq+paKcr/6VfuluZKWJapYaAUGFg8
         ed2UwPZlsHYKQ/Qm3vZRyWCbuXrRYnJSM/YX+b0nBhYBs3jLc8Sh2sgY+Q/FqAoQMvrV
         eY1Rr0v5ZQfs+q5nFgb2xxO4nqRZIsepyqnrCUJGLbZKSvXu6PTsEI1SikFuQJa1rNth
         gEtDDl4thTlXI2ePB5vMINy4NaYl/WUIc5pNV4/lhZzrV2nXWZWVSnALEhWSQoa/6cDr
         Hn8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9J5ohA0ujLoXrh2XKiZTYcRgEv+Rv2MosZRmebKhcVZ8gRWhn2bAFkjpnkuvehEU+76fHzNro4JIdETyEy@lists.linux.dev
X-Gm-Message-State: AOJu0YzWjLpCaL6DSMt7odbJH6NCphSI9nTXccgKhh/U+GoqdBmANipt
	fwveG+9m10YTtfmm4lWrzZmTxCyK+ySUTK4P54Qxpx24ecanjuZg1y03
X-Gm-Gg: Acq92OEGt3KlZ6ID64Q9of91ZY2mbcML5emR5AmmGD2ShI9NhTMPil/4MlMi2HlfJlr
	lbKDLY9SHW3dXCsh477TzgVtV39np+Gc7oijL4kuim1TRHp8fMnAURFV8aEr1VglmlKkvAqrLWu
	47R44itYqcrY+rRMKaw7ZcpTQVr9J8PBeWbFf+v8hu8aNspfePNEUaVOAIQcw+08U7WfnZZxq1x
	HeCejUlT8ko7ZHiNMiAJCd5rxU2LOIKHUd/W0Y7tIUY6p69DIlZOQTrsbfgNMMqdFo4E2486SFX
	NmNJ7OhYzlxsVFcR0+ZRqZ3DG4H74wFb75khuHJTsLcubBf7CHGEP1+/XNS3XXhWWEhhZYRo8Xg
	o0Sxzv3gxc4o7Dk6TYeBrJAf068mE3FqBmhJadlcYe/77qhcXJvaEm2mn0keBx16oJy9frPQLUT
	QnbYyInJ1Rny/marIC2oWgkdLNLvertwYhzKwNcfbt
X-Received: by 2002:a17:90b:3ecd:b0:366:1172:597e with SMTP id 98e67ed59e1d1-367d46b8236mr8511990a91.9.1778493722662;
        Mon, 11 May 2026 03:02:02 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.211.132.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm9243825a91.14.2026.05.11.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:02:02 -0700 (PDT)
From: Harshit Shaw <shawharshit116@gmail.com>
To: deller@gmx.de
Cc: tzimmermann@suse.de,
	chintanlike@gmail.com,
	andriy.shevchenko@intel.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Harshit Shaw <shawharshit116@gmail.com>
Subject: [PATCH] staging: fbtft: check return value of device_create_file()
Date: Mon, 11 May 2026 10:01:40 +0000
Message-ID: <20260511100140.4794-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_create_file() can fail but its return value was being
ignored in fbtft_sysfs_init(). Check the return value and
emit a warning if sysfs file creation fails.

Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index d05599d80011..cc6dbaeb6043 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -204,14 +204,21 @@ static struct device_attribute debug_device_attr =
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
 	struct device *dev;
+	int ret;
 
 	dev = dev_of_fbinfo(par->info);
 	if (!dev)
 		return;
 
-	device_create_file(dev, &debug_device_attr);
-	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(dev, &gamma_device_attrs[0]);
+	ret = device_create_file(dev, &debug_device_attr);
+	if (ret)
+		dev_warn(dev, "failed to create debug sysfs entry\n");
+
+	if (par->gamma.curves && par->fbtftops.set_gamma) {
+		ret = device_create_file(dev, &gamma_device_attrs[0]);
+		if (ret)
+			dev_warn(dev, "failed to create gamma sysfs entry\n");
+	}
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
-- 
2.53.0

