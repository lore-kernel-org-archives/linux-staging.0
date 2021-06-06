Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E570
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 04:35:57 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id k25so15448574eja.9
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 21:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pH4GInW10Hp6KLNIVq0KGQtBtOWx4rjYfaOWwD1TPj8=;
        b=JAmH389YkyoK3omVOjdghXx2vEVJ5SB1b0N+laj5qfyMMoyT1ZJ0CbrBeU3M/Jsmqt
         Y3aHEzQ/7M9Dq7GZxiXpx9DEUxlWljK1W5XLBOQGw21yeVh+/+Ij91Hd9kYpWheq/3Sd
         2q7VzLpP1bPnaluClbNj1n/pLVjuTApLOkJ+1s3Z6Swjg8vZfUmGdiBN9jJOzb6B/1Sy
         SmgZImdGHdsgaWwyC21cmy7wOCso7F1456UDui83GgyBGh4w0liGpqHczag23NoOCOEp
         6jRjvkozeDx3DWdnwPEpRZ0iBx2oOf6vd3qC9Wh03Pe1yFYHa07npv0OoLv7ME34l87U
         iEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pH4GInW10Hp6KLNIVq0KGQtBtOWx4rjYfaOWwD1TPj8=;
        b=DOdiD0y3xADTrp3DmhzmwDxcjMiodkxmJuxpCgGg1jVFlJvxZPGsyy/sl08NuiSRlF
         7b5UEeWTPomDRBZHjVE1iIaTrMF/pZNWLsHcDamEU/ooMypyRziykj1hVZWnlhs6ZRbe
         tl9/U3Vvbs3qF85c3P46KfarbfRKEJC920xyG61LykwRN/OBJ57TWNEv7l4O967H0aq3
         /0NItdATTtFYMqzrMxw6f852TQ8JAgun3E562Gvu/xCAtyh5Svsr8fVXZPbYQn9yyZRX
         DaKlfVea+GyLOuu8yVRXRnxvTZiM7z7B0x2AY96fVcbKBytKetdepwnPNPyKaaMbv8ZK
         dZXg==
X-Gm-Message-State: AOAM533MBMjvJ6OCEW38IoDoq7c+rUqER7IxEYdLb+LOsLzNfDHdK6cD
	9KxOrxjPV5E1K++ZFpacTKQ=
X-Google-Smtp-Source: ABdhPJzjlT4dgF1ikXObsEfQy8kJolnGFce1z0v5cHwuJUWzEzvOyuflbmfpSXADmUYyO9lVWpxNHQ==
X-Received: by 2002:a17:906:6d45:: with SMTP id a5mr12199536ejt.399.1622954155836;
        Sat, 05 Jun 2021 21:35:55 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id y14sm4826420ejq.102.2021.06.05.21.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 21:35:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8723bs: os_dep: Remove conditions with no effects
Date: Sun,  6 Jun 2021 06:35:52 +0200
Message-Id: <20210606043552.31785-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed conditions with no effects. Detected by Coccinelle.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 213ec5b4ce98..2035573ee5a0 100644
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
@@ -1268,11 +1265,7 @@ int rtw_resume_common(struct adapter *padapter)
 
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

