Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284470
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 07:42:22 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id k7so21260422ejv.12
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEkqcK+ZsCfx0RKoS5sCh6znx6o98CrrxGkDXKRKUsg=;
        b=H8mSCiPt+rS5B5BvuBtl7dA6LWtO3csDe0YNYRKWYxTr0ervMpKkkZYsW4KCLFJ0/+
         1XQ+5LhuocKbptJrS1hhqm6GTr9vnZnjnedSRBNtg95k5qdlelAv5rAIEXHFgYsy0H11
         nbtO4DMfgQOMGSIKjwo4IF3UPY/VvVAPjrEK7WMnFK3C4aD1qhZkFKXDFUW+zD4BKhae
         320p4HTfVU8PN48ZmK4RcKp9Oa+c0M9Ch1VKI9/95VoQzs3mz1iRwOMJmGl8iIs66TrH
         F6S3NPo4JZu2HWPJc2dHOaSG+MRd5QepOwTW1HHpXccWJKVkdB2Qzic2jDZc7FIAt26W
         qAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEkqcK+ZsCfx0RKoS5sCh6znx6o98CrrxGkDXKRKUsg=;
        b=gOHcvAbYhutZZQEaUkZEoJt+WeqM/zbBuLjtdRMJiS3gLHG632ef0ZeZfxAlGTDalM
         lF4wEiWCAvO8VI/8VpEsUi+ko0WQBpb/nRpswa9AFBX9acmxc87BroKbafrNiRxEOGqd
         VXQ7zOCimOwxYkrTzycW3BWuOBYAnpWRZW3t1xu/xRtkuqhocBC5QOnphduE1HzWpb3y
         hGThv4PJLBNY8Ns4Ftg2bUFQqtFDE2DWdxUkt7pDkheF7z1e2bMlzmPV8BhwnsnT+n5X
         4T193pk85eroyxee8oJuhzDWq7cL/p9ao0uOMTkFs4UGxr3aoonXCnswlnkIiwRiv/Dv
         GbzQ==
X-Gm-Message-State: AOAM530nUlz72rmjsf985seiGv7IOZrzgbPr4hAsP5o5bttcRPn971tt
	823v2O6RmWPhRJ/dJWL99SEBuiwu/6fqdg==
X-Google-Smtp-Source: ABdhPJw40SprLvulNts0awtG+9BgtWsDCMxmdQDudQ7JpKGhHpkH7YKAyNGgeio/iUWcuwlR9jGqig==
X-Received: by 2002:a17:906:86d2:: with SMTP id j18mr12202709ejy.180.1622965340965;
        Sun, 06 Jun 2021 00:42:20 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id i15sm5108804ejk.30.2021.06.06.00.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 00:42:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: os_dep: Remove conditions with no effects
Date: Sun,  6 Jun 2021 09:42:16 +0200
Message-Id: <20210606074216.26495-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed conditions with no effects. Detected by Coccinelle.
It seems that these conditions with no effects had been inadvertently
left while deleting code that had to be conditionally compiled by 
unused definition CONFIG_AP_WOWLAN (see commit dc365d2cc579).

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1 -> v2: Rewrote the changelog according to suggestion by 
Joe Perches <joe@perches.com>

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

