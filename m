Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29D6D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:53 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l4so32777252ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WsTnlZ0JLtuPnbO60j2rczl2/gLE7x7tVgm20+EM1Dc=;
        b=v7SNGemTBhWQrAoIapsNidlHLFQnZx+bRnGVs+M17pVLVxst/gNZb3SmwiskAjL8lg
         ygF1ZxYy+vpP/GQgmtBbIe/A8oz4faap+35tlxfg6yhC2EsaoLFn2bw3qc2sKJs5uO4W
         HNT3QE++OG9CbZCcW9Wo4ljeZmkpJobpEhaq1Cz7flYijDpgGUl+nYEiuX8zFX0thYOt
         iOt/aKuDWC/6WtGfEzIsI6KbEtXv2sXF0oB5s4lKuZcBAr+MeH9C9dpWGvCVhyo/x3LV
         iECHTLWDZakB/vTl7nfioZOhPE98eoXt1dSaXLaYSmliBFmEt5nSm0OXycJB74HD/drA
         wVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WsTnlZ0JLtuPnbO60j2rczl2/gLE7x7tVgm20+EM1Dc=;
        b=frsyPXYkRHE9Sv7mSAwyXVn5vYpuBQ0zbaAupM9lSMQnvsbsYTB7DJHdvM3hNngdOj
         m27xKegwhQlQAkxf9WO4bM613cWZAmgtHrFcarEEGRlH93qvDctqR58YBwYmgCWHJWQS
         7dNsH5YZ+arMqnxa/j6EjqaaiiXvRxiWbIQf2l8nGPgSRXUZq6nKqgSo7AoDrF1dtfmk
         ZWvglsDRIgi3/IpL9wLmysPQl7EHlnMvPUnC2YxQe6Nps3ABSMylZ0GJ3Pbn3DMeJOpX
         QlwHes13DXvLirNMNpgnXKWwg6Z/r/9SQuzfIdd0iYRGXqdU/bofP51N/4YeYhnZScCi
         pPeA==
X-Gm-Message-State: AOAM531h0MyOi/1dKNzUVdwaZHOFDcLbFPy+lwS7vx12xchAJVT2j1cW
	KNVc5MfRyKJfv/3cXzo/58iANg==
X-Google-Smtp-Source: ABdhPJyQJ/Sxa/NX2STNIxTSUi4KKDzaHuSnMl08NYq4KrdAtMi3M+xDBFVTkst+RtqDwC4ChkPzzA==
X-Received: by 2002:a17:906:430f:: with SMTP id j15mr115016ejm.543.1618423912323;
        Wed, 14 Apr 2021 11:11:52 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/57] staging: rtl8723bs: core: rtw_sta_mgt: Return error value directly
Date: Wed, 14 Apr 2021 19:10:49 +0100
Message-Id: <20210414181129.1628598-18-lee.jones@linaro.org>
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

 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c: In function ‘rtw_init_bcmc_stainfo’:
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c:512:6: warning: variable ‘res’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ross Schmidt <ross.schm.dev@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 7b631a6b258a1..233febc145983 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -497,7 +497,6 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 {
 	struct sta_info *psta;
-	u32 res = _SUCCESS;
 	NDIS_802_11_MAC_ADDRESS	bcast_addr = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
@@ -505,15 +504,12 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 
 	psta = rtw_alloc_stainfo(pstapriv, bcast_addr);
 
-	if (!psta) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!psta)
+		return _FAIL;
 
 	/*  default broadcast & multicast use macid 1 */
 	psta->mac_id = 1;
 
-exit:
 	return _SUCCESS;
 }
 
-- 
2.27.0

