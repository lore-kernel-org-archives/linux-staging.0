Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1804A35
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777668829; cv=none; b=gm3dqZ8wSML1kksLo7QP0vgERsSNM5vZxa65PmiuF6AK0dfkN5CgJF4aaWaII+1ZlmgMF1b7rTVpVldq3r27zuLPULO//CZhlGI1Wj4EgvkX+QmmI1f4gDlvvd08NEbb45G/Q6vnTE1pfpI0vZPUvKLmjSnQ+vNSVtX4Bm850pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777668829; c=relaxed/simple;
	bh=kHq5Y+rZYz9ntgQgGu01Dszc8dfqel96UsaJKo56apQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lk5PTZYXjRM8WHa1e8VomMNMG3bAirmqAAEbEOC++qJEsxjv9XsN65Dvp2rsXRfFp2+fHYKdAjlQ21ejOccN+oWgX4Bfbq0R3BZMjBRxWypcTKjeTHuhY/EWPAvEZHfG4xfcO/pHsaIPIpKEen8W7EKCd9Pe0FSlyvf69leI4sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrWDLS41; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrWDLS41"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-362e30526f8so986102a91.3
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 13:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777668828; x=1778273628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6qrhqe2rSuKODtf27Dr8TXO4pCepi2BkEIZ1t22ecA=;
        b=UrWDLS41IqeM9SpThfWcTghy/dvMH/BY2kzEj7MBGiLRJ2nwhXGWwcIaVG5S7bmnKd
         SFSNNRQsSoxmUKzvtdZBN7jOkJ0s+XOnvbwPNbSYxJxzZ1M1kpPbDO2PO3uRKkRBhmhQ
         phS/HBY+HHpRZN5/rzWnTWl9XSCS872ognAoHbRGGaPsMKGE7pjofjhtYNkzEfDGNcCB
         RC992YWnqdkNyWqGEHfsS6CxeNzrmHaiUC/vyCTtVGjiFxxVeIpfUETjOn5PPhu9XA5u
         nE4yoYfE1pkszbXdu3YZRLIAVrpAoivsWg8lgs0F1zJ+Umnlo++0CoxH0eaLCS7Q8vzH
         iW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777668828; x=1778273628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6qrhqe2rSuKODtf27Dr8TXO4pCepi2BkEIZ1t22ecA=;
        b=YaWqeTRL/R1094nHVRFNXJIqCK46eTrJpvRJq3W0A4O2dadMcCZOxfdPpCYSiruFMO
         dGgaXR9WIguRZabwhPDfH6/h+ARXKVQkjX0DPN0J9mlQclF45VmfpzYItZ+A84KlPvLp
         E67TTvp9aYZbxckawQAyynab7gtPNE2Wks8oXb+RqU9nQRCiqw0qx0MRQsH8w/hIOS/E
         M7Vc3i6jFO/VPw5JuwNoGc6y7wRd8hPYiHViF5hj0tEUDDfmSKF55wXuiVrPRdk3VGx5
         p1pjNqgtkPPe0JUbZ+h7C3DeSdytQjwiPOX92JkfXH9mQTXMexspXdB1iB31b0QuErss
         zyJg==
X-Forwarded-Encrypted: i=1; AFNElJ8X7va3KFJB8MuSKFlRJrJ5XyPhGrGNEyH0q3gZ9ZSoff6byogn9nI4QoiifWtIwRMB0ddyDpsbRxMyciIY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlnoc+W+34QoOHvh7RQ7/wa1O0t0VX6P/CRQpdHRRZb9KKJ4Te
	VV8YvTZjcH7HepB88qK9RoUe4za4yFyI7DWP7MvLUsqFjBvJX1oo/ZWK
X-Gm-Gg: AeBDieu3qQ96SYURWl3g7GCrM3gTptEpxRT5qas1Z0TLJVJyFVD4BG0o4LGTtjU+tln
	Z5SixYQkQfUOdWZkJFthcsk6Q3DVXfKoTrZk4b3NI0qXT3fDPTYKUS7e61L5AWisrq8BC0hQ510
	aOPXGoA7E0JAypQUTvfKfDAvn3VmrP7ZVLVBU04zqTzSEcCUJ3mF7Wbiur1WOJhMDgMfYYFxtvC
	5pe7l1kXru2WBo1sGbD1VZKJYSvM9Gz4vX8Ib4FMknoUp+3tu1HyIXemQ7ktJ+neguI1GkM6/y3
	Mo+2aOM1e3yZs/rH/BCHmk1WDDuagYv4FrL+UpV0bldaBqIrilCwL3zsXri555SKxyp37B0veB/
	Nnxt3uCzanQKLqBym9YULvqQDDCCInmUJKXxFqd7ss6+6fD1DT0woANFy6QVmi3iLJ7pBceG9N4
	VYkAgd57Vcu4TkfnMBjfIMaafWBqmzVHDxyrWWHCze09yUivC5ssM=
X-Received: by 2002:a17:90b:4a4f:b0:35e:3afb:a3ff with SMTP id 98e67ed59e1d1-3650cd08f1fmr690658a91.3.1777668827711;
        Fri, 01 May 2026 13:53:47 -0700 (PDT)
Received: from horstaufmental.lan ([159.192.179.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec899esm3438359a91.1.2026.05.01.13.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:53:46 -0700 (PDT)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	b9788213@gmail.com,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix unbalanced braces in if/else statements
Date: Sat,  2 May 2026 03:53:36 +0700
Message-ID: <20260501205336.230955-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix inconsistent brace usage in if/else blocks to improve readability
and avoid misleading indentation.

No functional changes.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 9bef096164fa..622970c7fcfa 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -793,8 +793,9 @@ static void halbtc8723b1ant_SetAntPath(
 			/* Use H2C to set GNT_BT to HIGH */
 			H2C_Parameter[0] = 1;
 			pBtCoexist->fBtcFillH2c(pBtCoexist, 0x6E, 1, H2C_Parameter);
-		} else /*  set grant_bt to high */
+		} else { /*  set grant_bt to high */
 			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
+		}
 
 		/* set wlan_act control by PTA */
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
@@ -810,8 +811,9 @@ static void halbtc8723b1ant_SetAntPath(
 			/* Use H2C to set GNT_BT to HIGH */
 			H2C_Parameter[0] = 1;
 			pBtCoexist->fBtcFillH2c(pBtCoexist, 0x6E, 1, H2C_Parameter);
-		} else /*  set grant_bt to high */
+		} else { /*  set grant_bt to high */
 			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
+		}
 
 		/* set wlan_act to always low */
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
@@ -1856,8 +1858,9 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 			halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 		else
 			halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_LPS_ON, 0x50, 0x4);
-	} else
+	} else {
 		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	}
 
 	/*  tdma and coex table */
 	if (!bWifiBusy) {
@@ -2053,8 +2056,9 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 				halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
 		} else
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
-	} else /*  wifi LPS/Busy */
+	} else { /*  wifi LPS/Busy */
 		halbtc8723b1ant_ActionWifiConnected(pBtCoexist);
+	}
 }
 
 static void halbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist)
@@ -2089,8 +2093,9 @@ static void halbtc8723b1ant_InitHwConfig(
 	if (bWifiOnly) {
 		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_WIFI, true, false);
 		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 9);
-	} else
+	} else {
 		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, true, false);
+	}
 
 	/*  PTA parameter */
 	halbtc8723b1ant_CoexTableWithType(pBtCoexist, FORCE_EXEC, 0);
-- 
2.53.0

