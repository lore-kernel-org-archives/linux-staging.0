Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBDA29D6
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:44:56 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c18so1594865qke.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CvednEzuQ02NtFsCgta6D6p4WRTWzDN+ZPtXTrjI+gI=;
        b=piS3iNRppYIAVghy1A2C8FJXwDyX8QFUaUWHjFRq5F1+jQ03Ovs6E4C/2/k632mTWU
         yjuMIzpaMrf/KrgX1UQ/NZ1QtZBGJMtoBSiLpfo+lC1MVkwoDPFacgosQnneq6Y6DX9I
         UQwEC2v+gY9zYt5KwobugsygZEGaVub5192jUkg/PGifEV583bDV9vltUd6WDak2rAA6
         aBvVP9h0e+VsaeVAij2RVGXPzPRplahCyX88xNQ7s86ahsmb7K8kliZmuAnW/Lh28HtT
         EzMXjhBFdeXTmW39v7sUHSxjONF4kqid+gOS3xXi9k2eO49B7LQ6uvuDSJCX8j38ksI5
         H2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CvednEzuQ02NtFsCgta6D6p4WRTWzDN+ZPtXTrjI+gI=;
        b=lGHM4Xz8efpbSxzlDeZswWj9Xp+NF/uIjJJQ6U8lC+qxyY+cYZScy/wKDxRNfvJo0e
         ICrK1Zgxy++dZ6I1JlQiUGaLnX+vkPCyKa+Ye3Ms/6KxgGO/po428AscPlKtxTzFrz3p
         XZnDf7uK1YK3vBVHtefZf8gsYHjNNNixCgpHDjXhOuxVyeyLAv6nWJ0cB+tUqdhZu9+P
         W/YINtb0xm8z0Wfl2DYf9FSWvF2xi0IJG9SAN8fEyoz0FEWtVVR+QH4Jy3DZFknIBTvQ
         pS4kb8ZzNcVHiu49WF+ghTcw1t9pNzv+J17aLTkp9aiz9KHmMA1Xt8yM349fx6T9v4QG
         wPRQ==
X-Gm-Message-State: AOAM533mEHvsN7roBZ1tOl2MraJhAR8zkJzOMFr9xkQXx6j13Lhlooh9
	nRuW1fHWB+j27zswAuOZNLfyQA==
X-Google-Smtp-Source: ABdhPJwt5MCin1kS6VE1XZZ+9nnQwR6Kf8Sh303vPQypPOY7rE5alCup2B2A2KiCYVKOVN9GxyWs3g==
X-Received: by 2002:a37:8246:: with SMTP id e67mr4944352qkd.324.1627051495484;
        Fri, 23 Jul 2021 07:44:55 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:55 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 02/15] staging: vt6655: remove filename from baseband.c
Date: Fri, 23 Jul 2021 10:43:27 -0400
Message-Id: <20210723144340.15787-2-lucas.henneman@linaro.org>
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

This patch resolves checkpatch's warning, "It's generally not useful to
have the filename in the file" for baseband.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/baseband.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index d89163299172..f73f3fad3e05 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: baseband.c
- *
  * Purpose: Implement functions to access baseband
  *
  * Author: Kyle Hsu
-- 
2.25.1

