Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8372
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 22:39:28 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso2175wmb.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=voxq/9vxohYeGFGqDOpPEyahbECLxcis2l73DPAnZsg=;
        b=hlKCJUr4h0d+FLJplMKasgUOI2+2OT92oYaAjpAPy4eyCVSEHZlSkm1QdrFysQvLdu
         Ig2rCyLlF2YkTQI3rlCxTYdrGmIbdexA937NxJ+1ItAV0eNZl/gJT0a5DG39Sf073qc/
         EuaVNtyJ8+CuY/7wCA+jIrwjiKvVUPgya93L/SCwv3f+xLB8r67ZHlxbAhNHJmHUn0an
         GFd2yjPM3s4BMkb0CXB2OgSCr5b1toM4VPb3VVxTOyT48hIFgA70yu/dkYCBxHGa/C2J
         0eaNwQZr+W06vmrADB9WVK9eZGMFFflDf5MUuKW4dRAQ66srfajVgOgoXl03SbDuqlH2
         ueRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=voxq/9vxohYeGFGqDOpPEyahbECLxcis2l73DPAnZsg=;
        b=vLczznJTO5x6K8ZNNhzFSYmMyIA8PrUlZZMAfTao47emeCelcGCh+X/fMNw2DA4yHf
         9nhlP3cqfMf/4YEHqMeG3fsuS5khxDrn3eBkYgrSp07BmxObxI/Rwa1OcNYZ/6uT/esU
         eU3NCGFdbMU+vIJzkJT2NY0PB8CgtzStuaxdESJM+45v59K/YuK94kB3TnOZTURZc11i
         USzlp99VS8wd/b6+1hEBOD5SuCc1/UDsZnTdWKk0lDr9B3cTn1ZS/RGMzxPDmVZ2QJEM
         Iq7ZPIm07AFroHuzqDgYpmRzXIl5TObej1wQnM8jaP8fxuZXqV8JoBVu+8Mi83PxgS/s
         Ll2g==
X-Gm-Message-State: AOAM532dnLqKKyFb1dtl2WAD29it4VfHsFz4qUUChSZEiLszangCK1BT
	H+HabfR8GEX9V7vWKgclgpM=
X-Google-Smtp-Source: ABdhPJwCVC08rppD9ybS0GwE/ZZ/PGZJRSFTovFRnKGTSowlXTUG1cCXcP4HXk8xMM/WuCN6J4Vg1w==
X-Received: by 2002:a05:600c:2d45:: with SMTP id a5mr425987wmg.125.1631140767056;
        Wed, 08 Sep 2021 15:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id d29sm428643wrc.6.2021.09.08.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 15:39:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove unused PHY_ScanOperationBackup8188E()
Date: Thu,  9 Sep 2021 00:39:01 +0200
Message-Id: <20210908223903.10516-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908223903.10516-1-straube.linux@gmail.com>
References: <20210908223903.10516-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function PHY_ScanOperationBackup8188E() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c    | 8 --------
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 7542a8398886..d3564181542d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -830,14 +830,6 @@ PHY_UpdateTxPowerDbm8188E(
 	return true;
 }
 
-void
-PHY_ScanOperationBackup8188E(
-		struct adapter *Adapter,
-		u8 Operation
-	)
-{
-}
-
 /*-----------------------------------------------------------------------------
  * Function:    PHY_SetBWModeCallback8192C()
  *
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index df3d3f516996..1799d9aeaa3c 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -192,8 +192,6 @@ void rtl8192c_PHY_GetHWRegOriginalValue(struct adapter *adapter);
 void PHY_SetTxPowerLevel8188E(struct adapter *adapter, u8 channel);
 bool PHY_UpdateTxPowerDbm8188E(struct adapter *adapter, int power);
 
-void PHY_ScanOperationBackup8188E(struct adapter *Adapter, u8 Operation);
-
 /*  Switch bandwidth for 8192S */
 void PHY_SetBWMode8188E(struct adapter *adapter,
 			enum ht_channel_width chnlwidth, unsigned char offset);
-- 
2.33.0

