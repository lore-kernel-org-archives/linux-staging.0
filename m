Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F9429A2;
	Wed, 30 Mar 2022 18:00:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id k124-20020a1ca182000000b0038c9cf6e2a6so513745wme.0;
        Wed, 30 Mar 2022 11:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjDBA8xXV3PaVr1T7IqgeEG7zCa3/bW1lV8w1dmHNbo=;
        b=gYGIDn+dPCphlCTk/qqlLNO0kbPmWbsbaxGJlFezdIeGKOfdz3ZTK3sICB7jxsEMUz
         1ErRmuLNzGEBgejIgG1cTy3fHdlIm9brSoNAFnRR/VpS/S6QY7x9kigNkJoAh+CwEopZ
         s9escAG/6I8MXO1M2t30LC7bORx2kyodVjBWSa5Vsp4vtJKbHptL3xCZxXaB+QNRwpq6
         BWaZ4cq1ottckQ1/Qkdtukrf55/gB/NUuqLdimoAcHGF4+mwXRu45aytAAzZXDlIRP1k
         MeHHtL57gEDJM0xyQoA/zrDNPjkTlQsEknTX0R8lq/Im5R/Eg7kgfFm6M56sk2MM9QuQ
         5gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GjDBA8xXV3PaVr1T7IqgeEG7zCa3/bW1lV8w1dmHNbo=;
        b=zlUwYWXcqYjeW180tISpLYx4VkdY/wIXh6jEoCanTnMWJCxSsxI6xLBPwyhM+Xufcs
         tyOngTohEv331SwbMwPnioROYRqM4wLYGnigEto3PQu8d/aflLol46LT8ZcQ4mXcsNDD
         snJu8AV4XHgaLwGXVen+WmMTDWXUwziAMdkA7Gigpgf/z2wITdYcnPFQY9DRulyGlP4v
         NBFDupoIQSGB3vilJaM4Lh6z3k8Rqj45lNldarfOrmntHRYptHnr2A/jrZXdiFdZ+poY
         APLXJnhIDqO37CwCXCZb4IgoQgISCkDphCisAE/XNv34Lz7oQuAhom4WKAkJNkanp/wX
         +23Q==
X-Gm-Message-State: AOAM532uD9VQXZbWN/CveoNGlIpoxR6lxOZ2W+n4ew2S+O+N8qALjsYV
	ECPmMnNIz8+36noV6Rqp8bZHrUaxGeA=
X-Google-Smtp-Source: ABdhPJx2yaZhLKwvYiQxEaZYg1Ek8pVsCoS/BpPLxLWQcxbSTDeRqWKbtjLgWBoZ7PphulafdFI8pg==
X-Received: by 2002:a1c:f312:0:b0:387:8bf:bd3 with SMTP id q18-20020a1cf312000000b0038708bf0bd3mr635353wmq.112.1648663244522;
        Wed, 30 Mar 2022 11:00:44 -0700 (PDT)
Received: from alaa-emad ([41.37.132.115])
        by smtp.gmail.com with ESMTPSA id v18-20020adfc5d2000000b0020589b76704sm18951588wrg.70.2022.03.30.11.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 11:00:44 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: remove code suspect indent
Date: Wed, 30 Mar 2022 19:59:49 +0200
Message-Id: <20220330175949.95564-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "WARNING: suspect code indent for conditional
statements (16, 32)" for line 1240
founded by checkpatch.pl

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
Changes in v2:
  - Edit the subject.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 14d37b369273..46e18a90529f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1238,7 +1238,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
 		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
-				BusyThreshold = BusyThresholdLow;
+			BusyThreshold = BusyThresholdLow;
 
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
 			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
-- 
2.35.1

