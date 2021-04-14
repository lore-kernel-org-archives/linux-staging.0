Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088906D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 18so24856226edx.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qc8L+dcw3d24zY+sl7nk13L5CWZODm4pKqWzC24XNuA=;
        b=RsMgUT9z0UgmuLd6/gWneuaSH+Wz/H1T8WVju8abvzHVPMWI3GmgdyBg8QdGdZjuIv
         z3YoVjwQ6wODbJ5VYXsTgTq+uBrpOiwRFAdQKtpk26C7k3h7foR+2uOAoFGeO8EaFhj6
         M4ST8cvuVDSyLpCGSRIqE7CKfRJTUFAQhFCVOWYJoAdVsCEAegxj5IxiAWrV6yPY7Qf2
         ayGdBgUrCqajeFjbx4+PhFN0sO7T2giM+/fz/7m/TfAR58NVbWkRuxOAE3a1ct5yaPGV
         7yNv2MwI9CTjshNXfar2RaphsllJYOh8aaDuts9iWX83FjCTfpuMwjzTgVWq4tzgrPWL
         g+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qc8L+dcw3d24zY+sl7nk13L5CWZODm4pKqWzC24XNuA=;
        b=ADk8ZqNRMZkykGOeG0tXo5IBkk/QUMeMqC2+0pbVyOmIGDQVgZJehVQ7lZmCPlAksG
         q0BrR2NL2b7ew/qndEbkwdzx7IJLSgEPki7R/i9CEehYBoTCdviXmGY9AbxULIhaOgS+
         0a+KPaSmwhuTZfYCdBhe/5y4Ql27xq+mN1gwXN4i/1CUlW9XmXT1rPnsOP9DQbKUOzMJ
         vjd/1vHM3/ik6wdUsXrRj4JCbfJQaD3vXxqUI8fuJorZGfuB6dXfen3MoQtz5Q5GyuJA
         u4I2d6rm1WcVPL8vNqdgNZ1giBmkP70lGT5Zbk9HXG0eXopsTiYwXVczYCwXnMVIy9kJ
         6Buw==
X-Gm-Message-State: AOAM531EMKvUf7l6IZSxlhVxmRs33B4h1lh7Ca6OKuZejoCZrsuJBps6
	mxIZYwP+9LTY3ixCRlTt7tRosQ==
X-Google-Smtp-Source: ABdhPJym0XykJ7uehzEeDKck0S1U4BFMDECGcI32y18+IAFrQ1uRgChUm0Ua5MADkZ09X2gDGKfcMw==
X-Received: by 2002:a05:6402:150e:: with SMTP id f14mr178010edw.63.1618423951574;
        Wed, 14 Apr 2021 11:12:31 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:30 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Cesati <marcocesati@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Stanley@BB.SD3,
	linux-staging@lists.linux.dev
Subject: [PATCH 54/57] staging: rtl8723bs: hal: rtl8723b_hal_init: Mark a bunch of debug variables as __maybe_unused
Date: Wed, 14 Apr 2021 19:11:26 +0100
Message-Id: <20210414181129.1628598-55-lee.jones@linaro.org>
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

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c: In function ‘SetHwReg8723B’:
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3507:32: warning: variable ‘ioted’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3507:20: warning: variable ‘masked’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3507:7: warning: variable ‘input_b’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c: In function ‘GetHalDefVar8723B’:
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4072:46: warning: variable ‘lowest_rate’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4072:34: warning: variable ‘hight_rate’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4072:21: warning: variable ‘curr_tx_sgi’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4072:7: warning: variable ‘curr_tx_rate’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4071:20: warning: variable ‘rate_mask2’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:4071:8: warning: variable ‘rate_mask1’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marco Cesati <marcocesati@gmail.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Stanley@BB.SD3
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 4773f0dcd9819..ebed2a912dcdd 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3348,7 +3348,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_BASIC_RATE:
 	{
 		struct mlme_ext_info *mlmext_info = &padapter->mlmeextpriv.mlmext_info;
-		u16 input_b = 0, masked = 0, ioted = 0, BrateCfg = 0;
+		u16 __maybe_unused input_b = 0, __maybe_unused masked = 0;
+		u16 __maybe_unused ioted = 0, BrateCfg = 0;
 		u16 rrsr_2g_force_mask = (RRSR_11M|RRSR_5_5M|RRSR_1M);
 		u16 rrsr_2g_allow_mask = (RRSR_24M|RRSR_12M|RRSR_6M|RRSR_CCK_RATES);
 
@@ -3894,8 +3895,9 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 			u8 mac_id = *(u8 *)pval;
 			u32 cmd;
 			u32 ra_info1, ra_info2;
-			u32 rate_mask1, rate_mask2;
-			u8 curr_tx_rate, curr_tx_sgi, hight_rate, lowest_rate;
+			u32 __maybe_unused rate_mask1, __maybe_unused rate_mask2;
+			u8 __maybe_unused curr_tx_rate, __maybe_unused curr_tx_sgi;
+			u8 __maybe_unused hight_rate, __maybe_unused lowest_rate;
 
 			cmd = 0x40000100 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
-- 
2.27.0

