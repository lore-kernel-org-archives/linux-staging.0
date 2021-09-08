Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8778D72
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 22:39:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u9so5502008wrg.8
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 15:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ev+Bp/+/AMJyfm0UPz2j6n4X4wGybMjpIdHclYnCg/o=;
        b=XoPCeYcVtDCNVDvml1OplWQIFZnPPc1xDU8NZ2a7e8L7mOqk4mrrhF+O41E+0IyPey
         FkStPjoZ49pulEufZbgPVCi/ZS6pZeH6HGHgBYd1jLxetRcifV8sOJDOqImyQca3DIDE
         p3/4RNXkhPfAwMVYxWrA2/nvIimN97K0VrowPO7frmFOheSRG2RgJ5HPVOlU3mFGhqV1
         kPVdxGdEh5KdkuqMqUuhD9Lqfhd4/GgMvOyA0DPrkVjF8NiGQo9dzw/+GqBafOum+rW4
         8xZUb4s7LFBwYfKdOdkXV5m7mQXeNoXVKEh37Lp0QonvTVaWEAnSiz5+dcbjiiVy/+xv
         wVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ev+Bp/+/AMJyfm0UPz2j6n4X4wGybMjpIdHclYnCg/o=;
        b=rYHZoJ5Ow7SXs1XW2Z7uacnPbuf7qpc1Sc6aT2MN9L6yOlcxePXVUDuhvbOROqCUoT
         qM6gR7ADDnFcyPEuaeEjHLGXVIJVnB+/PsZdP7Z7cJSjsMsqexY0mH013srbWcPESD66
         R9J00dLdjk9FnPXv16PwvKd9urjkwymf8MO45FRwMXzkfAZ8X7oEUI+spNwG8UIRlXrP
         YSAG1uBnhBZioLH5fWrQTjSewKwcrr/IS18jFcjwJdkU8GPLVPP82GC20UDUbiITNPn1
         V/SojU8uKiV0CWH2SY4r/Qg5PMURFIW77N9uNq/xpRAvRMtVE4DVW1N7pTkrtOrO3PHv
         LFxA==
X-Gm-Message-State: AOAM5331IPd1g0NCR7YaZj0IgQQh60+kEor4y8HoV+tS/KxqBSUCnSjt
	zF7dPtg/8HQ7LD6x2HfHu40=
X-Google-Smtp-Source: ABdhPJwrjXLx+d3AllDMvWicC0tH55HHMoXrbFIT7Uc4xoWkUieZkV0WBkSej/+rgMZH4LDdW3SIFw==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr563415wrr.332.1631140771063;
        Wed, 08 Sep 2021 15:39:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id d29sm428643wrc.6.2021.09.08.15.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 15:39:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove unused rtl8192c_PHY_GetHWRegOriginalValue()
Date: Thu,  9 Sep 2021 00:39:03 +0200
Message-Id: <20210908223903.10516-5-straube.linux@gmail.com>
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

Function rtl8192c_PHY_GetHWRegOriginalValue() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c  | 18 ------------------
 .../staging/r8188eu/include/Hal8188EPhyCfg.h   |  3 ---
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index dd0008bcceb6..94febe0edd35 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -609,24 +609,6 @@ int PHY_RFConfig8188E(struct adapter *Adapter)
 	return rtStatus;
 }
 
-void
-rtl8192c_PHY_GetHWRegOriginalValue(
-		struct adapter *Adapter
-	)
-{
-	struct hal_data_8188e	*pHalData = GET_HAL_DATA(Adapter);
-
-	/*  read rx initial gain */
-	pHalData->DefaultInitialGain[0] = (u8)PHY_QueryBBReg(Adapter, rOFDM0_XAAGCCore1, bMaskByte0);
-	pHalData->DefaultInitialGain[1] = (u8)PHY_QueryBBReg(Adapter, rOFDM0_XBAGCCore1, bMaskByte0);
-	pHalData->DefaultInitialGain[2] = (u8)PHY_QueryBBReg(Adapter, rOFDM0_XCAGCCore1, bMaskByte0);
-	pHalData->DefaultInitialGain[3] = (u8)PHY_QueryBBReg(Adapter, rOFDM0_XDAGCCore1, bMaskByte0);
-
-	/*  read framesync */
-	pHalData->framesync = (u8)PHY_QueryBBReg(Adapter, rOFDM0_RxDetector3, bMaskByte0);
-	pHalData->framesyncC34 = PHY_QueryBBReg(Adapter, rOFDM0_RxDetector2, bMaskDWord);
-}
-
 static void getTxPowerIndex88E(struct adapter *Adapter, u8 channel, u8 *cckPowerLevel,
 			       u8 *ofdmPowerLevel, u8 *BW20PowerLevel,
 			       u8 *BW40PowerLevel)
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index e5662fa9c918..ee4b26ecd19d 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -185,9 +185,6 @@ int PHY_MACConfig8188E(struct adapter *adapter);
 int PHY_BBConfig8188E(struct adapter *adapter);
 int PHY_RFConfig8188E(struct adapter *adapter);
 
-/* Read initi reg value for tx power setting. */
-void rtl8192c_PHY_GetHWRegOriginalValue(struct adapter *adapter);
-
 /*  BB TX Power R/W */
 void PHY_SetTxPowerLevel8188E(struct adapter *adapter, u8 channel);
 
-- 
2.33.0

