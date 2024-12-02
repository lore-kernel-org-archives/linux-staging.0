Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13011DC182
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160791; cv=none; b=dF7274uVKP40XVvlwSmbLcXbqpE5RjFXeKB6mTayRnCVjOxjU0NiJUWgMFjFTEeaSvq0BHnVQzpCiLH9lcl8yYj2Cm4KXSFeZ/tMfaPJ2pzBCWaSFzMkj8h7Gx16L6aTmuB9QOgBmwLQxw2+8U5l+OMtliEx0MEDUfytj5mywao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160791; c=relaxed/simple;
	bh=09GWm3NPgrh+ao6MyuAlAXhT7IU3BvGUhq/z4ZdrWN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0dRn329W3ynQEQpksQCNVWS9o+94zinraVzBA7Nb63b3wgErEGBZ7M+4W6uATn3LRV+fQX3PeKPDLfhShrCzskU8JHK42Z/zy9mQmnQeC/BhlKwOPmliVbgBHdRwnOYlxzBMyyAN+AU3xDNQ/y6sdx9BgLDaeHhmcaWkF2EXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdxFvXMX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdxFvXMX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e2880606so2771310f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 09:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733160787; x=1733765587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9UepKrEEs8M1uTay+TY4ozxAVh1Q3ubIpqMJm4iDlM=;
        b=jdxFvXMXp2No1X/GMxVXThN3f0gdn1vxbMkzz3VsYOukR7z034cDeiur1fdeNR8aAb
         asV7UQWLU7HF99aRJYYqseyNS8YG5DcxY/Z57do8v5FV0QDAAyt1on2L96lezRwLNsE6
         Bpd0sfknM780HMiqI7KFtjTojAE9LHxeDbLSDBRHV4DggvItRuz40ZBixOUI/wIjp4jH
         JLVw9f54podCrcDJeqHsOuz6y3PaDkQ6CQiUkhCcl9Esgo/WxgBmaq0YrxRRaT8OTNga
         VvHo8XyMQvS1KZfDnHNAs/krjOzd2QLfkzi1ihGV/r+le3527tpSF+P21kBJHgs7RsQO
         Noyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160787; x=1733765587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9UepKrEEs8M1uTay+TY4ozxAVh1Q3ubIpqMJm4iDlM=;
        b=oQw/mlbQ+oJ75RGTUdp5bV1auAGRWoTGtVc4rHkRW9Y46KZX94BvSVCuKgAa/8AUxd
         xV+qvkxKjZhSmF8yIdKL30k5tpSqdyedM4P560CVGmcHLTNW09BpL4rOAnsvTSwJnHBr
         UAuQiDV0oV4Xld36ufI/CURWBhapNsKOq5CV7NZshVheG6nX2dfVSFSuvUYHc1EbqZHr
         vyV3TmJjIFqb70HagM7GZQUg6Gt8wPG0AuDqYR6rP7HLeA/jetB/PMV4b8nsWTGt+WMR
         N5/4pYtP0IPRr8FsliOahETIref8ai7nmUR9kF6IdE0A3lqbWN+T894eF0zij3wSbGIV
         uJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCXYNzp/LARWp724A+0Dyw5QgwidrUbSKh28CYWATs4GliT5iP6m1TS0I4rOp3eaMvxePpX4thSEMHFwLe5e@lists.linux.dev
X-Gm-Message-State: AOJu0YzXsXl6mSwi2ck9uLb3Md8MxJt3Y3VBEvVDpMOSL6CKbJqCQ0cU
	pKaC6zbglGctgtY9ZVTOD+1wW717Oi0XDvf87YWHtRZUbORrO4I3
X-Gm-Gg: ASbGncvB2qyRUoETOeKO5KQ02vjHmfS+K1L40u544eEaiv1PL3w0/rMLHMDuCsxeboC
	cgF5bRN6dm/rl6hTOQEgJ5a9oi31pto1+ZHCEomhm3qc7tQuFqq9N3wh1PCknNxvO4x3P+Oluji
	+PTqBaqpeMYa9UtZ/2EPsrYv71bYkNPrMzrCDurynmq0S0Fceo3eVvan7Ji8H7yg9Ddl4io9Gh3
	z71YvrqG5t0LV/Hs/B5QXoesBrto4SdY/gxl+jQf6NmLO3k7w85D8LdyyLsj8i9/dJf9gKfMYIm
	Yqiw8sNcbQ==
X-Google-Smtp-Source: AGHT+IGU6TrGjJrZxC949YpDcF4EFU17N6Vqpt5++NRblmB2X+oGB3LAKLP6YHuEwmTMXaDUxAM/kw==
X-Received: by 2002:a5d:59af:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-385c6ebb8c7mr22949983f8f.30.1733160786923;
        Mon, 02 Dec 2024 09:33:06 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dec66e0esm10595076f8f.43.2024.12.02.09.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 09:33:05 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v2] staging: gpib: Fix i386 build issue
Date: Mon,  2 Dec 2024 18:33:01 +0100
Message-ID: <20241202173301.6462-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both drivers cast resource_type_t to void * causing the build to fail.

With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
which cannot be cast to a 32 bit pointer.

Use ioremap() instead of pci_resource_start()

Reported_by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap

 drivers/staging/gpib/cec/cec_gpib.c   | 3 ++-
 drivers/staging/gpib/ines/ines_gpib.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..a1ea4d9e370a 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -297,7 +297,8 @@ int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 
 	cec_priv->plx_iobase = pci_resource_start(cec_priv->pci_device, 1);
 	pr_info(" plx9050 base address 0x%lx\n", cec_priv->plx_iobase);
-	nec_priv->iobase = (void *)(pci_resource_start(cec_priv->pci_device, 3));
+	nec_priv->iobase = ioremap(pci_resource_start(cec_priv->pci_device, 3),
+				   pci_resource_len(cec_priv->pci_device, 3));
 	pr_info(" nec7210 base address 0x%p\n", nec_priv->iobase);
 
 	isr_flags |= IRQF_SHARED;
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..b5f8ea57fd9d 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -780,8 +780,8 @@ static int ines_common_pci_attach(gpib_board_t *board, const gpib_board_config_t
 
 	if (pci_request_regions(ines_priv->pci_device, "ines-gpib"))
 		return -1;
-	nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
-						       found_id.gpib_region));
+	nec_priv->iobase = ioremap(pci_resource_start(ines_priv->pci_device, found_id.gpib_region),
+				   pci_resource_len(ines_priv->pci_device, found_id.gpib_region));
 
 	ines_priv->pci_chip_type = found_id.pci_chip_type;
 	nec_priv->offset = found_id.io_offset;
-- 
2.46.2

