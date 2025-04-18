Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E42E401
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744948368; cv=none; b=titPrNOuPSF56e4lh76D+9HWzYdUUoWbuKKvi0iQmHCSPMxslHiYdIzA8YzsZ2zcuwqcGKWbWcnSIe8JBFXHirFmaAnV605AdVf/E5th5EM+aIISMKC5Fi1gY1Se20TG9wIkdRqVBbx28BH3Sz36mwDzu31x8IQN/tv5+PZF1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744948368; c=relaxed/simple;
	bh=1HKTn2EglAYTCuaBXWT35oX2outJLa/J/ifrSlkV4kA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HFaNscULyB3ZAXGLLKjmzcOkclsAQkJwgWG2khKpUOKwdxED8NBtIXjnPvJZl6I6T8K5DcL/kJZ3qZf8/w4HYv0wicsONV4Dm/bz2FoQvNJoJihwZ75rGQ7LbXiz9rgVDluq2j22XcRGuFwfS+JNrkbx/Swk9i+SK+8p9Gs0g8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLNEv0B5; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLNEv0B5"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2240d930f13so2424955ad.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744948365; x=1745553165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J5dQ2/PrvjaVhqlG1x9qQJqPr5ZU/HRgzC2aAsxKHs=;
        b=TLNEv0B5rWRq/xEgnQDyd3fGsL6DkyM5XWrcOgmOxWJEoofAk1jRNb0pBz/HfVVZip
         hG5mUuc2ege5vb8J/oxs9R7bsy3Cx5cIlAY8V1fbfWyaaO20uVQ9cEyvAPEAkKzHLOHD
         chF7JHOvR4AHLRKkUpxmDq+hFuY3OXKqPT5A21f6JgC14+rR2g32Lxv9J+0UMk2e5ikM
         8Xgkz4yF2INeRWT5iEbH/lMeALgcOsJdOMfPnfDSC9iFjGALs01zwdvUwWjeGdfT5Wn8
         IaOJdvJ68/19cizvcHsuO0debkpUJm3BS0r8q+HZIyyFyd20riOoNQnSg/dgKyaGNxPK
         ACow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744948365; x=1745553165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J5dQ2/PrvjaVhqlG1x9qQJqPr5ZU/HRgzC2aAsxKHs=;
        b=rA+p41jemGySin7wYdKq/heWh83hjjKUPX4RzozQvliJmzaNVLUoosvkLuDuMbdbeQ
         nnjiHs8JmVhQOLtbiHseKUZFbCp57G1oiCpvLE3hbnJQi7kDuiPVOPJnCZtUGxmBKtVL
         0gxsJFtfq+zXa2Ka9kxvZRP5NNUulK241/hXNb7PeuMLvDSV6H8eFh5hBSlok7n1lqIJ
         8bdgYUJqYEOrL9WpQCqs/ucGC2EVyLC/VyzRt96uNMRCxQ0BSQbGfyBnxyvqTJjqhCgu
         a97JG0RUKo36rR/6hQ2zT0tKEknxfeszgMEK5sVc6hlcDGFQ/U77liWJMgqgSbUHXdGw
         kDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh7kgYVL/dYVo+5SjlYGE1NKjFIdqtbHRcBZn8Nr0h10d38Z2exJz+5jI+4/YH8fA4cZLuhalMlhYNunbb@lists.linux.dev
X-Gm-Message-State: AOJu0YyrYM3bM5aUHlrpxp/g+oaKX91tbokma3mYHowqeWqTa+zS6d1g
	r8LWe9jAzmkt51cnt6M/6ZoA//AUD/5xut/dfIGNSPS+perGHdz3
X-Gm-Gg: ASbGnctdmf3caIX/PwWHUJrDrUOp+SQouW7VL12wqn3qSsjPdEGyWY/Do19kpE3dUKA
	2ICxci73uew1q1yaOgz2AQV1oNVynmaOFlKcWlxO2lI3/XkdhA43ylHKUWFi3moeM2EqY40zcSk
	/QG9rD6+02kuNvI2Uno4urDTAwH5S7fB2Q/8XTrJYhJR/9hzlELJ8bWlLnmWnMvv2sI7vymBXFk
	dMXFuStB55QGW7Mai09STEuErFoiRVCo6wxAbAYxjXIqBIugMw2pkwK//YWD8AakGraDcX4OzBi
	HNA95FvN2djyz+rra1h+zUl5RkTfnl57U8wc/pyGv8Qv8uRasERA5NpNkHidr+3VFYCH48M1xKY
	UkgK0K5k6lXSoPfbggvQ2lplpd5MXbSWhtU+BlsYZwDrYNFzyHnZ/23U=
X-Google-Smtp-Source: AGHT+IEf8BcieBW0lj/bJ4dLQDQM3ev773NtVTtH+NHVZsyy1jn4grCRfDQO9hb2GITMPvEINmdVpg==
X-Received: by 2002:a17:90b:4a02:b0:305:5f20:b28c with SMTP id 98e67ed59e1d1-3087bcd3fedmr717176a91.5.1744948365397;
        Thu, 17 Apr 2025 20:52:45 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee889csm273853a91.2.2025.04.17.20.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 20:52:45 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH] staging: sm750fb: clean-up `else`-blocks
Date: Thu, 17 Apr 2025 20:50:23 -0700
Message-Id: <20250418035023.27067-1-ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean-up `else`-blocks in `hw_sm750_map` that occur after `if`-blocks that
terminate function execution.

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 4bc89218c11c..64b199061d14 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -55,9 +55,8 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
-	} else {
-		pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 	}
+	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
 	sm750_dev->accel.dprBase = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
 	sm750_dev->accel.dpPortBase = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
@@ -84,9 +83,8 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
-	} else {
-		pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
 	}
+	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
 exit:
 	return ret;
 }
-- 
2.39.5

