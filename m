Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D60347BC6
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 03:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603189; cv=none; b=ngspqcCZybGh6hDAoL4f6p7J0Wk8T68w/USpWEYS9VeVDRY47SxXIdODZQOJEAnhyeHr+nz2Lnle7QZ4PpFhB80jbHGnaF+mU5tEYF/tcncqw1gW9iggprWg2W+Gmq3Yy/8zNt2N8PP/zGDZ1hbydAq+XwCOnZW9EsHipfWjaEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603189; c=relaxed/simple;
	bh=6n4mbQR+CoqfTdBOCo0o+hQReTnlhdkET92OVUldk4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NeRtxbMeZnuInOnR2M5rcrVfnkagevAwiAGLNE4B7JGUb7KTcQDNX6ICFuCB+AYmKNb2P6RpLYt2dftEu4/x+ijksZjvA7RjSAlOP2PlhA5YuJ4CFQJ/rrS9Udp6kQZTRoXObUU3nrPxcayx9YK3PtP8DAu7Mmnt85fUBBU85qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYEUSKDq; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYEUSKDq"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso105089366d6.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 20:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784603187; x=1785207987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06KNrp4lyrGkLlu1Mo9YOsMNhsPWA5cPKbU/JrYNlz0=;
        b=ZYEUSKDq0lPXuRy2BzhR5cgEgMfP33YVADXy8Af09XykOfo0ydpnOKnLOHYN/hUEW6
         c0YGbZFjB4PGYvgi6YKL0p/8aFovRvL8lEdTzCepYJMhxr6uWvKNnVkv5OcVMogW6r1o
         U1Kw4Mhx59FcH2XeJNazIYyshxnaabfm8DSL8RNaY2lmnoEPvuZMLuSkvHaUYnr5duH8
         UpEH/5s6m6vIkOLb9aTYHC0j3j7vzqiRLJTVqWln5wrXG2p9JcD/g9E2Gu+0fW2doQCd
         nWqcsDc3FwjZgBnHHXMKAV/exFpAW0ayc1sxEdc9AHcEA7nJdXf6iN93e8e542lQqsGD
         sN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784603187; x=1785207987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06KNrp4lyrGkLlu1Mo9YOsMNhsPWA5cPKbU/JrYNlz0=;
        b=hJDFpHg3quFeGPu9I3ZWIMMXnEQjDDNnn6KYWzbGbdY/wIyti7blTWbKiMnzi7JyQ3
         ttbqIMUWvdbCL8duyPfL4Na4oMdTPbdLqgN58kdUNcLXVhrIibSrMY+EbhoJ2LrWi+CN
         7UzS4Gi6gt6nUCJFtwZgyiKuatJt2SG8u4PX51TixIF3jJMhfZWCo0SNF9d06iS9OEew
         UPCyRSAt0Yjc47JHqTLvT8pIvliWdVdymE6L2udkqaDb5enQquN0Pn8euesV5YZKvr+j
         Uf9dUVFZdfKwH1j/7MyEopuVr0ZmGgXl3ay8LorxfPOA1Y2P9ucpOQrxvfu738t6b9OO
         vfsg==
X-Gm-Message-State: AOJu0YwgjOUpNtoePZ70vlfchX20QmGIucTkwlaIRnmnqB1IC4ys2XgS
	YXJHvol29cH7KQH5PCxAvMWbC74ads7CzEbx9H+IllIhPR3PD0eEFux9
X-Gm-Gg: AR+sD12j9rF800Q7IYf1egUQTZ33RG2I20EztQ+zvcSXHJyVWZfNw+lMMnWsXxdm5UJ
	1a08EMTqdA5yz95i0szXcotC/HxnU1ZgIVJ6ZZuCLrBtNHLP6GENhDSQCqeuJ6x+DQXrHT8dn+3
	2bvIbw+8S1YyeUPieq4QcW5dzLQB0GzGe/F7Ue4yFFKltmCwpZ53EKCL+6QuhNpDOsm6DL7FpO+
	D4CNMuD7AXfGaBlx3J/1q9JWLMLZGHX+mgO0A3AMpyjVJLEtKuSgMBnQreoz5PJehk4SX4DhG9B
	PcFGp3NtT8i6Iw1J8kpDAWokz8q1EHXars+d1XJroUYpd49Mhfc4spS5bRrZoiQVdkfNHcm/5dF
	VOGXUseFQ8ex6NV4Mgso0dEweamjjbso2yNmkMrpkeO6db/FoldAb+qX0gc9ksEgGtZDt8mRWcK
	duPejpKSEQYHKnDiLO2wicFlh8H9L0C9T4bsWyLHERACjAosbVWqSs0CIANFLJC+YlN1103Xulz
	eOR5Q==
X-Received: by 2002:a05:6214:418b:b0:8f6:8677:7ea5 with SMTP id 6a1803df08f44-9077850bca9mr176434086d6.37.1784603187206;
        Mon, 20 Jul 2026 20:06:27 -0700 (PDT)
Received: from localhost.localdomain ([2600:4041:5831:f700:25fb:580d:c87b:d844])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871dec5sm104393056d6.44.2026.07.20.20.06.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 20:06:26 -0700 (PDT)
From: Amina Shamraze <amnashamraze1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amnashamraze1@gmail.com
Subject: [PATCH] staging: axis-fifo: align continuation lines with opening parenthesis
Date: Mon, 20 Jul 2026 23:06:18 -0400
Message-Id: <20260721030618.27784-1-amnashamraze1@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding line alignment. Align continuation
lines with the opening parenthesis for better readability.

Signed-off-by: Amina Shamraze <amnashamraze1@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..13a4f329a2e3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr +
+							XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.39.2 (Apple Git-143)

