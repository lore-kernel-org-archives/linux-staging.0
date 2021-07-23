Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88192FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:00 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h10so1783198qth.5
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ciu8u5OUntfgP70451NjBC7j5Y4yTXOhvbGFbwQvPck=;
        b=wnDFCk5dXLjx4N3BbtqfBcnNDVgvY4FcedNaVSHCY761A5RXM5l2Ys+kgkr2eV9fTW
         ob7wf4AzHR5w3rY06TotTzNa+/ljsrAF5vZsW+oxnzJRoUx5EiI1c3iq9lVGritZZmPg
         3hIzrH/c8eN63Tla/ZoBJzYLc+gBC3rUTc4Wp5/vYP2bjW6RDx2qfogl01eQccLdkR9W
         gEb0rG7Fa5L7z9ZeXvVGOSpEt0pXE8lJktYyCfc4+DC3bxP6MZd4d2isVJgcAFzZ6q9j
         OsYHuq4yF3whORUy9LKjUxdAQq7WI8fHqMwzXEvZQjLDtyt4RWJUKY9++6qT/lR6uCEO
         D/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ciu8u5OUntfgP70451NjBC7j5Y4yTXOhvbGFbwQvPck=;
        b=ax+1m2NVAI3W7jX2pfein7kutryNj0QYXScHTzNrqE+h2ml5bViIUdJ1x/iw2lyqwE
         y6G/LxdmiBQH2GybdhO5J8jdyOKsyBN1B9QHpOA3WIB2WlwUZw+pNYfa8HT8kdKr0aAZ
         05oqM0aBKqoq4CrZFpwhfqhMm7fQLcVMiHkHI6FhbqhYKUB8F4OY0CuwcHodkhTQClZt
         4QJzPpvVGK4Hqmtc8Tu7J0LhawadGjsIy/WgxZVh4YI923jxr5faF9jHCwJefV2WU1Nx
         sW5QtKeQ2NZ5rONNKgRaapLT8p4jIZB3Gti4k63RvMuYcE8XePmZMNae41a8LqtfgF85
         GOWQ==
X-Gm-Message-State: AOAM533HDZi786kcdPsGaZ9lF0mP37xoqNUc8saciQCsUJdXVuH0BzAU
	7GX3vymnQ/HXF+DpAwr+SYDudg==
X-Google-Smtp-Source: ABdhPJz/OTk67gHJ1Cln4vb6S4F2aqvbOJLeuv/1M0QUO7mGt2rtoHMEXpUaF0I8l1tx2ZU2tGZyiA==
X-Received: by 2002:ac8:768b:: with SMTP id g11mr4282064qtr.352.1627051499834;
        Fri, 23 Jul 2021 07:44:59 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:59 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 07/15] staging: vt6655: remove filename from device_cfg.h
Date: Fri, 23 Jul 2021 10:43:32 -0400
Message-Id: <20210723144340.15787-7-lucas.henneman@linaro.org>
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
have the filename in the file" for device_cfg.h, and adds an empty line
after the top description comment to match the style of the other vt6655
files.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/device_cfg.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_cfg.h b/drivers/staging/vt6655/device_cfg.h
index 04db6a8d3db3..db0304f6e21c 100644
--- a/drivers/staging/vt6655/device_cfg.h
+++ b/drivers/staging/vt6655/device_cfg.h
@@ -3,14 +3,13 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: device_cfg.h
- *
  * Purpose: Driver configuration header
  * Author: Lyndon Chen
  *
  * Date: Dec 17, 2002
  *
  */
+
 #ifndef __DEVICE_CONFIG_H
 #define __DEVICE_CONFIG_H
 
-- 
2.25.1

