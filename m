Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A876D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:30 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id g5so26117681ejx.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JG8RadKIrihjyXFfRsCZD83eZb8bfn2gyhoNJUeR5Lo=;
        b=F0Si20U7EEaQfivV+4peCD2C/DkpStztQBp1+C9UUNcxJe/bTDRPtK0BxiI5CgQIiZ
         yRZT6i6btwKg5jBdsr7w0rxyPMXWTsAGJTbO1c75rsD1zpLuOSov+xNGDbnMJ6UBHri/
         8zJWrvj62kFIRBWxELsa8FWSpITH3+jLU8tk2H8PhgGpJS7sn5pvrbCmiiM6REVzbsu4
         xyMxyhiNHeyqhZ8dq+6BpreBXYOqrN79ineI/ym3AAnphR46IDgh5EmaICY0z4AaFm0O
         VHedOrSSi8K+j3HHh9tx6Cq7KdMqn7w7K0d7lBDWJktWJvV+CxDYxoRPqe/F7J9l5x2N
         Yg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JG8RadKIrihjyXFfRsCZD83eZb8bfn2gyhoNJUeR5Lo=;
        b=IAFkgHzgATD4oYlbCQlawIdxkt6XobMbOaIn/1+z0bS194h3fZBLrX+mMbSagjG2t6
         ljfu/7ID9DoonzhGe/GZXP49bEvnc1TgKDfFpQpUfoJHzzIQkAmVcsXre1AZRophurEx
         +mvOl6+g5LY19ffTLLiLjDHOJB7DnQ6dKc+wM8BOg1fviXQ0UGqMynTXb15sOaZTJl5Q
         gI4yDsfgPGzuXsjSsFIT5Mja2JKw496uOPys/6SVjrIvPxmNRpXl2H8lEWl9P+c1XuFY
         uIjaXnQMR+L6UtvGxqBwe9NJYYm4mmbRAsoMy1jjgLnnAPNFDVQS80EpZcxWPZlKY8Gq
         rNQg==
X-Gm-Message-State: AOAM5335cRIaOuOhBvuu2Y5MTHozgRuoycI+dD7+tvHSox/o+L1VGvlZ
	7QZ59Ub7J4Oq6B/bAbjjFK4Ydw==
X-Google-Smtp-Source: ABdhPJzYRHFxRK3BCTuHuYtNaQBngvugm7MSJGBmljuM4cPPYDW5aUCi74feGWXzVfHPYAG9G/lc8A==
X-Received: by 2002:a17:906:11d8:: with SMTP id o24mr156797eja.386.1618423949321;
        Wed, 14 Apr 2021 11:12:29 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:28 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Cesati <marcocesati@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 52/57] staging: rtl8723bs: hal: odm_NoiseMonitor: Remove unused variable 'func_start'
Date: Wed, 14 Apr 2021 19:11:24 +0100
Message-Id: <20210414181129.1628598-53-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c: In function ‘odm_InbandNoise_Monitor_NSeries’:
 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c:32:18: warning: variable ‘func_start’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marco Cesati <marcocesati@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
index e3b44481bd888..956e5a725a5d7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
+++ b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
@@ -29,9 +29,8 @@ static s16 odm_InbandNoise_Monitor_NSeries(
 	u8 max_rf_path = 0, rf_path;
 	u8 reg_c50, reg_c58, valid_done = 0;
 	struct noise_level noise_data;
-	u32 start  = 0, func_start = 0;
+	u32 start  = 0;
 
-	func_start = jiffies;
 	pDM_Odm->noise_level.noise_all = 0;
 
 	if ((pDM_Odm->RFType == ODM_1T2R) || (pDM_Odm->RFType == ODM_2T2R))
-- 
2.27.0

