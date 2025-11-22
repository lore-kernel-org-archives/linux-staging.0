Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075372032D
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763837840; cv=none; b=C/h0r8B2cVgZ/pFFHFEMkkdL3PYZZmgCLRwEaRpljmUG1wN2WE24c+ij0TJxglsz1PFUSoxv2/E++7MDATY1sqHuuEXtSt4i2TaF6KwoIAJEo7RX784Rh/2rcXbfS2pxZlDZiOw+GNcDoz45KbhX2Ko+4EI4BQil6DzkTc0kSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763837840; c=relaxed/simple;
	bh=FyeMTFWXQEtRzQRRB+ND7H2hIAMCRwhxRmOSK7mYiqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a6uOklOpE2pznAuuY2gJ4NWLgsTypNFgxEGRUM/cKp8Ld1GVzY312FYebbCsw3jteQeO0/bD56TqCKFqpBJ11Y7w4TAiSSn3Tuo2ualPCCpFANmBYS93c0LePxv5EkxwdRVSB6AzjdRRkJPnneyCk3af4SUECjQqflVRCIxUWgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0155kz9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0155kz9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3159952b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 10:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763837838; x=1764442638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fS0mw443M6QxSkVgXyyHCqsY/MzqrCLE+Xj30w6faIY=;
        b=K0155kz9vYJMGPvAweS68UyOshq8FgK9ogQFiNreNZJ8tijYKq8i0U/W2RiUwGSYDG
         Wv4MPyAGLVrgN9Mq/gWJOfRppdVJ4bRuIhG4lN8q6LYq5W3k3fDzS69jfBS6B+VmTbaG
         d177ytALfwlab9BNUg8HsU/bz714TbmYGlFCyrQ7ZI6GM9PIRtWfRprNDv0+rSBQOILP
         bauf8phuNi9yeAjV1ATdeFM2wZDXyyLolnxM1qhMswHfs2mtKW3Z3wxqFRuM+hF4QGph
         4yUfKsmFhrQlizAfseqXJVNgND49vGjwIGzipcVpfgNWqIC9AnIs4h6chb5zRt2knCIi
         FHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763837838; x=1764442638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS0mw443M6QxSkVgXyyHCqsY/MzqrCLE+Xj30w6faIY=;
        b=AriudAEgfGDO4GKanoeXAwSIZwkFae5/XHTD6jOmcaXf8BtMKBV/YXRmD1BRyPSMcg
         fSX1r+7S07Mcsjn+yf5uRRDmxpcmdTanj9vKHiDn9cJxFJ6cyvkUMLuieMra87T/9Wzd
         1eP+pBuPb7DrSnMW94g6guqoS8ozUeE/3HxvBWbeLJAHiUctzaFOg+OxQjFdi/EupgTI
         PbFfa4VSmIaXtEScbdw895/uOtAcxsjkAZV/8uhzj9rxvTgcmYmsHmmQJqoU+qR/8pCk
         9uPQ02UypbNtTxCno6yhKkF6sHtoIqq2cSXbwUH7RixZ+FzKnnKtBu25CrrJAx2fzSB1
         DByw==
X-Gm-Message-State: AOJu0Yw74uGk3mlVW9IUpclBhWYQNgNc4nyNYQCaeY7iSyElLM6aiYhH
	74qZQ9d5xcCgPdOZQ4mKc/AIG0NagZ7/ytDUtQce3Pu7VP63fwGJAvvD
X-Gm-Gg: ASbGncutxKjmTH3u9TS0gvUul6yGnPmnqOw/TvK7zuYW2YQ8lIDOnFZfUnzyV/AcuKe
	NV/U6WYcVGo3p0IRbRLQKxVOTLqcIOvEZ7sQm6YY5I/jUwEJZJIKI8sQYjZN6BVBaMCpS/xU+On
	rnVf3xS5Xu24H+7AAbshoBLtuuQ3eVXWCx6KO+G9+GJn0Pgi5h5V/+3NnSettgyTrLI5R6YsMZR
	tMXpv4B47yhBe92CmaP9bf1r+uBUjetn/bQmta98NZFBdmiFwjwJHJi48EuSQG8YjFAat3j7zsW
	uu5hh+zTrSGFSzsTj6NYsNETFURarP/+o6jdM4ObOWOOdv61Y7gMgr+RlO7Tq6zQ4HJNJU4nps8
	ji15qkiOcSw3AzkKGA9rP/p3wxcsnG+Qon72VhX68NAcLcTxkFB+qQow6RgrHcjcOMssZ/0cbnr
	dVF2I0iItHNfS/9NwuAC/+OuPWjRjiDYRsOV23JmQhIT2keaIL8K1a0GwIN9M68JdgGjYF2CcnP
	Iq3sgIK/Xa8yqrio2w=
X-Google-Smtp-Source: AGHT+IGWy5B7C9q07ADZpbLgxycFL2lVuffM7oqACRFZfdQnr+Nh2+VHHAZ/dlMPVmgygkLkYYwRHQ==
X-Received: by 2002:a05:6a21:9988:b0:35d:cc9a:8bbb with SMTP id adf61e73a8af0-3614edf88e2mr7692966637.47.1763837838339;
        Sat, 22 Nov 2025 10:57:18 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75b61c29dsm8795259a12.0.2025.11.22.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 10:57:17 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH] staging: most: dim2: fix missing cleanup on interface registration failure
Date: Sat, 22 Nov 2025 18:56:56 +0000
Message-ID: <20251122185656.251902-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If most_register_interface() fails, the function returned immediately
without freeing the allocated 'dev' structure or resetting the hardware
state via dim_shutdown().

Add a proper error path that jumps to the existing error handling label
to ensure resources are freed and the hardware is shut down correctly.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..ddf86d794448 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -889,7 +889,11 @@ static int dim2_probe(struct platform_device *pdev)
 	dev->dev.parent = &pdev->dev;
 	dev->dev.release = dim2_release;
 
-	return most_register_interface(&dev->most_iface);
+	ret = most_register_interface(&dev->most_iface);
+	if (ret)
+		goto err_shutdown_dim;
+
+	return 0;
 
 err_shutdown_dim:
 	dim_shutdown();
-- 
2.43.0

