Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B654B7A3C
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403358; cv=none; b=fPhXQuAsjr6NyU+mNGXoYSeGQ0IZyBT8iSmIOhMtzg/ZNeUGLAbHnYoUzJT/z+sOjh0XQShrq089I8CLKnd6z3qS6HEw5DOhMbMqAxK66E956trYl6Ul8lP982NjJqV8PmMQxfEg22lrHo6p2lbj50AZrlcDvkj2e1OiBTaewfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403358; c=relaxed/simple;
	bh=Djw+CAa4TdmdhY24d0q7OhDkmwT0mOBOFc45rC3up0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1m5HIPA7rwUqHjnPeL6eLHQjIKU0xzqJ2BWK4xslH0hWW/eWN30NATYorruH3cCkCZAgCSfh3U7vdM1ePFo18AAQFX4XvR54FXUm3DLC+DfjCQkQRjSrHPy/D+il9hUBovk/2M1kySA7Hkiji/IvrYlwBySb0/paA8//K7X/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK8z1EHH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK8z1EHH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so14010885e9.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 02:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403355; x=1793008155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVwmmSqI00v46zZ18N04BUiAXDw2jjv5hFhr+um5J7s=;
        b=hK8z1EHHuujBCmTv3BzxFtL8Kc6v71GrTIpGJDTdI05D5+c04kZ8qPMMlBMdX6jPrz
         lwgtqmV0JubUOtvDl960PAuKVoA1kbAfwc7Al9SixsRCYQjV5BgXQTDKLDNfJ6QOsuiT
         Iaf6KbTiAM/WfgaULCZfl3xXedsu+SLWm6qQN9pqEjU4l0cwmDICgsaaOl8IV5NphEwA
         MzpVVGTCX5iIRxC7zcJEFX74CuknFfEj8fKRpVqUIjA9ypGvh6zYgbuukx3tLHux7gwe
         Ecb0R62JoUCkgUeBXgilTH+TJO4uC/WNAefoL65oAm4Bk7nZSKPtDvLiDI3MX8szuthO
         QFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403355; x=1793008155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVwmmSqI00v46zZ18N04BUiAXDw2jjv5hFhr+um5J7s=;
        b=l0UHtTwT//OrCleXMNrFXm/aSaLNlnv32U3+EwJCI7P0DaldWf/1943JBVfx7hLv75
         SGY0KxnDIeHe1dvcn+WMI6I2VYEvIHgvFfIy6qKNnmzH3JSJerLC5k5nQ0ht/BuBecrD
         dNbp5xUnk8hximxivj1aosGmfVHykJcrRoDjkCBhYrf8//Yvu925kx7MD+HnRKNJ5rjk
         Z8dvtxuejCnvPBQyWH38xmg4TH+coBFhaRAIaS0WTTUwNRyXZfABKJ6fY9+dUvn16TJ5
         ezzKYw+SJC3a6RBoVwxwoY/r7wwkmtQ3Wy8OodzSFB5/EBx52Omt1CRNm8orhi+jNf1H
         S1/A==
X-Forwarded-Encrypted: i=1; AKwUvBztv5DNH1IYEn6MmSVLnNOTV+7tFhtaG9YVE+J5kwKyvSWA/0RIWhH2Pr2S/IGUu+Q78Xr1TE/NxjJ2nxtn@lists.linux.dev
X-Gm-Message-State: AFq9FYIJCYQJV/p2u8uLG6kPbmpz+s5v5PF/IWYCCsGuQTv7yjqCnqwW
	i9uvHST/irY1tn1ZmZuBAzuUuEYeaE9/LhannrBt4a7ZMRAF3gTRihjx
X-Gm-Gg: AYBFou0GChCPfCBCs5Y+jp1U/p4F5vxIPq1a6Hionh//7qU5rwRes5cwOwuOnWtx2fk
	0T0AJa0/NdWyi4N2SKdZUOkx9CUeV6ZjYLpDhHearbZ4ZGt31D+19rolHqA3lAf6AXWvABc6nOo
	lzo/Qyxjbd/L54F1MVdtcnPC9QMcrxxqGvkZ9HF02dVJBNA1e96vGski+xLITPH+z9e7AWGe02U
	Iq5Kt8fWrIETVa2n13k/5a3WvGvvu/Zw6WomFyoFODtD9O8yQJ5xpogQBK8HNAKVIZ7Zqb9jkWq
	6uyEToNy6D3qzEvSMt1h8kS63pAIgGZT6vl04ukEJmwizcPZehFwdGgTawUGIZ0ecR/WvhvvonB
	tEwMLa9/b1rRzZCZpUjdGH/M/HSjWcOhbaOTZ/emJT6NpHX8yigt3rfEJTOHFQjOv5jK5kd0+U0
	aB2rgyOFDi2T0Qev2yu3Sw78bp3qRwzvEcVaUEYIQ6zh0BDHwJyg8UL0FyYn2ha39amh0s8y30l
	l8O3hfPSNYu6g26kimnqnJ4GrI=
X-Received: by 2002:a05:600c:3b1c:b0:4a1:c646:3edc with SMTP id 5b1f17b1804b1-4a1d75f2aedmr149554645e9.11.1792403354550;
        Mon, 19 Oct 2026 02:49:14 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm177669655e9.3.2026.10.19.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:49:14 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] staging: sm750fb: Remove redundant NULL and zero assignments in probe
Date: Mon, 19 Oct 2026 12:48:35 +0300
Message-ID: <20261019094835.1343-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750_dev structure is allocated with devm_kzalloc() just above,
so its memory is already zeroed. Remove the explicit NULL assignments
to fbinfo[0] and fbinfo[1] and the zero assignment to mtrr.vram, which
only set fields that are already zero.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
Note: Greg replied to my earlier sm750fb patch that keeping the
explicit zero assignments is good because it is clear what is
happening. In that patch the allocation was in a different function.
Here the assignments are in lynxfb_pci_probe(), just after the
devm_kzalloc() call and its NULL check, so I think removing them may
still be useful.

 drivers/staging/sm750fb/sm750.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..8702f6313f78 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -969,13 +969,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	if (!sm750_dev)
 		return err;
 
-	sm750_dev->fbinfo[0] = NULL;
-	sm750_dev->fbinfo[1] = NULL;
 	sm750_dev->devid = pdev->device;
 	sm750_dev->revid = pdev->revision;
 	sm750_dev->pdev = pdev;
 	sm750_dev->mtrr_off = g_nomtrr;
-	sm750_dev->mtrr.vram = 0;
 	sm750_dev->accel_off = g_noaccel;
 	spin_lock_init(&sm750_dev->slock);
 
-- 
2.53.0
Note: Greg replied to my earlier sm750fb patch that keeping the
explicit zero assignments is good because it is clear what is
happening. In that patch the allocation was in a different function.
Here the assignments are in lynxfb_pci_probe(), just after the
devm_kzalloc() call and its NULL check, so I think removing them may
still be useful

