Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F8A3A1C9
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474500; cv=none; b=cjcl6jA/yloPRzDDBofRHyGWqmoGJo3g+UM3VAtQm/0ohh8D7aNn6JEpLprkM7oZJ3Rxsvm5YVMxjQ/3l9rE6PY1Ef1Xh8t1KI/rjZBT5Wi4+bCQ54oGBN1sLKRXsRKXhKWqeILOUTBbbSQ5F21EJBLT2XsS3QviRAtL65eKzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474500; c=relaxed/simple;
	bh=03nknNNixmoJGQZIQfb5UNGRC7a8plfvBlyB1zfqcnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sxI3GgdOGDB2pPuF9CyNzeFhqO0Hz93Sao+M4kwgIOptbYCVdgUUXm60eLsd0T5S5/soL3ObNztYtJkGaAlrcLytpADJRc8gCuH44J0v3Nh5ZmwJppakGhLq9tCH/ozHr6aplINt6mm9PqwP4Ga//hSMKBTFtOlG7Llpnjf04FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YApQuQG7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YApQuQG7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso2098702f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 21:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778474497; x=1779079297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDlyASvaraeGyhobDhKssBlnhZl7u+7R/qogLVb4gQI=;
        b=YApQuQG7nSR5uwv+9lVeAsKax40JY1soBbUs7hnVm/ySZfg7Bvzdo654+qYKYU7Uc6
         3byfpJkofoRKaHdqkoAUILAKuZ1d4vbp3efFAeoAK7RN2sApajfGPK0I80E/y3QS2xz1
         EuXV0uNHovq9ldWHQ/noupC2fpmiSiuvIUMQMVZWdGyGU5SChGW5Pp6XeY1eKJtLkInJ
         KGPPm+KxL8MGyiwrxEX/6AYjmDaqD0ffGiBxToHSWPQSIhuKHt6XguLLQITVk4m5/PiG
         QEX5oFP9/i9yEasU2ZihEjCRP7Q+bDdrBY/hWhhPTVTJ54HRBxl4K2fEPt0BIC/Xquwx
         39Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778474497; x=1779079297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDlyASvaraeGyhobDhKssBlnhZl7u+7R/qogLVb4gQI=;
        b=iS2oJkurMxR1iaxE5Q3eXIbu5lQB683S3wRDkCYubEgeM3qL0m//vCTJgVN4LZeq2L
         Izg+7al4Dqd4J7+TcwMeph/vrSu8wRSXq5iNYZxvHS8ybu0R23vs3fNGqeyMO8/MX1Ak
         gYvjjswo5ZK+nOdt5J72JgLDLw6ntX3wrM5kfUImd8x65JxUw2MI4xcSnjKnL0xd9iJc
         nEg1cH5VQn6rLTKSYlCFEa2BYwQMbKFCJk65nlMFxhwn5iLND5Z6e2DMwOClL7YgFTGb
         6LwImVKGxjQZ0ZfkhjqgS/uQk30V3sAn7hzeRRnoQIeWjcG+6wpCtbtB9ULhxL6zZNUA
         8ekg==
X-Gm-Message-State: AOJu0YzwUH4JAukHCUQrCXOMqLd8+WvKzVK8TGGVKgo2kOfV9f1o2kxZ
	3N+XYKRDiRQ57STY0dBqOudnui5Mfb7G7rB+XeOl3QYuvWq5MMdFkrkY
