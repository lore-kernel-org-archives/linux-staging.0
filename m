Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBC2FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:07 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 129so1577988qkg.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7hVoJHBEz5aqunTxwoH93rA+3dLU3vT58D03EQpnxo=;
        b=ZLqoKSQMV8pXQ5EQnTnMhWed90b3qLRTKFva7ohCIxGmtf5QBQ5dxOvNzGCmMnsozH
         v9mrIj8drEe2rZ11TaZ2JBSlmOreesO6UW8FrUoTf0GfspjluidpSEsniF7trnm0mk6F
         sP7PWbhWOaE757HwA0Lv9Nd41kxDs7SloZAWwbb+Tjcg1Jn5vLKbu0MLXTAN4Xxb6ht3
         PO08KTI6XtudLypVkTiYdSgo8Y2O+oGrjuRiqnVpuGeEsnfyA5l0joCT2En2ihHpL3TF
         B2KWw3FU08dVKAI8EcHiuK4lI0NRq7JD+oFsucZ3wSxGSR8EAyKYzKa2uGRrXF2fwgLV
         3h2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7hVoJHBEz5aqunTxwoH93rA+3dLU3vT58D03EQpnxo=;
        b=EQXXJIY51Pbu4DZH0zNoCgbdyTMDhkgy2AaYgX6cTWUc7VPU+J8vbAJaZa6Uv3ZfAl
         7/OwvbIHa5atQW5so5FpxDthA6rHbm/la2aD9T2YqSrTz7B+9X3mDlMXPykR1MjZEqVk
         L4ajBiPpZhYtB8FlJzPI/vXLfR4LPjjW+z2GWr2F7UAgfOJeWJH2Uq8cxsfBvYSPdJoe
         MN3Wpjb1DNYIiR5fHwcOzGZ13JIh5/vS5O4Fl3Ju/+zaPXC226Zqh2ibqoIpPCAyKFCJ
         Jv+63uPLszViYURBwrfxh7YOrfzuEIWpcRM3bp4gFiUCqxalLXX659d7QmYNExbqUpfg
         eZpw==
X-Gm-Message-State: AOAM530cldb5KVsoOXd/KboaEWcIZXQ6IXJp5JtcvyTx/kCCoUXhbHid
	KU5zz7K0oSqKe4c9wl9TQMU9cw==
X-Google-Smtp-Source: ABdhPJxuI0i0eDI3fl3PhMFcrXiYdLpEc+OPNOJHg7QG06oFa7V//nIp/vJNMjnm+Apo8QivtUttaQ==
X-Received: by 2002:a37:8504:: with SMTP id h4mr4926918qkd.85.1627051506883;
        Fri, 23 Jul 2021 07:45:06 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:06 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 15/15] staging: vt6655: remove filename from upc.h
Date: Fri, 23 Jul 2021 10:43:40 -0400
Message-Id: <20210723144340.15787-15-lucas.henneman@linaro.org>
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
have the filename in the file" for upc.h.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/upc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index 8608693ae9c3..b374db5fca81 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: upc.h
- *
  * Purpose: Macros to access device
  *
  * Author: Tevin Chen
-- 
2.25.1

