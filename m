Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57793FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:28 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t7so10278472wrw.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c1o6cETie+EygdT2bARuzpRmX27g1uoX7+0epnYgy4w=;
        b=iI/0dEkNyjczXewoipqIKCHJ3HieBch4c0WRxg+smt7ezZoFpmsVMEnpyVJl5c1mdl
         Yj1VsYzk6nAQxUAi5G2xsI2cCoLmWAUq4E6tAs9XuUqwijMkFE8nJyXflTtgE2Xfnaek
         wNnZiwUhqarif6YF3NQuUgoaZ5L6BfDNc1RodW602Q1mO5Na2ozrlNSycmDyHs6yo8H/
         ILDnMmF63bM4smIbVHIM1sZtVDfVwchMk8ukGaBiFVZUhdPBpC0mDPtg7ufYofou3LZf
         JHmxdRJiVdiOS+R0wQjI7A/rcAQAFpxCQVMHjgAwFy24ShpOM4HN5cjmOKNS6Z4BxzGZ
         mOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c1o6cETie+EygdT2bARuzpRmX27g1uoX7+0epnYgy4w=;
        b=3Q9IUkN5YF/0c7QtxWwrng+45HNrUqrvfE4tmHMhOTCOet7PYwqbTJ7jBp/za9yMFr
         2vmJs9YFAJWH7nNUt3oOU8A84TmpwKmUSQgKsphFBHNaeUlgvZ5dOQeXRWtOfP5K6PMm
         0gVZ88aIyGZYnmwV5uczq39lWadDIEJDDxz+0hYqzVlyg5LuZF1FlYNwhHNuWAyd2l6a
         WiFh7ClR9tX8IghoJ5iqVeiSbxrZhPBSNrKqkNYwkzTk+7fDUja+8Elg22uxVWJS8Dxt
         whtgb0yAwyGDB6ATcMQXD0HmrqWEn5Rawou/e4wOt6grvl5/rRg9HZnoUYmBaRHOYoY3
         Tivg==
X-Gm-Message-State: AOAM530ftI7Mv9dMpSIRPJLKnPcLxHD/Njo5lNaGHfg/We/e5uu9Xkwu
	gnthXlbTIcaltAKpqP/aW00=
X-Google-Smtp-Source: ABdhPJzQkYoCk0jmNkY8qqkGC+xhDfyP9A7JEmls/pHN5NhB7gMmK9jBUz25qYqFD4R9vNOksHtiIA==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr887007wrq.3.1632341127397;
        Wed, 22 Sep 2021 13:05:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/47] staging: r8188eu: remove efuse_GetCurrentSize()
Date: Wed, 22 Sep 2021 22:03:35 +0200
Message-Id: <20210922200420.9693-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function efuse_GetCurrentSize() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 9 ---------
 drivers/staging/r8188eu/include/rtw_efuse.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 958954473d9b..cb4ad21f00c1 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -286,15 +286,6 @@ u16 efuse_GetMaxSize(struct adapter *padapter)
 	return max_size;
 }
 
-u8 efuse_GetCurrentSize(struct adapter *padapter, u16 *size)
-{
-	rtl8188e_EfusePowerSwitch(padapter, false, true);
-	*size = rtl8188e_EfuseGetCurrentSize(padapter, EFUSE_WIFI, false);
-	rtl8188e_EfusePowerSwitch(padapter, false, false);
-
-	return _SUCCESS;
-}
-
 u8 rtw_efuse_map_read(struct adapter *padapter, u16 addr, u16 cnts, u8 *data)
 {
 	u16 mapLen = 0;
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 81407efbdc44..a6e36be6ee76 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -101,7 +101,6 @@ extern u8 fakeBTEfuseInitMap[];
 extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
-u8 efuse_GetCurrentSize(struct adapter *adapter, u16 *size);
 u16 efuse_GetMaxSize(struct adapter *adapter);
 u8 rtw_efuse_access(struct adapter *adapter, u8 read, u16 start_addr,
 		    u16 cnts, u8 *data);
-- 
2.33.0

