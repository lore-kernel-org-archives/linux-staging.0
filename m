Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCC3FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b10so7352323wru.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qcHiBJ7ecTcvksiC5irFRRiRrj2+RpPFI8rIqAmGbqo=;
        b=jyaf5RHxdUR670RBw5qiBs1Vr6QXHmb906eQ7oURpWLhZg6UN0YF3PJzACTDU82K7p
         /rrJ7qv0J7FB9mFwX3n1LOSNPLE//IOneDsqJBoD2tNvIwC7JArqtknaRfS9d8DBbQQ5
         adxZGgntKA3SxuFOBjyVqdrS+LdJlgfJZUjN3LHxdLne8sHxM/LVQ+CO22kR9sKx1d1s
         EMGhXEkHyR9kb69rtxvI5mf25u1gueWrnzdCoDb4bsjUszlB7zmsPIVpiJ5LYGUxW9qN
         lRww7tnucuoFwC2upRz45ob/XNTvmFH1b4WLfN0IQ3Ty19SkfrRsK3xeEBaRqNnk/LUC
         sgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qcHiBJ7ecTcvksiC5irFRRiRrj2+RpPFI8rIqAmGbqo=;
        b=rdFZbZM4gCbWo6dJBSxZNfncYaQt+NdWd8Q0YuwNDVzbFJAsTPNG3Haqm3+qfdba/J
         AjSJFipi/gdzfxLgoz26NquGFPf03FCPj/VesLvH2RIYm5ftMksxtnfMelj8QDQcRh6Q
         8bzf1L1chmWHmCn0pUD3QdowOJWu/YNOvWWsOSc0ygsqLSx9nbA1Hdf4H15fSu3gy3Ko
         2uQGa8UYNXO+SpBywDBlPT8Y1qAyDldzKm3YSNeIfDNSVVhtT1JxBCrPWYbMt3oBGjqI
         4CWnKoAMiFpAhEl3N3CD4oVruILcpnRdI2gdE94Sqfrt2Dimqv/2bmq7ob4vMgot2Wbv
         4kbg==
X-Gm-Message-State: AOAM530cFQKvBGPRmA8uqpTi55BT1mxFdwZQ0lf8VI5yyvHQ8kc2CuXk
	AQ+f/mWovw4V+0DRaHZqsiG88g==
X-Google-Smtp-Source: ABdhPJyUawFgSQDsqBSJrACQOCVtIXqCqD70UAB3coaDNpQGveKG0QzDpNpY0fplX6mkKm2oGwPN/A==
X-Received: by 2002:a05:6000:1010:: with SMTP id a16mr10153905wrx.70.1630890073417;
        Sun, 05 Sep 2021 18:01:13 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 05/14] staging: r8188eu: remove rtw_hal_disable_interrupt function
Date: Mon,  6 Sep 2021 02:00:57 +0100
Message-Id: <20210906010106.898-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_disable_interrupt from hal/hal_intf.c, and remove its
declaration from include/hal_intf.h as well. This is just a wrapper
function that calls the function pointer disable_interrupt in struct
hal_ops if it is set, which it never is. In addition, this wrapper
function is unused anyway.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/hal_intf.c     | 8 --------
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 3eb05863856d..79cf6df0f598 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -149,14 +149,6 @@ void rtw_hal_get_odm_var(struct adapter *adapt,
 						      val1, set);
 }
 
-void rtw_hal_disable_interrupt(struct adapter *adapt)
-{
-	if (adapt->HalFunc.disable_interrupt)
-		adapt->HalFunc.disable_interrupt(adapt);
-	else
-		DBG_88E("%s: HalFunc.disable_interrupt is NULL!\n", __func__);
-}
-
 u32 rtw_hal_inirp_init(struct adapter *adapt)
 {
 	u32 rst = _FAIL;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f4cb3727030b..e45a45dc1ec1 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -297,8 +297,6 @@ void rtw_hal_get_odm_var(struct adapter *padapter,
 			 enum hal_odm_variable eVariable,
 			 void *pValue1, bool bSet);
 
-void rtw_hal_disable_interrupt(struct adapter *padapter);
-
 u32	rtw_hal_inirp_init(struct adapter *padapter);
 u32	rtw_hal_inirp_deinit(struct adapter *padapter);
 
-- 
2.31.1

