Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3F2C9C
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 23:48:46 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id c7-20020a4ad207000000b002e7ab4185d2so15613421oos.6
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 15:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6w59Lm+S9vTDMWvPIWW+WWqVExelOhv6n2kHObVwhbw=;
        b=M9HKxXV66+sQsFok01Z8z37aiPmPfP4oMAcDwsAsTT6tAvFHw+vrKQ7S1r+LZYxS5o
         sa9z6UKa7XIB8PcRpDtsJzdEMR0N3nzporGuqxWzbOF7RnuHvzS+a6K4jT9wNikdCC1l
         VMQtwqpvSKXMTTEsnYu4I2Jztkq9DKMrAwvKH8XemO3IHj93f5UFZ2qP4qbUrNFbgISS
         unSNzqrz9aEby7fiWIio47sBWT9pQF+S7+MrxJjH1GJobF3DBzPod4Z/7pxA9u6d2PjA
         J8grum0WsVm2h1woWi4Kffhz5WqcwzqGRmIIirU2eAydEkxIlDCymrNQkWkitU/9rf3Q
         pocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6w59Lm+S9vTDMWvPIWW+WWqVExelOhv6n2kHObVwhbw=;
        b=aRf14VWwarb1F6RYSwnV3ntd9hj0uPioukPWepnpN1U3WWK1yx3IBnDqtYXQ+B/z9R
         okBXaqUxitb6wTN+LfTqi7lJ7OXeV8AaXQ9vtc4EA8JFAr2Yrbyyy/0/WckJiCcFexEC
         qSx2A/R08/N1iwThIpJUO2+QWeowhOGnL/j55Kpb16iSYTHcQDtieGe4KW+AgfeMqzpF
         uDUWULs12pkSvcme4Xn1KQc4dQU6lgXPFmSiF+6coRBvsTZ8/sNdAnSbaV0NXIbp57N4
         /wTaGuDc7hCfczjfZcyuTgvpefS1snvyDFyw9hFLgDVbHCsq3ztlqcwlQcrc00UGxQrv
         5OWg==
X-Gm-Message-State: AOAM533kX7AHSZI97cjfnsfUKvkMMfr7GycSdsw3Yb4+1qqUNNn+1tgL
	/6LcTHhYvwrZneF5Gm5ViaA5C6mHBqhLb7KP
X-Google-Smtp-Source: ABdhPJxtupvU6YR52AZ3UhRA9Dd/HfxzaQDo2i0IxqbYlKti6NgdZntpMSVHsSdeiBr0IbXLygMmaA==
X-Received: by 2002:a05:6870:6187:: with SMTP id a7mr427434oah.301.1644277725520;
        Mon, 07 Feb 2022 15:48:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:4134:806a:5a4a:2a88])
        by smtp.gmail.com with ESMTPSA id r41sm3330805oap.2.2022.02.07.15.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 15:48:45 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: alignment should match open parenthesis
Date: Mon,  7 Feb 2022 20:48:24 -0300
Message-Id: <20220207234824.27893-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index e02dd8e11c95..c7803144355a 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -942,8 +942,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 				pmlmepriv->num_sta_ht_no_gf++;
 			}
 			DBG_88E("%s STA %pM - no greenfield, num of non-gf stations %d\n",
-				   __func__, (psta->hwaddr),
-				   pmlmepriv->num_sta_ht_no_gf);
+				__func__, (psta->hwaddr),
+				pmlmepriv->num_sta_ht_no_gf);
 		}
 
 		if ((ht_capab & IEEE80211_HT_CAP_SUP_WIDTH_20_40) == 0) {
@@ -952,8 +952,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 				pmlmepriv->num_sta_ht_20mhz++;
 			}
 			DBG_88E("%s STA %pM - 20 MHz HT, num of 20MHz HT STAs %d\n",
-				   __func__, (psta->hwaddr),
-				   pmlmepriv->num_sta_ht_20mhz);
+				__func__, (psta->hwaddr),
+				pmlmepriv->num_sta_ht_20mhz);
 		}
 	} else {
 		if (!psta->no_ht_set) {
-- 
2.29.0

