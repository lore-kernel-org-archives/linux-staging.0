Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3611173
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722346924; cv=none; b=sLsr+6ANDUB2BAisExaF2VGxJxjIkTT5jwewJfnF7onqjWchJVuDi3cmJud5KqsZeR8C0zQQXxVvdfClpeU1kI2mXMyRnp10DZfUeHxC8xAOGpEQz7WBCywLqNIjcnbUjcWIo18qQG5FI8B4BHpS2xB0WFFF/z0/iofxr69UXYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722346924; c=relaxed/simple;
	bh=d0Rk/kG1aoRS/YcGvNRRON/NZwovw91z+XHhTRu5vts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ph+6FNnbnSkxgX8aNF8K+zHkT6SxO8vIzIeKfK+1IJ4OsRSK1GKcSMC2jHpTar1J2DfNJ8r/5WXOlObVaFZulbZvLLeOmTLrrXaCX5iuPH7jMVDr4NgQ1FvWLOrpKgQkKHTEFl+4XYp7cbLPqBIcENyMxADs7axkefrF3KcsBlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ub9wuVkz; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ub9wuVkz"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7a10b293432so2709187a12.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722346922; x=1722951722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjHDKFiNb/7mkPm12vALojAT4EA8gp+e8Ucm06PO4g4=;
        b=Ub9wuVkzewYM67fIsKiHSFJq3zojtf+FHTMEAoYiFek4DVKNUyoBc6d7uFFPIh4u+f
         7fyjFJpE3IrivxtHdtS5RKEjyl/DW9q3Nj4rgHrPrqbvt/mBjUm1L2Sn8sw4jpGNWGe8
         ujf4dLhFRr/bWainCpt2HevRz2XZemEbygJAo9k/KOeN+8wZAmzaPlreb1Oc71mNsCah
         T+AAbnKb4MQBcZl3yr7C684RF/RYKRX6FaiYpBaDlhdZ89Ko9cSu8FWW518Giz0SurL+
         AItCqqAs9TR/sQy8lVFgivP/qSbIzUAwXIiypKaF7HjZz0JN4kYe5SZ0KbabLB6fJ9aR
         CXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722346922; x=1722951722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjHDKFiNb/7mkPm12vALojAT4EA8gp+e8Ucm06PO4g4=;
        b=urdeBqOAqCRDWTtw3O6rJMkpGWrbPneA797RBL3v1K0f8kEVB6kl1lxhi8XF1uKLRy
         8C1MP/h5tJ5kr2KmykS/xtYhknfQUdHrX3aHencg0tze48FBCwEDIPZxh289+rhKR6HJ
         ekUztynoMEqSAokfGBioDOeD+4DPvmTMFc0kQpVEEI2Yoy/8p5z7UM0JE3r4G7NMEDzR
         BAf9/RP2SnrATic3EqVfkuwgv3VKBuAKfTvzvrQNT+SE2Cmvsps+hHvQebaiFuGHICUc
         Kqs9vP3i0dHQsjetJnimfXFkg4ZR6q9NasLNyRImrv6zBDWe0UX2dXTmQOCNIIYUwB6c
         qHpA==
X-Forwarded-Encrypted: i=1; AJvYcCUvwxJ4I6u3f/Y1ldcW1yevm/zOYCw0FcNE1zE1k3tlhJx5t+6k8vPsqRA9IB7fzpyVn0WhisyxyMnQ5fTPz4FAXM6ffhDHaoeOiJ63og==
X-Gm-Message-State: AOJu0YwZYyP8KiCAiFP7IPQKQD8/eVyDIhB6vhJpJGB43XpnvNN6bzZq
	j+DIHROCIaP/2Gt0LlNH+1DMAt9ivaR+e8kmea8EGQZLFNChIfdc
X-Google-Smtp-Source: AGHT+IF40GQQD8Bzij3JiNBe7Z8RFZRAA4t8TX3JQnaJ7TY4M/IRNx7Qoul0MwzMCBlBt8orBk2NMw==
X-Received: by 2002:a17:90a:597:b0:2c9:63e9:845b with SMTP id 98e67ed59e1d1-2cf7e1a1dfemr8887061a91.9.1722346922058;
        Tue, 30 Jul 2024 06:42:02 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb738859csm12604140a91.11.2024.07.30.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 06:42:01 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: remove space after pointer
Date: Tue, 30 Jul 2024 13:41:55 +0000
Message-Id: <20240730134155.37784-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "foo * bar" should be "foo *bar"
in osdep_service.h:105

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..d6d651342 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -102,7 +102,7 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 #define MAC_ARG(x) (x)
 #endif
 
-extern void rtw_free_netdev(struct net_device * netdev);
+extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
 
-- 
2.20.1

