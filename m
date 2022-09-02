Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268B111A
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:40 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id e18so1971335edj.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XufPAMebi+TQKK75DKApzVpkJqGpncDvct45lHXgg7c=;
        b=VSAW1KYwHOYPot9JTY8QLTMtsYCkAkx+nRTw7kEwhLX56cvbty0VZVK4dqqevFGhXk
         jlrEts/mFkoVzDH/Lr44Z13J4pj1LfGeLG/WAiG4w2cFSbhBe0l3XwEbm3+ORZkhHLEJ
         IF819CSDWTV3isxNAj2NbPUKyKFq4hsns7pvaHxtbikzEArsczys8uLIjvN7bIDY8Dn4
         Z3LThqa/GRajG+E8OOGyVLuOPTvBM2rilQUnVcFFCUpXGr/tgzHejy3Ighfj46QXYOhz
         TiciQxs9DQVyf/RTESEHJkiK2BQKjgpg55Q9fy/zdNB3uue6a10sMJUIJx7ZBrqTncqC
         gjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XufPAMebi+TQKK75DKApzVpkJqGpncDvct45lHXgg7c=;
        b=PBrvv4Z5zYC8hR8/LNsomyJtNYk4Th89ixdO8iW3DJ3DvBZnRGNy0bC1K5HyiVXA0i
         5W3s/+7pcQDfO/00znaOneXna0vH41bUECSV0o4R2pF2cRh86GNIyaQ+4htDakSuRIg4
         utu2Gk1g1QRbTS9fjBWdTsT32i7H1PgDbqi4JT6E5grgB72XAZSzPDASq7IlWzIny5r6
         xLDqCGf+Br6YM1tGIys58j4svNSBfP7m5QjZecGp3o/GpYvrCI4I5QXg82rFoJTorCCl
         E55ZVNls716dfEWRYm+me4ZOOr9b6e2SH7rkOKhqdzUdSkbfDJ+P4sumo64/I1px5ewl
         9OEw==
X-Gm-Message-State: ACgBeo1otBh16f4zlMPc9wDk/37+Mn7Choph8haO6t1U6lqocLp0LJq5
	yC2UJ7Zwyv+HB4FqvUkEZnM=
X-Google-Smtp-Source: AA6agR5UZtDyXut2Lp/DzM6pR7l9tsw/Vb1GjnyX/GqJQ0/NV1v1YZRDJTuRprdEzRFBVNcdp8ns2g==
X-Received: by 2002:a50:fc97:0:b0:449:1fd1:25ea with SMTP id f23-20020a50fc97000000b004491fd125eamr9397623edq.301.1662112359059;
        Fri, 02 Sep 2022 02:52:39 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:38 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/10] staging: rtl8723bs: remove hal_btcoex_SetManualControl
Date: Fri,  2 Sep 2022 11:51:57 +0200
Message-Id: <ae83ad941013d7a6c47d06f70c0f43087fe2c84f.1662111799.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function hal_btcoex_SetManualControl because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_btcoex.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9acd49323c7c..e36f8c369a04 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1283,11 +1283,6 @@ s32 hal_btcoex_IsBTCoexCtrlAMPDUSize(struct adapter *padapter)
 	return (s32)GLBtCoexist.btInfo.bBtCtrlAggBufSize;
 }
 
-void hal_btcoex_SetManualControl(struct adapter *padapter, u8 bmanual)
-{
-	GLBtCoexist.bManualControl = bmanual;
-}
-
 bool hal_btcoex_IsBtControlLps(struct adapter *padapter)
 {
 	if (!hal_btcoex_IsBtExist(padapter))
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 78599d3521bf..fb167642da01 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -45,7 +45,6 @@ void hal_btcoex_HaltNotify(struct adapter *padapter);
 void hal_btcoex_Handler(struct adapter *padapter);
 
 s32 hal_btcoex_IsBTCoexCtrlAMPDUSize(struct adapter *padapter);
-void hal_btcoex_SetManualControl(struct adapter *padapter, u8 bmanual);
 bool hal_btcoex_IsBtControlLps(struct adapter *padapter);
 bool hal_btcoex_IsLpsOn(struct adapter *padapter);
 u8 hal_btcoex_RpwmVal(struct adapter *);
-- 
2.25.1

