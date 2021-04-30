Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D22F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:26 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id l4so105667748ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5KtDzlglqZBamkEg3baS39llf/wufOaHK1MWrZxa8uQ=;
        b=AlWBx7/oB3YlhNtCS6fmYXufz89ZPE+hdIuJ1po89twnm6pXmrEZ9y9Pz9SvSZkV0K
         Mb4sferP5wVXkul86OXANpJgMqyB7mpfz9OH3J8afxCXwhHaLtkWlNGpGYwUWC2lULwG
         uuLZQ/B6tKkj53jWRnkU2eDzoDdAuGlHTgpL0ChCRRhJMx31OfA58Pjowq2MW3Ww8BQo
         5D1ZLs75hESGHrkffRtidWSinXMudUpu0NGpqlTbjblsGsXTZvOm4rZUnw5cdqtimu3Z
         Q9tCn1lRD5cmJScywufNknke4zqFPJYkmiavJcYfzshhW4A7+FQAQZpPs5PbCxYYITFn
         6Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5KtDzlglqZBamkEg3baS39llf/wufOaHK1MWrZxa8uQ=;
        b=nKzMXokH5lEH8O5BSuE7II18mDVarVU7FFGG83l2sqoxFl7MPjezev3ahEAbHMsap/
         xVTQD+O3nWmXiYcIrQ1yiHRcQ2XM1sPgVYxcqv3ljNoejQGuhCa/dwyxNmGYpHGVGCnx
         zeUkMRcwPQ5HUcB5k+rCVZ+5pmcv3oLhn1HspAfDM1f+IqpGryOg7iwPNp+ob4cv5CK1
         NHIyuMkJP1AKx7ucAVfVcgrtrtmgdmKc6lKiECXACrhPg7v5EhDVP0//AQSa9RGwLzbm
         HKcnopMErxJzO04EgUesOn7EAUG6dVSuG+NpxIUpyGhMLB1RPWbLBXD1pKgDhTzYpQc1
         vI7g==
X-Gm-Message-State: AOAM530fAGQIa8H/Mayixjh5MPbPBi0Td6C7ma1/iZU41Qv1jka4ZVbz
	6p7x3ljcqG3tAM2wO/1eZfNzJkapB/c=
X-Google-Smtp-Source: ABdhPJyYEI65+jJeDYqpyFQvJxJiPhO+XNts1sUqbDb/dFjScoVHCWyCbf9JqU78xANRt0vrqhJGFg==
X-Received: by 2002:a17:907:1b1e:: with SMTP id mp30mr4905363ejc.532.1619794644955;
        Fri, 30 Apr 2021 07:57:24 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id jt20sm2072544ejb.79.2021.04.30.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:24 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/43] staging: rtl8723bs: remove unused ODM_PRINT_ADDR macro
Date: Fri, 30 Apr 2021 16:56:33 +0200
Message-Id: <8f04c3b8b841efc4271d4a7ef71a95e04894d64a.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_PRINT_ADDR macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index b4fc247242fe..58de4d16335e 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,29 +97,10 @@
 
 #if DBG
 #define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
-
-#define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr)\
-	do {\
-		if (\
-			(comp & pDM_Odm->DebugComponents) &&\
-			(level <= pDM_Odm->DebugLevel)\
-		) {\
-			int __i;\
-			u8 *__ptr = (u8 *)ptr;\
-			DbgPrint("[ODM] ");\
-			DbgPrint(title_str);\
-			DbgPrint(" ");\
-			for (__i = 0; __i < 6; __i++)\
-				DbgPrint("%02X%s", __ptr[__i], (__i == 5) ? "" : "-");\
-			DbgPrint("\n");\
-		} \
-	} while (0)
 #else
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #define ODM_dbg_trace(str)				no_printk("%s", str)
-#define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr) \
-	no_printk("%s %p", title_str, ptr)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

