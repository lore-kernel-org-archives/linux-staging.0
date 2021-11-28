Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0A2C80
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:09:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d24so31446679wra.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxZ0KofGh2uxqP5kVqaEZl862FeeQxlLxUXNxJ6Ab/U=;
        b=U35qfvEj6qT6CoP6mXzGTvFmNIacPLYWKF9TPZBEdClMYKgorjKAgKikODiXskmAWI
         SRmqCRCWG4h95ccMe6hh0sHMjVx5JtQ4l+Cs+xaeFwSWwNaZBizFskuXAn46gWJQ4h99
         Phz3By7hhDD02X2scCRrhb5KabScmlRbILmmFmn3wH88kEYQJo29VFFFtHuYqZjvBgrO
         J7i2MsN/SsvtSk0XjCq/jD/k6SRyBMUNiOj3e8nncRZnw16sjNlqM1Xl5tOoUBrxzJIw
         h5VhySlkkk8mFyJua+LH2jFCzeMcpE9pfGg5lfPyqQk3s8HLQewtdbexQ3mAfU2/i5d+
         jtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxZ0KofGh2uxqP5kVqaEZl862FeeQxlLxUXNxJ6Ab/U=;
        b=ejmhzt/cRnumeOxSl1mxukj2WFtTjMWBkUS0R3WX8HFdu3OKKm9cmFCMcRZWgggzCQ
         bQQ3JNtTXzi0ELZWQTOvTQC0Py7nRJpkgz2RWtUfzDWnx7AqkJl7LEGyClvpVL0PxFbh
         QVMGQbWLBOVp39gUlMgxtFsuZuRWDHl/tBP1mc+ao4HN0C9fm2pzjkKhhgfIP4eji0QP
         YtQn8f8a1HV7jTnXptZt9nD5wnUykldxYH9pV5FXfFvHSHjPFZ8yFK09pNtCuSR0v/Ms
         ofrgMG1vVveA0Oo9mCOifnS3OXMdwahDfDSCbSn4S1AjSm/KAh530EPD3HDyvUfrGugb
         jt3A==
X-Gm-Message-State: AOAM533ZpvmKjP1LJrvpt4ev3vUfb72jVpu9ouirNxFpW4yYZ2lr5qqO
	JroSLad9G1oIjBiK/elfG8k=
X-Google-Smtp-Source: ABdhPJxYSFQ+DX7oFcEKXp61g2qW0la3h7bEUCH2k7ekca+y9t9Tu2Ym4rtQOxxx0KM0n0pSQyS8sA==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr27945466wrl.24.1638119391842;
        Sun, 28 Nov 2021 09:09:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id n15sm18243845wmq.38.2021.11.28.09.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:09:51 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 05/10] staging: r8188eu: remove TxCount from getTxPowerIndex88E()
Date: Sun, 28 Nov 2021 18:09:19 +0100
Message-Id: <20211128170924.5874-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128170924.5874-1-straube.linux@gmail.com>
References: <20211128170924.5874-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In getTxPowerIndex88E() the variable TxCount is set to RF_PATH_A and
never changed. Remove the unnecessary extra variable and replace its
usage with RF_PATH_A.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 7124b9880efa..73d5eb53a927 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -611,18 +611,17 @@ static void getTxPowerIndex88E(struct adapter *Adapter, u8 channel, u8 *cckPower
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
 	u8 index = (channel - 1);
-	u8 TxCount = RF_PATH_A;
 
 	/*  1. CCK */
-	cckPowerLevel[TxCount] = pHalData->Index24G_CCK_Base[TxCount][index];
+	cckPowerLevel[RF_PATH_A] = pHalData->Index24G_CCK_Base[RF_PATH_A][index];
 	/* 2. OFDM */
-	ofdmPowerLevel[TxCount] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-		pHalData->OFDM_24G_Diff[TxCount][RF_PATH_A];
+	ofdmPowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
+		pHalData->OFDM_24G_Diff[RF_PATH_A][RF_PATH_A];
 	/*  1. BW20 */
-	BW20PowerLevel[TxCount] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-		pHalData->BW20_24G_Diff[TxCount][RF_PATH_A];
+	BW20PowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
+		pHalData->BW20_24G_Diff[RF_PATH_A][RF_PATH_A];
 	/* 2. BW40 */
-	BW40PowerLevel[TxCount] = pHalData->Index24G_BW40_Base[TxCount][index];
+	BW40PowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[RF_PATH_A][index];
 }
 
 static void phy_PowerIndexCheck88E(struct adapter *Adapter, u8 channel, u8 *cckPowerLevel,
-- 
2.34.0

