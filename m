Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C16F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id r12so29091965ejr.5
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ELwmxXeBIsDchhOORDJRl9CMop2vhKZZT8xFyRFrBms=;
        b=WUZl67xYh2YUhRgwuoHgfgl5nZ/gKDg1KPJjzwjiO1Z46+CcBhg7wuQZ7KK8D73CuD
         XDqvdwSqDTjSZo4yeTpxlmcnfq5tDeO/+NjvOlcx4bzXRZHw3kJgFYvspJPy6WCDIdEi
         beFjnSO9xtcLD7zMkcoJqKSLZ2wCtf9TvXhqPsEllvzQzLU8lEiUUpgRlfcjmx7DmGft
         aCNL44mjR0DFJvbIz5i+tyh0OB+s+MJnEobpynfJA2AdNY3uQZGyzKYxV0+4T0i/liFP
         tAt50wmrl63j61VoyTA1nNL5NS7+77zEpn+J7tTR+6StSNiXYfpo2DPhZo/5c5tEvlb+
         mQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ELwmxXeBIsDchhOORDJRl9CMop2vhKZZT8xFyRFrBms=;
        b=laLqUd7LfnbPwL8MUmRkX6gB+UDZo7OqD6Vyl9NzLH8ndRuOiAc+28oUv+UycwkwQU
         iQONIIKHqKiM3k2LQDJNhjqPKEWIboG8c4UKtz4d2sVNpmNmhjHUOqsgayUaSqA4praB
         +wqN7bWfOVt1gfApaqlYLxmBO6a2WT1csEUS4MuKsKWZqwnLXa6RtNh+3Po8Y4R5enw9
         Eg0WLnEd1Nx9AF5WWaQQTqN2ALliGUlJLH1uxdv3m725oKi9hAFofBS53sdo+FQxWkXk
         VXY2MwdZrJyTeUdqvHBLnzcH91BzxvX5k/DgaONyyUZ+HwLVI+JsYUIUcf+mSEAExT0z
         Dzgg==
X-Gm-Message-State: AOAM530QDGjapgl4Auh2utmjSorMMWC4BsgiPHR09n5mFUxbK49tmtod
	ZKDYv6h5UtJbBq3+7tdNELVO8JeE3yIEyg==
X-Google-Smtp-Source: ABdhPJzrViTY5hqbNwoP531uofoZoKT6yO7sBxY4tEqg2tn0JyR+CW3IiZ5RL1HmzJfobhcdzUOTvw==
X-Received: by 2002:a17:906:b4c:: with SMTP id v12mr2579929ejg.330.1617183675868;
        Wed, 31 Mar 2021 02:41:15 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id pg2sm818663ejb.49.2021.03.31.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 34/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in os_dep/ioctl_cfg80211.c
Date: Wed, 31 Mar 2021 11:40:02 +0200
Message-Id: <6d3a356fdfd988e575ad03e8469b171471a6a366.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 260d9fa739ef..6df2f1e12bd3 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -875,7 +875,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 	if (strcmp(param->u.crypt.alg, "WEP") == 0)
 	{
-		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("wpa_set_encryption, crypt.alg = WEP\n"));
+		pr_err("%s wpa_set_encryption, crypt.alg = WEP\n", DRIVER_PREFIX);
 		DBG_8192C("wpa_set_encryption, crypt.alg = WEP\n");
 
 		wep_key_idx = param->u.crypt.idx;
@@ -1797,7 +1797,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	if (ielen < RSN_HEADER_LEN) {
-		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("Ie len too short %ld\n", ielen));
+		pr_err("%s Ie len too short %ld\n", DRIVER_PREFIX, ielen);
 		ret  = -1;
 		goto exit;
 	}
@@ -1901,9 +1901,13 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
 
-	RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_info_,
-		("rtw_set_wpa_ie: pairwise_cipher = 0x%08x padapter->securitypriv.ndisencryptstatus =%d padapter->securitypriv.ndisauthtype =%d\n",
-		pairwise_cipher, padapter->securitypriv.ndisencryptstatus, padapter->securitypriv.ndisauthtype));
+	pr_info("%s rtw_set_wpa_ie: pairwise_cipher = 0x%08x "
+		"padapter->securitypriv.ndisencryptstatus =%d "
+		"padapter->securitypriv.ndisauthtype =%d\n",
+		DRIVER_PREFIX,
+		pairwise_cipher,
+		padapter->securitypriv.ndisencryptstatus,
+		padapter->securitypriv.ndisauthtype);
 
 exit:
 	kfree(buf);
-- 
2.20.1

