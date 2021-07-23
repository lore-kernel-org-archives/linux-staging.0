Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58442FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:44:58 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id m11so1770484qtx.7
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GGRV6fuE6gsxNz04S35VHDyeYowO7/W+U9us9gevUNY=;
        b=df2FhuACO/btV6Lq4pXG7tOXfUDkb6fMGd2ZZP9nm7I4XW4+zX1CXqU2PisUf2KCM9
         8X/0wX6FkZXo1vjsuSJLgBxvVN0M/3sFWvtVDWmXO3h8wlkBwmX5NtmDdTAYOG2iyAVp
         mWY0yTKKjRNWuAMw09WYQM8B8Jg1DyOzHyON94D3JSLwFoRjLkoebcJChlIzsu7JGVVp
         1i5vQrNXKEA4xRsinyP8LRQMR/+fLGdvVvMz3u4MgmPft9G98Imw/GIdjHKRireA4QW8
         TWBnxLUpzZSuVhO9S3x8c1zKYNY1Hg6eovV4KzQummN8xu8uKmOdA2tt/6RytKKREkj2
         +EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GGRV6fuE6gsxNz04S35VHDyeYowO7/W+U9us9gevUNY=;
        b=cYJnf+OxQLV/LUaOFyHgGysOcEcVKTRq4sssuDwLHi+9R16Lf8BOUdYzVu69C74Fxi
         HPznxUj8xwDzmVt4loFNk7gbNyQEci7AyKBtQb7nwOOwmOurP8gF6QYhF/eSOkPw22my
         YRBLOvXYfy3ya1c45lKtU/BDtqVyHm3OLud4asWQz6XapLvF2n0Dl/U8pHtGvCfJUnhD
         tRxmmHMkK2lFGgIkSs/8LvmzrrEamd8o4wGFPY4lLHq9IvS5f++qlEJfM9PKUiXfxMDk
         IwQ08VeU2n+33tH/tO3OTWEugkhFUpc53jQpgQYXboE1SxhTWbXZkdpKBqKB8qRAiuMj
         gRhA==
X-Gm-Message-State: AOAM5316+J/7N3wGxmefF8+gHJbOrX17xd5feh7YW+p5oIndDOU13/jg
	VxUqkBBMHFAiuGNkhwxD7AdroQ==
X-Google-Smtp-Source: ABdhPJwGPRMdqeIVNw/ckuzW2mxIVYMTpFljoao+5RjypTBU3UEPbpst8mQCYcWOAAspTVEn1S9w5g==
X-Received: by 2002:a05:622a:3:: with SMTP id x3mr4157576qtw.321.1627051498044;
        Fri, 23 Jul 2021 07:44:58 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:57 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 05/15] staging: vt6655: remove filename from channel.c
Date: Fri, 23 Jul 2021 10:43:30 -0400
Message-Id: <20210723144340.15787-5-lucas.henneman@linaro.org>
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
have the filename in the file" for channel.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/channel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index cf46ee63681a..52b6538a201a 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: channel.c
- *
  */
 
 #include "baseband.h"
-- 
2.25.1

