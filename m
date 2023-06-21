Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFD52595
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 18:50:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f90a1aa204so57118295e9.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687373412; x=1689965412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3jx2b9Mk6wTwyAJZvyHLpveP2xgctvjKCyGVRIC4vU=;
        b=Ved+5VTcRIF6F5DTcxJG++sULjUtB19mhxF9Ubo1HTbj3rR1uq1RmeGC5jjv4gKFBn
         Y4zgCc2hgv7ApEqFEMHpodirSQ1QL7kqDukbnW53opZYBRm7HYt2apoxVOJxo2wyNPrp
         yXZf+4FjZouvxQ166fOEHpVxxzHJxn83ktqUXjDa0rl/JTBJw6QRsWj/OU2PPwKp5RsN
         3CpI655lSn3Gcw4KEUcXOSvupkXwUOcPpbcFmg+gnsCNCPPqyFPNqucN0VPZi1tBu6pz
         h9u9TvyyIkZ1xW0sfpx5kbBUiGbSR7E9/GldBhDinF2uLDYxqzST+lvsR08z81KhoTNa
         7ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687373412; x=1689965412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3jx2b9Mk6wTwyAJZvyHLpveP2xgctvjKCyGVRIC4vU=;
        b=LKm0hbezjLPaLFIf9HMXTc22Ig6V/hlGSiX2YmUD+6Z/vshtDYFLs0gOtS0KmSHvCb
         kSTyjqHULzakUqk3hCsla+5dmN0SvbHa91ukmIhLue5o/4Rw1pAemfWuMs5EUhSYG3bD
         CA2j6f8mv6JgKqxflTzdiwPBaCXcDsobcT9P0HgLx8gHn5J7AsCOgMeywaap+CGMU7G4
         JF3wP++SoZl8C+P5K6puxMCE3kqD46xHN1X1Jz8Jl8RJYsr0WPG5tekb3Yqup4WCAar1
         iDsS9RMgrWRl2Ag8tS/0XyS0xkekMYlwmG1ximhT7cUPrWxwKKz2yDgT90ZjwJ9qrinD
         6kSQ==
X-Gm-Message-State: AC+VfDzYYcy4rSo2LtINmCBn0yH2721UkC5J/zDJqMncSAR62joUq5bU
	8bqnUMMZklK/AXfK28DLIiY=
X-Google-Smtp-Source: ACHHUZ4EqJ1KTzEJeOImHHPsqkN0R3NplriF3y1TlxR3i0exheMHaEulgPU16ef3une+6wGwK27+bQ==
X-Received: by 2002:a7b:cbcc:0:b0:3f8:f9df:8da1 with SMTP id n12-20020a7bcbcc000000b003f8f9df8da1mr15148791wmi.32.1687373411993;
        Wed, 21 Jun 2023 11:50:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:5d4c:afae:7fa:7038])
        by smtp.gmail.com with ESMTPSA id v11-20020a7bcb4b000000b003f8d6647661sm16740107wmj.15.2023.06.21.11.50.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Jun 2023 11:50:11 -0700 (PDT)
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
Subject: [PATCH v2 1/5] staging: rtl8723bs: Fix indentation issues
Date: Wed, 21 Jun 2023 20:50:01 +0200
Message-Id: <20230621185001.25144-1-franziska.naepelt@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230621184635.25064-1-franziska.naepelt@gmail.com>
References: <20230621184635.25064-1-franziska.naepelt@gmail.com>
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

