Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FF6D37
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:17 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w18so24901826edc.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gzsQ++5tggOH/lyoVRZjANgz+vVvSO5T9YRzCRDRV4k=;
        b=Oguy02argzP0OY63vLYHiwuzVKhU7VAGRl8tFcP/38mFmLLpDgxB+wIP2qWuc+gUBd
         LlR68ZrOfi5jdO1Mp8UjFYNC6m4r2r/+nEJo1rNzyUAfQatM3t4ENMqk7BczVEuCdpuD
         hjDSTHIJwuDJhVsCxDW/lNb47yeqoNWbkn67DexsFwftsniniVXACi6KpBNyr41rMsJ7
         eTWt5Iiv5kQtXatxJ1efGuIQdMfOOwO28k/uKFHEXS6qUwNs5I162MlSVdv6OZBTdaNs
         wwjXMUWufW22B2IaW3hNSFRnGLuiYjQZWHZx/ePgAIl0solvukh+8egZ7USLgD6ySx0Q
         0teA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gzsQ++5tggOH/lyoVRZjANgz+vVvSO5T9YRzCRDRV4k=;
        b=Wn+492rLjTfMTP69fQKbq23cn875og3NAZl1N6G3+WMnWXww7JX8K+gr/ITBRVWloX
         659izIq6/XiqLSilORfWm6oG3QL9hresmb99+mAbwg8SaYPR8t8j+TgvS/uaRVLZtAdq
         hQFdjqxd5YXIok3D3cr28nhz4ga2C9g4DcZPk80JLazlvzrmR7J2rsrPlkYFQYO7gUXx
         FjW5dr9RIdVqigEo59qchnJNGloPFYEFXsJfq49U/UpwzSy49D/Fp8kbodwKFwvmrKCj
         SsLwOiWmDADRfSwd/pCzomu+JH7kBxXbunCYLTjROgWX3vC1d6mjxb2JnWyzDve9r7rv
         YskQ==
X-Gm-Message-State: AOAM531seGbgC9DddmGfefj6nIconLrpgLhlco+JxMCvMkkygaMH5+S3
	/bqq927iFrIk4gKElz7orCdAK9h0iDY8Vw==
X-Google-Smtp-Source: ABdhPJwt4k0Jy20LqyFC525+9zQaFI+Q10g56qWYsmqDCQsXKo1JIec1cgT4PZOBV+8oJ13yM5oJBQ==
X-Received: by 2002:a05:6402:b9b:: with SMTP id cf27mr216271edb.60.1618423936105;
        Wed, 14 Apr 2021 11:12:16 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Cesati <marcocesati@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 40/57] staging: rtl8723bs: hal: odm_NoiseMonitor: Remove unused variable and dead code
Date: Wed, 14 Apr 2021 19:11:12 +0100
Message-Id: <20210414181129.1628598-41-lee.jones@linaro.org>
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
 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c:32:34: warning: variable ‘func_end’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marco Cesati <marcocesati@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
index c3de123e2a487..e3b44481bd888 100644
--- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
+++ b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
@@ -29,7 +29,7 @@ static s16 odm_InbandNoise_Monitor_NSeries(
 	u8 max_rf_path = 0, rf_path;
 	u8 reg_c50, reg_c58, valid_done = 0;
 	struct noise_level noise_data;
-	u32 start  = 0, func_start = 0, func_end = 0;
+	u32 start  = 0, func_start = 0;
 
 	func_start = jiffies;
 	pDM_Odm->noise_level.noise_all = 0;
@@ -150,12 +150,6 @@ static s16 odm_InbandNoise_Monitor_NSeries(
 	if (bPauseDIG)
 		odm_PauseDIG(pDM_Odm, ODM_RESUME_DIG, IGIValue);
 
-	func_end = jiffies_to_msecs(jiffies - func_start);
-	/* printk("%s noise_a = %d, noise_b = %d noise_all:%d (%d ms)\n", __func__, */
-	/* pDM_Odm->noise_level.noise[ODM_RF_PATH_A], */
-	/* pDM_Odm->noise_level.noise[ODM_RF_PATH_B], */
-	/* pDM_Odm->noise_level.noise_all, func_end); */
-
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_COMMON, ODM_DBG_LOUD, ("odm_DebugControlInbandNoise_Nseries() <==\n"));
 	return pDM_Odm->noise_level.noise_all;
 
-- 
2.27.0

