Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE25F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id b7so1877951ejv.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=whK0jEbKryksV4Tco/q0sErwNXSaatvT6sONXK2sG/Y=;
        b=uIL42zPP52sEEkjGOh3Moj7SXGeTKvJsp8Rd9IqsusYwHR7m+9jW6yd/8iyqKgwhFc
         tHzGsSN92z2DUJbl0G9cFbVjlJj0Ap5Zh4JRjtvGX3QMaOdrTJhHUYtdSzEEQIlkMzFL
         iMEx8RkRwruoSwf+ySLDFEgFzygBSfpnG6PNCttgzfBLq0LpfYTzY+h9h2bka0IttmdO
         Wgg0ewHMmZ93aImU54ShwU7+pswtZfOiUSYIzFt2YGAeDWo4Vum6VTvtmTgTW8pipMeH
         0GkxKsHYPA1eCtnWQEYymh0qw9pLHsV8mWFsg4u7+t9Q5AQRUwZgUwwFwsj3K7TPX5U7
         Qotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=whK0jEbKryksV4Tco/q0sErwNXSaatvT6sONXK2sG/Y=;
        b=ghBhnbOz6BwlD3WTxHS3NrtUpu1/10XRqhBwbw/mjorRI4aP5oeT8UXVptHsNhS+Yz
         FOiETK7gNCHPFAABOgvjDNvvhBgcujuOy97H4hEet4e4Bjkg+3BrkmznBeFnUHaGi8Ja
         kXfGi4pOR9USBSL5GBm2PDbHCdXpAtyLP/WDAazoHBhcZHxsXbCy5NoVN1GTno5b76eI
         IP9tO3eYC+I2ww6kDfxFuhSJSGWAFyeH7R07tH+RJ4n3ZXU1YgQrnwaPa5bbQ2HgSZ/B
         ocG/QFpDYeuEp3zdKD3lP7NfDT+OdXBB6VsN8eNBOL11+6TKPsGeRQ2mXgEJuEDg1GAN
         mE9Q==
X-Gm-Message-State: AOAM532m+rUeqoNn8lBZRrZwbx9rAqns8wOMQ/DlwmVi87jNe1kt3/B2
	b2Y02vr7MUROmsuEJ55l7+o=
X-Google-Smtp-Source: ABdhPJwFNrl1XybbUowJTbrAxBWSs23W/D1h0p1F1hffjN/meExjXri4Prsp715srmVLeR79TR+fLg==
X-Received: by 2002:a17:907:10ce:: with SMTP id rv14mr8345846ejb.56.1617268953230;
        Thu, 01 Apr 2021 02:22:33 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id n3sm2434165ejj.113.2021.04.01.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 43/49] staging: rtl8723bs: remove RT_TRACE logs in os_dep/ioctl_cfg80211.c
Date: Thu,  1 Apr 2021 11:21:13 +0200
Message-Id: <3fdf7a35a4991a634cdca30444435abd269b0f1f.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4f6398f86b75..42c0685e976e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -875,7 +875,6 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 	if (strcmp(param->u.crypt.alg, "WEP") == 0)
 	{
-		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("wpa_set_encryption, crypt.alg = WEP\n"));
 		DBG_8192C("wpa_set_encryption, crypt.alg = WEP\n");
 
 		wep_key_idx = param->u.crypt.idx;
@@ -1797,7 +1796,6 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	if (ielen < RSN_HEADER_LEN) {
-		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("Ie len too short %d\n", ielen));
 		ret  = -1;
 		goto exit;
 	}
@@ -1901,10 +1899,6 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
 
-	RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_info_,
-		("rtw_set_wpa_ie: pairwise_cipher = 0x%08x padapter->securitypriv.ndisencryptstatus =%d padapter->securitypriv.ndisauthtype =%d\n",
-		pairwise_cipher, padapter->securitypriv.ndisencryptstatus, padapter->securitypriv.ndisauthtype));
-
 exit:
 	kfree(buf);
 	if (ret)
-- 
2.20.1

