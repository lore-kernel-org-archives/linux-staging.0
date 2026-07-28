Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498833A872A
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260442; cv=none; b=W0jaUQjXop+cGTc+Qg/gCAJrrSQiv4dh2yd9vvrS08PBFFPX9EXtaN/5uobmEMdMnfsSKwhwaxAxk7/iwZB6S35iIC8unSZr/Mid2vA7uflERaVvGrrQfwxuvVOWDcnihezekswbg28+zOwnsCCrwlvpvDKIlv0obFjnP5qBLKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260442; c=relaxed/simple;
	bh=OWmgzUv30hw8Cxy06eh1qsXN73tFekYSrLUEdDxdL5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=URia2PLJTARnNtwAkG8XmQGq+mmLm1zTjmFxBrU9Ld28PypkgK80s20sIxj2mUiCAuGEav5ChEAajzyOiREtZl2adMqt0/p1oqX633T9A4BGZq16kIwVxi1JplQe9cNVtNMNXAO+8xu5a5z6m/kZDYgCTafqaqdAF3Xf5L55AOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV+KA/Q0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV+KA/Q0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc73e322dbso1953685ad.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260441; x=1785865241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMDBxdU98X+ksZ0V89il3Zwmd/97GnUTb2hKOjrqHEU=;
        b=ZV+KA/Q0Tfzc/pQ7qvp2Tzz4tQZtznDnPRgwFolGabAv8RW0/DfE5B3QmG+6652fpU
         PpsZF3D8aVYWpE/u4xozkeDILOc9LCFhqWW1tYh9pVWY1l9YK1G3Jc2NfOBYNxSjNcAn
         flRZvHqR+OcepnOanksDckVVSRWD/+AIyB0b9ChPrY/OepdU9tanrANpfwFYAnm5QHFP
         Zdgam9CRyOnnKQaJX/R9ZeX88L/y4deTW9/6399h4t05sMHiTRciD+2I4yVrW6gOYgjP
         pNGircMBpn2CyiSO3OaZ9CjjxDcFHMWejp7SDnQfGuh0ZnBqMDDGwAxkG8BsmqsC+RXb
         p2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260441; x=1785865241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMDBxdU98X+ksZ0V89il3Zwmd/97GnUTb2hKOjrqHEU=;
        b=Re18Fmrh4+faEi2jiKat1CGWEw6Iole5XAUhR7aeYAmoAFJ4atzOnMQwIdtXYRqpse
         FT4IDFj3HgIKKgrj7v4zEvmkxw4Gj8TpNOCqPmeMzgr2+cWeU3gDhsO8jUakryH7tUnh
         eHr2qMYv6AqPX2e04NoVz1qBn9X4Q2Q8915eayuUwIxHKqdeIaGU9G+r37G1JdSUFkX3
         rTllcaGsnC0jzhDePU/jcFynXwr+AqmY/GHz7rh8gwyyMwVYWe1Vht+mE0jyxKww2kv0
         5uNOqov9ZfiRaKENvQHIqW1MeWj6jiYzE+V+K/AGnL0Sz2LLCa7QtSiaoMMX7O8azLFa
         9avw==
X-Gm-Message-State: AOJu0YzljMh05nUElWyihJW7nIkzZe/wUN0+Kff9jAujbQ1lVYjvGpUH
	sZwbbN+WJmY4C6qPX8n2e+UQLkkzd/Mq1GXcJFG+7vgxHN1YVTBBZtqt
X-Gm-Gg: AR+sD10OShCEwPxWrIOKO7hlwOlFTqFAKwqzXVHjRMzLuzZEZ00w67K9c4CB25Yvm7u
	0+/U/ckzxEcv7SCq6FcFl0ty6GtK26jQSyLAgnBS63wmfuPLeFiIWRcRv+DoYpVVK8j5Eoyd3Db
	1eXuEgxzEYEYjmTgbSoAQzGRke2dai1VYwcM4KjstqNGcJ/QA1r94xQpHq50InUeHuSqW/XHz/L
	DevhEojuGQoy3jlt+5s2qe+5RDavx8IMh0ZqMaAnjnyhwmRBotSdL/5k44C96oC5E1+565Qh7vm
	WrtqMkbZxllvWdhZMr9amPGW06XYQOMaU086cx9GLMKD4knLrFq6t0qc5lwxbQ06N7sUm24BdPM
	J3vQB4U+T4+f+JEeANOkB389Zz3YXaAYb8TPQ7hUL2jpQjp32r2PVclmWbW0VR4HRk8Ll8sxcPe
	FHbu5Tg6lpxTFxkZToD38UtA==
X-Received: by 2002:a17:903:1b65:b0:2ce:d34a:5959 with SMTP id d9443c01a7336-2d015dc8e16mr43395525ad.44.1785260440581;
        Tue, 28 Jul 2026 10:40:40 -0700 (PDT)
Received: from Vicious.localdomain ([117.96.147.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504db2c4csm708721eec.28.2026.07.28.10.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:40:40 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH] staging: axis-fifo: align arguments to match open parenthesis
Date: Tue, 28 Jul 2026 17:40:18 +0000
Message-ID: <20260728174018.1600-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the arguments of wait_event_interruptible() to match the opening parenthesis to conform to the Linux kernel coding style.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea..ed09be2fed4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.43.0

