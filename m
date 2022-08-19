Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630217EE
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:54:08 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z2so4863178edc.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hRYX9Qb8xgVcO72OHHpEJqvkK+/eKUc0GJTr4L8+CVs=;
        b=Zrdanl+ISS0t/bkFjxe38FKDpC4fChz8UY3qlFMBwI5B0xWU0HA9Z+g80uc/ASOWo/
         GuX73IWG2WYPEZrsQzUtig2dRC2SMsJ/+7Tl52u4XBuYU6cwGootc/r54lMwHoskpMlJ
         H+L+tJ8hlWcb7b5uSFoKk/e5fc6DjojWgmIYIN3CEtGArfo+GgGdU4zYJVFVY7YiRK8J
         KIGOY5nmisMSXXFNXehpYucxwg2wDOYmfUJBUdLgFPRp66NfCt+9cup5CYlM7ZoFqPgA
         U7/Y5Qc6ZTWNUUYtYGzFR8sDde4Avpz14VBVig1HK12JwufQHAn5tZEBeIF3gYtZsarP
         tjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hRYX9Qb8xgVcO72OHHpEJqvkK+/eKUc0GJTr4L8+CVs=;
        b=C8M6J3B7XxWz4cSwnRKciGpsBkQUVugnzgFTHpnOLetIvrpW1DVh4KNb+pRHmlUZ/X
         ZHBiV2ePk9SEx8Aa3afMotDP360UbdZUTllMp1p8X/nN3Se0NvTiGQS+nl0TWEIbWgaK
         nm6H86Q5McpG5Aaxh6tUoWOpjVXPfRUN8Fl3zxObiUKCCN2fzEGTZ9jdnolkIxeApVXP
         xRJI/z1gQL6B59/+Q1m8ZkwzOpYBrmwaIv9+Ypmfmsd6/xOaUW89bDWx2XvuxQyKKdv2
         MAcTLS7bDfUxU37xBmSjyX+eayfUFk1GbbWwgNclBRdVHh9MhDOqodPuMHqXDYb3ZFS3
         pevg==
X-Gm-Message-State: ACgBeo2FqstYg2JwQFgDtNU37OIn/anhQSpUCpNgX6Pt+0oTKp9+ptI6
	LblAtShwOCB79KaYlLuvbGacs/6Jz494SQ==
X-Google-Smtp-Source: AA6agR65dRgEllaP6C7s1+YKmHkYBctIUXotwAG5I79QP25D4aveUE7rgFk83QswOi57Ba/eiQXgmg==
X-Received: by 2002:aa7:db5a:0:b0:446:62:922a with SMTP id n26-20020aa7db5a000000b004460062922amr5365995edt.373.1660899246990;
        Fri, 19 Aug 2022 01:54:06 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:54:06 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 3/7] staging: rtl8723bs: remove function rtw_odm_ability_set
Date: Fri, 19 Aug 2022 10:52:53 +0200
Message-Id: <35d0f2115fa6febd72a1a7d1c740dece3d55a3df.1660898432.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660898432.git.namcaov@gmail.com>
References: <cover.1660898432.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because this function is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_odm.c    | 5 -----
 drivers/staging/rtl8723bs/include/rtw_odm.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_odm.c b/drivers/staging/rtl8723bs/core/rtw_odm.c
index abb111752169..ec8406c18b03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -129,11 +129,6 @@ void rtw_odm_ability_msg(void *sel, struct adapter *adapter)
 	}
 }
 
-inline void rtw_odm_ability_set(struct adapter *adapter, u32 ability)
-{
-	rtw_hal_set_hwreg(adapter, HW_VAR_DM_FLAG, (u8 *)&ability);
-}
-
 void rtw_odm_adaptivity_parm_msg(void *sel, struct adapter *adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(adapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_odm.h b/drivers/staging/rtl8723bs/include/rtw_odm.h
index 27e8240284b4..ea9c4de0f284 100644
--- a/drivers/staging/rtl8723bs/include/rtw_odm.h
+++ b/drivers/staging/rtl8723bs/include/rtw_odm.h
@@ -18,7 +18,6 @@ void rtw_odm_dbg_level_msg(void *sel, struct adapter *adapter);
 void rtw_odm_dbg_level_set(struct adapter *adapter, u32 level);
 
 void rtw_odm_ability_msg(void *sel, struct adapter *adapter);
-void rtw_odm_ability_set(struct adapter *adapter, u32 ability);
 
 void rtw_odm_adaptivity_parm_msg(void *sel, struct adapter *adapter);
 void rtw_odm_adaptivity_parm_set(struct adapter *adapter, s8 TH_L2H_ini, s8 TH_EDCCA_HL_diff,
-- 
2.25.1

