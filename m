Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75E3B9D8B
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103731; cv=none; b=M0jga+4ebX5MGf42t/u0uv88XijuRGRMUgNHFFegeHJN8CAtJZbuTD70PonLoI1q2eA7xWMGPaipAK/gfzFV/Cf+emQmTU988pAzrlMyOb6YGVOtodBp8JADy8y16YriUBzJton6BVgzSnMYda7JVJP3aVhcv04ZqmBJNhhujBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103731; c=relaxed/simple;
	bh=auQoIFEZ1QAQc7DCsENXc1BnFeqO7SoThFRId0n4ECA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRrZ3rBOwNMJZpjmWFXA6IK2ILxAISgqZkoVK60X/7XcKH35LsBsJiRfOpjYsAlPnnDzUMyVEvuscb9Rv5tjVyjogZdRWVUI1xWpHjAONYmCDta5FFaaCulWUFXUJyL6fBjWps6YpTzOWyNNquovbFh0mkf1CklARr5q/41Ybks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpgLcmt2; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpgLcmt2"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c757a9251faso1769296a12.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103730; x=1776708530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxD4aUdeYsCT0+eL5ShpmQUVwXje8QNRmRkbwKTdLA8=;
        b=gpgLcmt26DVMCa5FNQaU/+amwDRaq9OwT3QAI5q+cN1+KjUPedBW+tq4gSU0XwzlLg
         iWLkbGlKrr7cWAnsV8JtkwiIXAW7CadKa2nCNbKHYNqs3zf0tbD/sPZxpNaBT3yWtNS6
         XE6xwW08UwqE0mlzgJ2OsMDnIxA7qKpHAROKU4E4k+qXDn/0L4rOeG34PQzc0TyQu662
         75og9qz1BvFEvPAG8tDWuu2lpfVW8cCXU2zUV8GQSUOqzR26zGn/ZXUOL9GfsngJByKZ
         zQAsigVXH8SwZhCeC324t/ZNEa6mCUR/r1a+V2IQWLmh002xohyMz4nTncpSPup9xXTt
         E4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103730; x=1776708530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxD4aUdeYsCT0+eL5ShpmQUVwXje8QNRmRkbwKTdLA8=;
        b=rccfNaVHMFm+9n4kIVUtslzyBHG4Djjk/PzNUbnudfVh0O2yt4ysm5YWEV/vZMtI8b
         nMQtRab/HRtsMIvgBkY81PReN6qTUtkbCkFEAEvIxCS1XCzlqWtVTnrDZ49zCtM2yCXX
         Q/5UryLqOYbL+DxzGlZS+fAtk8nl/9QFgJ/FuqnPiiEAmihU1m2T3SpvwJvvCpIiW2jC
         Vr2PFkB5pIxmyRC3xjAqi8p1rOH5cOChsgcqQERbwke9uyqRV9q64K8ASlPtdJBJXDKD
         vB/q2NTIZS8UgPNR9fMV11AyNAbnQpvEuwh2K4l8c2DdFuE5E7Xyx1FFaaKG7HrbnnXI
         jE+g==
X-Forwarded-Encrypted: i=1; AFNElJ+5ebmRhAKk55Rp2YIoHMcYmXaG4LlZ7ytAzmmdz3pS4OEEy2OS2losCOTu/TxgcaKmXjKY2jEW3oO1CltH@lists.linux.dev
X-Gm-Message-State: AOJu0YwH08h2v99cbp0H8vdR8KjtI7lR/mkjtLQ2Q8terPoMJSfIntAO
	StZjPGfLBB0lvdLvPd/O8So2+8V7XxC1ZNtVISGF3ZHePPHEIwDNJKTl+EukTw==
X-Gm-Gg: AeBDieuq+EJBl+HonZRmZc5ru4/66p9ptZXuvSDwu4HouGmadK3JKmykdG9CmQZMi1Y
	wSEkVG6uuPXjVePJJdVXd2y6oWNAzsXfJS+4R9RX4x/ZuEaoRtACALgP0Rz+mgC19khmj2D9Y68
	PCi9buJsSaA107iOYW9Fzx7f7+AM+KomzwC2macSsvJSc5LzlfjbvZhq9g/MPa0P416e5k83GBy
	dOjMrhZdqBIgTiNcHRqzPZwjoYL/7X9S31yrSSHmpGZJTV+vQrwe99aw9bopC1pWydHkTotpM9W
	K7Fk3IghMgVpNv4FPWM1F30I/dHcDPMkd86xxa5JAHk3tSjVA8gsQJqoPCaiF/AYOExUseYKuv+
	kDxd7RccqVDnwi2sYbkvYY5R8iKSbGqrLrC+Z/IE0PuOUF1HG8Ol1ygyh04T35oFLLonVRWO9gU
	cJ1/2J715DL3o70ijNo0wly4bCbUiUBUfVt0GG5lzx5SzvvZBZ4dixKILlJw16Fw3x+OUFwREgZ
	jSMvg66ULxEhfHNitI40tc=
X-Received: by 2002:a05:6a00:4511:b0:82c:d7c4:4c69 with SMTP id d2e1a72fcca58-82f0c25e146mr12379963b3a.3.1776103729661;
        Mon, 13 Apr 2026 11:08:49 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.118.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4df7f5sm14717658b3a.43.2026.04.13.11.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:08:49 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org
Cc: nayana.mariyappa@gmail.com,
	s9430939@naver.com,
	andriy.shevchenko@intel.com,
	kees@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: os_dep: avoid NULL pointer derefernece in rtw_cbuf_alloc
Date: Mon, 13 Apr 2026 23:38:02 +0530
Message-ID: <20260413180803.72647-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of kzalloc_flex() is used without
ensuring that the allocation succeeded, and the
pointer is dereferenced unconditionally.

Guard the access to the allocated structure to
avoid a potiental NULL pointer dereference if the
allocation fails.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 7959daeabc6f..4cfdf7c62344 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	struct rtw_cbuf *cbuf;
 
 	cbuf = kzalloc_flex(*cbuf, bufs, size);
-	cbuf->size = size;
+	if (cbuf)
+		cbuf->size = size;
 
 	return cbuf;
 }
-- 
2.43.0

