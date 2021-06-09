Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D4270
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 13:23:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso4273211wmh.4
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lP2ITBV7zRm5ag9NRrSPl6Qm8uDsIEGXg/GTfJ0e8kU=;
        b=KK0oiU/t558sncv3jMwVG6ULytasfYiT98qny4LgoNaCN4ZSgD6PwE+DZj2cOWMt4s
         Bz+mSAotwP41jlg3HXkiJRfKh0A4/m2EqFbxkK5BBSMm+XwzJTWAx71qNB99UH4D86ki
         HuAHbEHk9hJjNZyk82WLiaiYEyDWgjGEpNIHeVhoUAdMvrVpH6ZkZ83qyfWAlgpnnCSi
         6DrcGcTl8TKtFWS/aJH4M7bLQcr6GuzDznE+5LiawcuKF+wp6veX+6OTHBOiusJBBgzU
         23d33dn1akI3nRLlFyZ6ZtAw9/lLSZ/NV3dpDs4hNPtDXQ9nbYzUUjQGJIGbmwX4Bb5D
         U5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lP2ITBV7zRm5ag9NRrSPl6Qm8uDsIEGXg/GTfJ0e8kU=;
        b=ecE8gm9u8on7zWEdl1cMrnF4vHV1wfzYYf3YFi9fU+LMxemRSJU1hZFrLabdiIlaaU
         CNcwXDuQ2DxJOSgqizUK/C92e57B7Fpz3z2y9cw/ihDZMNlnbdLpwNV2VBdJLBnYdZKY
         Anl5CdYjVQ8+1pRHJfMrlJXsvqilnbN2hZvOjpHI5hA/Jo6xYe7NNC9DZBzoRwuM3qG1
         ZwrY7s2BBGExN0gefcsi1ZBSNqEpf8gSoEQahK0wlyOFsw+opI/ncVOfGcaAQRboAh9x
         ttLgboAp7JpwRtWDGxPqR/R6InzJCHm+5gXZoGdt9auqS/j/WW/BpL/xaQ7qMYEHC1LL
         XVEg==
X-Gm-Message-State: AOAM531DXsJaFtzGXNb+Uyu+/zaKQF4+yJHOJ1ZjIBpHAEDr+VIvdZlV
	VUE6idEfq4zi93YZsN/DPZM=
X-Google-Smtp-Source: ABdhPJx/b5jPlSGViDVrOKwFkkoGyNC7ZtT0/PWdyiyLa/U64F0l7hYPf+1VTBXpCJjIQLtSoc5Kbg==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id f14mr9624626wmq.172.1623245031597;
        Wed, 09 Jun 2021 06:23:51 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id f5sm27793994wrf.22.2021.06.09.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:23:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: os_dep: Remove conditions with no effects
Date: Wed,  9 Jun 2021 15:23:46 +0200
Message-Id: <20210609132346.15403-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed conditions with no effects. Detected by Coccinelle.
Deleted a variable that is no longer used because of the above-mentioned
removals.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Reviewed-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---

v1->v2: As reported by Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
deleted a variable that became unused because of the removal of the
conditions.

 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 213ec5b4ce98..11b9a5919da4 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1187,10 +1187,7 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	rtw_ps_deny_cancel(padapter, PS_DENY_SUSPEND);
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		rtw_suspend_normal(padapter);
-	else
-		rtw_suspend_normal(padapter);
+	rtw_suspend_normal(padapter);
 
 	netdev_dbg(padapter->pnetdev, "rtw suspend success in %d ms\n",
 		   jiffies_to_msecs(jiffies - start_time));
@@ -1264,15 +1261,10 @@ int rtw_resume_common(struct adapter *padapter)
 	int ret = 0;
 	unsigned long start_time = jiffies;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	netdev_dbg(padapter->pnetdev, "resume start\n");
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-		rtw_resume_process_normal(padapter);
-	} else {
-		rtw_resume_process_normal(padapter);
-	}
+	rtw_resume_process_normal(padapter);
 
 	hal_btcoex_SuspendNotify(padapter, 0);
 
-- 
2.31.1

