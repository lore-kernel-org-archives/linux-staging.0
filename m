Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8318771
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n127so15441774wmb.5
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsQ6es43IHoyLDmIOwsDHm5ujGzK3kUKyhDSjmmPsb0=;
        b=Mp8i3P0Sf1co4etxYdreRCLJQqqwnCV/+TnKyGhB9hAbXJZ58JEkWH4qLqpwKcS/YL
         EGK49Gou9IkFa2NXIZoixKXvKvfAuDM6YFO7nnyT4UEOFpwRTNbGeweogEc9uHWQKK46
         LTpmV7424Lk/jQXWroCWBKwQvR8S6UT3mSpmJUp88jL+sWdOV08knsLxhVzwqRwiQmy8
         nR11TDF6/GSfHPKOQkVmNAroizoRF44BUrdAyWkY0r0ef8WnQQx0mjOqzEfnLjVNiSN8
         KJQxoyiJEf+8VbpLRLoawjkBUKqRSuMevYYmQvc9ECjZ2pIsiSVd7jOjj/xC79ZDcJki
         pAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsQ6es43IHoyLDmIOwsDHm5ujGzK3kUKyhDSjmmPsb0=;
        b=ax74TWLXd4limtE08mOqRVNi4QJVpWJ0BI/V71w1LohjPTbaLNDKRYyuz7XWbB4xzZ
         36GL05F1aDpJ2ffmbjH0x6PCk1Ds+pynKMcAZvnbQcFZCNOFeBrFTpq97/RCJ25mX+Uv
         j6PlE2SiKjxhivN8c89EE7Q7TO7sSo2gv2qt6V5gcfV/P5jRGNDmsIfpqYKZhQu9WC4u
         oO2Zy2jrYf+aSWZZZVqOkDJVr2AKZosLsQdTzjtlurwJyDGXShNqsZ6Ibr9TH1pvDTyh
         e1jkjkffAKsofxtjX8UttEKdncDVC5rgHLfZuI+SpYPFB2VOyu0OzZDJPSA6cF3cYMeT
         cbpQ==
X-Gm-Message-State: AOAM530O/5zOcJcDxDzvVlZMUO4oR2zV9wXoC4ihrHCGstBgDek9sk+6
	01803uO6UCubSzh4uIHye4M=
X-Google-Smtp-Source: ABdhPJxo5ygUoqnau1EOZRCfQA2ZN3FIOMMdxzh/gpWKlpCZXF5WR0JylhDn3cDgvGSNK50zPJz3gQ==
X-Received: by 2002:a1c:2857:: with SMTP id o84mr9731601wmo.181.1619254977183;
        Sat, 24 Apr 2021 02:02:57 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id w4sm12235750wrp.58.2021.04.24.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/50] staging: rtl8723bs: remove unused debug macro definitions
Date: Sat, 24 Apr 2021 11:01:56 +0200
Message-Id: <93b7f5af8f5220bd17530f7a907fa4fff4cb87d4.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macro definitions related to
private log level tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index acf4deacd3a7..8f56d1e7e644 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,18 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _drv_always_		1
-#define _drv_emerg_			2
-#define _drv_alert_			3
-#define _drv_crit_			4
-#define _drv_err_			5
-#define	_drv_warning_		6
-#define _drv_notice_		7
-#define _drv_info_			8
-#define _drv_dump_			9
-#define	_drv_debug_			10
-
-
 #define _module_rtl871x_xmit_c_		BIT(0)
 #define _module_xmit_osdep_c_		BIT(1)
 #define _module_rtl871x_recv_c_		BIT(2)
-- 
2.20.1

