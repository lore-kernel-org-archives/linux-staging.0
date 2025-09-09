Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48FD1DA4E
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 04:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757391440; cv=none; b=I3jvt37NzlhLXkC3/alT4d27XQ6m5kGr8nxipFIJGfqRHg0SDkedDOhGwSzqwdTbdcezxdq6hywdgtn7nHBTyNMHYZAly+wBICfH4LkoPrZm3L0IGmZGnmuO/aqPB6rbE823ae/3E8bSOIjEJn+vCEnWW9e/mSWAeXnqKNFVMh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757391440; c=relaxed/simple;
	bh=WzfDYZ1/295BDSpNZdAsFTCdD4z1X2KS9R3h2y1gY2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G5E+J+C3DWtMulLzHdsU7ZRS9H2UB0/UnaahZAUDDJzM0cJgW4M8RqMou18jGVTLYLY1EwdGwLtJXCz79SnEFZ02J/8AVlRQOHVgeXPQDtWbNAxsG1xgAH3Q3neyoZRmFOxIInF4mugPuKdZSCndwhiDB2gLUlnwGhZhjmlWy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jghul4Bh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jghul4Bh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so4395119a91.2
        for <linux-staging@lists.linux.dev>; Mon, 08 Sep 2025 21:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757391438; x=1757996238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez6ws/owLuMN5VyJ05mQBNBzD0cyX1jnOdsu5qx93Ps=;
        b=jghul4Bh29SPCCGag7c2EYjiXjHC7YXEEVHlNGsH9N17cPV1qppwHtWGRYXFptR5tG
         hh5NyMtw5vcU9jftLUYTr/p8OL8eyRQ3tLPNiePI+7/9aphzAPvReR7sU+/T3SQANZ04
         Vre/jlydwj+VzO77aQO9VpES4YmaOw+J5ktM+feA2fRPMKWqbjgYM6SvaVoLCMtuaxj0
         bygiXIzLhFpuOMNE8oiB/CXsFs/4/eOkugX0W6SlQqfAwF3xQejzZyCRPvuSkkgKdgCJ
         Z9pz2R3I7wg/D9PU7obuKJ2e4/1kDsdh6Wx0w56WEg+DrwRq1k1ZUOv0R3VRwIGiUq7i
         XFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757391438; x=1757996238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez6ws/owLuMN5VyJ05mQBNBzD0cyX1jnOdsu5qx93Ps=;
        b=SdqihsvpcJqhpoVf1KRnW6NqcCM2yBRbGz9I8BTFwZXkuk7ZnSo+PkznAmb0WkkNSX
         iBx5oGZkLqSctmQPbti3x8TjsfTDbLDraopJbQ6NkI9f+Hd2YcUI7AS2W/UxaP2l32rc
         h/qadOjEglSVF+dE3H9OAaCxw4qs1NP8toJHfpZ8cHebmIuBywOMQkqA1/SY+/N0O9GL
         CPAEwCBTT3z3kutBF7Xm+AtJkOIld3EgqjRXq5WiuHlyyBSNyP6lSNDsF88ui00We95z
         +MTa/fsR9UmNpj6WHq5PGpVmTNfuNszxb1KSFn4TFf5jeRdGRaVPzZYQv1vGC41mBZeN
         xztA==
X-Forwarded-Encrypted: i=1; AJvYcCVU2PshVVpN2a0DatMW2M1/m1BE4+eayTPG+8KOgH6Wv+Y63ejSwauYMAZT0rS3Uows3sLKnT9JSoVC+NGk@lists.linux.dev
X-Gm-Message-State: AOJu0YzkZggvwC4elPruWC6kjKGRNuy+Ss/mAIwH1fkY6Atc7TC+YNMd
	TI838jI9wa3XPMlyRn6kZCNSwUVURbrgA9SLsEbF7+De1l2+AGkgOnbl
X-Gm-Gg: ASbGnctL6wfn4mNpo4IeGxOYUG3s2A7d0s+Udt3Z4ZBds/TU8T90lsp84V1j1KGKsjJ
	ZltmxEGjffItS4Zv3qfZEITXw6zzfPMv9INrsBtPoHV/7LhbrxZ3Ty4BGazNiK481Fm0u3Zv2os
	lL8II+96ttwDnSNYxzlXYZw2UgbSHpCASXRpEYV/E7QtuRffGpFULDUvY9pjFBu03wJbRF9tpdc
	dI+MJiWJfa4/ttrld1/IxMO4OrNnbULJSONGz+ADpMtC7S0Az8ud1Nm2d59DZgLHaiI2syoWvSN
	cv8dZnO72LgR9/JqtcqwAMRqHHbac89O2w+U+4nQeyQy3jsFWPymeHUHRq3rL3guJ95mEb4YeIx
	dVvuVXdhkUiJOTzspB3s5/eCcchXt+DA+cVyE5g39
X-Google-Smtp-Source: AGHT+IGzK1092pVJREpJAKVPiRzEhUau1GpXgrcz1XiLkQShk6Jw+e+QnC7Tw1XkjiDyvKNRr8g40A==
X-Received: by 2002:a17:90b:3904:b0:32b:6132:5f94 with SMTP id 98e67ed59e1d1-32d43f95d02mr14142423a91.21.1757391437861;
        Mon, 08 Sep 2025 21:17:17 -0700 (PDT)
Received: from localhost ([2409:408d:3e07:67a0:20a1:b9c9:f581:f3be])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774660e488esm562919b3a.2.2025.09.08.21.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 21:17:17 -0700 (PDT)
From: Gopi <ggopijeganathan@gmail.com>
To: 
Cc: ggopijeganathan@gmail.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Declare processor directive as CONFIG_TNT4882
Date: Tue,  9 Sep 2025 09:46:54 +0530
Message-Id: <20250909041707.3001-1-ggopijeganathan@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning massage found by checkpatch.pl script.

Signed-off-by: Gopi <ggopijeganathan@gmail.com>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index a17b69e34986..918a4cebbc6c 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1369,7 +1369,7 @@ static struct pci_driver tnt4882_pci_driver = {
 	.probe = &tnt4882_pci_probe
 };
 
-#if 0
+#ifdef CONFIG_TNT4882
 /* unused, will be needed when the driver is turned into a pnp_driver */
 static const struct pnp_device_id tnt4882_pnp_table[] = {
 	{.id = "NICC601"},
-- 
2.25.1

