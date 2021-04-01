Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F135F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id dm8so1167325edb.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Yp6HUDwotT4+ERSYJIqIGZC15Onkb0fH8+gTnR3dV0=;
        b=d+rSqmUpyv6CfbbFUNvDHzY9XBiU6QEALR7xDU/RovPnvBTrLmDy7xm6NnfZj+aX/t
         B7WYEgke270X7v7e7vhjKNPd0ZyDJifGNj0Y9fppJka2hZuntAQ70tkKW0HhMEmhjZgG
         AXX9cIndUAAEHKcyY0KqC8+cRcPv5IW6c2Qa8hz+74Cby+Eh+IF065StfDUaUAcYS5n5
         1fNfKPQbzQHa2Sgj8iTkIH5U09QHUMJBfDghBZW5yZIWgtU90BS1zhUtKrDi7naE6TL+
         jiwBovLhSCB1SplMDydFTsMyevJKQ9ptpCCepBAVcj44Dxim6NL7ktyrO1rwD0fD21lF
         Km5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Yp6HUDwotT4+ERSYJIqIGZC15Onkb0fH8+gTnR3dV0=;
        b=M6+osp9ZvJCjgXLD77wbEwu0tttYL7RjGIO53qLwCm8jii6vjFhwsIpSJmLKjm8TH5
         1890fJALcDOr6WYJkOYq2djhDqr0ly1qoQCOXjH1XRDfqvbW/DHXTm2DpPnoQIUIJ1pt
         gvSImbxCbSzH0pT4RCPDrHKYMs7o99AQyoHUeuEje7JzY0G9T7WbA7MXylFxkwgD5efb
         bhnryBhDvm6Z+YXhQ/XdFvyP4TbMDaQdgPC3UNa6pU97oQ3QaELHJitw93q2gfcBVD0E
         VJq1IjJ3hTk3q6dtljms/UKCrmPjEpqVjeA4M+R0SaKkVuu7/z2OZyeSNTT2H/xxjfNv
         3Wfg==
X-Gm-Message-State: AOAM530inwTJrGPUvritCTSP1SF/xTFN4gdKy1YeNx7HxvQywmCmd1WM
	qFcvuej7GN30IbXJkRJdwxg=
X-Google-Smtp-Source: ABdhPJwSA5rPbsSC9d7zyklLmBBFZEh9k5U4eSHZKzmHmesuGEftJMk0GhNAqK/PH7uTA2d8ShY7yg==
X-Received: by 2002:aa7:de11:: with SMTP id h17mr8542803edv.83.1617268894588;
        Thu, 01 Apr 2021 02:21:34 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id m10sm2463641ejx.10.2021.04.01.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 07/49] staging: rtl8723bs: make one single if statement out of two nested ones
Date: Thu,  1 Apr 2021 11:20:37 +0200
Message-Id: <144308b944b51799960704b95959e9ae7da0e9ae.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make one single if statement out of two nested ones

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 018553984dbf..dd0b69cb9a03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -278,11 +278,8 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 		return;
 	}
 
-	if (padapter->bDriverStopped) {
-		if (pslv < PS_STATE_S2) {
-			return;
-		}
-	}
+	if (padapter->bDriverStopped && pslv < PS_STATE_S2)
+		return;
 
 	rpwm = pslv | pwrpriv->tog;
 	/*  only when from PS_STATE S0/S1 to S2 and higher needs ACK */
-- 
2.20.1

