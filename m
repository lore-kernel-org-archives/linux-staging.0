Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186B17F9
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:54:13 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id gk3so7582891ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xYBRhSDok53eb0OvQN4XDJTh9o2Zw4fM6AIaxBqnM/k=;
        b=ltdvzkJRO9g2IMP5iAVwgdjpl0KDRL0IG3LSpk4IBLDzc/KPGdw9U+rjTiGUI5Uemz
         0Koyktpo0sYtmEWn8siCBEcp9dgM0ON/9MZeX7t0dqGJiTXtjeHmzP6CTMO7d6uGPgas
         AX+Ek87nsl2r8G3RcnUdpz6uLqk/oOwxhpw4G36ksJ/7+EGErTfgmhSMJL3XvqtwNj8E
         eBH/sScrEuYCYHA/5FeF9gJ9/YpIS3GII/tI6hr0CvTfIa6E15f3nDx53QjcjjrsZ6Pd
         Vl97bRM0mK8VoYceRVo/gEzGb785J6wFnu7qGgIlmxhCFQrpfZcvS5IBXZ1yC8Ocp960
         s0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xYBRhSDok53eb0OvQN4XDJTh9o2Zw4fM6AIaxBqnM/k=;
        b=WxiuKFb/uKWTkjJLxg2pHL0gthvZRBSSI/Pdd1ZHbxn6kz4J1ITQJBXeywn42zCIM8
         yW2ad0Gj5Y/Aj8PBszx0FALWiXusxwFxt4IDr3Y1oZMWAUXMhMABCIvJYiD3W4nKqWov
         cgF0PVgOM+x4kn/3Xnu1QAjoa7RbiaaM7LwEfTyK5wFlGA2Phpb8GjUBs8SvuVb8CurG
         u6d91PxNNVOlEfbBNU3rD4RTMogozl+4Qb+FuxKL6+h0Ef3NGjFQKNPnSAot/AYbRSwB
         jnJlk/gkdJ9ahnH165EXH/q0WmQzVFhMY/0r9fP+2U+cHvcQNe3oaVGglx30J8FkFZCy
         QLFw==
X-Gm-Message-State: ACgBeo0y4AG3q5gBXseANp/9gOfWVkfsnx2mc9bgptfbH3bF0+RRYjMT
	Y5gCnj8pGVxgzXv5aKnsWtM=
X-Google-Smtp-Source: AA6agR5AVVX8Bhx+h0cLCh1hbXIILyI8JLqKQvYeEvO2DBkVvyckuyYRwtaLGKgumDy8vWrKgnjS4A==
X-Received: by 2002:a17:907:2bc4:b0:730:aa9c:bd86 with SMTP id gv4-20020a1709072bc400b00730aa9cbd86mr4243212ejc.341.1660899251902;
        Fri, 19 Aug 2022 01:54:11 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:54:11 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 7/7] staging: rtl8723bs: remove function rtw_odm_dbg_comp_set
Date: Fri, 19 Aug 2022 10:52:57 +0200
Message-Id: <e1927eb6151d39b53a6ce1eed1d7ad20a2d633be.1660898432.git.namcaov@gmail.com>
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
index 2cba7825c9b3..58b6299ed9d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -90,11 +90,6 @@ static const char * const odm_dbg_level_str[] = {
 
 #define RTW_ODM_DBG_LEVEL_NUM 6
 
-inline void rtw_odm_dbg_comp_set(struct adapter *adapter, u64 comps)
-{
-	rtw_hal_set_def_var(adapter, HW_DEF_ODM_DBG_FLAG, &comps);
-}
-
 void rtw_odm_dbg_level_msg(void *sel, struct adapter *adapter)
 {
 	u32 dbg_level;
diff --git a/drivers/staging/rtl8723bs/include/rtw_odm.h b/drivers/staging/rtl8723bs/include/rtw_odm.h
index be0d47413fd2..6a431c121285 100644
--- a/drivers/staging/rtl8723bs/include/rtw_odm.h
+++ b/drivers/staging/rtl8723bs/include/rtw_odm.h
@@ -13,7 +13,6 @@
 * This file provides utilities/wrappers for rtw driver to use ODM
 */
 
-void rtw_odm_dbg_comp_set(struct adapter *adapter, u64 comps);
 void rtw_odm_dbg_level_msg(void *sel, struct adapter *adapter);
 void rtw_odm_dbg_level_set(struct adapter *adapter, u32 level);
 
-- 
2.25.1

