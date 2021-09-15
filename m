Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2F53FD4
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 09:02:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b21-20020a1c8015000000b003049690d882so4165862wmd.5
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hs3mRcTeREmOfSm39kN+QtHRavsM4VI0RyJdbjV285Q=;
        b=DG8M9J6xuHLtr/nbqPvulc3q/HwyojLa2iMboMhpRdjCHJDbu6oVsNDpZ2v4zKYmX/
         mdlOrnj0RA5on2WbdG2k+bmGONRXzvEcaLm+ynrTFqqet29Rn/5voWZl8QC3ujQz5wa1
         b3r++NHQLRYXHQ1bcVbKs1HqNvBmTLxulxa3gMZfuxytCJL6kqvOb8QS9xTx1qiw49QO
         9ziKcozVDI8pTDkCOx/o5EApwDPlnybikC22aP0gMaaK29tvtfvjyyy7rkwO0xhuGCuc
         6njTXp8sWJiuokbao5t0ROFqDCKtkRFFwqJHM8yU3qs1++5aZinYJS+BM9d7np9SbyZ0
         L+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hs3mRcTeREmOfSm39kN+QtHRavsM4VI0RyJdbjV285Q=;
        b=lvkaaYWCfFbwV58ifV/gXfp08kfSIRRZ3uCECgtd/n+FBoj+0/n67FQWwC1wYMdFRY
         9XgR/Yq2k7fZ/qvkL/mcR8mxrQzU51bYePwsSYB/Gh+ctxfiOo9dU3xudO0Uh0YZQO7w
         t07zynFW+VBemmsvbAMonYwcYAnAwyJES8M/49XiW1EW4mQ+STfg5ri3BNLeyDYj1p5a
         BKxtvK2KaqCBdF57yjzJIWVRVqEa1R7DtBg0ht563XQ/D0FUqmOdY7pOoYTUPMxjw1e3
         sb1E09SzrxLCSgJ8vBdGaNbK0AfUV0fyzND6ev4vzA+en7KtwGvD0nR2hFus/mO+FcTC
         htHg==
X-Gm-Message-State: AOAM530XdoMzFKMo0HbP1i/QAhaMa4ng3uEp9g0gcZPYQ4Q6xkpp+B7D
	eH+ynnYYCtv14FNZkIDBfQI=
X-Google-Smtp-Source: ABdhPJyZzjRch5cHfi/ZGfLYSUbX/tVcd0Dy7jLi5u1ctPlm7I7ZM2P6WKgbWQERmoHUtC6yxpu1hA==
X-Received: by 2002:a05:600c:26d4:: with SMTP id 20mr3334117wmv.40.1631696539772;
        Wed, 15 Sep 2021 02:02:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id n186sm3565530wme.31.2021.09.15.02.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 02:02:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/4] staging: r8188eu: remove unused enums from rtl8188e_hal.h
Date: Wed, 15 Sep 2021 11:01:55 +0200
Message-Id: <20210915090156.4169-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915090156.4169-1-straube.linux@gmail.com>
References: <20210915090156.4169-1-straube.linux@gmail.com>
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

