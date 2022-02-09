Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1932F43
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 20:57:54 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id x193so3901951oix.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 12:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S0XRMCidxLf3AMH2NileQLi/UY5vaptNNJhFkA7h62k=;
        b=aq0u3wZCQUyAx4ASAWiAG8nNmiuXymUY+bm91AJoSqSwFiNbMOuUFTdNx3KfI9J5/b
         cEV3F62a/1KKd9MFxa6WtmaxsaPFn2y8FWrK4sSQgqaGMtpzfOfIB63I2rN7S81PEdtb
         rmFppyJOS/RAOCYFFut/7e2o+zGy0ij2oin9Uo2mWqSTB5f4ctQ4bNbSr2m8TWNeqjmX
         uxAw+Mt17EO+D88rUfDEY9vL/UIXbltCwAzmFSYh3RlrlB3ZmIUnrzkiLXqyveY82iok
         mOm1N/ayrRrcQn30xpC+tdpafaEueJij/cMPKhYQV4MBInpdZvMpKQO1ACULujgw8Lvm
         wEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S0XRMCidxLf3AMH2NileQLi/UY5vaptNNJhFkA7h62k=;
        b=UYYxm8VXuHDwHXIc0d37S8pi4h8pTMyjXHJ9IiBzcABVXYpLlpA1L+1ep32/NcDVni
         eIuk0kl1zXlTHrIQx3l4GrVTtvDa3PCqo+NK+PjskvQ5S8hxnc+62p6Xzy5gGczwMi+Q
         ysxUJCSsnZgX2/o2EVhkOkTo8LKFmCU5gH0WL8AnnCGHkkTqYBbouX0EHWHSjX/OQbwr
         iWMFTQBHXOWxuXJx8kX4W0VJ+tSSu9JdBBBxsFKWqpVmLEB7R/KlKtX6B3z1k2IqDUDG
         SG4+d7wamc1L+AHHi7xitumUYi6TL6b8QYnoqQo9f6rRfWIeJ/ARpodvPk/y6LhlkPoa
         3Kig==
X-Gm-Message-State: AOAM530l1b6dnEvTpzk7LAjP3Q6FKE4i7V6FGuVdtIQaItWkNEw1/rBk
	qz5w4FtWNLkpfCUQ74RDc1E=
X-Google-Smtp-Source: ABdhPJyGWueOWBlkiM1w5KuvGFTribr9OXBqRie/wd6kJ+eHbYjfobOUgS1S84qqkgKwTbm8vl/AjQ==
X-Received: by 2002:a05:6808:1702:: with SMTP id bc2mr2390274oib.214.1644440273270;
        Wed, 09 Feb 2022 12:57:53 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:758b:9a0d:6e95:934f])
        by smtp.gmail.com with ESMTPSA id j19sm7005949ots.21.2022.02.09.12.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:57:52 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Avoid CamelCase: <bEnterPS>
Date: Wed,  9 Feb 2022 17:57:40 -0300
Message-Id: <20220209205740.9926-1-leonardo.aa88@gmail.com>
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
 drivers/staging/r8188eu/core/rtw_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e42119e16284..4ec4da6d3078 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -880,7 +880,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan)
 
 static void traffic_status_watchdog(struct adapter *padapter)
 {
-	u8	bEnterPS;
+	u8	b_enter_ps;
 	u8	bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
 	u8	bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
 	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
@@ -913,12 +913,12 @@ static void traffic_status_watchdog(struct adapter *padapter)
 		/*  check traffic for  powersaving. */
 		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
 		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2))
-			bEnterPS = false;
+			b_enter_ps = false;
 		else
-			bEnterPS = true;
+			b_enter_ps = true;
 
 		/*  LeisurePS only work in infra mode. */
-		if (bEnterPS)
+		if (b_enter_ps)
 			LPS_Enter(padapter);
 		else
 			LPS_Leave(padapter);
-- 
2.29.0

