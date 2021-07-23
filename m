Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C642FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:01 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id b1so1844027qtx.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r2FMLdy+Xfg8tryIAceuhlfZ35wf/N8NLi/v3zHNuiU=;
        b=sThrfUjPR8NOjxuMaDWyynYQWvlXrBtNQ4G4m6kdmVXjmJV6V6Dlvkki9rOLxfiahM
         IPXv1IpbECrNPBGOQ5pATYZQi4MAbTVchKrAMcnmWKnd2sUXWd0CBnOR1M8wHCXIg2tF
         ukBrpTgHLuPOizcs+ktOG2vq6kjssGfze+UEzJk8lE75kz7U/zfGmobr45OvfbvDSPyL
         ezI1ufoL5mTEVNIQtMbSPamqKyfSiOJnlB6PjhgHZpgvzoXpQlaIg5PFnYD7+kvn9wIC
         lr2RwH3M/ipJPoJWt/bPa473me4Y4DtbYmBIyCvORM2lQL2Jv3Kbwi7cuU55+b8WFMYq
         jOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2FMLdy+Xfg8tryIAceuhlfZ35wf/N8NLi/v3zHNuiU=;
        b=RqMZ3Gkk40jXnaI655uXdmBoMf9O8lJbDINSiS3YSRh9vU5zkAUGGw5yWzCknVVOwL
         InHizYcsWRWETQoTfpJruuTmYygdX+iTUobjRkn1Rlabwd/yhyJNQfXoy5+wn3Wypg7y
         /VVCeSWyfZSmiAQfIKw4SxiLjqmtt6bXhI8+M2cXxyOt7sWkq2eYNVqoaW82eIYzGEdv
         8DkDAhZ2VBE4HRR++ki7WAOusPFTxtI2vIyziTh3k/egtMICBYMEEtInhazE0gZEgTKq
         gr7rJoWvn9N/gVYU50+aWjG9R6u7psDifUTdKtckso+CsHmq8TsXmkuMD/AzL5EqCHv7
         HHMw==
X-Gm-Message-State: AOAM533CDgcxaUz9VjnVvBfv8OAJhvKJMMbvxawPKJR053gxFBbocJmR
	Woj9oodc0NIW+IbUOahQaHIo3w==
X-Google-Smtp-Source: ABdhPJxP90i0ZfgP8t9n4J7JwjKmBB+ym10OSbKDvAJBDy48NMMkiJ80oMj1Vum7xGA5bCsuagBCeQ==
X-Received: by 2002:a05:622a:209:: with SMTP id b9mr4403707qtx.136.1627051500724;
        Fri, 23 Jul 2021 07:45:00 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:00 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 08/15] staging: vt6655: remove filename from device_main.c
Date: Fri, 23 Jul 2021 10:43:33 -0400
Message-Id: <20210723144340.15787-8-lucas.henneman@linaro.org>
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
have the filename in the file" for device_main.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/device_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 979165445d88..d40c2ac14928 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: device_main.c
- *
  * Purpose: driver entry for initial, open, close, tx and rx.
  *
  * Author: Lyndon Chen
-- 
2.25.1

