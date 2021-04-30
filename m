Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5839A2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:37 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u21so103858595ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxnsY7XxgR5LPkLt/HzBZqQVJx7TOeoHfiVCxdpmUW4=;
        b=hrhRKshMp3WRdkuds8YQxZl/TMiaTbst/OmV1OxYXnVSkyvzca55VxbCNGofsw2t2c
         i+kleGNk2ItBWf1nDFR2hbGFoEa/zmdzycA09aRIbphHnx9V+Ube1MrHV9MysHCAp06V
         dM4OVc18THAEd2snplWac8pJkiuR+2sFY+0pJXto8ymvXllFyT8zw2qswcytLB8OhwLj
         fWsneuUUQiICPzNjtGPdYLDh1fI8Ak39khZYRtxC8LRxrGckNaq8NYuZ+5JDFUWE1oap
         2lk8Z8zkptaJqZQua8/58jpYK53XqYb1Z+BV2G1l3NrnE+MWHN5x082UWKSJX1aUYDIp
         srTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxnsY7XxgR5LPkLt/HzBZqQVJx7TOeoHfiVCxdpmUW4=;
        b=nGKIOOsRzzkvyIO/zv5g9dKvYCkR9u3tqnYc1Xem0OK5r36c7S2vwPAm1wo/42R1Ck
         ZNw6V6GfO07iLZ/+2iWaiIoWcFTE+bM/yNHZ0kIlsCnRzIVX+ohl1nftfzHMR+9oijUw
         KsUAcTLououFA95M7xZkGuz4zgvkb2Jkivjz7/GSJK0JOJ7j//lRW0KxzToCaerZtck9
         cWdsCWcRzmelfeq8xSaTmnpIosqtSlvKJqDqlQQ8N9KqZjPAJoGwBp1VfF2uPh0ihjv2
         ogYWOP0VHJOlH5ubHYi14takloFgeoghX4K5qijbN5Plc0EjvE/iqJf/Zb2R+TISsjmF
         Bg3w==
X-Gm-Message-State: AOAM530/+ObnWdiiI31IVoaqLGcKa90xtw7CfBkr25J0PQVkgj+XOvxt
	Hm7rOtNp8PQGZvIqBTUUgec=
X-Google-Smtp-Source: ABdhPJxCYNqD0VnHq8f+IoNhzvOHjurXyPfPsJ1AQpIwrpb+xo2Eafyp1y7sIvmkXWELiJVIw/mDcA==
X-Received: by 2002:a17:906:dc90:: with SMTP id cs16mr2814549ejc.210.1619768675994;
        Fri, 30 Apr 2021 00:44:35 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id r21sm1475223ejy.27.2021.04.30.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:35 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/43] staging: rtl8723bs: remove unused RT_PRINTK macro
Date: Fri, 30 Apr 2021 09:43:37 +0200
Message-Id: <794c49f2978c0a94fc2ca91c60588f9999bd0e70.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RT_PRINTK macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 3faf4da42bd7..5c4412bf6fbd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -87,8 +87,6 @@
 
 /*------------------------Export Marco Definition---------------------------*/
 	#define DbgPrint printk
-	#define RT_PRINTK(fmt, args...)\
-		DbgPrint("%s(): " fmt, __func__, ## args)
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

