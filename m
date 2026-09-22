Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554932264AB
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 03:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049202; cv=none; b=fYJFGqhoYw8bTfCJc/eLM8NT4Yf8qd9DFXkTOoehOI+vZcxZkpmPQmkwG4mjpdcOK93fzLVH/K+LjPvyMQ7OkzMiw8PR2Sgk71KnIwER0RwO64d9p/sFUyUtv8z6AI5r5pEYe1njSSWU5vD4Pt3WIqDlIb1OWLeXtUQKKngvpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049202; c=relaxed/simple;
	bh=oaig7IIc0/9Gc/HoBtE26gxovH3dKDsT0hiocoSqP1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4b/ThUGO0A+TngErzj5zZtlOCukXVOxdLVdIoTqDCAengE93snfxYZoVPVTrZKm4B8P9BVna4X0mgbm2Bl+Z7aZsCgHf6N4PrN0vlYlUNymEBd+94QCbYmGGZk5wbJpk9SRibwBpQ3F2vMVflW3yQSY536zS0AR1NcTHMfnYkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7M6Et8Z; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7M6Et8Z"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4fffc0so1710492e0c.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 20:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790049200; x=1790654000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Gh5tKcxiQTs/oI+I7DVxOINXtqMjEU216h7NUGcuQ8=;
        b=I7M6Et8ZjhCBJxd+Y3/91cmCpklJTgnNHAuv6cqlPz/54JbR6dxRxHQw43f2c7jXua
         dSzF/DJd9ERmI6tsXBAlTm3PmzMVSbBDzx6LnxEvR5uvuaz72KBtNhqRyfACmDMJH0RD
         HWJ95NEPErPiR12V9hNs8TCZtaSL84ej6vdkYcpLsjhrVfzVlIq/Bw1saXKyzx+2hyhp
         AV8wkYEuXesGPKWxuvwxCWRdRUb0cx77e7EubAVP0XFiFlnRcjnk5o/q74ExC3RxlVtY
         CAa0N80tGLjeR//rHhvlwGnPKb+akEYn0DHudPEWv9HjvK29He/+Eivb8LOYqWXrlIEa
         S+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049200; x=1790654000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Gh5tKcxiQTs/oI+I7DVxOINXtqMjEU216h7NUGcuQ8=;
        b=Mtv05xHE/cKxsJgeMq1HpHXhA2Ypv2lm3XuMwq6IHGaeAIHYkxNirt16x8HomlXMr8
         ctQsU94HXPEu5weFL3SoYK3h7L4Z8S+E+CNLEc8bu5vlR00LR9HFibdKVsHIxk0/uwvQ
         zKAUoL0J6LM4ExAFtoQbD410sVlKiiVl+MpmzueVXJuMHg8rHg3Jwlt5EWKnfW9tHzar
         hGUxkxC1zfBO6LtqZEM26rMIxVQeHUfPWIiCjsgqgw7OD+qBj8wtW2eY0ihl04928ehf
         /ci2Aeru3b6DPawxAKdVpA8P3bryoVCZKWrWVLaLjw1+X/lnEIPXu3JeRdXNGNQIKlKp
         oIyA==
X-Forwarded-Encrypted: i=1; AKwUvBxYWMxj5HaIOlCqmOuMMteeNkTNK+gCchPo/KbGQ7VRmZAy7slEMZSJKXhJY6h7jjhgsLtYAHsLCD/ZUjaq@lists.linux.dev
X-Gm-Message-State: AFuF++lzIajoNfrDO3jhXZlJMjjFLOzXtFIGvxAfxiyp3DsduLp/kPX/
	Xi6Yr97nzruv6Stt0x5qGOj7zW+2UoXwSw9nj5zgStjFJkjxpKvCFgBA
X-Gm-Gg: AYBFou0qw1Abb4KRBjtE6uMMFhJnAeb/z8bU0QcEKhJgP/qtDdXiaEnguBeyknt6PlJ
	vXtPFsQ10X5fbk+4yxWBi+G4XAJzwTpaUea5DsLjMt/ekqqOu+36pYtywB55Kb1znD1cOUisozm
	0nzNvmBf0sLfAkmQmqwet4zPBKES+AnR4w22ZNhcFuR0ggZ5nE2TZnDLgRPWlFka1YcsB28+8Vi
	LZ+1PzcFgRgGOGdFo5BVryaFqb/a29SLEAt8xsS2PKs4wwkpKDu7HHRdoQsGeYuHIqSujwHIQUM
	VKWBCrzNdwBX4lV3TYLKkrPLgg8DAddQQ4wNZEqgEbbfXdDRAkOdrJf3HAnYzyZvF6DLsIrwXOW
	8sKCR8yYtRhUsZbGYgQfycOxIysTy4xy81Kb43g4fJTtYE0dygqCi7zAo0hefTJ6qBBgdQI5BHF
	5QyGOvorAIMyTMjSOPMAUtU+TrvrqKMdll4QE74MUq1kbDCYC56CHydycf/s3l9Kkjb5KtTDxfv
	+gGwEyhIe1GzUpnuCI7/jkSsV2RctQ2ipF2gCAjtTzsLLR0kQasb9tM5jJQd8xI5jwczLH1kv4/
	hVfjb874F65DIhhAasi08sIbk/zEyoioD0FJgtsqW3o7vqc=
X-Received: by 2002:a05:6122:e261:b0:5c9:c60e:f4b7 with SMTP id 71dfb90a1353d-5c9c60ef783mr5263547e0c.21.1790049200145;
        Mon, 21 Sep 2026 20:53:20 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:9e9d:ca05:6a44:76ed])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e7ce53dbsm525835e0c.7.2026.09.21.20.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:53:19 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>
Subject: [PATCH] staging: sm750fb: free cmap on framebuffer release
Date: Tue, 22 Sep 2026 00:53:02 -0300
Message-ID: <20260922035302.167378-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never calls fb_dealloc_cmap() after it has been allocated,
so when the buffer is torn down we leak.

This happens on every unbind, and when an error is detected in
sm750fb_framebuffer_alloc().

fb_dealloc_cmap() gets called before framebuffer_release() in both places.

Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")

Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..92412534239c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -910,6 +910,7 @@ static void sm750fb_framebuffer_release(struct sm750_dev *sm750_dev)
 	while (sm750_dev->fb_count) {
 		fb_info = sm750_dev->fbinfo[sm750_dev->fb_count - 1];
 		unregister_framebuffer(fb_info);
+		fb_dealloc_cmap(&fb_info->cmap);
 		framebuffer_release(fb_info);
 		sm750_dev->fb_count--;
 	}
@@ -943,6 +944,7 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 	return 0;
 
 release_fb:
+	fb_dealloc_cmap(&fb_info->cmap);
 	framebuffer_release(fb_info);
 	return err;
 }
-- 
2.43.0

