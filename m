Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B45CDA
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 15:49:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id qk11so26985434ejb.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LzislRsRPF3CyBdUmLIeLjcZ+WoLwAHUia8Yqa/r/Y=;
        b=ha2FxVA0CtY8C335/jYpTtab94I/NRB2Yqb/JJbP0d2h/g9iGmnwOCu++Tavz5zs2w
         JqQGVBD3pfViPN84daHU4fJZapDw3N0GAZNgHt7N88C1Dc5kAhTtGIpZbDM6dY3t87sH
         I29TcN8zqeLJM1Ia0lRZF1+q9qqBij5nwqL//tLuYqJU4BTl7VXxGd7twjUpjVbRczlr
         iPNrsJkHpR0AS2yTJO+nomj/brlQQrJmq2dLSh32tfVGBOuEOW4tEtVWUgJjaAmHk5Aq
         Fj7icxH8+2e7Yy+iIOzoUQkt+nIswofz916in6foReEN9J1pLe42dgIND8xaO7qrxtj4
         ZlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LzislRsRPF3CyBdUmLIeLjcZ+WoLwAHUia8Yqa/r/Y=;
        b=OrCn1H+mlh8HBAP973rn7c9hyomGqUN2DOosDIaD0hvB4OSgJM2qUhcEm5D9saswNj
         tb4UQFsOpHpg2CcVO99zkJt5hm0aYGBJD4rXtunY5+fEkEg3hc2m3qpTt31N0xZvGbkM
         VuXkOwHeHwcOhb5n3b9iFGThL861EobPHDlF+IVFvSH15JEhJRhVFQ851iNDwcMFYDJt
         lZZek4lA4EBmSeHB39bqWo47eFtYkgj3p4f0YUKFIeT3ACREGArR5HlRBCUJYd95FBsa
         WfGMtBkCvlu8zWqujfw6h7AeaKqqHrLYK6GxxDy9q1GonFjt+XBNft1aOnf4N/b/6zjh
         dD8A==
X-Gm-Message-State: AOAM530uOx+M4x1PeZrVHdPKKOgzV/kQ/nZjTfyHG/4IWPMPnlfEP+dE
	8STdEuXhFWXeFiGDJwoATa8=
X-Google-Smtp-Source: ABdhPJwZykj1EHixwqFV4XcWPVOX4bsIPTaOFEh54CJYyRq5L+ohYrYHChEMs7+jKAhm4XTIzhNA4Q==
X-Received: by 2002:a17:906:39c7:b0:6b5:1c00:f6a0 with SMTP id i7-20020a17090639c700b006b51c00f6a0mr12889792eje.631.1645372145481;
        Sun, 20 Feb 2022 07:49:05 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id ew6sm4178979ejc.217.2022.02.20.07.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:49:05 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: clean up rtw_rf.c
Date: Sun, 20 Feb 2022 16:48:47 +0100
Message-Id: <20220220154847.7521-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220154847.7521-1-straube.linux@gmail.com>
References: <20220220154847.7521-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary includes and the unused define _RTW_RF_C_ from
rtw_rf.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_rf.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index 945a40e6511a..ac1c06a60735 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -1,12 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#define _RTW_RF_C_
-
-#include "../include/osdep_service.h"
 #include "../include/drv_types.h"
-#include "../include/recv_osdep.h"
-#include "../include/xmit_osdep.h"
 
 static const u32 ch_freq_map[] = {
 	2412,
-- 
2.35.1

