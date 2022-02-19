Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158D5585
	for <linux-staging@lists.linux.dev>; Sat, 19 Feb 2022 18:32:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d27so19936408wrb.5
        for <linux-staging@lists.linux.dev>; Sat, 19 Feb 2022 10:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2Om4HUFwHssKMFJC3KShI30/to87HwYxiHEG6JaehI=;
        b=EoDhkQTMB5IM+DTH8OHKdybl1rk3RzIBZBDiXmz7BkNJRu51aQdK1760aBafU9ANKt
         J4lEvccjIr7mXjEvQkrVGN196GlTH/v6ChA/uk67fBGnNjN5kOUXfqAmZfHYGydATKxk
         U4uAtZ1XXH74E8H9ycNuptFDH6cu+fRveax3MelGi59iGK1EKmV0sWyujMHRNuDOoVdl
         qQSq7WoT5sDMVzFwF9NsL5ztpUu6H10WzKAO5bHUa4n2wFBgk7A4qdc7xkGIqaAMqYhZ
         MaBsxaRU4TTIwH1pDItprmjHPMJjedykjNXF7vNotap/BFBxVPruGPJAg/JVQ3hQUK28
         FL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2Om4HUFwHssKMFJC3KShI30/to87HwYxiHEG6JaehI=;
        b=JpoC49dI3oDXMlWWCgdXLmUbGcN3w7DIEdtg8Q0wgcphIRdgSvwE0l/f8crK72WdZ1
         FjMwUJj6zhy1qnZDbWMtHmvfGYV+CF56x52515DKEa4xvFLmZWo0zxpOBeDvbr3HJr6U
         KauBw9thjeJ7ujaqsLv+sWqEMyqyWYl/KQzMJSvwYZx01cpBqvUICi1A2YIZypd6R+jt
         L+DHVR94c7ct7MY5VHXuDkfklSYE93vqVf71pcJpzBXH0rqG4cXdMOuHtM6Ux0zMdG6Y
         f6dCYE9rrJwmY8iVWn2sMXVgNpRyr5N8xJDP9etrf9TGaap+RZZ49h10Ss9VbKLVXEPP
         BgFg==
X-Gm-Message-State: AOAM5335lNBmV6Ca+dzwrF2ne8a7RHcXcNW7uQ4MjlPFvWwEmH1jddGs
	zuFe3lLgl1w+a7pLVYYQyrU=
X-Google-Smtp-Source: ABdhPJxW/bkxF1YMHMa3U/USwle3YdSMCmXlMTXKuv5YFiY9MopFNWJ6q6gTKGrzFKhCqzCl64/O0w==
X-Received: by 2002:adf:f851:0:b0:1e5:c793:3e85 with SMTP id d17-20020adff851000000b001e5c7933e85mr10450437wrq.113.1645295557980;
        Sat, 19 Feb 2022 10:32:37 -0800 (PST)
Received: from localhost.localdomain ([141.72.243.13])
        by smtp.gmail.com with ESMTPSA id ba27sm17611568wrb.61.2022.02.19.10.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:32:37 -0800 (PST)
From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Subject: [PATCH] staging: rtl8192e: use BIT macro instead of left shifting
Date: Sat, 19 Feb 2022 19:32:34 +0100
Message-Id: <20220219183234.31216-1-mosescb.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a BIT(nr) macro available in vdso/bits.h
which is doing the same left shift operation

Example: (1 << 7) == BIT(7)

Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_debug.h | 54 +++++++++++++------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_debug.h b/drivers/staging/rtl8192e/rtllib_debug.h
index 9065901636f5..e3e8302945eb 100644
--- a/drivers/staging/rtl8192e/rtllib_debug.h
+++ b/drivers/staging/rtl8192e/rtllib_debug.h
@@ -7,6 +7,8 @@
 #ifndef _RTL_DEBUG_H
 #define _RTL_DEBUG_H
 
+#include <linux/bits.h>
+
 /* Allow files to override DRV_NAME */
 #ifndef DRV_NAME
 #define DRV_NAME "rtllib_92e"
@@ -16,32 +18,32 @@ extern u32 rt_global_debug_component;
 
 /* These are the defines for rt_global_debug_component */
 enum RTL_DEBUG {
-	COMP_TRACE		= (1 << 0),
-	COMP_DBG		= (1 << 1),
-	COMP_INIT		= (1 << 2),
-	COMP_RECV		= (1 << 3),
-	COMP_POWER		= (1 << 6),
-	COMP_SWBW		= (1 << 8),
-	COMP_SEC		= (1 << 9),
-	COMP_LPS		= (1 << 10),
-	COMP_QOS		= (1 << 11),
-	COMP_RATE		= (1 << 12),
-	COMP_RXDESC		= (1 << 13),
-	COMP_PHY		= (1 << 14),
-	COMP_DIG		= (1 << 15),
-	COMP_TXAGC		= (1 << 16),
-	COMP_HALDM		= (1 << 17),
-	COMP_POWER_TRACKING	= (1 << 18),
-	COMP_CH			= (1 << 19),
-	COMP_RF			= (1 << 20),
-	COMP_FIRMWARE		= (1 << 21),
-	COMP_RESET		= (1 << 23),
-	COMP_CMDPKT		= (1 << 24),
-	COMP_SCAN		= (1 << 25),
-	COMP_PS			= (1 << 26),
-	COMP_DOWN		= (1 << 27),
-	COMP_INTR		= (1 << 28),
-	COMP_ERR		= (1 << 31)
+	COMP_TRACE		= BIT(0),
+	COMP_DBG		= BIT(1),
+	COMP_INIT		= BIT(2),
+	COMP_RECV		= BIT(3),
+	COMP_POWER		= BIT(6),
+	COMP_SWBW		= BIT(8),
+	COMP_SEC		= BIT(9),
+	COMP_LPS		= BIT(10),
+	COMP_QOS		= BIT(11),
+	COMP_RATE		= BIT(12),
+	COMP_RXDESC		= BIT(13),
+	COMP_PHY		= BIT(14),
+	COMP_DIG		= BIT(15),
+	COMP_TXAGC		= BIT(16),
+	COMP_HALDM		= BIT(17),
+	COMP_POWER_TRACKING	= BIT(18),
+	COMP_CH			= BIT(19),
+	COMP_RF			= BIT(20),
+	COMP_FIRMWARE		= BIT(21),
+	COMP_RESET		= BIT(23),
+	COMP_CMDPKT		= BIT(24),
+	COMP_SCAN		= BIT(25),
+	COMP_PS			= BIT(26),
+	COMP_DOWN		= BIT(27),
+	COMP_INTR		= BIT(28),
+	COMP_ERR		= BIT(31)
 };
 
 #define RT_TRACE(component, x, args...)		\
-- 
2.30.2

