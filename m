Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A761868
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 16:20:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id r18so14951185eja.11
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5/IIZbWRTXX4L4GClXT0KhOjJ/7HccMx71oM1JZ+Wao=;
        b=qt8DPBK9nsHDVjwGrqgLpBzVPfG65OzLmfeda/YIKHJx0dLGFN5IpJ0SPQgo4zXgrL
         q3ZUsNblrO/WcjTt2zoHCg3LI+jX3+XHGc/flOWysgFAkk9kHDfQX07Uz8aJYOQ9t6aS
         mjY+0vEE7wNFrAR+6S6aryGt73ywxVgDIYmvTdRH0MUK4d7udGVzH6Nfq8rhA84bfAz8
         fRZ6gbOHO1gBJCm9Hs5VBNa/WOcH/WL4pHe4pMdP0UqOkf1B0bx357EkzGSmAkrNWYFm
         e9dpXBps38bCfqH18A41Li2ANSNKWeV8sD+46tciiPQ9aLkEy7JS100oV+qq7MXtL//f
         Gi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5/IIZbWRTXX4L4GClXT0KhOjJ/7HccMx71oM1JZ+Wao=;
        b=l127jvavdjUng6oKen56UV5RdT0swyxXnnHpEOW1iafe8JmFb/db56oiCPXeA/g1zo
         5gO+jyurh/xN6YdGRwRZ3TMQwn/DO6xzoOpJhPDqasLdJFWeOjikNS9wRTyrNxetva8S
         PO2wcO0t+jxJ/b+dPWed8lycimDvu2+9AdYO/+Shsim/9CgQO5K4QY9E7LIYQKKVG8On
         p0FlFAM4YKNcYh0Xh4fvrdnZXVWLhdarbmuv6J0zk4b50uECrXDEjXNYFn9i31Qe1W3t
         h1CHu6+MRnaLykXDiKimEB7YDa73U8yrvTvPnQRKr2ll5reRIWCsCcISS3TxuP+WVaVu
         eYsw==
X-Gm-Message-State: ACgBeo1Eyc0LV1062JjEu/W2jBsSXaroe0GNKb2fPI/kn6qqVzgNaZsg
	UdSgtvDN8i3PVgOKqgvJ4oAZFFL57nY=
X-Google-Smtp-Source: AA6agR4+ga2QghFLqkPTwzMTva+vEGzt6fMB58RBbVxHQE77kDfdgtbFZmbQmtBlI4nyOY1iQC85Gw==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id c6-20020a1709060fc600b0072fd0800416mr16218426ejk.1.1662913203217;
        Sun, 11 Sep 2022 09:20:03 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id bt6-20020a170906b14600b00779dc23be62sm3055346ejb.120.2022.09.11.09.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 09:20:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: rename odm_QueryRxPwrPercentage()
Date: Sun, 11 Sep 2022 18:19:47 +0200
Message-Id: <20220911161949.11293-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911161949.11293-1-straube.linux@gmail.com>
References: <20220911161949.11293-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename odm_QueryRxPwrPercentage() to avoid camel case.

odm_QueryRxPwrPercentage -> odm_query_rxpwrpercentage

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index a557c5d1542e..8b292644b38c 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -3,7 +3,7 @@
 
 #include "../include/drv_types.h"
 
-static u8 odm_QueryRxPwrPercentage(s8 AntPower)
+static u8 odm_query_rxpwrpercentage(s8 AntPower)
 {
 	if ((AntPower <= -100) || (AntPower >= 20))
 		return	0;
@@ -117,7 +117,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			break;
 		}
 		rx_pwr_all += 6;
-		PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
+		PWDB_ALL = odm_query_rxpwrpercentage(rx_pwr_all);
 		if (!cck_highpwr) {
 			if (PWDB_ALL >= 80)
 				PWDB_ALL = ((PWDB_ALL - 80) << 1) + ((PWDB_ALL - 80) >> 1) + 80;
@@ -162,7 +162,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 			pPhyInfo->RxPwr[i] = rx_pwr[i];
 
 			/* Translate DBM to percentage. */
-			RSSI = odm_QueryRxPwrPercentage(rx_pwr[i]);
+			RSSI = odm_query_rxpwrpercentage(rx_pwr[i]);
 			total_rssi += RSSI;
 
 			pPhyInfo->RxMIMOSignalStrength[i] = (u8)RSSI;
@@ -173,7 +173,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 		/*  (2)PWDB, Average PWDB calculated by hardware (for rate adaptive) */
 		rx_pwr_all = (((pPhyStaRpt->cck_sig_qual_ofdm_pwdb_all) >> 1) & 0x7f) - 110;
 
-		PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
+		PWDB_ALL = odm_query_rxpwrpercentage(rx_pwr_all);
 
 		pPhyInfo->RxPWDBAll = PWDB_ALL;
 		pPhyInfo->RxPower = rx_pwr_all;
-- 
2.37.3

