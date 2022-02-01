Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FC3FDC
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id j2so32337017edj.8
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ncQM3kR+4xDnKchoBNvVQ7NuD29eMdEQFRmCBoUrMNQ=;
        b=ocPh9Vv8GXsorx9D71qIpRemoGa6o4fX6mLS8AS1YzM+uQV87f7BbX9tVNh769gexF
         mQQ0qC5tXP+IAuSDDoDiMDMRBPeyRMPdbuGMSXI5qFTOoRGARmkQ9GWNsvVZ0iRh5KxM
         vdI/Z8QP41/i7vfgbZWvQRY2ofc93HYkdoEAHV0uqmncphVT4iaNzoOQUdWnswiijLzs
         JocAgyzvN5ymPPpVSmXNRFBPebbZO9AeoHlP/RFtJJHMCiYgmSEc1cWzt+Ov0nHMJRkP
         N6KSSEgnr+znfgYIVFj2hTlXkZEZlKsq4HqJBP/Z4iiwKr+dsLVjJl3k3t+bqV0zPWDj
         nBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ncQM3kR+4xDnKchoBNvVQ7NuD29eMdEQFRmCBoUrMNQ=;
        b=AdDAE8M/FpSJLcLsuDHTKIXq7xY7FJ+WB+hsMDXSI53fdER+VmqIqEsx6hT780p2Xr
         bhML1vefkrINIfwDkFx3O9oQ4CIDSxbXdhVt65A4b511q/BUJdCZOEBN2XOQf2qwN62Z
         Q9rvW6+DS8fxQJJltSIhRQAgY5FOaEmLpZuXiEhTswIkG1VR1GAt6TusLrHraxUG9jGg
         8hMI2cmjG++sUYMwLxSLehrt79tjMRRV0GmYkYKsbTZlLWtbGKXNwKPy/ittBkYgt1mW
         lmGf0P64SAxwqdCQ/1FjcrrlVCl/rj/BRqXP3zGzne3Si8H+zpwQ1Qsn15UgAw8XE5Tq
         tkrw==
X-Gm-Message-State: AOAM532/Cixd6HX/HnBcU2ZURK0/BuoytoC2XBYzMrQeZ7LtZIcmMx6E
	+mgbChFB4FRaeT9uQ0cBF2U=
X-Google-Smtp-Source: ABdhPJwIg5jbispX3rgtrezqUBDa6jzoU0VMREInkbZara5ttVyl5pTB9gQ0Gy34GHmXBSX2U14WuA==
X-Received: by 2002:a05:6402:348a:: with SMTP id v10mr24361875edc.249.1643704991500;
        Tue, 01 Feb 2022 00:43:11 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:11 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/9] staging: r8188eu: ExternalPA is read-only
Date: Tue,  1 Feb 2022 09:42:51 +0100
Message-Id: <20220201084259.7497-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201084259.7497-1-straube.linux@gmail.com>
References: <20220201084259.7497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable ExternalPA in struct hal_data_8188e is never set.
It stays at the default value 0. Remove it and remove related
dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c  | 3 ---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index d10a6cc2d4ab..9b06a23df2ac 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -99,9 +99,6 @@ rtl8188e_PHY_RF6052SetCckTxPower(
 			TxAGC[idx1] =
 				pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
 				(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
-			/*  2010/10/18 MH For external PA module. We need to limit power index to be less than 0x20. */
-			if (TxAGC[idx1] > 0x20 && pHalData->ExternalPA)
-				TxAGC[idx1] = 0x20;
 		}
 	} else {
 		for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index a24cdbfa83de..2de7c0464411 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -181,7 +181,6 @@ struct hal_data_8188e {
 	u32	MCSTxPowerLevelOriginalOffset[MAX_PG_GROUP][16];
 
 	u8	CrystalCap;
-	u8	ExternalPA;
 
 	u32	AcParam_BE; /* Original parameter for BE, use for EDCA turbo. */
 
-- 
2.34.1

