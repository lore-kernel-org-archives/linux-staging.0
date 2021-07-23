Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3A32FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:06 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id b20so1591851qkj.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iBfKBiy/ypAxIY52vZu97aEGP3LKSfeZMlPoOGe1m/A=;
        b=RvC3YzeaCvD55UsNtBDZFAqmMbKSKnZiBI78BECe5jb00jFQ5M2vc96qVUyEygsH3i
         bymgfvXW3Tgf97ndQEfiYjwvC5PwCZcQKzxGWaORlLJmsc9SSTGFsGCZYMj9oG/Argh/
         A2Z619YcX4SYh/XrkZfruNXgU54ELrXVguw2leNO/OuOl+Il8ki0vJGai/yHuNhBPPPu
         5Ntt+5btimWAOHPgIgEjnZnbPnPFv4aJOtTgWe5pEvxSleo8ZqQzL8QKDU9BU3Ap347J
         2ue1ddfngVWuvzWbLkI+1G+bRUIyuEenaekXsVMXnRRaCAKL+MrZWfVI34Rs0GH4jimj
         NfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iBfKBiy/ypAxIY52vZu97aEGP3LKSfeZMlPoOGe1m/A=;
        b=elqeEnzWs5O+ILKISSpWc2fWfFWsbqQCvnonklxhVsXARguXYNGbcDqDDmQaRyvMXm
         zSWmh7l2QZ88dVUeNkVB3fwSigD8xM2U+wG1hQQfqsSNU+cGhfWJWHo12GZNUean9G0T
         Xov6RDnJEx/nQNyNkFeE2KC0DXjcOdgjQSHFGak+W6YgTOoAh+S5XegIf2RveSWICyxc
         /zAMjCWKBwEejmxEfT8x+/+pE3ix0r/tLvcstxNgynwaAbN+C05P/tN6/FvSLqoRlb2y
         Hd3Qb/y6iTNc0YFNenzcAmoPk0AKv9DHcisAhBZx3wZ6bbu41UdHRpQZgNHvHUNb6Z42
         DLqw==
X-Gm-Message-State: AOAM531sejfPaabbVvVedUX7UjaN5dnLfpUm32/QFQ26KDQA3qpsbL8A
	FeHWZwwWlAawU2C70HPZTcLckQ==
X-Google-Smtp-Source: ABdhPJxH5qFy3uz5cS0YawiXzsbTECwGWRLwWJUHlIZf263DSfTtbWhT4vbaIMrlCVjiOI6dzlEPiA==
X-Received: by 2002:ae9:ef10:: with SMTP id d16mr5009426qkg.264.1627051505203;
        Fri, 23 Jul 2021 07:45:05 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:04 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 13/15] staging: vt6655: kernel style cleanup of mac.c
Date: Fri, 23 Jul 2021 10:43:38 -0400
Message-Id: <20210723144340.15787-13-lucas.henneman@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723144340.15787-1-lucas.henneman@linaro.org>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes from mac.c the file name and an ftrace-like pr_debug
per checkpatch's two warnings.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/mac.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index f5ae7f1f5689..9721c2234bf2 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: mac.c
- *
  * Purpose:  MAC routines
  *
  * Author: Tevin Chen
@@ -775,7 +773,6 @@ void MACvSetKeyEntry(struct vnt_private *priv, unsigned short wKeyCtl,
 	if (byLocalID <= 1)
 		return;
 
-	pr_debug("%s\n", __func__);
 	offset = MISCFIFO_KEYETRY0;
 	offset += (uEntryIdx * MISCFIFO_KEYENTRYSIZE);
 
-- 
2.25.1

