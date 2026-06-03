Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D783563E8
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507643; cv=none; b=ZZnRz0zsyoci/cliwQbHsUMGk65aFtxb+4DeXBvyoNL4qc6h8B8aRNr6MlUCzXDem7U+MFxJhlCQR5QCP6ODLNi7y+dFE6m/gqHpGM4/sAXv0DT4PPjBvGs8H3zIK/FZWe07FofQHgGMKuCTqjQifUSeZGfpsJSBFjAP3KMb2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507643; c=relaxed/simple;
	bh=GyBdjQf+KD7yqZ4PteBpVZ2I7sBrWX+tT3dPNPIxhHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uZmyLlUZB/97b80zSrAvs8V1TuN80+4tb5vSlqrvVAiLKYiKAXU2v2Z36dN9Dk7++GmzfcmOO1nVHaDVErbaVxFjS4C9kdJVlooHxWfXUXVzcYSXYTY+wtq48oHSh0jGp25elp9wG59SfyhwloQ8WNMlJRFnV+uvabgzdEC42T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTV9AFFx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTV9AFFx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4908b92904fso76670195e9.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780507641; x=1781112441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPI/K42Dqqi8EI9/bqvRnWGrrrFYIj0w7WpadU0Mx7w=;
        b=LTV9AFFx2s7TA6p2alPO+UedNBPWPfiOqgoXrcPH3gBbanodBnEjlIdye61ihCk+gg
         O2/W7HOwQfw0q6D/OrGc9/SOjlwiYnhPl09bb2EZ9u3Wlpzsg6wIhODm80f2y/dRjgkA
         mUAtL+8/Zs3qccLE3k1M13ni4Et861DeTix8RgDpbwCfamc3YsCzU7bD3ooPN0YBVLEy
         lnNr7W+7oi481yZXE7xEuDiWZxZ/Vkmpogil8Y6v03qsylpZ1Enf8mtuUyzoG39MgfAY
         eA8urk+fQDKVMQZOrygBZYkznDcDWDfltmhL6FRUNra5mB+lKuZtSH9tyiVJ0rRJE3cr
         r12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507641; x=1781112441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPI/K42Dqqi8EI9/bqvRnWGrrrFYIj0w7WpadU0Mx7w=;
        b=CDyruwg+YPutMt8qsAWZsq7m/3bVjnUBXiC/D4zJ7D8WL5v2HSe3pofDLBP18AKkOD
         J3/y6Yuw0bioAf2QVFxjvDXFJ9DOsOqYZ5Cb5HWrccX9B95BdGnbdgky9huPhigLkhMb
         L2v5tZdMkvqMXUx2esNGfLN2W8CYK1N7nMvRg1ABKRgEZ7Wqew/z3DI7CUdOfaHD8zgy
         217DRPuYxXDLBNSa0FnB6NcBOGQVj/xnvsvJWOf7u9qdlFKDAjSauMmYtaje1c0P4ANd
         gSZ3sMJqjXJC6ap2I8+cs7q06N3n44cQFj+5WHk9g3AB7Nax7g2lkRM+dRD0kjGlgN2E
         lrhQ==
X-Gm-Message-State: AOJu0Yy+qK2tAy1PslFJ+tBROC3K9rZ9m6bgJvhcMd1TwKV5uizim16e
	Q3SYtP49gf9Bj0u66zXa5oonJDCWPH2wsoF6RMMxrKwhvF9V+D8Snpy7
X-Gm-Gg: Acq92OEQDRFtxafBlS6o32afHLcDxArBwa2xVAoKX/gsfYK24r3ceiWqVX8eD7frPwB
	dT787sZLLwZ/MEFba03TcNC/Owfw3Ci7se41n3wnHEYo8pFR0sR5EcjuF1BXePW+7Xz/SIEQkUc
	Diaafu/QmmOPQhtTBUNeCtm1WTT1MrViXqBFT6AX++jeCGf3kfXzu3htx0fvcvMRPX7nt0OtXd8
	WtaZc09xljwoFf8tOqCiRrl9lijipCtmo6WfSrzBQ5eoaQeDVDC8lnL/hGFsR3xNF37zaglcOFa
	OwGT/6d05qQ1FsXAGC1uE9qPERPRg3ah9hvWrEVBGVq6MPHFcm1gQkK8PNYUcvbpI8HhiDQCrwN
	knWwEZ8VWumEayZdtK/y1XERyniQkNu6lceDc1xlnvRmk0Jz+1i5zlxrHbuF5ldvMpIMZdHN+gl
	jTTu9NgU/g1SmH44yWwg3gkp4kwXrpl5v/gqyl8LNUwlHPJP3kU+p9tD8LQBePv056F4f8NRLxL
	1/Z89d9PXQ=
X-Received: by 2002:a05:600c:5288:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-490b5ec053amr71039725e9.9.1780507640498;
        Wed, 03 Jun 2026 10:27:20 -0700 (PDT)
Received: from MSI.lan (uch71-h01-176-129-204-49.dsl.sta.abo.bbox.fr. [176.129.204.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd663sm6558395e9.10.2026.06.03.10.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:27:20 -0700 (PDT)
From: Dorian Catric <dorian.catric@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	marvin24@gmx.de,
	error27@gmail.com,
	Dorian Catric <dorian.catric@gmail.com>
Subject: [PATCH 1/2] staging: nvec: fix typo in copyright header URL
Date: Wed,  3 Jun 2026 19:27:18 +0200
Message-Id: <20260603172719.398-1-dorian.catric@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo 'lauchpad.net' -> 'launchpad.net' in the copyright header.
The correct spelling is already used in nvec.h.

Signed-off-by: Dorian Catric <dorian.catric@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a563..66d9c3c162179 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -2,7 +2,7 @@
 /*
  * NVEC: NVIDIA compliant embedded controller interface
  *
- * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.lauchpad.net>
+ * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.launchpad.net>
  *
  * Authors:  Pierre-Hugues Husson <phhusson@free.fr>
  *           Ilya Petrov <ilya.muromec@gmail.com>
-- 
2.34.1

