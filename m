Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23EA5F
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 05:40:31 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t20so4220078plr.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 22:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KxyeeXYM+0996CFKfGwExxixHCD5JVGi5ipPAcYMkSg=;
        b=Njl5EIu18L7UlpKpxbxVVOfMtbUa6XdKE32KhTWr8XmZeibmo+CqL73CX0Ka7pzrDU
         bhLaJ4YXoBFtqzuhFMwxgVShCIsXdn0Jj62uKWLrZitzhfRA/RKwvQFjf8BMKBupU5GV
         BIq1Izg3MhnDwt1vq01sLkGhKxuKI9p2rbIrWN7aSlOjgtmdvVfeNPlzuObtNqeGXWzF
         z2ijBHognMmIVt3iRVzKLxxCrzpZXm42a32+mNlOWACUpHey/f/IVTFhAY1ZNtehyd2B
         iunxT7L/KeLfyj85rvvZLkX6LRVdRm/6b2EGJJhT0VyBF0kuXmGDAmQB75egoNGAF+0H
         RFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KxyeeXYM+0996CFKfGwExxixHCD5JVGi5ipPAcYMkSg=;
        b=enLfFVrDZFClpdupUKQlXVcZ/dbyTh7wX3I185Jvahx0zSv51Y0G6PfmQ/mQ8WsDNa
         IdX8w6W5zIMghVnTgJc0c2IOUNJEGy6uj0FBhc0kRaYmkToH81134L3onU0+ZiMjyTFF
         Od2Ro3JYcGBAPFd6wUOMWck3Eybu30o56dLOV5Cn6IImLJtDLcPl7gWv8RW3N5BInPSP
         ChMnxH5UkYNMdTAZ1+orC8WhakeTreUEfSnhNKHQrUuyQCa2TISs8+WPhqMRPuyM3w4j
         6rLf9U4NCr4wq6/jbjKB/TjENphStfRCVx+YSNZv/skZBDRX1XxX08cZunbmPBbU6eu+
         FqJw==
X-Gm-Message-State: AOAM5315S0iGkA8m2xZ0SuHxMAo7zu2dLqfZMfCFGyu7IQjfY5j7uQCi
	8OydVrYvxCkgRbFNkkxiLCk=
X-Google-Smtp-Source: ABdhPJwTY1G+qMQ0x1XLtf9HBFsor12CoiNfQtUtMDCoE+gLtjOl3HnvSXaAguMpmiMF09X2CbEMSA==
X-Received: by 2002:a17:902:8218:b029:e6:190e:48e with SMTP id x24-20020a1709028218b02900e6190e048emr19130071pln.33.1617514831530;
        Sat, 03 Apr 2021 22:40:31 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id y7sm11759877pja.25.2021.04.03.22.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 22:40:31 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	unixbhaskar@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] staging: rtl8188eu: replace goto with direct return
Date: Sat,  3 Apr 2021 22:40:08 -0700
Message-Id: <20210404054008.23525-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

To conform with Linux kernel coding style, replace goto statement that
does no cleanup with a direct return.  To preserve meaning, copy comments
from the original goto statement to the return statement.  Identified by
the checkpatch warning: WARNING: void function return statements are not
generally useful.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
index 391c59490718..d21f21857c20 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
@@ -139,7 +139,9 @@ void rtw_hal_dm_watchdog(struct adapter *Adapter)
 	hw_init_completed = Adapter->hw_init_completed;
 
 	if (!hw_init_completed)
-		goto skip_dm;
+		/*  Check GPIO to determine current RF on/off and Pbc status. */
+		/*  Check Hardware Radio ON/OFF or not */
+		return;
 
 	/* ODM */
 	pmlmepriv = &Adapter->mlmepriv;
@@ -156,10 +158,8 @@ void rtw_hal_dm_watchdog(struct adapter *Adapter)
 
 	Adapter->HalData->odmpriv.bLinked = bLinked;
 	ODM_DMWatchdog(&Adapter->HalData->odmpriv);
-skip_dm:
 	/*  Check GPIO to determine current RF on/off and Pbc status. */
 	/*  Check Hardware Radio ON/OFF or not */
-	return;
 }
 
 void rtw_hal_dm_init(struct adapter *Adapter)
-- 
2.17.1

