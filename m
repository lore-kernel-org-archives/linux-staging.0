Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB073FB7F6
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359086; cv=none; b=ITXa00sEc7rNyLpb+m3P6owxsk/GBcMA3BPDPVexjbBA8Pk6y6rcm9jf/zi5PoBeBvN8GXep9FD8D/4Ky+z7FbZgYUWUAP6cdGcsh7mr5OPNbVQjgnd9Dy2Q3+tSERobDWe+gc5/F5mJyCTpDp8qRbgXM3tqNW3F3sawsUPAoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359086; c=relaxed/simple;
	bh=ow27vvtpNwttHSjrRn2sBP8Q1nfMXQaIsQ2/Moq+9M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhxF01pOyGIyPgz6byKRE/n3LVIkz4xv9OSr5uwAIKEZfW0tmcIYHwtxWZyK6f9yzM2L/hm3UGaQ+pPtRsK1ib7aNpyfy6rfCpZtsPZFdJNDjWrA+xbUxlmnJZk9W5IWjCuSWGy5CBw+Mw40jWa6RPE9zafLAa7GnIUxHdtM2Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD8ARQgh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD8ARQgh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae3a007bd1so6665865ad.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359084; x=1774963884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9Ov7Gpju6GLB2FoP3yGQg+yVJxnXkFugNFyMr8bXYs=;
        b=jD8ARQgh4/B+oOH4cCJ+egYvgxW5c4sezhPgU4tEQW/OX7OXZxXAx3s3ekyMZazcGa
         iLMeEd3kR50+nhoDUdVqWPfQ6ws2hK2o/ebSYYsQkwzrnnWqMv3y2w7geTlgIWTWVUe9
         Gu1H9j5ogJpuNqgZbo5NDL8dK4A73h91shcdfkv0D61jMs+0qh4m7SqmMlUzZHaPxhfh
         U069REKV0TdcZFTEdKyacMFoTgQr7yUe+GQPjjPVypapYMvmXrlGxFWCXoeL+rvltTE5
         Cz+5al0aDeejvuUycTL8YWSxELGD4pWMu0mZe2dL/8j1wkWNcdBjbispC3NIK0LCOJgM
         mGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359084; x=1774963884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9Ov7Gpju6GLB2FoP3yGQg+yVJxnXkFugNFyMr8bXYs=;
        b=HeoJvDcTP189AUxgExyLb0qZl3pBOvxK6JnhASTreufp1TBOVT/dUhG96/+TDFH+Xt
         e+2aUvk/4mu1cVZ7e0aHTS/kGLd3o8vpaUIMJHufy4HiCo0JRh6wuzZXr+ezHBNBkdWX
         pBeYqAAj3YvNjpmT5Qq/QG34lCH0yZCdkiTqImvzbi09jcH1jCGfqDkOKsZfhaTyBg7L
         OODLWm+MwFZ01hf6GMAJBj4YmI7JVvjSI6MxAOOaQeJV3Y+BqTYyLKb9vYKfgQKkN4Rg
         AqmK/N1xHue4w02CNS5rUNfh10eTRS+AZsUnuXR1buKzg4pTQudUrB1h0draWym4viMl
         o8iA==
X-Gm-Message-State: AOJu0YwS9UmHqN187UApGH6Cfx62THXsOxj8r2rLEiaHtS5Txz5wJXtt
	+igMz0WO8Tq9L9pgaY1/oIUMenHtHeNWmDa7mnGW+LbTsPPIIKMEQ3C/Q1c4iWI1x043KA==
X-Gm-Gg: ATEYQzwjmp76HWPe/m4R++U65OjlrGlvzVbGaC8ypuhfW2qr4JZtZixk0XyE7P46bV6
	kG39xccb/2fNoDsypFknjVQJRVWZrpbTlsKKj+NqcRvZIrWa+P6TN5IvkgQDJrubycFXCHRuHRq
	ntL2uZj+X2k/F8eZCeTFzCao8jd6iN7DHrp9Zueo6OPYGOuVSs7HqMZPl+QzR7i5uO+QdsMpcxT
	ebBDWhGzUTsicKPgkXNL9MP54b2uUVuAeQQWfXi1iKMkD6FokD0xi4DmKBU/J23FbVVQOPv337t
	QTmP/Z13YpAEoa/ny7FRMF4HOAVTI6yrCA9gYzYND9eVlAL7BAv6WXbVeGrTR0ORDqTEwYgptzJ
	RyTmbSkxWuk7t5thbnBl6hAr/XVkZ5SZabVR9WOEJayRv1nDpTx0vAxyO/LaZ9pKXTXwtZOp4sG
	3PrH4jTVGCbzESopLlZGI12fNXSkjD
X-Received: by 2002:a17:902:e849:b0:297:f3a7:9305 with SMTP id d9443c01a7336-2b0827e94fbmr106992435ad.6.1774359083825;
        Tue, 24 Mar 2026 06:31:23 -0700 (PDT)
Received: from fedora ([2401:4900:bdeb:4823:b168:4102:56c7:c7d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354bb76sm147526535ad.34.2026.03.24.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:31:22 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 1/3] staging: octeon: ethernet-mem: add pr_fmt macro
Date: Tue, 24 Mar 2026 19:00:27 +0530
Message-ID: <20260324133029.82764-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pr_fmt macro to prefix log messages with the module
name for easier debugging.

Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 532594957ebc..aea9c69667ce 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2010 Cavium Networks
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/slab.h>
-- 
2.53.0

