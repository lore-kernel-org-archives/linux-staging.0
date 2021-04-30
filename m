Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E762F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:27 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id q6so23708027edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBMRL9okd6exFYzTetsEZ3MsVPUnPB4cIvHOO2Zf8iE=;
        b=Zc1+7wI7aOqq0hjmpYddIAn+mNWVhOqeqWoCw/2snDV2/idwSdyvmOjLKucNWv1xfk
         KjMpKAL/iyP0apb+UZ7Z+dwlU00qP1RW1gyQZf2qonhl6AMofR8e+sCfLOBiYYm0PPuz
         Qb6iZHteza7NVY3rYQaqm6ZyyIkxUttWdfnO75KXTGs9hVaU3kn8pOF3fzrsSoedwDGP
         MRKO7qguxTdTAxkWwZjpO4v5gcAqdYN9YE5dyZHfSnMtj2DnSmW/Nqh9b78X0HTOjgFe
         c19ZPXjrDt83PIBolsM+vRUufc7iKDVgVQg/TQLLpdxFtdTkovpntPYiizeY6LzMkBFk
         mg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBMRL9okd6exFYzTetsEZ3MsVPUnPB4cIvHOO2Zf8iE=;
        b=PcNEPBdKpNLv/V/Ob2iJ2CUJpkCVVCV42PeTzFpKvXt42sw/lxmcOfMxpJBkOBm5TG
         R3NHV1w5u7SZvfr8aQJKzz0/yVwt9fdnswHDLp1tHIbNfKh22lzuq1mFpuBY/cBdraZY
         0mYeqrNFUpz9G/40avLAYxSjgrgsmeHrMaUVB1fVKUjMTanaQD0qT9kLiADVxFECi7KH
         wOHD6TaWam70cpBijLjL6r4ZOSX+CT2lFHRk+ZbDBDdI+ZaJO3LT469fI90Ts2WNCfPD
         8QJRhHvfU/HqAmuqks5txD3MpMIbC6mGtiVaQnsVUjueX6WUEmQ+zqKktcxVJAK2cnke
         /qEg==
X-Gm-Message-State: AOAM532ntoM+6g6TGvrQ15PiS4E/RyIdcA97Y/q3RT3kLdqvbLAHU4wJ
	0dzMEK0sNuD69zk187gMSfon193KocU=
X-Google-Smtp-Source: ABdhPJyP3OFwXt70owCY3qp4LX+a64ZzGOx7cWB9tbKqhpEM2j3G5TXpX87oR8/VHnFMUVW2SYYr2Q==
X-Received: by 2002:a05:6402:441:: with SMTP id p1mr6496473edw.298.1619794646450;
        Fri, 30 Apr 2021 07:57:26 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id lx20sm2122035ejb.31.2021.04.30.07.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/43] staging: rtl8723bs: remove unused ODM_dbg_trace macro
Date: Fri, 30 Apr 2021 16:56:34 +0200
Message-Id: <ed3cc3b2c0df4f3c3f691b353f181f7c22309dbd.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_trace macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 58de4d16335e..cd68c583699a 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -96,11 +96,9 @@
 #endif
 
 #if DBG
-#define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 #else
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
-#define ODM_dbg_trace(str)				no_printk("%s", str)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

