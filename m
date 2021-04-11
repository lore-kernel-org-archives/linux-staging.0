Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58370
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 12:57:50 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id l4so15729540ejc.10
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRMti9nujvKS8H3X8tITiw1ThPL4vQHA+hUAaNa2c7s=;
        b=TATloitH6Bay+1BTft/k+MhmpWkk8o77IH1l9FwWkEKpw5U9Wd1FnlNc2eDYkaXslp
         FgydzAFqWWNIMNquxm44Ndn+1KAZMpGjiQ3g/TBo5jZFFh1d9JdU8UrXvsn7kZNM5+A+
         ndD3az7bvsdHUDF1xiQaAcZvC4zO0xjFKpOQKdH9JdSZxLqhQ6bo2Oae7mrbDqT+yLet
         ToUnxzfcMkEAl/tXywu6deOWn/Eupaf9kdXhZbtB3XUepxzywSUQTTQufvuzG3TZv9Hl
         FFgLqUWF2+GUxKGpchaDDq81HX6o5UMtbY09gqXPH3+n12zjkpOMrHwRh71Uoxl6sE1k
         ogZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRMti9nujvKS8H3X8tITiw1ThPL4vQHA+hUAaNa2c7s=;
        b=OljYe6lyhphj8ZQRPddFadvizSPd74kdqKguFx9v8WUtgIor2ta+RSjnOsJgpb6HV7
         pQJj6K40DuuYeplU7SVL85PkUOsDnyBgNuAIcCzjYWR3AZNIWKAlEB66Iic/hBr7TCkM
         w0PUaqWwruGQl7JKEEL0VnczKJhVc7b/wHMBl22v13aeTIKsKtETKQbNu01ia8NqCbv/
         OATkCK+QOx/nxwUhifNYDCS6WhNRI8BZjzlmCwVneVDCt0uHF1Y8gLJaRCvkqSAd9l7D
         j88G29E8E94inOdqSYA2DDOIb7nDmz/CXdF1qf94Fu7u9ehhwRru2qbYfzBvuWQZIzAU
         FKvQ==
X-Gm-Message-State: AOAM530oQsQo8xdOsvRgs9wrWHRsmQadRFNk+ngPnixVXMvAJa5xLDu0
	Zf/tzCI6QfK/bAF6jyOQw2M=
X-Google-Smtp-Source: ABdhPJzQGw6N1wq2MTVUyHdymB4moAe+PKVHgyjw+2glTJMGB8xihypkzLJbxckCSwwh466iIHLE2A==
X-Received: by 2002:a17:906:8303:: with SMTP id j3mr4045920ejx.85.1618145869024;
        Sun, 11 Apr 2021 05:57:49 -0700 (PDT)
Received: from agape ([5.171.72.218])
        by smtp.gmail.com with ESMTPSA id r19sm4031768ejr.55.2021.04.11.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 05:57:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove unused variable ret in hal/sdio_halinit.c
Date: Sun, 11 Apr 2021 14:57:35 +0200
Message-Id: <fbba90b0c8fb9f65b0dc7bc0b02560724a5502ab.1618145345.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618145345.git.fabioaiuto83@gmail.com>
References: <cover.1618145345.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following compiler warning issue:

   drivers/staging/rtl8723bs/hal/sdio_halinit.c:
 In function 'CardDisableRTL8723BSdio':
>> drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5:
warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     881 |  u8 ret = _FAIL;
         |     ^~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 2098384efe92..936181a73d73 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -878,10 +878,9 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 {
 	u8 u1bTmp;
 	u8 bMacPwrCtrlOn;
-	u8 ret = _FAIL;
 
 	/*  Run LPS WL RFOFF flow */
-	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
 	/* 	==== Reset digital sequence   ====== */
 
@@ -909,9 +908,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/* 	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
-	ret = false;
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
-	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
 }
 
 static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
-- 
2.20.1

