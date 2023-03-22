Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3C7C
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 05:17:07 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w4so10200881plg.9
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 22:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679462227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XW/nloa73RsDbxvXcsiwU/r3yMnxVtzFID97L8lhtk=;
        b=NroJxHZ3oYEHTsjtJdI1uiPOX8c/Uk7CAOrHj26NwJT53hOgfDzI2W+u4LjXXZOBO9
         6nMqaGvBuGjcn5jt98Vl8WZK7zuikadpwiCzK2YTEs0Xl5O2WIWb4GVd2h+kLPApOyoK
         d02EhdJKL+AH6f6PCCTaAkS2igffFDsPgydE19v0gfEyPTXSplrlMdbyilqg8MopSPAj
         7KMcx5/0XvlrQF9vwLd7XADbWEGZQ1bssuDunGZMEyC3ZHMKd/EN21ZZkTdl6HVCL0NX
         v4rA7/rBkbs0jXgsOYwNX/0lh3AFYoshl+YcwniLwqyzEBUA54E69yBAKSB2TkfE4/yN
         eC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679462227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XW/nloa73RsDbxvXcsiwU/r3yMnxVtzFID97L8lhtk=;
        b=FTlL7LlNXpUks2KxUUuNCFRGOCB0kovsimrYmnf1VC5Kuj9Fja+PKgXePsELe1Chfq
         2M94KKPr6m89ypPdMZC7lHxtU3soTgc3Wt97tP9XSgtMtJqMvioyKkGtwcTAuXbSt1VI
         6v5DU1pBEZkjIIftgYfkkTgJj+Aoo3FyIcf0qbtwv89kzJFj7w0xoFvw1Yx4FgrAMffB
         u9SWSsacbpvG7P+9dOISnEVJdOPUGA09SP65bhNjmerXxaR95tjfRvoJfD2Tply+QYu2
         7E7q6S74wvWHGG6qCjt6q30FAKNOMjPZpkgUaJgfygsAWEwqTtPdL8ts8pxbaQhtJhcf
         BXLg==
X-Gm-Message-State: AO0yUKW8emjxIk7Bbr9qbvYZDNDg5M3mdsZ43G0txXLL7RU6NwQYKqdF
	RKawRDpohSr5cC+REMWmXw==
X-Google-Smtp-Source: AK7set8+oAj4xTeKbgtoNa9q/D3k1XzFG3O0u6jHtD+I1kKZd+c9s63e8Z4VOfMfUFgja/Uc432JqA==
X-Received: by 2002:a17:902:e5cf:b0:19d:7a4:4063 with SMTP id u15-20020a170902e5cf00b0019d07a44063mr1796838plf.46.1679462226864;
        Tue, 21 Mar 2023 22:17:06 -0700 (PDT)
Received: from mehmed-HP-Pavilion-Laptop-15-eh2xxx ([2401:4900:1c19:e99d:845:36b:5d36:1b42])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b0019cbec6c17bsm9618653plg.190.2023.03.21.22.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 22:17:06 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:47:03 +0530
From: Inshal Khan <kziaul123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8712: osdep_intf: Remove RND4 macro.
Message-ID: <ZBqPTz9j4tjDxaHo@mehmed-HP-Pavilion-Laptop-15-eh2xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The RND4 macro was found to be not used anywhere in the project.
Therefore, it has been removed from rtl8712/osdep_intf.h to
simplify the code and reduce unnecessary overhead. In case the
need for rounding macros arises in the future, kernel rounding
macros will be used instead.

Signed-off-by: Inshal Khan <kziaul123@gmail.com>
---
 drivers/staging/rtl8712/osdep_intf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8712/osdep_intf.h b/drivers/staging/rtl8712/osdep_intf.h
index 0e097b4a8670..446ee09159fc 100644
--- a/drivers/staging/rtl8712/osdep_intf.h
+++ b/drivers/staging/rtl8712/osdep_intf.h
@@ -17,11 +17,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-#define RND4(x)	({ \
-			typeof(x) _x = (x); \
-			(((_x) + 3) & ~3); \
-		})
-
 struct intf_priv {
 	u8 *intf_dev;
 	/* when in USB, IO is through interrupt in/out endpoints */
-- 
2.34.1

