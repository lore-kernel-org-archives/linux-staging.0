Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F429A5
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:43 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x21so5562989edd.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VQZuhT+vruVJe9YEYFvuAFzDJPr0QZ5/cyRE3vYoUZg=;
        b=itRnIEhrtNDTKZvVpDRGtBZdEhu1oyR2767o4jHeOyfDYCWG9xd/+3hWwlQslpqWWj
         /8AyCOmbpA+RwFlh33lG7WOPm/gksWLs390tPwrl4FJqInh3C/FPGi7S059mss1bINdc
         t0ohdjXVcCFDe9p3tAPKPHaucze0dMuSG9FQqf510pjeqardYrz0ceCrHP/aHeS1kAdd
         TqLzDjLAvZ5O/5lfR34jTeyd9HAlYlRTctW8N67A/HY4E4JCfFtXk52MtcWTdsbvHziv
         DLxCpWbW9HBPgn2l3Gq2+pbBBKx8vtRzOY9B1eTGR32VPwG2p9/HVbOVupIVq80NTgG1
         LCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VQZuhT+vruVJe9YEYFvuAFzDJPr0QZ5/cyRE3vYoUZg=;
        b=SHis+CZPIpAYfjF4wX7sql9KYRTTzdFJlEelJ/GGyGhAJiOSx/Jn6Nccf/TXoyyhpT
         wq0oPmXm3M87/1TbQyxibZwMkJ/DcJMdO7Kjb9AsOIVSNeph1qPZP7Qy4bs0obT9Cghc
         lkNWV0WfesBDH2brMqQaSMqA8ncTrkiP1EGKpaOdO+5/u5l1jZEuHPZz/I6VKzAL4IL6
         nddJBkcRqY6NIPSRC4QH5Kuw72poNBDL4JeSBclNPa13AjmHtqF41hLdK+0muuPrnVRD
         nICGlI8F57e00BV9x0avGUUG9buedFSyfZGPspEMb99VkJdZHaYd9vD0Xc05wzSjYepK
         YJGA==
X-Gm-Message-State: ACgBeo3b4aH2+rzadctF/xTYc3x/CnvEjdzIWygWWEEtfj38F0mMG420
	lGbx7/gsTUJl+zXMjUn6aFQ=
X-Google-Smtp-Source: AA6agR6eNvZ6APVC+t8pgRuJsvlNBspi+p6fIrSoxbJxZzrXtb1Z3/ACL9/V3LTpX9MKODR+dJxzkw==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id et15-20020a056402378f00b0043ad3f579f2mr6084087edb.338.1660913681431;
        Fri, 19 Aug 2022 05:54:41 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/11] staging: r8188eu: move rtw_indicate_sta_assoc_event() to rtw_ap.c
Date: Fri, 19 Aug 2022 14:54:21 +0200
Message-Id: <20220819125428.8412-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819125428.8412-1-straube.linux@gmail.com>
References: <20220819125428.8412-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_indicate_sta_assoc_event() to core/rtw_ap.c to
get one step closer to removing os_dep/mlme_linux.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c       | 21 +++++++++++++++++++++
 drivers/staging/r8188eu/os_dep/mlme_linux.c | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index a567683c21fd..24eb8dce9bfe 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -935,6 +935,27 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	return beacon_updated;
 }
 
+void rtw_indicate_sta_assoc_event(struct adapter *padapter, struct sta_info *psta)
+{
+	union iwreq_data wrqu;
+	struct sta_priv *pstapriv = &padapter->stapriv;
+
+	if (!psta)
+		return;
+
+	if (psta->aid > NUM_STA)
+		return;
+
+	if (pstapriv->sta_aid[psta->aid - 1] != psta)
+		return;
+
+	wrqu.addr.sa_family = ARPHRD_ETHER;
+
+	memcpy(wrqu.addr.sa_data, psta->hwaddr, ETH_ALEN);
+
+	wireless_send_event(padapter->pnetdev, IWEVREGISTERED, &wrqu, NULL);
+}
+
 static void rtw_indicate_sta_disassoc_event(struct adapter *padapter, struct sta_info *psta)
 {
 	union iwreq_data wrqu;
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index ad5f795f6857..37c7f52421ee 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -129,24 +129,3 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		kfree(buff);
 	}
 }
-
-void rtw_indicate_sta_assoc_event(struct adapter *padapter, struct sta_info *psta)
-{
-	union iwreq_data wrqu;
-	struct sta_priv *pstapriv = &padapter->stapriv;
-
-	if (!psta)
-		return;
-
-	if (psta->aid > NUM_STA)
-		return;
-
-	if (pstapriv->sta_aid[psta->aid - 1] != psta)
-		return;
-
-	wrqu.addr.sa_family = ARPHRD_ETHER;
-
-	memcpy(wrqu.addr.sa_data, psta->hwaddr, ETH_ALEN);
-
-	wireless_send_event(padapter->pnetdev, IWEVREGISTERED, &wrqu, NULL);
-}
-- 
2.37.1

