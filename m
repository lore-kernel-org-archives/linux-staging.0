Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364E62FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:44:57 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id l16so1455271qvw.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i9lKoJh6A3gY5qBoHYJhYMf8mnZelWzpBJi2pXCLQLs=;
        b=URP1jAaAgUQo8pBjpe6IXX9titzvAG+qhDTsjy+tTgvBY3cnqZwB9em49vhN58hIFH
         rejkWLhBbU10yuEOBbVnE+dbQbhl8SZu0vwHJPft4A37chdESQoukMjab/MQAHL14uCU
         VcRb5O4NOSflnqz5MmFXWXLrupgwRMzkpTJ1ngmmyT17n+39JNn4s628sc7Yq/Z/QYK+
         EMPKiAQCPOKyDnfAy3NSQuL4plraolP3aSxFuhtzON1/orwdIRTtEZw8sFR2v7osIE2c
         lA3mvQ09AQdFfw2gZZoZaOFIUGK+/y8n5tBSUU8ExZKixWq8KW+PytRkqpWI3pDV4uMJ
         nZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9lKoJh6A3gY5qBoHYJhYMf8mnZelWzpBJi2pXCLQLs=;
        b=Kp4l1pV2v31ZPC+pok65dd4TTbZfkCM0Cbw/vh4QxPLBhKfm1ClbLsT4nRnMzHOGOP
         AwNICF3Stx2cdqPQX5qVIKlAZMLajE2n4I5/mbjpef7vzoHk7b4McuDeevzZLisALJ3W
         2BWY5PFgQdfHaN+8X/th2w14fJ5qQOokGi4WmdHfCv3H3Y+2UTrwG6Ft3U8DWr6+e0mm
         ZRgXaBCi82Yvptj3W0zqOrafJ4eFCso2JeXQvTscWLBROJU1tGohQiEawGvss/RNIM4k
         I7zU4ZBRx5Dgr6qETNky5mgrZLafvRg1Xf0VhRd+QKVOVZ0UzXI79KTJCvFGlDb9Fvsi
         X5wA==
X-Gm-Message-State: AOAM532+U5KKWEl8i9J3ksrTnAFCJJK3gcbzcmE1XTiK8kxgTUbBjwL5
	N23AXWsWscLsTOphl9mpkCH8Fw==
X-Google-Smtp-Source: ABdhPJwbMJ38KNYZ9C7DtDVHfPbZe0nn4I2jwKgPJ1MXrj0uTaRok51cCVjzh8u6GeihH+EYU+DnqA==
X-Received: by 2002:ad4:518f:: with SMTP id b15mr4856090qvp.52.1627051496249;
        Fri, 23 Jul 2021 07:44:56 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:55 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 03/15] staging: vt6655: remove filename from card.c
Date: Fri, 23 Jul 2021 10:43:28 -0400
Message-Id: <20210723144340.15787-3-lucas.henneman@linaro.org>
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
have the filename in the file" for card.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 29086189c53a..3ef3a6e0e6e1 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -3,7 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: card.c
  * Purpose: Provide functions to setup NIC operation mode
  * Functions:
  *      s_vSafeResetTx - Rest Tx
-- 
2.25.1

