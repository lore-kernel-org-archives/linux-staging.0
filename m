Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AA23B1
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 08:35:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g3so17440059eda.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 00:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678437309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFs/e/K/gilrBIUS/3vF7+owOyPjJYDXNevbCxgiE/4=;
        b=RBkobFKJ41nf/fAPlQny3VRJNwdx8fMPH4lp5Z454gp+GwXUmlPcJuYgMoYmBq2a5N
         U37LQ2hsJ8LRI/fJFR/ctcpJIIeIJg6LzQTB7lMCzM/wUDtN1E/6TmFG+4FlPJ16w+Ir
         Z+KTbWNcggIOfMBWwUKuNgMC6ZInlEyST4ZsCMeaU68ZTSlVg97/Wzz/jJf+tkDknIBb
         +wVAWiEQUyP+spNrrcXCmczq06tzSyhWG0wKAnNtmGFZno/hgtDP4DYnTAvdtCyZoKzc
         qrEZRS/CxTmg0EAre8rcOxwkojquYa1OQvyxyy2skXFPoS1lZGeubw2/kYqyBlpOy6tA
         8zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFs/e/K/gilrBIUS/3vF7+owOyPjJYDXNevbCxgiE/4=;
        b=SJaF/8w2oaG1r4imFq8FcCmUr78xn5CxdJIvoDSHQl0EabucAefFiLZaP/0f0XiGO6
         QWDhQh2PxxjcFRx9e64qNZRjkqBGVIMmYXPs3cmf47hCgDImWgDLFT5z2BfD6hGXEqjp
         fwjrMeJs/TUAtFnbV9YqA3M7uVAeHWEfW1Y4LlLgFcF4tdycU1NlOuSPyL1y9yDopdF2
         YOCkYKGKHmPOtIjWtdkXNRe9I5lkSxVqTMu9PzQaUZj/vJcRjqyqIeSiTkdp+7sTLSlU
         XgzZO5ulEf6gI53pOuiNfp/+51Ke7NHtqNW4b8Js7HkrmY0nBTllmG7nXpYgO1q3suO4
         Rx4w==
X-Gm-Message-State: AO0yUKVb/85iy15DCWIMCU/4rBYww1b9GARFCdiikPBSRb7Eag8mKRsd
	sSXNT7TxKEsK33oUQ3US8/K/hYuECkQ=
X-Google-Smtp-Source: AK7set+1UXSQl+SRqmOeFWItIcmJaep95cXb1ps44FVISlcj/OWnPtRPQ4M8UE5ZmeungxVUnuDKmQ==
X-Received: by 2002:a17:906:fcb2:b0:8aa:c105:f0bf with SMTP id qw18-20020a170906fcb200b008aac105f0bfmr28935468ejb.17.1678437308902;
        Fri, 10 Mar 2023 00:35:08 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090619ca00b008ce5b426d77sm697888ejd.13.2023.03.10.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:35:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: linked_info_dump() is not used
Date: Fri, 10 Mar 2023 09:34:48 +0100
Message-Id: <20230310083449.23775-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310083449.23775-1-straube.linux@gmail.com>
References: <20230310083449.23775-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function linked_info_dump() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 21 ---------------------
 drivers/staging/rtl8723bs/include/hal_com.h |  1 -
 2 files changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index da68557c5b20..792636fe3270 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -897,27 +897,6 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 	}
 }
 
-void linked_info_dump(struct adapter *padapter, u8 benable)
-{
-	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
-
-	if (padapter->bLinkInfoDump == benable)
-		return;
-
-	if (benable) {
-		pwrctrlpriv->org_power_mgnt = pwrctrlpriv->power_mgnt;/* keep org value */
-		rtw_pm_set_lps(padapter, PS_MODE_ACTIVE);
-
-		pwrctrlpriv->ips_org_mode = pwrctrlpriv->ips_mode;/* keep org value */
-		rtw_pm_set_ips(padapter, IPS_NONE);
-	} else {
-		rtw_pm_set_ips(padapter, pwrctrlpriv->ips_org_mode);
-
-		rtw_pm_set_lps(padapter, pwrctrlpriv->ips_org_mode);
-	}
-	padapter->bLinkInfoDump = benable;
-}
-
 #ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
 void rtw_get_raw_rssi_info(void *sel, struct adapter *padapter)
 {
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 839d93d8a1df..c1aa7f0a35f9 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -149,7 +149,6 @@ bool eqNByte(u8 *str1, u8 *str2, u32 num);
 
 bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
-void linked_info_dump(struct adapter *padapter, u8 benable);
 #ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
 void rtw_get_raw_rssi_info(void *sel, struct adapter *padapter);
 void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe);
-- 
2.39.2

