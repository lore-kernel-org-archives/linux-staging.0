Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7862F52
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 13:50:25 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id y13so8875605ejp.13
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DrYs5wXMzkTkGQcWHMkczyKadrbT/RhKmAvnzhy1suA=;
        b=p9qll2ZwMcI8GJPjpMIatWPBUs6cVNjmmb1dCuBggaPMzK+Dp8znjpp8gt8jhPAwDU
         QsuIwvc36BeYrGnek07YrgPO0DUjucvUmg84q207eBb+Snhqs7heTbEbcWyH8rLgmiRb
         kGn4BKSml07t3esXr5NQpREr0yqE6muM9D5jqe/MLthJ/2rPcunJm+SyarMRt025C+3J
         T+UO6xrfANZ0pG/Oy1vSMa1m87r5taUU2YkJW1dF5FX0urXTDoMRwM/YGzKr6EvxJyxx
         s1u1/9lSi/XoD8TOz6CGvkYeHFMyLCEX2sxJqX8Bn3O7pn7wOcZdAbGgbhP2MAFWO6VU
         B/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DrYs5wXMzkTkGQcWHMkczyKadrbT/RhKmAvnzhy1suA=;
        b=YPrZGoFjgfgrnzQ/zXEgzU+NAPJUgixXQZHwL/9kXibP2grARLwJPLV074kk2XLnCQ
         JJ19Crm+Jr7NJ7VFLd8d3QABnkfE+Yoasf/Y+WXC9x4uigjPsQBTQopRA7Sdp2BhO0fC
         pVcIFlHYlCd2UQ+tmIUsHgQ/B36yxI1eCknFYvZLlkmt5oezsU0AQr4ujpnXe4bUUU9P
         p/JMy79mojYCuZu0RKe8vwj9XcF9Nnx1KhW8qEM0RCC7oRQ+IazhqXWm7b1+Ue/66bHi
         nKwW/qnrDxi8NdKeYD7pSQ98twn9xtnQxU7XsgjhcxrebHypMwp5g+kG167f3MmLLfcm
         //wQ==
X-Gm-Message-State: ACgBeo1WT068eADpqgRx/ITKXJxu1PBqq5krurLGNcLxNYa2r9QwyJFK
	82ZZ2zKlCAakJhqCVtzqX4Y=
X-Google-Smtp-Source: AA6agR5ToE5/sY/jfDvLQ8ZLVWmLfN/LmtF2j8s3eMMhHPcoS6Lo+W3+W5shrbaBLLlNPCccIFsIPA==
X-Received: by 2002:a17:907:60c7:b0:731:148b:c515 with SMTP id hv7-20020a17090760c700b00731148bc515mr4994191ejc.724.1660917023984;
        Fri, 19 Aug 2022 06:50:23 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b0073087140945sm2313821ejk.123.2022.08.19.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:50:23 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 1/8] staging: rtl8723bs: remove function rtw_odm_dbg_comp_msg
Date: Fri, 19 Aug 2022 15:49:35 +0200
Message-Id: <7ff2d658863db4fd5eecc1a53f682510c2765c3f.1660916523.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660916523.git.namcaov@gmail.com>
References: <cover.1660916523.git.namcaov@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_odm.c    | 16 ----------------
 drivers/staging/rtl8723bs/include/rtw_odm.h |  1 -
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_odm.c b/drivers/staging/rtl8723bs/core/rtw_odm.c
index f6b73a2a0270..abb111752169 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -90,22 +90,6 @@ static const char * const odm_dbg_level_str[] = {
 
 #define RTW_ODM_DBG_LEVEL_NUM 6
 
-void rtw_odm_dbg_comp_msg(struct adapter *adapter)
-{
-	u64 dbg_comp;
-	int i;
-
-	rtw_hal_get_def_var(adapter, HW_DEF_ODM_DBG_FLAG, &dbg_comp);
-	netdev_dbg(adapter->pnetdev, "odm.DebugComponents = 0x%016llx\n",
-		   dbg_comp);
-	for (i = 0; i < RTW_ODM_COMP_MAX; i++) {
-		if (odm_comp_str[i])
-			netdev_dbg(adapter->pnetdev, "%cBIT%-2d %s\n",
-				   (BIT0 << i) & dbg_comp ? '+' : ' ', i,
-				   odm_comp_str[i]);
-	}
-}
-
 inline void rtw_odm_dbg_comp_set(struct adapter *adapter, u64 comps)
 {
 	rtw_hal_set_def_var(adapter, HW_DEF_ODM_DBG_FLAG, &comps);
diff --git a/drivers/staging/rtl8723bs/include/rtw_odm.h b/drivers/staging/rtl8723bs/include/rtw_odm.h
index 94fc68a5c424..27e8240284b4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_odm.h
+++ b/drivers/staging/rtl8723bs/include/rtw_odm.h
@@ -13,7 +13,6 @@
 * This file provides utilities/wrappers for rtw driver to use ODM
 */
 
-void rtw_odm_dbg_comp_msg(struct adapter *adapter);
 void rtw_odm_dbg_comp_set(struct adapter *adapter, u64 comps);
 void rtw_odm_dbg_level_msg(void *sel, struct adapter *adapter);
 void rtw_odm_dbg_level_set(struct adapter *adapter, u32 level);
-- 
2.25.1

