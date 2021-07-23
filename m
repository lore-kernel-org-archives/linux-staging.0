Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C6A2FB2
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:44:58 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w10so1797252qtj.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0WrZChTYr+2yRT96KTHSooltmcWEThpE/fGki1Z+2z4=;
        b=i5ep01lgPsV5vY+quDTck/LcEqe3g+a99t2WGNoYO5iGV7XBtzxiBviy/tsqDOwWho
         9WNvfr18tU7TgoJ8N77Wpkm4p76ayoasXfami2oQGjqKVQoXlSp0eIsRsUvoiV209KPo
         8d9RYGVfeE6nO9/vB/6m6sKBo03SA2uvJJbgY3nB8JKuCWT5fsRODo/92e8jpPSAk8vh
         r0dD83lhlqV5ZBovr6Rn8Tj2jWrQzcEge53K3woApzEothGnRQImgDztMHc/AnKtXF8Z
         fAxE5w/PNAWTzRKblpVHOJPz6r/aVzCbu5sOjK48WLlOdddhN8Yso6SOmMMHUA11d8Kp
         3zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0WrZChTYr+2yRT96KTHSooltmcWEThpE/fGki1Z+2z4=;
        b=CdyOwMEpJzA5d/ZaQ08YHQ/6Rb0AGC6sIyC7xdgNv5sCr21JKzqAJ2kJ/obzXcIfDl
         7uYjORX9yQIf4zs0CDyM95/bcOUZUwDRtETOgvduWHLQJP4nRB0+u3wmgS2Q1c/TIEFm
         xAloGpiX6rpAYUpylKMMdk+jTviLc0orrYfvKSL2YUuilwGqT9dDBU5r0/sO3p5xFTcj
         ehGcvp4GptsI3rYzrnBi4wdlP/zOpwqQ/9kDecpNc/y/0xM5uvci6nvToV57uYtVc15m
         Pi3qKNrDpzF+Wmcg07Ece6Red3BEJw9a94yYXPhCBSxT91goTbVCLVe6Gjxz8B1TyH6a
         dNUQ==
X-Gm-Message-State: AOAM532Xgr9kObL9jnHRHT37xpiRiQOLPv6o8GM9hV11b40mQ1gchN9Z
	evOg8i/6xAXCLF+mvrP7l5swSw==
X-Google-Smtp-Source: ABdhPJy7ZuEM5WLpcVcrACGQaZvv/j7rBExetFWN+w7t1l3Bd9ntT+X7WzOSI8OYG6ZDfKNBT2rxqw==
X-Received: by 2002:ac8:786:: with SMTP id l6mr4238671qth.387.1627051497253;
        Fri, 23 Jul 2021 07:44:57 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:56 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 04/15] staging: vt6655: remove filename from card.h
Date: Fri, 23 Jul 2021 10:43:29 -0400
Message-Id: <20210723144340.15787-4-lucas.henneman@linaro.org>
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
have the filename in the file" for card.h.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/card.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 568a2ddd6588..09e7f3f1cbed 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: card.h
- *
  * Purpose: Provide functions to setup NIC operation mode
  *
  * Author: Tevin Chen
-- 
2.25.1