X-Gm-Gg: Acq92OEAvcb5arVJ/vitNHLQ7u33XIdeU/BkeEDkVTL/t0v1CK3DoBpMvMEftPbCHGx
	c+cCN8mxIxxb1/DOO/HG6DQZtUGKGwtHlvrAgpmF0bpmeDZz9jJOxScfSeol50JvXISEZ9t9v/w
	U/1wXNRsGC8krvC7tYs40Ttiy+SfCltGtjSpTjd8ZYWpPvcs+WXionZH829J6fsU5WK205FVKHo
	v3LoBcj1JzB9PG/ay67Zyicz6L8JYLUxI7b3D5q5MsMcnIHVtQvWdhNcR0drEhqcy02Z2BGe1/5
	PvwC3rQoCtGN/Zu1L+00bRhkto8gF7jHirovM1vZuXcxhD6aHmLWylKyc9mEJVaMjTQ2HPKYxrr
	HTnIAeXkHT/kZZ28w+WJuoKlXEg/FYKC4lS/ENgaxWG547kfHBV0C+NQ79H0ppplWBJft0oroFX
	JQ9M+9SXBhY37tBPDNtPaVnF8GCdsr3PdtuYvnYbQJScssB4zAk8TTNrQay7C1FlyaHwENO/HDP
	prbFti/ndSqu+CMjvJzZ21foQ6G0syicJBK8nh2Cv+SWbvM4tsdu3hT6MuS1dR+M9sdcyAKZNOI
	GMCsM4u4
X-Received: by 2002:a05:6000:184b:b0:43b:962b:5314 with SMTP id ffacd0b85a97d-4515bbdd5a2mr35302753f8f.19.1778474497354;
        Sun, 10 May 2026 21:41:37 -0700 (PDT)
Received: from dynamic-pd01.res.v6.highway.a1.net ([2001:871:25e:8576:c50a:9875:702a:ab71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491304505sm22836366f8f.22.2026.05.10.21.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:41:35 -0700 (PDT)
From: =?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix type issue in DYNAMIC_BB_DYNAMIC_TXPWR
Date: Mon, 11 May 2026 06:40:29 +0200
Message-ID: <20260511044029.14839-1-m.steinmoetzger@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add explicit cast to fix -Werror=overflow warning for BIT(2) usage
in DYNAMIC_BB_DYNAMIC_TXPWR

Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>
Signed-off-by: Michael Steinmötzger <m.steinmoetzger@gmail.com>
---
Changes in v2:
- remove BIT2 macro in osdep_service.h
- migrate DYNAMIC_BB_DYNAMIC_TXPWR macro in rtw_mlme_ext.h to BIT(2)
- cast usage of DYNAMIC_BB_DYNAMIC_TXPWR to u32 in rtw_wlan_util.c

v1: https://lore.kernel.org/linux-staging/20260509032202.146240-1-m.steinmoetzger@gmail.com

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 4 ++--
 drivers/staging/rtl8723bs/include/osdep_service.h | 1 -
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h  | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index d837738b9f40..943e199ede82 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1476,13 +1476,13 @@ void update_IOT_info(struct adapter *padapter)
 		pmlmeinfo->turboMode_cts2self = 0;
 		pmlmeinfo->turboMode_rtsen = 1;
 		/* disable high power */
-		Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
+		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	case HT_IOT_PEER_REALTEK:
 		/* rtw_write16(padapter, 0x4cc, 0xffff); */
 		/* rtw_write16(padapter, 0x546, 0x01c0); */
 		/* disable high power */
-		Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
+		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	default:
 		pmlmeinfo->turboMode_cts2self = 0;
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index bd72edcb4259..2f5011a8210c 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -14,7 +14,6 @@
 
 #include <osdep_service_linux.h>
 
-#define BIT2	0x00000004
 
 extern int RTW_STATUS_CODE(int error_code);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index a4770f5eb75c..f832d77d7156 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -28,7 +28,7 @@
 /*  ====== ODM_ABILITY_E ======== */
 /*  BB ODM section BIT 0-15 */
 #define DYNAMIC_BB_DIG				BIT(0) /* ODM_BB_DIG */
-#define DYNAMIC_BB_DYNAMIC_TXPWR	BIT2 /* ODM_BB_DYNAMIC_TXPWR */
+#define DYNAMIC_BB_DYNAMIC_TXPWR	BIT(2) /* ODM_BB_DYNAMIC_TXPWR */
 #define DYNAMIC_BB_ANT_DIV			BIT(6) /* ODM_BB_ANT_DIV */
 
 /*  RF ODM section BIT 24-31 */
-- 
2.54.0

