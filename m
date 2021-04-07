Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79E70
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:10 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e12so5015078wro.11
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FH/YcO2sYbbsIWneREzRnpYXkAOrBtR1NQ4JZO3sLEw=;
        b=Hu0+gVGRqG0vp+AeBiAVtaFIn6cW+wxkmPhpWEiIssVRTuRY2Z6MazWrYa1AR9SLlL
         agIGq2Mm/IHWr+txF3y4F0GC4aE5V/uYIzozmgguUih4uB4drp0cU+pChCG74+Y+jpdD
         s7VUXa8PRD7euZADEhHXYLYclLk6yGPMzoev7qUYTMJYZz5v0EfgBbLQobQuvRcCXax4
         jVRoM5Yc/X3w/L+JrIrVms8bMno+ygiZ4u9vEpYcI7nHoqYuxDjJPaa6Kd4MjaqyALdD
         LGmIo/Y9PrTB5p5Anx1eRphvRHZ5SyWJ05D7lLi63H2+7xNFrNvAqsb9qFTXknkS0xSe
         VpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FH/YcO2sYbbsIWneREzRnpYXkAOrBtR1NQ4JZO3sLEw=;
        b=EkpTt72z1C72vVRr+N4LaCW3KLjNxp1BhVXDGg/FST0uDXSxfBpr4yzzYc0ra/ziVW
         VJ3+DebtGCqFQwLN98jpCEIgLYYold9Z+Edon55rJ11qvPWY7Ot6oEBw4ffnO5rnwaYS
         3iVj3+4HAKM/kV8E+rByG6ALFb5wUZJvfHRZmICWZ0Ts7lV1peA9g2LYKOpWAILqh7st
         LgcSgQjYcwHCx+EkbhwdfOtG03r+4ax5r8/l0eERFEpbft5HzxOfwL7MP2X6PotiBfYE
         E0sDlFa8H3Dp93y44cUdpsXCx7G9BAwEc71bgxDHD8Yc5irwsjhsPi7g+7oH6XcRIBnA
         DHUA==
X-Gm-Message-State: AOAM5315mmttVyR6As+CzxhKtWlu65FU7imV0+GGe11VGsypNap+9LMI
	ux3bYo0c9CK7K3mhCgbq1Ws=
X-Google-Smtp-Source: ABdhPJxeMxG4MKLNCd/LkTegHOL7lGdOUrmKukaLI+DBbtE0Ajoaj4OVQQpc3SIodFUkMxsNdiIl9A==
X-Received: by 2002:a5d:4d89:: with SMTP id b9mr4555867wru.356.1617803408779;
        Wed, 07 Apr 2021 06:50:08 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id m25sm5812899wmi.33.2021.04.07.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 08/19] staging: rtl8723bs: put constant on the right side in if condition
Date: Wed,  7 Apr 2021 15:49:32 +0200
Message-Id: <41c98d13d5c74b1329ae125f097b780745cf8246.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch warning:

WARNING: Comparisons should place the constant on the right side of the test
683: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2204:
+	if (_SUCCESS != rtw_set_chplan_cmd(padapter, channel_plan_req, 1, 1))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 2392eb2b0458..2f6516283248 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2199,7 +2199,7 @@ static int rtw_wx_set_channel_plan(struct net_device *dev,
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	u8 channel_plan_req = (u8)(*((int *)wrqu));
 
-	if (_SUCCESS != rtw_set_chplan_cmd(padapter, channel_plan_req, 1, 1))
+	if (rtw_set_chplan_cmd(padapter, channel_plan_req, 1, 1) != _SUCCESS)
 		return -EPERM;
 
 	return 0;
-- 
2.20.1

