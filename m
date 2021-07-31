Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509713487
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:23:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z4so13357204wrv.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1x7J72bz0//FnktNoXDcuPvaVh8FGIGtRtGljqXJxPI=;
        b=W7sDYvj/CAScpi5Et0a3yj48P9hnshxp9Kt7chNOVK+qL9CvCHxuCbjkUhoFI4bQZy
         oj3zIK6yS5OuzbHyZlXSI/mgN3ho+7MBuQICxUkWxx/OvQxTkAoyrcI9QGCHv1aOqvmo
         FCZ7Mz7VIX3j0cKwUGAddRsgeiVYEEn+UDaHQLUk72wdpatm3gGRFfnHeC3Zldmg9pGO
         e/DJXi2j4P6+++gw8NRfE9PhBu1a6o2Z3XraxZxSsT40vgdwlQ64SjSS+a3IVrLz+ZJu
         Ht+Ops+m+/3tKtJvCu61pPwq52+i69Pa4Uya5sozN1xIwoyrPgIEWp+MoD1FEvVMftyQ
         tDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1x7J72bz0//FnktNoXDcuPvaVh8FGIGtRtGljqXJxPI=;
        b=icKqzx8Ng0cb1dtuTaGJIj08swUjbsWIiq35UZLfCXZJZaS4oSNIe+qETzQRsYYZ37
         cxyaA0YtZ3ksBO4g5c+gRe++jRJHqEVmO6lN976lfDj7C5BPbwUWw6ne5sXhFM1LZi9o
         tScK3+RLVWd6MfeDbZqVavPAxEzoJidLAdzPuBsipChqonMyvwmHx6TJo6fxg3osgeFj
         t1tUQEjltqq0wlFv+ITwskHWvUyjXuAUkmcOgM35u3uchECoHRNSwMskMlF6RGPRfS8y
         u+DLmBMREyrAdgAKGVJ7oNsq0xuRl3wQqSwQxylCdZIfi0b6N1KWlHdms/5kH6hdXHq4
         uEFQ==
X-Gm-Message-State: AOAM530FhQzI2g43CKpFyi3T1G/cj6bx26CNBGuvveUhCo2+eg3SNd4D
	jg6Ra0fsQ8N0ER/sNoKeaVdaBg==
X-Google-Smtp-Source: ABdhPJxBImAH3B/wBIqq3cq9BIPEU7cBXleMaMh34sPoLdJW93Uzon+E036iJ5A47doDLRVA140xKA==
X-Received: by 2002:adf:f112:: with SMTP id r18mr5632537wro.160.1627691037685;
        Fri, 30 Jul 2021 17:23:57 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:23:57 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] staging: r8188eu: remove ODM_RT_ASSERT macro definition and caller
Date: Sat, 31 Jul 2021 01:23:42 +0100
Message-Id: <20210731002353.68479-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_ASSERT macro definition from include/odm_debug.h and
its one caller in hal/odm.c, as this debug code is against best
practice.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/odm.c           | 1 -
 drivers/staging/r8188eu/include/odm_debug.h | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index c6c184d95fee..fa3973393eda 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1373,7 +1373,6 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
 		LowRSSIThreshForRA += GoUpGap;
 		break;
 	default:
-		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
 		break;
 	}
 
diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index 73fdea598707..c11d8925952c 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -96,15 +96,6 @@
 		RT_PRINTK fmt;						\
 	}
 
-#define ODM_RT_ASSERT(pDM_Odm, expr, fmt)				\
-	if (!(expr)) {							\
-		DbgPrint( "Assertion failed! %s at ......\n", #expr);	\
-		DbgPrint( "      ......%s,%s,line=%d\n", __FILE__,	\
-			__func__, __LINE__);				\
-		RT_PRINTK fmt;						\
-		ASSERT(false);						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

