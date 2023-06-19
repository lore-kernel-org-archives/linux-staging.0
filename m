Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12CB13AF9
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 18:03:57 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-977e0fbd742so527326966b.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687197836; x=1689789836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3jx2b9Mk6wTwyAJZvyHLpveP2xgctvjKCyGVRIC4vU=;
        b=sB25lAs9M9T5ef+SSdN+RFXG3CFcWIZZFsFJzWjnOhiNWn185mvbqvNfaY2O/P1hd8
         lDlqHEwGOga+ykrUJD7BeLs46uudS3TXlaJ5fKVgWN7IstFmQlY8ggFEPoAEbkzApcEP
         UkHlegN2faNzCaN76HOVFIh1JtMiuSO/q1P4v1+jg/uRUUfZ/Sy7mvA4AMR788gPyLOG
         P4Rwk5YOtl9y6TRU0Ib9G498Hqkm91nbY3hUIPpIN/T4RxNoRn0ah3ZZw1snX3BRYo05
         lKWZpdcQbJtgvGnbBrupwWNQJmiCRX96y6RnqwjQ73khWrYnwG6+kzKHmYjl2aR9dwuX
         RhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687197836; x=1689789836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3jx2b9Mk6wTwyAJZvyHLpveP2xgctvjKCyGVRIC4vU=;
        b=jADq1HcCaQQltNipf1C5ZSrmdESx+lny+1vPoux4A1S9lg0MNkWL63fakcAqyU+RFE
         6lNNe1/l1DiQAaS59l0a/CyFkToa5bA9yCRfaVhV7YtTSSYlHsG8ErFQtShi5aC7PJDL
         cJ9t9yfsRAe+MoV/GdSgfaj3Zzytn21+1MKIitGP2zdAcnlC/ZgXpedDx+52ZTLn350H
         qS6Ro7B0Dn7cjtstdvp9lvv+MYjCYGKNL0hWypUr1koTO5UMTFg+19UVyr4PKjogr7a6
         n01M5lVlgFywoHkM1aLR6mQddvwtnfazGBB1tQwfjmmF/Alj/RmpNx1v4Nc/UcDsedHu
         iZcQ==
X-Gm-Message-State: AC+VfDwQgkcU6lvm8GhSUKa6/Acl8uLLRm15c1+PJ/BkD3lIJotT/3zM
	lJsUTjsAvxAqEA7HgbLa3lk=
X-Google-Smtp-Source: ACHHUZ4kDUuvTG8QrUb8lvlWMeevD5EvadoImRGj69UFl7+uh2sxzqE9PJ4vU4H9MA37Nm9RTrlAfw==
X-Received: by 2002:a17:907:2da6:b0:988:f93:32e8 with SMTP id gt38-20020a1709072da600b009880f9332e8mr6314843ejc.26.1687197835771;
        Mon, 19 Jun 2023 11:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:dcda:2154:7873:34])
        by smtp.gmail.com with ESMTPSA id kk10-20020a170907766a00b00988a6421831sm20913ejc.93.2023.06.19.11.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Jun 2023 11:03:55 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
X-Google-Original-From: Franziska Naepelt <franziska.naepelt@gmail.com>
To: franziska.naepelt@googlemail.com
Cc: eperi1024@gmail.com,
	franziska.naepelt@gmail.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	johannes.berg@intel.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	quic_vjakkam@quicinc.com,
	tegongkang@gmail.com
Subject: [PATCH 1/5] staging: rtl8723bs: Fix indentation issues
Date: Mon, 19 Jun 2023 20:03:51 +0200
Message-Id: <20230619180351.18925-1-franziska.naepelt@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230619175703.18826-1-franziska.naepelt@gmail.com>
References: <20230619175703.18826-1-franziska.naepelt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch indentation issues:
- WARNING: suspect code indent for conditional statements (32, 48)
- WARNING: suspect code indent for conditional statements (24, 24)
- ERROR: code indent should use tabs where possible

Signed-off-by: Franziska Naepelt <franziska.naepelt@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 84a9f4dd8f95..1afd1a93bcee 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -581,7 +581,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 				if (param->u.crypt.key_len == 13)
-						psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 
 			} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 				psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
@@ -1305,7 +1305,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	} else if (request->n_channels <= 4) {
 		for (j = request->n_channels - 1; j >= 0; j--)
 			for (i = 0; i < survey_times; i++)
-			memcpy(&ch[j*survey_times+i], &ch[j], sizeof(struct rtw_ieee80211_channel));
+				memcpy(&ch[j*survey_times+i], &ch[j], sizeof(struct rtw_ieee80211_channel));
 		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, ch, survey_times * request->n_channels);
 	} else {
 		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, NULL, 0);
@@ -2810,7 +2810,7 @@ int rtw_wdev_alloc(struct adapter *padapter, struct device *dev)
 	wdev->netdev = pnetdev;
 
 	wdev->iftype = NL80211_IFTYPE_STATION; /*  will be init in rtw_hal_init() */
-	                                       /*  Must sync with _rtw_init_mlme_priv() */
+					   /*  Must sync with _rtw_init_mlme_priv() */
 					   /*  pmlmepriv->fw_state = WIFI_STATION_STATE */
 	padapter->rtw_wdev = wdev;
 	pnetdev->ieee80211_ptr = wdev;
-- 
2.39.2 (Apple Git-143)

