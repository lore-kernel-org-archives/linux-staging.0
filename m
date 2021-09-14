Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986B3FC4
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 12:14:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u16so19842252wrn.5
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hs3mRcTeREmOfSm39kN+QtHRavsM4VI0RyJdbjV285Q=;
        b=hflRR/IP600E/ZFCzFLswmDZ5xQG3TsjtpJmP5HTGo8mSRpFZNafY9xA6OjV1q8FX6
         hmHOw85QoDit3nCRD7gkiM9kXP7to8g+lIi4PHib4emhdTz+cqpVYxQr1zZFSL+a4iLJ
         +XfqBQGth9fKyhNCyfLKfLeD1pXAXbN8xO2XBMcvAyg/YWUlylpxk9vWu4l36zvC3AQ5
         itiGsmJfGVcv5ZtK+INbs/oi1WTB3vSDcrCM2/lVMBns3/Scsi0J4Haec8v5J7PfBKMZ
         q4kDBWPFDqjQraRfsbpTvl6xeiuJsHTJ7Uctl8koDrws6qNogJQYevhfWYmMdbyK7hBt
         b+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hs3mRcTeREmOfSm39kN+QtHRavsM4VI0RyJdbjV285Q=;
        b=Hk4h3nlOJcmY1x5DQaWpwY/pMbzpazvrYeVNQ0o0MYFTuBiOwgP0r4QHgtkvKZSlOy
         I7rHujnt9TTBGxsKuH2S7Z0TyAlNLGNVCLlriZbujr3vGZrk3FbdigvvrbmmZJdIgkqd
         JtBr5xKRWofksUA3EmUuq5bDjYjV/VcKCrvzvMGjXoNO7u+RzkgUbXvY9kRZM/zobh1p
         8xbtGehXfNrVUNtgq/20WtIATCB2RFkcdxpcUtzq/e7sNCWC7tUb0B4ciOYqWvt1krjx
         hOHmpGAVA35Kkp/mcrKsVFzTrkQBwwxeSF6j/xFFUqWxmdWW8KwijxD9MG6Dv39sS8oh
         BJYg==
X-Gm-Message-State: AOAM5334OwpWuV8I67aEBEPAlUqCuDzXSMWmgdMRjujmi/LBI+qI8u9E
	GyM9hBK5mPKaL+pNc7y2xdo=
X-Google-Smtp-Source: ABdhPJxRt2LDszPZ8vdnTlTfJZO7K8vLtUm56jr2A92KeGUQ+rItZiJzCD2cQQL4Be9PevtEm+IY4Q==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr18488301wrv.41.1631621645029;
        Tue, 14 Sep 2021 05:14:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id j19sm10028100wra.92.2021.09.14.05.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:14:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: remove unused enums from rtl8288e_hal.h
Date: Tue, 14 Sep 2021 14:13:51 +0200
Message-Id: <20210914121352.26052-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914121352.26052-1-straube.linux@gmail.com>
References: <20210914121352.26052-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing MultiFunc and RegulatorMode from struct hal_data_8188e
the enums rt_multi_func and rt_regulator_mode are unused now, remove
them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 7e2feb390416..17913dcc9fbe 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -207,20 +207,6 @@ struct txpowerinfo24g {
 
 #define EFUSE_PROTECT_BYTES_BANK	16
 
-/*  For RTL8723 WiFi/BT/GPS multi-function configuration. */
-enum rt_multi_func {
-	RT_MULTI_FUNC_NONE = 0x00,
-	RT_MULTI_FUNC_WIFI = 0x01,
-	RT_MULTI_FUNC_BT = 0x02,
-	RT_MULTI_FUNC_GPS = 0x04,
-};
-
-/*  For RTL8723 regulator mode. */
-enum rt_regulator_mode {
-	RT_SWITCHING_REGULATOR = 0,
-	RT_LDO_REGULATOR = 1,
-};
-
 struct hal_data_8188e {
 	struct HAL_VERSION	VersionID;
 	u16	CustomerID;
-- 
2.33.0

